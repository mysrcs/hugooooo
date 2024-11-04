---
title: What's cooking on Sourcehut? October 2019
date: 2019-10-15
author: Drew DeVault
---

I'm more excited to give today's status update than any other so far. To get the
necssary bits out of the way: this month, 368 users have joined the community,
bringing our total to 10,539[^1]. Welcome!

## General news: Simon Ser joins us

I'm very excited to announce that [Simon Ser](https://emersion.fr/) will be
joining Sourcehut. His role will be interesting, and representative of my vision
for Sourcehut in the long-term. Simon's responsibilities are to simply continue
working on self-directed free software projects. I chose to work with him
because he's already a talented generalist and motivated member of the free
software community. He's written more about his specific plans in [his own blog
post][emersion blog], but with our support he'll be working on projects like
[mrsh](https://mrsh.sh/), [Wayland](https://wayland.emersion.fr/), and the
maintenance of [large swaths of Golang's email landscape][golang email].

[emersion blog]: https://emersion.fr/blog/2019/working-full-time-on-open-source/
[golang email]: https://github.com/emersion?utf8=%E2%9C%93&tab=repositories&q=&type=&language=go

Some of Simon's work directly benefits Sourcehut, but the goal of sponsoring his
work is to help populate the open source ecosystem as a whole with motivated,
financially stable developers with the freedom to work at their own direction.
If you've been following the [financial reports][quarterlies], this kind of work
is what I plan on spending Sourcehut's profits on: directly elevating the free
and open source software community.

[quarterlies]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss?search=financial+report

Additionally, thanks to Denis Laxalde's help, Sourcehut packages are now
available for Debian from our [new Debian repository][debs]. Thanks Denis!

[debs]: https://man.sr.ht/packages.md#debian

## git.sr.ht: web-based patchsets

Many of you recall one of the original promises of Sourcehut: web-driven tooling
built on top of an email-driven workflow. This is part of the third broad phase
of Sourcehut development. These three phases are: (1) build a bunch of
self-contained tools which represent the primitives of a development system; (2)
extend them with comprehensive APIs and webhooks; (3) teach them to talk to each
other. This design takes longer to bear fruit, but the result is worth it.
However, our wait is starting to come to a close: this week, I implemented
patchset preparation on the web.

<video src="https://sr.ht/_fUk.webm" controls muted>
  Your web browser does not support the webm video codec. Please consider using
  web browsers that support free and open standards.
</video>

This is now live on git.sr.ht! Please give it a shot and let me know your
thoughts. Progress is being made on the other end of this workflow as well - see
the lists.sr.ht updates later on. In other git.sr.ht news, some long-requested
features like release blobs and git-lfs are showing signs of life. This month, a
shiny new 64TB NAS was provisioned and installed in our datacenter, and will be
the backbone upon which many of these features are implemented.

## lists.sr.ht

I have been working on lists.sr.ht indirectly recently, in the form of
improvements to [libgit2][libgit2] and [pygit2][pygit2] upstream. The idea is to
expose libgit2's pluggable backends to pygit2, so that I can create a
`pygit2.Repository` which is backed by git.sr.ht via the git.sr.ht API.

[libgit2]: https://github.com/libgit2/libgit2/pulls/ddevault
[pygit2]: https://github.com/libgit2/pygit2/pulls?q=is%3Apr+author%3Addevault+is%3Aclosed

## builds.sr.ht

NetBSD folks have been helping me work through the issues, but it's slow going.
If anyone wants to have a go at it, [download this image][netbsd img] and see if
you can't figure out how to make it expand the partitions and filesystem to fill
available space on first boot. It's generated with
[these scripts][netbsd scripts] on a NetBSD host.

[netbsd img]: https://yukari.sr.ht/netbsd.qcow2.xz
[netbsd scripts]: https://git.sr.ht/~sircmpwn/builds.sr.ht/tree/master/images/netbsd

That same NAS I mentioned in the git.sr.ht update, by the way, is going to be
used for build artifacts soon, and likely for build caches as well, which will
speed up many classes of builds. Additionally, a POWER9 server has been
provisioned and installed in the DC, which I'm preparing to eventually become a
ppc64le builder. I'm looking forward to seeing both in action!

## paste.sr.ht

[paste.sr.ht](https://paste.sr.ht) received some polish this month thanks to the
hard work of Mykyta Holubakha. A public index of your pastes, access controls,
and soon paste deletion are all being added to the platform.

## names.sr.ht

![![](https://sr.ht/_yhw.png)](https://sr.ht/_yhw.png)

[^1]: Note: I've changed the way the total users are calculated this month. Previously, the number included people who signed up but never confirmed their registration via email.
