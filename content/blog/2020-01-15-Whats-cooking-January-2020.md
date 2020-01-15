---
title: What's cooking on Sourcehut? January 2020
date: 2020-01-15
author: Drew DeVault
---

Welcome to 2020! We kick off our first status update of the year with a
community 12,314 users strong, up 387 from our last update of 2019. A warm
welcome to all of our new members, and a big thanks to everyone for continuing
to use and support SourceHut. This month was heavy on operations work, so this
update is light on new features - but we're turning our attention back to
feature development in the coming weeks.

## General News

We're going to [FOSDEM](https://fosdem.org/2020/schedule/event/bof_sourcehut/)
again this year! We'll be in the J.1.106 room on February 1st at 12:00 PM. Come
join us, we'll be giving away stickers, answering questions, and showing off
some of our upcoming plans.

Last week, I finished overhauling our monitoring & alarming infrastructure, and
the new setup is [available to the public](https://metrics.sr.ht) for
inspection. I'm also working on opening up more ops work to improve transparency
in this respect: the [#sr.ht.ops channel](irc://irc.freenode.net/sr.ht.ops) on
Freenode is now open to the public, and I've also established the public
[sr.ht-ops mailing list](https://lists.sr.ht/~sircmpwn/sr.ht-ops). I've updated
our alarms to send notifications to #sr.ht.ops and to the sr.ht-ops mailing
list, and directed some of our cronjobs to the public mailing list as well, so
you can keep abreast of things like backup integrity and get greater insights
into outages and load. Our [alertmanager
rules](https://git.sr.ht/~sircmpwn/metrics.sr.ht) are also public, and you can
drop these into your own infrastructure to add similar monitoring to your
third-party instance.

Work is ongoing to add more instrumentation throughout SourceHut, stay tuned. As
part of this work, we also upstreamed several monitoring-related packages to
Alpine Linux, and upgraded all of our machines to Alpine 3.11 (and Python 3.8).

## git.sr.ht

We *finally* were able to source the remaining parts for the new server hardware
we needed to completely resolve the performance issues you were likely
experiencing with git.sr.ht. The new server is blazing fast! Thanks for your
patience, I know it was frustrating before. It should be plenty fast now. Aside
from some minor bugfixes and upgrades to support pygit2 1.x and Alpine 3.11,
there's not much else to discuss for git.sr.ht. Some of these improvements have
been making their way into hg.sr.ht, so expect performance to gradually improve
there as well.

## todo.sr.ht

Some great news here: you can now re-import the tracker exports which were
implemented last month, to recreate deleted trackers, migrate trackers between
accounts, or even between SourceHut instances. This month I'm focusing on
accomplishing our data ownership goals, so you should see improvements like this
throughout the services in the coming weeks. Ivan Habunek also implemented some
nice changes, notably adding rendered markdown previews for comments.

## builds.sr.ht

The alpine/3.11 image is now available, and alpine/latest now refers to it.
alpine/edge has been updated to use the linux-lts kernel from edge.
