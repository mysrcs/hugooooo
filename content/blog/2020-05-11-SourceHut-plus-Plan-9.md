---
date: 2020-05-11
title: "SourceHut + Plan 9 = ❤"
author: Drew DeVault
---

My favorite operating system is [Plan 9 from Bell Labs][plan 9]. The simplicity
and cohesive design throughout really stands out. In my opinion, Plan 9 is much,
much better than any other operating system I've used, and I've used a lot of
operating systems. Plan 9 is not perfect, but it's a substantial advance to the
state of the art.

[plan 9]: https://en.wikipedia.org/wiki/Plan_9_from_Bell_Labs

![A picture of Glenda, the Plan 9 mascot](https://l.sr.ht/pYgO.jpg)

Bell Labs has moved on, but [9front](http://9front.org) keeps the dream alive as
the most active (and sarcastic) fork of Plan 9.  In the vain hopes that more
people will become interested in Plan 9, and to provide better support to the
existing community, and because I was bored, I spent some time this weekend
adding 9front support to builds.sr.ht, providing the world's first continuous
integration service for Plan 9.

Here's an example build manifest for Plan 9:

```yaml
image: 9front
tasks:
- build: |
    cd /
    . /sys/lib/rootstubs
    cd /sys/src
    mk nuke
    mk all
```

The source code for 9front is installed on every system at `/sys/src`, so, as
you may have guessed, this build manifest compiles the operating system from
source. This includes the C compiler and linker, assembler, kernel, and
userspace; including Python 2, several game console emulators, and of course
DOOM and Quake &mdash; [in 115 seconds][build log].

[build log]: https://builds.sr.ht/~sircmpwn/job/204643

Plan 9 is very different. It's not POSIX, and not even Unix, and you can't
approach it expecting to use or even port any of the software you're used to.
Plan 9 is best appreciated on its own merits, and you should think in terms of
what new things you can do with it, rather than what old things you can force
into it. If you want to check it out, go into it expecting to learn &mdash; not
to mold it into something familiar.

Many staples of the modern software industry trace their lineage to Plan 9.  The
Go programming language is a direct descendant of Plan 9, along with Linux and
BSD's /proc filesystems, user namespaces, and more. Even if you've never heard
of Plan 9, you've been affected by it. Consider submitting a few builds to play
around with it!
