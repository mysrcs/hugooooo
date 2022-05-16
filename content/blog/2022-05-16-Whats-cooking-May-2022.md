---
title: What's cooking on SourceHut? May 2022
author: Drew DeVault
date: 2022-05-16
---

Hello everyone! We're back at it for another month of news in the SourceHut
sphere. Of our now 29,036 users, 630 are new this month: please offer them a
warm welcome, and your patience, as they learn about the new platform.

## todo.sr.ht

Comprehensive GraphQL-native webhooks shipped for todo.sr.ht this month.

Here's the latest GraphQL support break-down:

<dl>
  <dt>meta.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>git.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>hg.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>todo.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>builds.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
</dl>

We're getting there! The remaining webhooks should be fairly straightforward
&mdash; lists will be the most complex of these &mdash; and updating hub.sr.ht
will be the last major project before we complete the initial GraphQL
implementation. Following this we will be experimenting with GraphQL federation
as well, and once we have an answer regarding federation, the GraphQL milestone
will be complete, and we'll have taken the largest step towards the beta.

## Coming improvements to hut

The [hut] command-line tool provides programmatic access to the SourceHut
GraphQL APIs. I have been working on support for a comprehensive data export via
this tool recently, which will be followed by an equivalent data import tool.
This will allow you to take your account data from sr.ht to another instance, or
to an instance with compatible software &mdash; most of the exported data is in
standard formats like bare git repos and mbox archives. This is also another
step towards the data ownership goal of the beta, and will be followed soon by
self-service account deletion and renaming &mdash; which also require the
completion of the GraphQL APIs that are progressing apace.

[hut]: https://sr.ht/~emersion/hut

## lists.sr.ht

The new [go-emailthreads] library was integrated into lists.sr.ht's GraphQL API,
which is the next step for improving the heuristics used on the code review
screen.

[go-emailthreads]: https://sr.ht/~emersion/go-emailthreads

## meta.sr.ht

Work is underway, some of which landed this month, to improve PGP support on
SourceHut, expanding the suite of supported ciphers and making it more reliable.
Additional changes are expected in the foreseeable future to handle PGP key
expiration, notifying users when their key needs to be cycled.

## builds.sr.ht

Image updates:

- ubuntu/kinetic is now available
- ubuntu/jammy is now available
- fedora/36 is now available

## pages.sr.ht

Users may now configure custom Cache-Control headers to tune their site
performance.
