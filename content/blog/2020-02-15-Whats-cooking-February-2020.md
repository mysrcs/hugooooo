---
title: What's cooking on Sourcehut? February 2020
date: 2020-02-15
author: Drew DeVault
---

Hello again! Another month into 2020, and SourceHut development continues at a
strong pace - a pace I expect to pick up a bit in the coming weeks. We're joined
by another 443 users this month, bringing our total to 12,757. Welcome to
SourceHut, everyone! And to our older members, thanks for your continued
support.

## General News

Our meetup at FOSDEM went well - thanks to everyone who attended! I'm glad I got
to meet more of you in person, and we had a great chat going over the plans for
the future and getting your feedback on what's important to you.

In terms of general development, there are a few news items. First, you will
probably have noticed that subtle design changes landed throughout the services
early this month. These changes brought us into 100% compliance with the WCAG
accessibility standards, which is a feat that no other code forge can claim. We
score higher now on standard tests of performance, accessibility, and web
standards than any other code hosting service. SourceHut is now objectively the
fastest, lightest, and most accessible service in the biz. I even fielded a bug
report from a Lynx user last week!

Search support has also been improved throughout the site thanks to Ivan
Habunek's hard work, and special thanks to Denis Laxalde as well for his
improvements to builds.sr.ht search. Documentation for the new features is
coming soon.

I've also been working with some community contributors whose aim is to improve
Markdown support across the site, bringing support for CommonMark and aligning
our implementation more closely with what you may have come to expect from your
experiences on the rest of the web. These require changes careful testing, so
please be patient while we work on them.

## git.sr.ht

A cool new git.sr.ht feature landed this week: attaching files to annotated
git tags. This allows you to attach compiled executables, PGP signatures, and so
on to your releases. Check out the [user documentation here][user docs], and the
[API docs here][api docs]. This is the first of several planned features which
utilize the new blob storage infrastructure - additional features coming soon
include git-lfs support, build artifacts, build caches, and a "SourceHut
Pages"-like service.

[user docs]: https://man.sr.ht/git.sr.ht/#attaching-files-to-releases
[api docs]: https://man.sr.ht/git.sr.ht/api.md#post-apireposusernamereposnameartifactsref

More subtle changes to git.sr.ht include detecting if your repository has a
license, which leads to [our wiki page with suggestions on how to choose
one][choose a license]. I also added support for LibreJS for the few (optional)
bits of JavaScript on git.sr.ht, which along with the other changes brings
[SourceHut's score for the GNU ethical repository criteria][ethical criteria]
into pretty good standing.

[choose a license]: https://man.sr.ht/license.md
[ethical criteria]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CC03B4X6WE7XN.9NAXAORGDJ0B%40homura%3E

## builds.sr.ht

Denis Laxalde, in addition to his work on improving builds.sr.ht search
functionality, has also implemented RSS feeds for each page. You can obtain RSS
feeds for your user page, any combination of build tags (useful for per-project
RSS feeds), and for arbitrary search queries. Thorben Günther also implemented a
small bugfix which resolved a long puzzling issue with build status emails -
related to UTF-8 email addresses.

Image-specific updates:

- Debian builds with custom repositories now also automatically include the
  source repos.
- FreeBSD builds no longer use `-cpu qemu64`, following upstream fixes to AMD
  EPYC support.
- OpenBSD images now include X11 headers.
