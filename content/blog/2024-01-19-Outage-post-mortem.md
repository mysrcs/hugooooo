---
title: SourceHut network outage post-mortem
author: Drew DeVault
date: 2024-01-19
---

It's been a busy couple of weeks here at SourceHut. At the time of writing, we
have restored SourceHut to full service following an unprecedented 170 hour
outage, and while we still have numerous kinks to sort out following an
unscheduled emergency migration of all services across an ocean, all services
are now fully operational.

Allow me to open this post-mortem by extending my deepest apologies to the
SourceHut community for this interruption in service. This outcome was
unacceptable: we failed you, and I am sorry. We know that you depend on
SourceHut to be reliable, and you trust us to make sure that you can always
depend on our services to be there for your projects. We value this trust
profoundly, and we will strive to prevent a situation like the one we faced last
week from recurring. The Internet can be a fragile place, and we will do what we
can to re-enforce it.

Here's what happened, what we did about it, how we're making things right, and
what we're doing to ensure it does not happen again.

## Background

SourceHut runs on servers owned and provisioned by SourceHut, installed in
colocation facilities at three datacenters, respectively codenamed PHL, AMS, and
FRE. PHL was our primary datacenter, FRE was used for off-site backups, and AMS
was a research installation intended for a future migration of our production
infrastructure in PHL and next-generation deployment of SourceHut intended to
scale into the indefinite future.

We have been setting up an installation in AMS for researching a future
infrastructure migration to the EU and means of increasing our resilience and
redundancy, which we had planned to gradually roll out with minimal disruption
to user service over the course of at least a year. In the end, we rolled it out
with maximum disruption to user service in 7 days. The AMS datacenter
installation was provisioned according to a projected research workload with an
eye towards expanding it to support a full SourceHut installation in the future;
at the time of the incident it was provisioned at a scale appropriate for
running *most* of a SourceHut installation.

Our FRE datacenter is used for off-site backups. We maintain a Postgres standby
which is replicated in real-time and is usually up-to-date within seconds of
production, as well as daily backups of large data silos such as git.sr.ht. We
have a comprehensive monitoring system in place which, among monitoring other
systems, keeps track of these backups and notifies us when their metrics fall
outside of our window; for instance we receive an alarm if the database replica
is more than 5 minutes behind production of if large storage backups exceed 48
hours.

We maintain a comprehensive set of operational plans for responding to various
incidents which may arise, ranging from hard drive failure up to and including
the complete failure of a datacenter, which proved to be important when
addressing this scenario. We also have standard response times for responding to
various tolerances being exceeded which are designed to minimize user impact;
for instance we configure the storage utilization alarms with sufficient lead
time to provision additional storage.

The complete failure of a datacenter is the most challenging situation we have
prepared for, and it is the situation with which we were ultimately faced.

## The incident

At around 06:00 UTC on January 10th, a layer 3 distributed denial-of-service
(DDoS) attack began to target SourceHut's PHL infrastructure. We routinely deal
with and mitigate application layer (layer 7) DDoS attacks, however, a layer 3
attack takes place at a lower level and is not within our ability to mitigate
without the assistance of our network provider. Starting from about 06:00, our
monitoring systems noticed that something was wrong and raised the alarm, and we
started investigating the issue shortly thereafter. However, before we could get
a handle on the situation, our access to the PHL network completely disappeared
at around 09:00 UTC.

![Screenshot of our monitoring system detecting problems](/january-outage.png)

<div class="alert alert-info">
  We never received any kind of ransom note or other communication from the
  attacker. We do not know who was behind the attack, nor their motivations, and
  likely never will. We know that they targeted SourceHut specifically, and that
  they followed us as we worked on mitigations, directing their attack at new
  infrastructure as it was being set up.<br /><br />
  In this post-mortem we are going to focus on the impact on our network and the
  steps we took to restore service, rather than going into what we know of the
  attack and the details of our mitigations, both for information security
  reasons and to avoid lending legitimacy to a bad actor. In the end, the
  response to the attack from our upstream network in PHL did more damage to our
  infrastructure than anything else.
</div>

We rent network service in PHL from our colocation provider, who provisions a
subnet out of their AS and routes it through Cogent and Level 3. In response to
the attack, Cogent announced null routes for our downstream AS, causing our
PHL network to become unreachable both for SourceHut staff and the general
public.

We attempted to contact our colocation provider at this point, but we were
unsuccessful. Our provider in PHL has been acquired twice over the past couple
of years, and it seems that the ticketing portal we were used to paging them
with had been deprecated and our account had not been migrated to the new
system. We were unable to reach them until their normal office hours opened at
14:00 UTC. Our provider restored our access to the priority ticketing system and
began to investigate the issue. Eventually they were able to convince Cogent to
reduce the null route from our entire /24 to a narrower /32 focusing on the
specific IP address being targeted by the DDoS. As a result, service was mostly
restored by 18:00 UTC.

At about 06:30 UTC the following morning, the DDoS escalated and broadened its
targets to include other parts of our PHL subnet. In response, our colocation
provider null routed our subnet once again. This subnet has been unreachable
ever since.

At 09:00 UTC, I made the call to perform an emergency migration to AMS and
restore from backups. We began urgently planning the scope of this work, making
an assessment of our backups and the Amsterdam installation's capacity to host
a fully functional SourceHut installation, and planning the work that needed to
be done. We verified the health of FRE and AMS and our backup systems, finding
that our standby database was less than 30 seconds out of date with production
and that our large storage backups were no more than 12 hours old. We found that
AMS was in good health and we touched up a few research systems (e.g. Ceph) to
bring them to production readiness.

What essentially followed was creating a new installation of SourceHut from
scratch, importing production data, testing and verifying the installation, and
bringing it online for user service on a new DDoS-resistant network. This
involved hundreds of small tasks that we planned out and distributed among
ourselves and executed as urgently as possible, the full details are too
involved to repeat here. However, the general plan had the following broad
strokes:

- Migrate to external DNS
- Bring up a new primary database
- Restore backups from FRE to AMS
- Migrate object storage from PHL to AMS
- Bring up database-only services, such as meta, todo, project hub
- Bring up large storage services as backup restores finish
- Manually apply the diff between production data and the last backups
- Provisioning a new mail system and configuring mail services for it
- Identify a suitable DDoS-resistant network to bring us into general service
- Provision servers to backfill AMS capacity to production readiness
- Test the new systems and bring them into general service

All of this work happened in parallel and had cross-dependencies, so from here
on out we will omit some timestamps.

**Network solutions**

The selection of a suitable network to bring into service that would not
immediately collapse as the DDoS attack followed us presented some challenges.
First, this was a layer 3 attack, which can essentially only be mitigated by
having more bandwidth than the attacker and/or by filtering traffic at a
location suitably far upstream. Furthermore, many DDoS protection systems only
operate at the application layer, namely for the web as the application in
question, whereas SourceHut has user-facing services through not only HTTPS but
also SSH, SMTP, and IRC; moreover we strongly prefer to utilize end-to-end
encryption on all traffic and terminate it on SourceHut-operated infrastructure.

We initially researched a number of solutions, and spoke to CloudFlare in
particular due to their ability to provide a rapid response to ongoing
incidents. However, given our complex requirements, CloudFlare quoted us a
figure which was not attainable within our financial means as a small company.
Other options we researched (though we did not seek additional quotes) had
similar economical constraints. However, we found that OVH's anti-DDoS
protections were likely suitable: they are effective, and their cost is
amortized across all OVH users, and therefore of marginal cost to us. To this
end the network solution we deployed involved setting up an OVH box to NAT
traffic through OVH's DDoS-resistant network and direct it to our (secret)
production subnet in AMS; this met our needs for end-to-end encryption as well
as service over arbitrary TCP protocols.

We also got in contact with our network operator in AMS and explained the
situation to them. We found some solutions to mitigate attacks directed at AMS
but we will not disclose details regarding the AMS network for reasons of
information security.

We made some mistakes throughout the operation, rsyncs done incorrectly,
networks misconfigured, and so on. One particularly amusing mis-step occurred
when we configured the NAT through OVH: we naively NAT'd all traffic through to
AMS, and when the attack resumed targeting our OVH infrastructure, the inbound
DDoS was briefly forwarded to AMS before OVH's mitigations kicked in, which made
our brand new OVH account look like the source of an *outgoing* DDoS, with
predicable consequences that took some work to resolve with OVH.

Following our initial quote from CloudFlare, we understand that some CloudFlare
employees undertook a grassroots effort internally to convince the leadership to
sponsor our needs, and eventually CloudFlare came back to us with an offer to
sponsor our services for us free of charge. This was a very generous offer for
which we are very appreciative; in the end we did not take them up on it as we
had made substantial inroads towards an alternative solution by that time. I
have had my reservations about CloudFlare in the past, but they were there for
us in a time of need and I am grateful for that.

On January 12th, our network provider in PHL agreed to provision a temporary
subnet through which we could receive out-of-band access to our PHL servers.
We were able to speed up the provisioning of replacement infrastructure thanks
to this being made available.

**Provisioning services**

Efforts to restore individual SourceHut services came with a variety of
challenges. Some of them were fairly straightforward; services like paste and
the project hub depend only on a working SQL server and once we had that in
place we were able to restore them to service at about 19:00 UTC on January
11th.

git.sr.ht and hg.sr.ht had special considerations due to the large amount of
data they were responsible for. We restored them from backups to read-only
service based on somewhat stale data by 20:00 UTC, and restored to full
read/write service by 11:00 UTC on January 13th. We also did our best with
hg.sr.ht, but it is community maintained and restoring service was delayed until
we could get the community maintainer, Ludovic Chabant, online to help; it was
fully restored at 08:20 UTC on January 15th.

pages.sr.ht also presented unique challenges due to its use of an S3-compatible
object storage solution, which we discovered was not considered in our off-site
backups. However, it was a priority to restore service to bring online the
numerous personal and project websites which depend on pages.sr.ht. Migrating
object storage from PHL to AMS is a slow procedure which is still underway now,
we are running pages through an out-of-band link to PHL which comes with some
performance limitations but provides service while the slower migration process
is underway in the background. Pages also had to be moved to a new subnet and IP
address, which posed a problem for users who configured their apex records to
point directly to the PHL subnet; we have now emailed affected users with
instructions for manual intervention.

chat.sr.ht also poses some unique constraints due to its approach to networking;
for a number of reasons we implement outbound IRC connections on a unique IPv6
address per-user. Preparing the requisite network infrastructure and bringing it
online required special considerations and as a consequence chat.sr.ht was the
last service to be restored to full operation at 10:30 UTC on January 17th.

builds.sr.ht also required some extra considerations due to the fact that our
research installation in AMS was under-provisioned for its compute requirements.
Currently we are running build workers on dedicated baremetal OVH servers and we
are planning to bring build service back onto SourceHut-operated infrastructure
once we are able to ship our builds-oriented compute servers from PHL to AMS in
the coming weeks. We began accepting build jobs again at 18:00 UTC on January
16th.

All told, we began restoring partial service availability on the afternoon of
January 12th, and gradually brought up services over the following days until
full service was restored on the morning of January 17th. Following the
complete restoration of service we credited all paying SourceHut users with 7
days of free service.

## What's next

We have completed all user-facing steps required to restore SourceHut to full
service. However, we have numerous tasks to perform internally to put the
finishing touches on the new installation and to clean up workarounds and hacks
put in place to restore service as quickly as possible. We have an internal
bugtracker with about 60 post-incident tasks to be completed, some of which are
finished and others which are still underway: for instance, we have provisioned
a new standby database, configured backups from AMS => FRE, and we are working
on installing a new monitoring system.

We are also deprecating our PHL datacenter installation entirely. We still
cannot reach the network there, and the operator has egregiously exceeded their
SLA with us. We will pack up the servers in PHL and ship them to AMS to
supplement capacity there.

Ironically, this emergency migration allowed us to quickly achieve many of the
long-term goals we had in mind for migrating to the EU. We are now running
almost entirely on European infrastructure and we quickly finished bringing many
of our plans to ensure future scalability and reliability of SourceHut
infrastructure to production readiness. We had planned to do these upgrades
without user impact, but, well, alas.

Part of the work involved in setting up the AMS datacenter installation was
geared towards increasing resilience, reliability, and redundancy, and reducing
the impact of attacks and outages of this nature. SourceHut is still in an
"alpha" state, and though we have built a platform that is sophisticated and
depended on by numerous free software projects, that comes with some caveats.
This incident exposed one such caveat, a shortcoming that we were aware of and
actively working on improving, but which was exploited before we could complete
our goals for redundancy and resilience. Our definition of production readiness,
our "definition of done" for the alpha, includes building infrastructure that
prevents this kind of outcome. We have made unexpectedly urgent inroads on these
milestones, and we will continue to build out these solutions as part of our
work to bring SourceHut from alpha to beta to production.

In the service of this work, we have been researching a solution for running
SourceHut in an on-premise Kubernetes cluster (cue gasp from the audience). The
migration to AMS did not involve a migration to Kubernetes, but it did put us in
a better position to expedite that work. We intend to utilize this work to
reduce user-impacting downtime during internal maintenance, such as when scaling
up our infrastructure or upgrading software, but also to improve our resistance
to events such as the one that transpired this week. Once we have completed an
implementation of this solution, we will be planning out a secondary
production-ready datacenter which we can load balance against and which can step
up to take on full service in the event of a datacenter outage, as well as
making it easier to conduct the procedures that we employed this week to stand
up SourceHut from scratch in a new datacenter should the need ever arise again.

As unfortunate as these events were, we welcome opportunities to stress-test our
emergency procedures; we found them to be compatible with our objectives for the
alpha and we learned a lot of ways to improve our reliability further for the
future. We are going to continue working on our post-incident tasks, building up
our infrastructure's resilience, reliability, and scalability as planned. Once
we address the high-priority tasks, though, our first order of business in the
immediate future will be to get some rest.

## Acknowledgements

I'd to acknowledge those who helped us in this difficult time. Of course, I
extend my thanks to the rest of the staff, Simon and Conrad, whose long hours of
work ensured we could restore service for our customers as quickly as possible.
I would also like to thank the staff and network operators at our various
datacenter locations, for their role in facilitating our needs in the rapid
bring-up of new infrastructure. Thanks especially to the community members who
sent us their words of support and kindness, and offers of aid, via email,
Mastodon, on IRC, and so on.

Thanks are also due to our peer in the free-software-forge space, Codeberg. They
hosted our status page prior to the incident, and likely faced their own DDoS
attack in retaliation for the services they provided to us. We shared
information across our teams extensively and their communication and
relationship with SourceHut has always been superb.

I'd also like to thank the team at CloudFlare; though we did not accept your
generous offer we were appreciative that you were there for us in a time of
need.

On a personal note, I would like to thank my fiancé for their patience and
unwavering emotional support during a challenging time.

Thank you all for your patience and support.

-- Drew DeVault