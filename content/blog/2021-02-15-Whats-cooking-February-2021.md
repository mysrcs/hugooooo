---
title: What's cooking on Sourcehut? February 2021
author: Drew DeVault
date: 2021-02-15
---

Greetings! I'm happy to share that our community has surpassed 20,000 users this
month. 708 new faces have joined our ranks, bringing the total to 20,355. We've
become a pretty big community! Please be friendly and patient with them as they
learn the ropes. This month's "what's cooking" is somewhat deficit in
interesting user-facing developments, but I will dutifully report our progress
nonetheless.

Our next public Mumble conference will be held at 16:00 UTC, on voice.mnus.de,
port 64738, in the sourcehut room. Feel free to join us to share your thoughts
and ask your questions. I'll <span style="text-decoration: line-through">see
you</span> hear you there!

## General news

We've upgraded (most of) our infrastructure to Alpine Linux 3.13, and made sr.ht
packages available to any admins who are running third-party instances. A quick
reminder that any such admins should be subscribed to the
[sr.ht-admins](https://lists.sr.ht/~sircmpwn/sr.ht-admins) mailing list to
receive this and other important announcements that affect your instance.

We will have to schedule a second round of upgrades for our hardware hosts
sometime in the next few weeks. It'll be announced in advance on sr.ht-announce
and on status.sr.ht when the time comes.

## todo.sr.ht

Most of our progress this month is in the new todo.sr.ht GraphQL API, which is
going well. I hope to ship an initial read-only version to production before the
next status update.

## builds.sr.ht

Not technically an update for builds.sr.ht, but rather for the software which
submits build manifests: we've started developing some standard environment
variables which are set by git.sr.ht, hub.sr.ht, and so on, when submitting
builds. You can use these to programmatically find out why your build was
submitted, and access other context-specific details. [Check out the docs
here](https://man.sr.ht/builds.sr.ht/#integrations).
