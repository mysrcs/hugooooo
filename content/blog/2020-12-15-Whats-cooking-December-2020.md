---
title: What's cooking on Sourcehut? December 2020
date: 2020-12-15
author: Drew DeVault
---

A brisk wind of winter chill sets a stir down my spine, as I sit down with a
fresh cup of coffee to yarn a story of careful engineering and passionate
spirit that took place over the course of 30 days. The last 30 days. Cause this
is the monthly "what's cooking" post. Welcome! This month we're joined by 815
new users, bringing the total to 19,024. Please give them your warmest welcome
and help them learn the ropes.

Our next public Mumble conference will be held tomorrow at 16:00 UTC, on
voice.mnus.de, port 64738, in the sourcehut room. Please join us to share your
feedback, ask questions, and so on.

## General news

The big news this month is the rollout of API 2.0 support for meta.sr.ht and
git.sr.ht, both of which have reached feature parity with their REST
counterparts. For meta.sr.ht as well, our new OAuth 2.0 backend has shipped and
is fully compliant with RFC 6749.

todo.sr.ht is up next, and work for API 2.0-native webhooks is going to begin
soon as well.

## meta.sr.ht

Here are the resources for meta.sr.ht's GraphQL support:

- [GraphQL documentation](https://man.sr.ht/graphql.md)
- [meta.sr.ht playground](https://meta.sr.ht/graphql)
- [OAuth 2.0 documentation](https://man.sr.ht/meta.sr.ht/oauth.md)

There were also some improvements to our abuse prevention capabilities after a
wave of spam registrations &mdash; if any third-party sr.ht admins require
similar interventions for their instances, please reach out in private.

## git.sr.ht

git.sr.ht's GraphQL API grew support for mutations, like repository creation and
artifact uploads. Resources:

- [GraphQL documentation](https://man.sr.ht/graphql.md)
- [git.sr.ht playground](https://git.sr.ht/graphql)

## lists.sr.ht

Email replies to patchset threads can now include a custom header,
`X-Sourcehut-Patchset-Update` to update the status of the patchset to ACCEPTED,
REJECTED, NEEDS_REVISION, and so on. Additionally, a couple of buttons have been
added to all mailing lists which allow any user &mdash; list admin or not
&mdash; to download an archive of either the last 30 days, or the entire list's
history, as an mbox for importing into their local mail spool.

## builds.sr.ht

NixOS 19.09 has been removed following its upstream deprecation.
