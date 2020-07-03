---
title: How we monitor our services
date: 2020-07-03
author: Drew DeVault
---

Monitoring all of our services makes sure we're aware of problems when they
occur, but most importantly, it helps us detect problems in advance &mdash;
before they become outages. Our main tool for this task is [Prometheus][prom],
an open source time-series database. It takes a snapshot of various metrics
across all of our services every few seconds, then allows you to write queries
which model trends in that data. Our instance is publicly available for you to
explore at [metrics.sr.ht](https://metrics.sr.ht).

[prom]: https://prometheus.io

The Prometheus docs have some good tips for [writing queries][queries]. Here's
an example:

[queries]: https://prometheus.io/docs/prometheus/latest/querying/basics/

```
rate(node_cpu_seconds_total{mode="user",instance="node.git.sr.ht:80"}[2m])
```

This returns a value between 0 and 1 which represents the current CPU usage
across all nodes on git.sr.ht. You can check out [live graph here][cpu live]
(note that the live graph automatically selects the scale appropriate for the
data &mdash; our server is probably not as overloaded as it looks here), or
take a look at this graph I generated in advance (with the correct scale):

[cpu live]: https://metrics.sr.ht/graph?g0.range_input=1h&g0.stacked=0&g0.expr=rate(node_cpu_seconds_total%7Bmode%3D%22user%22%2Cinstance%3D%22node.git.sr.ht%3A80%22%7D%5B2m%5D)&g0.tab=0

![An SVG showing CPU utilization on git.sr.ht](https://l.sr.ht/WOLU.svg)

We can easily turn this into an alarm by rephrasing it as a boolean expression
and writing a little bit of YAML:

```yaml
- alert: High CPU usage
  expr: &cpu_gt_75pct rate(node_cpu_seconds_total{mode="user"}[2m]) > 0.75
  << : &brief
     for: 5m
     labels:
       severity: interesting
  annotations:
    summary: "Instance {{ $labels.instance }} is under high CPU usage"
```

This is one of the few times where I take advantage of some of YAML's more
advanced features: `&cpu_gt_75pct` and `&brief` are a kind of macro, which
allows me to easily create derivative alarms, like these ones for network
activity:

```yaml
- alert: High network activity
  expr: &net_gt_10mibsec >
    (rate(node_network_receive_bytes_total{device=~"eth0|ens3|enp.*"}[5m]) / 1024^2
    > 10) or (
    rate(node_network_transmit_bytes_total{device=~"eth0|ens3|enp.*"}[5m]) / 1024^2
    > 10)
  << : *brief
  annotations:
    summary: "Instance {{ $labels.instance }} >10 MiB/s network use"
- alert: Sustained high network activity
  expr: *net_gt_10mibsec
  << : *sustained
  annotations:
    summary: "Instance {{ $labels.instance }} sustained >10 MiB/s network use"
- alert: Prolonged high network activity
  expr: *net_gt_10mibsec
  << : *prolonged
  annotations:
    summary: "Instance {{ $labels.instance }} prolonged >10 MiB/s network use"
```

You can see all of our alarms online [on metrics.sr.ht][alarms], and you can see
our YAML files in [our git repository][git]. Some of our users have helpfully
sent us patches to add new alarms and refine our existing ones - thanks folks!
The advantages of being an open source business are numerous.

[alarms]: https://metrics.sr.ht/alerts
[git]: https://git.sr.ht/~sircmpwn/metrics.sr.ht

When these alarms go off, they're routed into [Alertmanager][am]. I found this
particular part of the Prometheus stack a bit more annoying than the others, but
eventually we rigged it up the way I like. We combine [sachet][sachet] with
[Twilio][twilio] to route urgent alarms to my cell phone, and there I have some
rules set up with [Automate][automate][^1] to make my phone go nuts when a
matching SMS message arrives - it starts beeping and vibrating until I
acknowledge the message.

[am]: https://www.prometheus.io/docs/alerting/latest/alertmanager/
[sachet]: https://github.com/messagebird/sachet
[twilio]: https://www.twilio.com/
[automate]: https://llamalab.com/automate/
[^1]: Unfortunately, this and Twilio are the only parts of the stack which are not open source. Replacing Twilio would be hard but I bet Automate is low-hanging fruit - [suggestions would be welcome!](mailto:sir@cmpwn.com)

"Urgent" and "important" alarms are routed into our operational mailing list,
[sr.ht-ops][sr.ht-ops], which is also public.  Browsing this list, you'll also
see some automated emails which are not related to alarms &mdash; I'll get to
these in a moment. We also have "interesting" alarms, which are routed to IRC,
along with the urgent and important alarms, using
[alertmanager-irc-relay][am-irc-relay]. This IRC channel is also public:
[#sr.ht-ops on irc.freenode.net][#sr.ht-ops].

[sr.ht-ops]: https://lists.sr.ht/~sircmpwn/sr.ht-ops
[am-irc-relay]: https://github.com/google/alertmanager-irc-relay
[#sr.ht-ops]: http://webchat.freenode.net/?channels=%23sr.ht-ops&uio=d4

Prometheus normally works by pulling stats off of daemons, but we also want to
monitor ephemeral or one-off tasks. For this purpose, we have also set up
[Pushgateway][pgway]. We mainly use this to keep track of timestamps: the
timestamp of the last backup, the last ZFS snapshot, or the expiration dates of
our SSL certificates. For example, we can get
[the age of our ZFS snapshots][snapshot age] in seconds with this query:

[pgway]: https://github.com/prometheus/pushgateway
[snapshot age]: https://metrics.sr.ht/graph?g0.range_input=30m&g0.expr=time()%20-%20zfs_last_snapshot&g0.tab=0

```
time() - zfs_last_snapshot
```

![An SVG showing the age of ZFS snapshots across the fleet](https://l.sr.ht/6HPu.svg)

This is trivially populated with a simple cronjob:

```sh
#!/bin/sh -eu
host="$(hostname -f)"
stats() {
	printf '# TYPE zfs_last_snapshot gauge\n'
	printf '# HELP zfs_last_snapshot Unix timestamp of last ZFS snapshot\n'
	ts=$(zfs list -HS creation -o creation -t snapshot | head -n1)
	printf 'zfs_last_snapshot{instance="%s"} %d\n' "$host" "$ts"
}

stats | curl --data-binary @- https://push.metrics.sr.ht/metrics/job/"$host"
```

Our backup age is filled in at the time the backup is taken with something like
this:

```sh
#!/bin/sh -eu
export BORG_REPO=#...
export BORG_PASSPHRASE=#...

backup_start="$(date -u +'%s')"

echo "borg create"
borg create \
	::git.sr.ht-"$(date +"%Y-%m-%d_%H:%M")" \
	/var/lib/git \
	#...

echo "borg prune"
borg prune \
	--keep-hourly 48 \
	--keep-daily 60 \
	--keep-weekly 24 \
	--info --stats

stats() {
	backup_end="$(date -u +'%s')"
	printf '# TYPE last_backup gauge\n'
	printf '# HELP last_backup Unix timestamp of last backup\n'
	printf 'last_backup{instance="git.sr.ht"} %d\n' "$backup_end"
	printf '# TYPE backup_duration gauge\n'
	printf '# HELP backup_duration Number of seconds most recent backup took to complete\n'
	printf 'backup_duration{instance="git.sr.ht"} %d\n' "$((backup_end-backup_start))"
}

stats | curl --data-binary @- https://push.metrics.sr.ht/metrics/job/git.sr.ht
```

In addition to alarming if the age gets too large, the duration allows us to
graph trends in the backup cost so that we can make informed judgements about
the backup schedule:

![An SVG showing the duration of backups. git.sr.ht takes the longest at about 3000 seconds.](https://l.sr.ht/wC9J.svg)

Backups are of critical importance in our ops plan, so we have redundant
monitoring for them. This is where the other emails you saw on
[sr.ht-ops][sr.ht-ops] come into play. We configured [ZFS zed][zed] to send
emails to the mailing list on ZFS events, and left debug mode on so that it's
emailing us even when there are no errors. We set up a cronjob to run a scrub on
the 1st of the month, and the resulting zed emails are posted to the ops list.
We also do weekly borg backup checks, which are posted to the mailing list every
Sunday night.

[zed]: https://zfsonlinux.org/manpages/0.8.0/man8/zed.8.html

Reliability is important to us. SourceHut is still an alpha, but a robust
approach to reliability is considered a blocker for the production phase, and
taking the development of this approach seriously during the alpha and beta
periods. You can read up more on our ops work at our public [operations
manual](https://man.sr.ht/ops/). And it's working &mdash; we have 99.99% uptime
for 2020, and have only suffered one unplanned partial outage this year.[^2]
Let's aim for 99.999% in 2021!

[^2]: Two pages were affected, and it lasted 46 minutes. We fixed the problem, prevented future problems of the sort, and added new alarms which would catch a broader net of problems in the future. [Read the details here](https://status.sr.ht/issues/2020-06-28-unplanned-git.sr.ht-outage/).
