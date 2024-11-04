---
title: "Post-mortem: git.sr.ht's almost-outage today"
date: 2020-10-08
author: Drew DeVault
---

git.sr.ht *almost* suffered an outage today, when available disk space for
repository storage got as low as 2.8 GiB. Thankfully, the problem was identified
and a solution applied before an outage was incurred. This ended up being a good
case study in the value of good monitoring and a solid understanding of the
performance characteristics of your system. So, what caused this to happen, why
*didn't* it cause an outage, and what have we learned?

![An SVG plot showing git.sr.ht free disk space over time, trending from 100G to less than 25G over 5 days](/git.sr.ht-disk-over-time.svg)

<em style="text-align: center; display: block">
  <small>
    A plot showing free disk space on git storage over 5 days. Higher is better.
    <br />
    We generate these graphs with <a
      href="https://sr.ht/~sircmpwn/chartsrv"
      rel="noopener"
    >chartsrv</a>, by the way.
  </small>
</em>

During a routine audit of our systems on September 18th, I discovered that
git.sr.ht disk space was growing at a higher than expected rate. At the growth
rate observed on the 18th, I estimated that we had 9 weeks before we'd run out
of disk space. Having other things to deal with at the time, [I wrote up my
initial findings on the sr.ht-dev mailing list][sr.ht-dev thread] and planned to
re-visit the problem 3 weeks later.

[sr.ht-dev thread]: https://lists.sr.ht/~sircmpwn/sr.ht-dev/%3CC5QM8KFLQUHN.2796RCC83HBHA%40homura%3E

Run the clocks forward to last night, and a disk space usage alarm [goes
off][alarm]. These fire when we reach 80% storage utilization on any host.
Normally this incurs an immediate investigation, but I initially presumed that
it was the natural progression of the growth trends we had observed a few weeks
prior. I downgraded the urgency of the alarm and made a note to follow up this
morning.

[alarm]: https://lists.sr.ht/~sircmpwn/sr.ht-ops/%3C1602078072831595278.11616517120117617331%40metrics%3E

So, this morning rolls around, and I log into the machine and check the disk
usage... and there's only 4.6 GiB left, and falling by 2 gigs per hour! This
trend is obviously heading towards disaster, so I quickly truncate some large
log files to buy time, [file a public incident report][status report], and loop
[#sr.ht](http://webchat.freenode.net/?channels=%23sr.ht&uio=d4) in on the issue.

[status report]: https://status.sr.ht/issues/2020-10-08-git.sr.ht-disk-usage/

The game plan is:

1. Establish a lower bound on disk space at which an emergency is declared and
   git.sr.ht is put into read-only mode. This is set at 2 GiB.
2. Spin up a new server with sufficient storage space to accomodate the growth
   for long enough to re-evaluate our plans.
3. Start transferring data over and get as much of the migration done as
   possible before hitting that 2 GiB floor and declaring an outage.
4. Investigate: why is this happening?

Steps 2 and 3 have some idle time baked in, so I'm doing the investigation in
parallel. It seems strange, there's no one adding especially large repos and the
git storage growth rate is consistent with our normal projections. I ruminate
over it while working on provisioning a replacement server. Once I'm prepared to
start the `zfs receive` to pull the dataset over to the new host... I notice
that the snapshots are unusually large.

I delete six old snapshots and immediately freed up 500 GiB of space. Crisis
over.

![A chart showing the before and after when the snapshots were deleted](/git.sr.ht-snapshots-freed.svg)

An update is issued for the incident report: the issue was resolved without
incurring an outage. Now comes the important questions:

- Why did this happen?
- How can we prevent it from happening again?

This should not have happened. We are aware that snapshots occupy disk space and
we had measured their growth rate and factored it into our planning for
git.sr.ht disk space utilization. So why were they so large?

The culprit ended up being that, on August 12th, [we deployed a cronjob which
runs git-gc every 20 minutes on a random subset of git repositories][git gc commit].
Prior to this change, our git storage was basically append-only: outside of
users deleting their repositories, objects were only ever added, not removed.
After this change, we started to *delete* objects as well, which caused the
rate at which differences between snapshots and the present filesystem
accumulated to change, causing our snapshots to display a more pronounced
increase in size as they aged. Our snapshot retention policy did not account for
this different growth model.

[git gc commit]: https://git.sr.ht/~sircmpwn/git.sr.ht/commit/b2ddc75f0b66debe09b7c6af4837b7817a1a018d

Our Prometheus retention policy was only set to 15 days (it has since been
increased to 60 days), so we can't directly observe a change in the growth rate
at the time this commit was deployed. However, we can observe that disk usage
fluctuates periodically:

![A graph showing periodic fluctuations in free disk space, trending downwards](/git.sr.ht-periodic-fluctuations.svg)

<em style="text-align: center; display: block">
  <small>In this chart, a higher number means more free disk space.</small>
</em>

The GC script runs every 20 minutes, and we take a snapshot every 15 minutes,
hourly, and daily. With each GC, disk space frees up briefly, and is reduced
again when a snapshot is taken.

Now that we know the cause, we can plan to avoid this issue in the future. It's
less urgent now that the emergency is resolved, but the future plans are to:

1. Create fine-grained storage utilization metrics which correlates utilization
   with purpose, so we can see separate utilization figures for git storage, ZFS
   snapshots, logs, etc.
2. Re-reason about our retention policy and storage utilization growth rate
   armed with new knowledge about the effect of git GC on storage utilization.
3. Move forward with planning for normal git.sr.ht storage upgrades. We're
   planning on expanding storage 4x-8x in the foreseeable future.
4. Add additional instrumentation to our cronjobs to better understand the role
   they play in system performance.

I've also increased the metrics retention from 15 to 60 days to allow us to
better observe long-term trends and have a larger window for forensics. This
shouldn't present a problem for storage on our monitoring system, but it
monitors itself and will let us know if it starts to run out of space.

So, crisis averted for today. Let's take this opportunity to improve our
planning and observation skills to make sure that we're better prepared for
tomorrow's crisis.
