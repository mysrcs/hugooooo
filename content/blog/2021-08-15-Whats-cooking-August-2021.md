---
title: What's cooking on Sourcehut? August 2021
author: Drew DeVault
date: 2021-08-15
---

Hello again! Today we're joined by 434 fresh faces, bringing us to a total of
24,104 users. As always, I'm relying on you to give a warm welcome to our new
colleagues and to exercise patience as they learn the ropes.

This month's Mumble meeting will take place on the normal date tomorrow, August
16th, at 10:00 UTC. We’ll be on voice.mnus.de, port 64738, in the sourcehut
room.

After another month of development, how much closer are we to beta?

## Operations

sr.ht for Alpine 3.14 [is now available][0]. Thank you for bearing with us
during our planned maintenance window. I'll ask for your patience again
tomorrow, as we have a [second maintenance window scheduled][1] to finish our
3.14 rollout.

[0]: https://lists.sr.ht/~sircmpwn/sr.ht-admins/%3CCD9T5BZ8RR79.12IPQT8UKJZOC%40taiga%3E
[1]: https://status.sr.ht/issues/2021-08-16-planned-outage/

## GraphQL

The current major milestone for the beta is the development and rollout of our
GraphQL APIs, which form a more robust foundation for us to build upon.

This month, we shipped a read-only version of the lists.sr.ht GraphQL API. You
can check it out here:

- [GraphQL Playground](https://lists.sr.ht/graphql)
- [Manual](https://man.sr.ht/lists.sr.ht/graphql.md)

The latest GQL rollout progress is now:

<dl>
  <dt>meta.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write</dd>
  <dt>git.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write</dd>
  <dt>hg.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>todo.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>builds.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>dispatch.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write</dd>
</dl>

I have been prototyping GraphQL-native webhooks, which is the only outstanding
major design concern for the GraphQL rollout. I expect to roll these out for
meta.sr.ht in the next month. I will also start turning another one of these 
<strong class="text-danger">✗</strong> into <strong class="text-success">✓</strong>,
but I'm not sure which yet.

Ludovic Chabant has also prepared a prototype for a read-only hg.sr.ht GraphQL
API, which I will find some time to review this month.

## builds.sr.ht

The following image updates have been shipped:

- Ubuntu Impish and Hirsute are now available
- Ubuntu Groovy was removed following its upstream deprecation

It is also expected that Rocky Linux will soon be available thanks to the
efforts of Haowen Liu and Timothée Floure.

## Miscellaneous

Thanks are due to several community members for their contributions this month.
Sol Fischer Romanoff did the long-stale job of auditing and unifying the naming
conventions for resources like git repos or bug trackers across all services,
along with some unrelated minor improvements. Thanks also to Nguyễn Gia Phong,
LordNature, and Juan Picca for their various contributions.
