---
title: What's cooking on Sourcehut? January 2021
date: 2021-01-15
author: Drew DeVault
---

Another year begins, and hopefully with better prospects for us all. SourceHut
has emerged from 2020 relatively unscathed, thankfully, and I hope the same is
true of most of our users. A body which, by the way, today numbers 19,647
strong, up 623 from December. Please warmly welcome our new members, and be sure
to lend them your expertise as they learn how to use our tools.

Tomorrow's public Mumble conference will be held at 16:00 UTC, on voice.mnus.de,
port 64738, in the sourcehut room. Feel free to join us to share your thoughts
and ask your questions. See you there!

## General news

First, a much asked-for feature is now available: a dark theme! I actually
rolled out the first roll on this feature a few hours after publishing last
month's status update. It is enabled automatically when your user-agent requests
it via [prefers-color-scheme: dark][0].  A few iterations of improvements have
already been performed, and we are keeping a list of matters for attention in
future patches, but please feel free to share your feedback on
[sr.ht-discuss](https://lists.sr.ht/~sircmpwn/sr.ht-discuss) as you encounter
any issues.

[0]: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme

## todo.sr.ht

As promised, we broke ground on API 2.0 for todo.sr.ht this month. Feel free to
check out the [draft GraphQL schema][1] if you are curious to know more.

[1]: https://git.sr.ht/~sircmpwn/todo.sr.ht/tree/api/item/api/graph/schema.graphqls

## hg.sr.ht

Following the roll-out of git.sr.ht's API 2.0 implementation, Ludovic Chabant
has been hard at work on developing a prototype of an API 2.0 branch for
hg.sr.ht as well. I intend to review this and help form it into a
production-ready implementation in the coming weeks.

## git.sr.ht

Small news: you can now update the patchset revision in the patch preparation
UI. Nolan Prescott also contributed some fixes to this workflow for some missed
edge cases.

## dispatch.sr.ht

An experimental feature is now available which allows dispatch.sr.ht users to
forward patches sent to a lists.sr.ht mailing list to GitLab as merge requests,
and convey the enusing discussions between both mediums. YMMV.

## builds.sr.ht

There have been some minor fixes and improvements to the following images:

- Debian
- Fedora
- NixOS

Additional Fedora improvements are in the pipeline, as well as a new Void Linux
image.
