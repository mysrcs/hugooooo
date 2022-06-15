---
title: What's cooking on SourceHut? June 2022
author: Drew DeVault
date: 2022-06-15
---

Hello everyone! Let's get straight into the news today. Our user count today is
29,612 users, of which 576 have joined since the last update. Remember to be
patient with these new users as they learn the ropes. Welcome!

## GraphQL

Adnan continues to ship GraphQL services for SourceHut, this month shipping
webhooks for lists.sr.ht, and preparing to-be-reviewed patches adding webhooks
to builds.sr.ht and paste.sr.ht. The latest GQL support matrix looks like this:

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
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks†</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks†</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks†</dd>
</dl>

† To be added soon!

The last major effort for the initial roll-out of GraphQL support will be
hub.sr.ht. Following this, we will be experimenting with GraphQL federation, and
starting to rewrite our cross-service communication to use GraphQL. We'll then
make plans for sunsetting REST.

## lists.sr.ht

We are preparing some changes to mailing list visibility to bring it inline with
the design of other services. Permissions will be consolidated into a single
default set, and a "visibility" parameter will be added which matches the
behavior of other services. Sane defaults for these new configurations will be
selected based on your current configuration &mdash; you will have received an
email if your mailing list configuration may require manual attention during the
migration.

## builds.sr.ht

Image updates:

- freebsd/13.1 is now available

NixOS 22.05 will be available soon, and Fedora 34 will be removed soon.
