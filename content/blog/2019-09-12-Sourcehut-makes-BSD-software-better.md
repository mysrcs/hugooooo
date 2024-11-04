---
title: "Sourcehut makes BSD software better"
date: 2019-09-11
author: Drew DeVault
---

Every day, Sourcehut runs continuous integration for FreeBSD and OpenBSD for
dozens of projects, and believe it or not, some of them don't even use Sourcehut
for distribution! Improving the BSD software ecosystem is important to us, and
as such our platform is designed to embrace the environment around it, rather
than building a new walled garden. This makes it easy for existing software
projects to plug into our CI infastructure, and many BSD projects take advantage
of this to improve their software.

Some of this software is foundational stuff, and their improvements trickle down
to the entire BSD ecosystem. Let's highlight a few great projects that take
advantage of our BSD offerings.

# Programming languages: Janet, Nim, Zig

Several programming languages use Sourcehut to run BSD testing. The
[Janet](https://janet-lang.org/) language uses Sourcehut to test both
[FreeBSD](https://builds.sr.ht/~bakpakin/janet/.freebsd.yaml) and
[OpenBSD](https://builds.sr.ht/~bakpakin/janet/.openbsd.yaml), and fast - each
build takes only about a minute! The newest language to join us is
[Nim](https://nim-lang.org/), which now uses builds.sr.ht to make sure every
Github pull request works correctly on FreeBSD and OpenBSD. The
[Zig](https://ziglang.org/) project, long time friends of Sourcehut, have also
been using builds.sr.ht to test their FreeBSD support, and they host their
mailing lists with us, too.

The stability of programming languages is especially important, as bugs in the
compiler or implementation will affect all software compiled with it. Thanks for
using Sourcehut to keep your BSD support in good shape, guys!

# End-user software: Neovim, mutt

End-user software gets in on the fun, too, which puts more stable BSD software
closer to your fingertips. The [Neovim](https://neovim.io/) project, a fast
moving and modern fork of the venerable Vim text editor, uses builds.sr.ht for
OpenBSD testing, and working on using it to help fix [bugs in their FreeBSD
port](https://github.com/neovim/neovim/pull/10907). The similarly venerable
[mutt](http://mutt.org) email client has also been experimenting with Sourcehut
recently. They're using builds.sr.ht to make sure mutt compiles on FreeBSD,
Alpine Linux, and Debian, and they're trying out lists.sr.ht mailing lists, too.

# Display servers: wlroots, sway

One of my own projects, [wlroots](https://github.com/swaywm/wlroots), was one of
the first adopters of Sourcehut, to no surprise. We were also early adopters of
FreeBSD support, and now we use it to test that [dozens of Wayland
compositors](https://github.com/swaywm/wlroots/wiki/Projects-which-use-wlroots)
work well on the platform. Several of these test themselves further down the
stack on FreeBSD as well, such as my own [sway](https://swaywm.org) project, and
the [cage](https://github.com/Hjdskes/cage) project, and more projects still are
using Sourcehut to test other operating systems as well.

# Small projects, too!

Lots of smaller projects have been taking advantage of Sourcehut's BSD tools,
too, to make sure they're set up right on for our Berkley friends from the
start. Simon Ser's [mrsh](https://mrsh.sh/) shell tests on [FreeBSD, Arch Linux,
and Alpine Linux](https://builds.sr.ht/~emersion/mrsh). Michael Forney's
[samurai](https://github.com/michaelforney/samurai) project uses Sourcehut
builds to test [four operating systems, including Free and
OpenBSD!](https://builds.sr.ht/~mcf/samurai)

# And yours?

Want to try it yourself? Just set your [build
manifest](https://man.sr.ht/builds.sr.ht/manifest.md)'s image to
`freebsd/latest` or `openbsd/latest` and drop it into the [submit
page](https://builds.sr.ht/submit) to give it a test drive - no need to push any
half-baked test commits until it's done. Check out the [compatibility
page](https://man.sr.ht/builds.sr.ht/compatibility.md) for details on
builds.sr.ht support for *BSD and other operating systems, and check out
[dispatch.sr.ht](https://dispatch.sr.ht) to add BSD CI to your Github projects.

**Hey!** Are you a NetBSD expert? We need some help to finish up NetBSD support
on builds.sr.ht. [Get in touch?](mailto:~sircmpwn/sr.ht-discuss@lists.sr.ht)
