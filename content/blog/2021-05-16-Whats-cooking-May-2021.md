---
title: What's cooking on Sourcehut? May 2021
author: Drew DeVault
date: 2021-05-16
---

Running a day late on this one &mdash; was travelling all day yesterday. We'll
also be moving the Mumble meeting to tomorrow, May 17th, this month. Thanks for
your patience! Today, SourceHut has 22,588 users, 698 more since the last status
update. Please offer our new colleagues a warm welcome, and be patient with them
as they learn how to use the software.

The monthly Mumble meeting, one day later than usual, will take place at 16:00
UTC on May 17th, in the SourceHut room on voice.mnus.de, port 64738.

## builds.sr.ht

In addition to the [recent billing changes][0], builds.sr.ht saw the initial
release of its [GraphQL API][1] this month! The current version is read-only,
but I expect to ship the read/write API within the next few days &mdash; it's
just finishing up the code review process now. You can take the builds.sr.ht
GraphQL API for a test drive on the [GraphQL playground][2].

[0]: https://man.sr.ht/ops/builds.sr.ht-migration.md
[1]: https://man.sr.ht/builds.sr.ht/graphql.md
[2]: https://builds.sr.ht/graphql

## GraphQL update

Today, we have the following GraphQL APIs working in production:

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
  <dd><strong class="text-success">✓</strong> read <strong class="text-danger">✗</strong> write (soon)</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>dispatch.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write</dd>
</dl>

The next service to receive its GraphQL API will be lists.sr.ht. Ludovic has
also been working on an hg.sr.ht GraphQL API, which I'll be helping out with
soon. The project hub and write support for todo will be the last major projects
for the GraphQL effort. After these, the remaining services &mdash; paste and
dispatch &mdash; will be pretty straightforward.

Following the completion of the initial APIs work, the plan is to design and
implement a few other features which will be shared between all of these
services, most notably GraphQL-native webhooks.

I appreciate your patience while this work is ongoing. I know that there has not
been much work in the realm of user-facing features over the past several months
while we've been focusing on getting this done. This work, when completed, will
unblock a lot of the workstreams you've been waiting for &mdash; organizations,
improvements to the project hub and service interconnectivity, better ACLs, and
so on. The GraphQL services are much more robust and sustainable for sr.ht, and
will provide a necessary foundation for future features like these. It's not
flashy, but paying down our tech debt is a necessary pain before we can start
the beta.
