---
title: What's cooking on SourceHut? July 2022
author: Drew DeVault
date: 2022-07-18
---

Good morning, SourceHut! Today we have 30,815 users, 1,203 of which are joining
us for the first time this month &mdash; a big increase! To all of our new
users: welcome! To all of our more tentured users: be sure to offer our new
friends a warm welcome and do your part to help them learn how to use SourceHut.

# GraphQL

Check this out:

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
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
</dl>

Adnan has been hard at work on GraphQL this month, and we're almost done. The
last remaining API to be implemented is hub.sr.ht, but before we implement it,
we'll be experimenting with [GraphQL federation]. This will allow us to access
every GraphQL API through a single endpoint, seamlessly querying resources like
git repositories and mailing lists in a single request. Since hub ties all of
the services together, this will be a very good thing to have before we proceed
with its API! This will also bring many improvements we've had planned for a
long time, but will also require many serious internal design changes to our
software, so it will require some effort to thoroughly test & validate them
before rolling it out. Federation will also open some doors for long-requested
features, such as linking resources like bug trackers back to the project they
belong to.

[GraphQL federation]: https://www.apollographql.com/docs/federation/

# hut

[hut] is a CLI tool for interacting with SourceHut's GraphQL APIs, and it
usually doesn't make it into these updates because it's not considered a core
service. However, I wanted to mention it today because I added support for
exporting your account data with hut this month. The export uses standard
formats which are as portable as possible, such as bare clones of your git
repositories or mbox dumps of your mailing lists, which you can re-import into
any git provider or mailing list software. Following this, I will be adding a
similar "import" functionality to bring your data back into any other SourceHut
instance. You can dump your account data locally, or queue up a build job to do
it on our servers.

[hut]: https://sr.ht/~emersion/hut/

Data autonomy is an important goal of the beta, so this also moves us forward
towards our long-term goals. It is also one step towards unblocking features
like account removal or renaming. Exciting stuff!

# meta.sr.ht

No major updates this month, but I have been working on some upcoming features
to tease: an overhaul to the billing system.

![Screenshot of the new billing UI](https://l.sr.ht/wPDl.png)

Some of the improvements which will be on offer include:

- New payment methods, such as iDEAL and SEPA direct deposit
- The ability to enable or disable automatic rewewal
- More currencies to pay with
- Better payment method management & invoicing

This is a very complex overhaul, so it will take some time to be completed. I'm
not sure when you can expect it to be released, but I'm looking forward to
shipping it to you!

# builds.sr.ht

- Alpine 3.16 is now available
- NixOS 22.05 is now available
- FreeBSD 13.1 is now available
- Fedora 34 has been removed following its upstream deprecation
- NixOS 21.05 has been removed following its upstream deprecation
