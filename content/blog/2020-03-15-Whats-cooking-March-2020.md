---
title: What's cooking on Sourcehut? March 2020
date: 2020-03-15
author: Drew DeVault
---

Hello! This has been a very busy month for SourceHut. Thank you for supporting
it during the alpha! Today our users are 13,195 in number, with 438 new users
joining us since our last status update. Please give them a warm welcome!

## General News

I've spent a lot of time this month working on a bunch of operations-related
tasks, such as monitoring and backups improvements. Our backup system is now
triple-redundant and kept in check by three separate monitoring systems. You'll
see some of these reports on our public
[operations mailing list](https://lists.sr.ht/~sircmpwn/sr.ht-ops), or can dig
into the raw data on our public [Prometheus instance](https://metrics.sr.ht).
I've also written up an [operations manual](https://man.sr.ht/ops/) to keep
track of our approach and future plans for operations, so that you can be aware
of what steps we're taking to keep things up and running, and perhaps apply our
techniques to your own self-hosted instances of SourceHut.

This month also saw design discussions on sr.ht-discuss regarding the eventual
design and implementation of user groups (or "organizations"), and how they'll
affect billing, access control lists, reserved CI slots, and so on. Check out
the archives for more: [the initial proposal][v1], and [version 2][v2].

[v1]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CC0L8LGIM0C2I.3O209D1TSO6M3%40homura%3E
[v2]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CC0WZSZTLDP8B.34K9PQFW7NTHB%40homura%3E

We also deployed some improvements to responsiveness throughout the site, which
you'll probably have already noticed if you're on mobile. Mobile users aren't
the only group to benefit, however: I took extra time to make sure the interface
looks good at any subset of a 4K monitor, so our tiling window manager users can
have a comfortable interface with a web browser at half-width or less.

Finally, we have a new mail server in place, which should be a little bit more
maintainable going forward, and our legacy infrastructure has finally been
overhauled. These were our last two servers which were not running on the
standard Alpine-based load-out[^1]. This unblocks...

[^1]: With the exception of ns1.sr.ht and ns2.sr.ht, which are still running Debian. These are slated for upgrade, but are not urgent.

## sr.ht

Finally, work has commenced on the central project hub. This will solve the
problems of discoverability of projects hosted on SourceHut, searching for
new projects site-wide, linking together bug trackers and git repos, and more.
This project is ostensibly called "hub.sr.ht" internally, but the intention is
to deploy it at the top-level domain: sr.ht.

![](https://legacy.sr.ht/RUcZ.jpg)

The hub will let you create a central hub for your project, with any combination
of zero, one, ten, or more git and hg repos, bug trackers, mailing lists, and so
on. You can add exactly what you need, as much as you need, and nothing you
don't need. This is why SourceHut is designed the way it is today. Many large
projects have dozens of source repos, and giving each one their own bug tracker,
pull requests, documentation, website, and so on, does not map to the actual
project structure and frequently leads to clunky workflows on other hosts. The
SourceHut project hub solves this problem better.

## builds.sr.ht

Following up on our recent git.sr.ht change to allow users to attach binary
releases to git tags, I've implemented build artifacts for our CI as well. By
adding a list of artifacts to your build manifest, you can have the files
extracted from the build VM after successful builds and made available for
download on the web or inspection via the API. Artifacts are kept for 30 days,
but in the future I would like to let you indicate that certain artifacts should
be kept permanently. [Docs are available
here](https://man.sr.ht/builds.sr.ht/manifest.md#artifacts).

I also provisioned a new build server this month, and as part of our ops work
I've [documented its specs here](https://man.sr.ht/ops/provisioning.md#build-hosts).
This will increase our build throughput quite a bit, to better support our
growing base of high-demand CI projects, including
[Nim](https://builds.sr.ht/~araq/nim),
[NeoVim](https://builds.sr.ht/~jmk/neovim), and
[OpenSMTPD](https://builds.sr.ht/~puffy-bot/opensmtpd).
