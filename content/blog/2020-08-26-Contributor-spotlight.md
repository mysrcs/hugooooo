---
title: SourceHut contributor spotlight
author: Drew DeVault
date: 2020-08-26
---

SourceHut is 100% free and open source software, and we accept contributions
from any of our users. Dozens of your peers have contributed improvements to the
services! I wanted to share a "thank you" with everyone who's helped out, and
draw attention to some of my favorite contributions.

From feature development, to bug fixes, to third-party packaging, to operations
improvements and more, external contributors have left their impact in all
facets of the software. Tools sr.ht users rely on every day were implemented by
their peers, and the reliability and performance of the service has been
guaranteed thanks in no small part to their hard work.

# Ivan Habunek's improvements todo.sr.ht

First, I'd like to give a shoutout to Ivan, who has the longest history of
consistent high-quality contributions to the project, dating to the pre-alpha
phase. We can thank Ivan for a lot of todo.sr.ht features, including:

- Ticket labels
- Ticket assignees
- Mentioning & linking to users and other tickets
- Improved search on todo.sr.ht and across the services

Ivan is also one of the "bus factor" delegates, and has access to production
todo.sr.ht systems in order to mitigate the risk a single point of failure.
Thank you for all of your help, Ivan!

# наб's improvements to everything

наб is a recent contributor to SourceHut, but over the past month she has become
[extremely prolific][0], submitting 73 patches and counting. In fact, that very
link showing all of наб's patches relies on a search feature submitted by none
other than наб herself. Some other nice improvements include:

[0]: https://lists.sr.ht/~sircmpwn/sr.ht-dev/patches?search=from%3A~nabijaczleweli

- Blame and per-file log views on git.sr.ht
- Default branches other than "master" on git.sr.ht
- README files in markup languages other than Markdown on hg, git, and hub

Not to mention dozens of bugfixes, refactorings, refinements, and small
improvements implemented for **every** sr.ht service. Thanks a lot, наб!

# Distribution packagers Eli and Denis

sr.ht upstream runs on Alpine Linux, and we maintain an Alpine [package
repository][4] for this purpose, and encourage third party installations to
utilize it. However, thanks to the hard work of Eli Schwartz and Denis Laxalde,
there are [official Arch Linux and Debian repositories][5] available as well.
These are automatically kept up-to-date in stride with our upstream developments
through some integrations with builds.sr.ht, all of which is maintained by
volunteers. Thanks for your hard work, fellas!

[4]: https://mirror.sr.ht/alpine/
[5]: https://man.sr.ht/packages.md

# Build image maintainers

builds.sr.ht supports [a large variety of build images][6], from Ubuntu to
Debian, Arch Linux to NixOS, FreeBSD and OpenBSD, and even Plan 9. Maintaining
these is a lot of work and requires expertise with the system in question - and
for most of the images, this expertise and maintenance is provided by community
volunteers. Big thanks to Timothée Floure, Simon Ser, Francesco Gazzetta, and
Jarkko Oranen for working hard to make sure that their platforms are
well-represented on SourceHut.

[6]: https://man.sr.ht/builds.sr.ht/compatibility.md

# Operations contributors Phillip and Ignas

Our monitoring software is [available to the public][1], and we keep our alarms
in a [git repository][2]. You'd think that our internal service monitoring would
be an unlikely candidate for third-party contributions, but Phillip Riegger and
Ignas Kiela both took it upon themselves to contribute improvements to our
monitoring system. In fact, after sr.ht's [only unplanned outage in 2020][3],
Ignas was the one who wrote the patch adding an alarm which would have caught
the problem earlier. Thanks for your help, both of you!

[1]: https://metrics.sr.ht/graph
[2]: https://git.sr.ht/~sircmpwn/metrics.sr.ht
[3]: https://status.sr.ht/issues/2020-06-28-unplanned-git.sr.ht-outage/

# Improvements to the broader FOSS community

SourceHut users, contributors, and developers have collectively made a great
habit of reaching out to the rest of the FOSS ecosystem, writing patches and
getting improvements merged which helps tie together the whole ecosystem into a
more robust and cohesive whole. SourceHut users have driven improvements to git
& Mercurial, pygit2 & libgit2, Go, Rust, and Python, emacs, vim, and VSCode, a
half-dozen Linux distributions, FreeBSD and OpenBSD, and even competing services
including GitHub, GitLab, Gitea, and Pagure, and dozens more projects still.
I hope we will continue to boldly go forth and enrich the broader community!

# And all the little ones...

There are dozens more contributors who didn't make the article. There's a
consistent trickle of one- or two-off contributions, fixing small bugs,
improving docs, and scratching itches. I'm grateful for these as well! Thank you
to everyone who contributes. Large or small, your hard work is appreciated.
