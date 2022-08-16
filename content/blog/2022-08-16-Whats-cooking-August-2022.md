---
title: What's cooking on SourceHut? August 2022
date: 2022-08-16
---

Good morning! 785 new users are joining us on this cool August morning, for a
total of 31,600 SourceHut users. Remember to be kind and patient with our new
members as they learn how to use the software and work with the communities
here. We only have a short update for this month, so let's get right into it.

## GraphQL

Work on GraphQL has slowed this month as we get ready to tackle a major change:
ID unification. Each of our services has a separate database with their own user
tables synchronized with meta.sr.ht's authoritative data, each of which has its
own set of user IDs. This has worked fine thus far, but for the coming work on
GraphQL federation, we will need to unify them. This is a major effort which
will require thorough testing and a careful roll-out, and progress on other
goals will slow as it's being done. Stay tuned.

## Infrastructure

We have selected a new datacenter location for our European infrastructure
roll-out and are working with hardware suppliers to provision an initial set of
research servers to install. It will still be several months before we're ready
to completely move our servers into the EU, but things are moving along.

## todo.sr.ht

A new ticket resolution, CLOSED, has been added and made the default selection.
The project hub has also been updated to support using CLOSES in commit trailers
when pushing to git repositories.

## builds.sr.ht

- OpenBSD 7.1 is now available
- OpenBSD 6.9 has been removed following its upstream deprecation
- NixOS 21.11 is deprecated and will be removed shortly
- Ubuntu Impish is deprecated and will be removed shortly

We are also expecting Rocky Linux 9 to be available soon.

## dispatch.sr.ht

Dispatch is being deprecated. [See the announcement][0] for the details.

[0]: https://sourcehut.org/blog/2022-08-01-dispatch-deprecation-plans/
