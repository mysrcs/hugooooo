---
title: What's cooking on Sourcehut? July 2019
date: 2019-07-15
author: Drew DeVault
---

Hello again, and thank you for your support during SourceHut's alpha!
This month, our ranks have grown by 352 users, bringing our total
company to 9,342 users. The big 10K looms over the horizon! I have some
very cool developments to share with you this month.

## git.sr.ht

The first and perhaps most exciting development is the availability of
code annotations on git.sr.ht. This feature allows you to upload a list
of annotations to your repo, which can link from function references to
their definition (and vice versa), or link to ticket IDs referenced in
comments, or anything else you can dream up. The system is quite
flexible and should grow easily to support any number of cool use-cases
you can dream up.

I've written [a longer article][annotations-announcement] on my blog which goes
into detail on the implementation. If you'd just like to get a quick feel for
the feature, here are a few cool annotated repos for you to browse:

[annotations-announcement]: https://drewdevault.com/2019/07/08/Announcing-annotations-for-sourcehut.html

- [scdoc][scdoc]: a man page generator \(C)
- [aerc][aerc]: a TUI email client (Go)
- [cproc][cproc]: a C compiler frontend \(C)

[scdoc]: https://git.sr.ht/~sircmpwn/scdoc/tree/master/src/main.c
[aerc]: https://git.sr.ht/~sircmpwn/aerc/tree/master/widgets/msgviewer.go
[cproc]: https://git.sr.ht/~mcf/cproc/tree/master/scan.c

[Documentation for annotations can be read here][docs]. First-party annotators
are available for C and Go, and the community is working on annotators for
[Rust][Rust] and [Python][Python] as well. I hope to extend this feature to
hg.sr.ht soon as well. If you write an annotator for your favorite programming
language, please let us know on the sr.ht-discuss mailing list!

[docs]: https://man.sr.ht/git.sr.ht/annotations.md
[Rust]: https://git.sr.ht/~wezm/annotate-rust
[Python]: https://git.sr.ht/~ihabunek/annotatepy

## todo.sr.ht

Ivan Habunek has come along with another great patchset this month, this
time adding per-user access control lists to your todo.sr.ht trackers.
This is similar in implementation to the corresponding lists.sr.ht
feature, and can be used to set up private ticket trackers with your
collaborators, post-only security trackers, banning troublesome users,
and more. I've also added support for adding and removing labels over
email (by replying to the notification with "!label example" on the last
line), and Paul Wise has improved our notification's email signatures to
be RFC 3676-compliant. Thanks for the patches, folks!

## lists.sr.ht

A number of improvements have recently landed in lists.sr.ht. You can
now search through patchsets and apply bulk updates to them, and can
search them via the API as well. Another little feature, the ability to
search by the sender's timestamp, is also going to be useful for
discovering the email thread which corresponds to a git or hg commit.
Post-only mailing lists (with restricted browse permissions) now also
show a more useful summary page to users who may post but not read the
emails.

## builds.sr.ht

debian/stable now refers to the newly-stablized Debian Buster, and
Debian Bullseye has been added as debian/unstable. There is also a patch
in my inbox from Simon Ser adding FreeBSD 11.3 support, which I plan on
applying later this afternoon. Luca Weiss has also made some changes
adding support for cloning repos into a different name than the URL's
basename, which along with improved support for private repos has
fleshed out our GitHub integration a bit more. Thanks to both!

## man.sr.ht

The realization of this workstream is still a ways out, but I wanted to
mention that there have been patches and discussion hanging about on the
sr.ht-dev list for overhauling man.sr.ht's repo storage mechanism. Ryan
Chan has been working on moving man.sr.ht's git repos into your
git.sr.ht account, so that you can use git.sr.ht to browse their history
and files like any other git repo. We also plan to make wikis available
by adding them as branches of existing repositories. This workstream is
looking promising and should be completed soon, and acts as exploratory
work which will influence similar overhauls for other services in the
future (notably dispatch.sr.ht).

## meta.sr.ht

Some initial experimentation has been undergone with single-sign-on,
which will address the problem of having to log into every *.sr.ht site
separately. However, more problems were found than solutions, so this
will take some time yet to complete. Once this is out of the way, the
plan is to then add multiple email addresses per account and user groups
(organizations).

## Interesting projects using SourceHut

I'd also like to briefly mention a few cool projects which have moved to
SourceHut. First, Alpine Linux has finished their migration to [their own
lists.sr.ht instance][alpine lists]. Additionally, the well known
[pkgconf][pkgconf] software is now available on SourceHut.

[alpine lists]: https://lists.alpinelinux.org
[pkgconf]: https://git.sr.ht/~kaniini/pkgconf

Welcome to SourceHut! If you've got a project of your own on SourceHut
that you want to share, feel free to post about it on sr.ht-discuss. I
want to know about the cool stuff you're building!
