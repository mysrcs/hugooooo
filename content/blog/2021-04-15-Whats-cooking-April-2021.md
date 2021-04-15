---
title: What's cooking on SourceHut? April 2021
date: 2021-04-15
author: Drew DeVault
---

Hello again! As another month rolls on by, sr.ht saw 849 new users join our
ranks, bringing our total to 21,890. As always, please treat our new colleagues
with patience while they learn the ropes.

Tomorrow's monthly Mumble meeting is planned for 16:00 UTC, in the usual place:
voice.mnus.de, port 64738. An important question will be discussed: should
builds.sr.ht be made available only to paid sr.ht users? For details, see the
builds.sr.ht update further on.

## General News

First, and most importantly, I have some urgent news.

![](https://l.sr.ht/Xcj3.jpg)

After ~nelson had some issues using Stripe from the Falkland Islands, I offered
to accept payment for his sr.ht account in the form of cute pictures of the
locals. He agreed, and here they are 🐧 He sent four pictures
([[1]](https://l.sr.ht/pCOs.jpeg) [[2]](https://l.sr.ht/Q9c-.jpeg)
[[3]](https://l.sr.ht/ajCP.jpeg) [[4]](https://l.sr.ht/yUYU.jpeg)), and three
videos ([[1]](https://spacepub.space/videos/watch/ffcafcf2-a3e3-4996-b369-1bfdbbe640d5)
[[2]](https://spacepub.space/videos/watch/01bfa6e5-bf6a-4165-9c87-7a707dd9bc95)
[[3]](https://spacepub.space/videos/watch/f86f96be-2324-4381-96ee-47fd87c771e3)).
Thanks, Nelson! Naturally, he will not be expected to pay for his account.

Otherwise, things have been somewhat quiet, as (1) I've taken a little bit of time
off this month, and (2) we've been busy warding off attackers at the gates.
Otherwise, we have been working quietly on builds.sr.ht's GraphQL API.

## builds.sr.ht

The GraphQL API is making good progress, and I hope to have the initial version
online this month &mdash; only a few features left. Ignas Kiela has been working
on some improvements for performance, and a few other minor improvements have
shipped alongside those.

Image updates:

- FreeBSD 13 is now available

We've been dealing with a rash of cryptocurrency mining attacks on builds.sr.ht
this month, as you may have seen on [status.sr.ht](https://status.sr.ht). If
you've experienced long queue times, this is why: we are playing a cat & mouse
game trying to teach our systems to detect crypto miners, then updating them
again after the attackers figure out how to work around them and saturate our
build queue with cryptocurrency miners.

We seem to have things under control for now, but it raises a more interesting
question: should we just make builds.sr.ht a paid service? Ultimately, all sr.ht
services are going to require payment, but builds is both the most expensive
service for us to host, and the most ripe for abuse, so it may make sense to
make it paid in ahead of the beta plans. We'll be discussing this idea with the
community during the Mumble call tomorrow, feel free to join if you have some
thoughts around this.
