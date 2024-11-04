---
title: What's cooking on Sourcehut? June 2021
date: 2021-06-15
author: Drew DeVault
---

Halfway through 2021! Things are on-track for my hopes to have the beta ship
this year. Joining us on the way are 23,228 users, of which 640 are new this
month. Remember to be patient with them as they learn the ins and outs of using
sr.ht!

This month's Mumble meeting will take place on the normal date tomorrow, June
16th, at 16:00 UTC. We'll be on voice.mnus.de, port 64738, in the sourcehut
room.

## meta.sr.ht

I have overhauled the registration workflow in preparation for the future
billing changes for the beta, more clearly distinguishing between the
"contributor" approach and the "maintainer" approach &mdash; only the latter
ultimately being expected to pay for their account. I've also made some
improvements for admins of third-party instances to make it easier to provide
billing support following the changes to builds.sr.ht payment.

## builds.sr.ht

Mandatory payment is now in effect for all builds.sr.ht usage, for all users. If
you require financial assistance, please [email me](mailto:sir@cmpwn.com)
explaining your circumstances and you will be issued free service credits.

As promised, the writable GraphQL API has shipped, allowing you to use GraphQL
to submit jobs, manage job groups, and work with secrets.

Additionally, thanks to Michael Forney's finishing touches on the old patchset,
the NetBSD image is now available as "netbsd/9.x" (aka "netbsd/latest") and
"netbsd/8.x". Furthermore:

- Fedora 35 is now available
- NixOS 21.05 is now available, and 20.03 has been removed
- OpenBSD 6.9 is now available, and 6.7 has been removed
- Minor improvements have been made to Arch Linux

## lists.sr.ht

The initial draft of the planned lists.sr.ht GraphQL API has been written, and
you can [read it here][0] (send feedback to IRC). Additionally, Simon Ser has
broken ground on [go-emailthreads][1], which we hope to use to provide more
robust email discussion parsing for future improvements to code review tooling.
Developing this GraphQL API is our focus for the coming weeks.

[0]: https://git.sr.ht/~sircmpwn/lists.sr.ht/tree/api/item/api/graph/schema.graphqls
[1]: https://git.sr.ht/~emersion/go-emailthreads
