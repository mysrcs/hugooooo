---
title: What's cooking on Sourcehut? September 2019
date: 2019-09-15
author: Drew DeVault
---

Another month of progress in the Sourcehut alpha! This month, we reached the big
10,000 user mark, and kept going: at the time of writing, there are 10,649
users. To the 938 of you who've joined us since the August update, welcome! I'm
sure many of you have joined us after abandoning the [sinking Bitbucket
ship][bitbucket], and if so I hope you've found Sourcehut to your liking. If you
have any questions or feedback, I can be reached at
[sir@cmpwn.com](mailto:sir@cmpwn.com). And a special thanks to the 1,093 users
who have paid for their alpha accounts, which for the first time represents more
than 10% of all registered users.

[bitbucket]: https://sourcehut.org/blog/2019-08-15-whats-cooking-on-sourcehut-august-2019/

## General news

First, I've redesigned [sourcehut.org](https://sourcehut.org) to be a little bit
more attractive and lend an air of professionalism to Sourcehut. I've also added
to it a blog, which has a greater scope than sr.ht-announce. I will be
cross-posting these monthly "what's cooking" updates there as well, for anyone
who prefers to read them on the web or keep updated via RSS. Though the design
of sourcehut.org is a bit more flamboyant than sr.ht in general, I've made a few
conservative improvements to the layout of sr.ht pages, notably centering
everything and bumping the base font size up to the system default.

I would also like to thank Denis Laxalde for his hard work lately, thanks to
which we're starting to see a Debian repository come into being for sysadmins
who want to run Sourcehut on Debian hosts. I hope we'll see that finished up
soon!

## lists.sr.ht

No notable developments this month, but there has been some planning I'd like to
share with you. I've been working this week on improvements to
[libgit2][libgit2] and [pygit2][pygit2] with the aim of improving integration
between lists.sr.ht and git.sr.ht (and later hg.sr.ht, but that's a more
difficult problem for technical reasons). To address goals like continuous
integration for patches sent to the mailing list, expanding the diff context
beyond what's included in the patch, and a little blue "submit" button to apply
patches from the web, I basically intend to create a libgit2 backend which
allows you to create a `Repository` object which, instead of being backed by a
git repo on disk, is backed by the git.sr.ht API.

I also intend to add a similar backend for Github and Gitlab, if possible, and
let you use lists.sr.ht to track patches against projects which aren't hosted on
Sourcehut. There'll probably be lots of use-cases for this that I haven't
thought of! One interesting thing you'd be able to do with this is have a
working git repository on your local machine which doesn't have a .git
directory, but instead does all of its operations remotely against a git.sr.ht
repository - albeit very slowly. I'm not sure why you'd ever want to do this.
Interesting nonetheless!

[libgit2]: https://github.com/libgit2/libgit2
[pygit2]: https://github.com/libgit2/pygit2

## todo.sr.ht

Some minor bug fixes and improvements landed this month, but the most
interesting addition is that of participating via email *without* an account.
You can now send an email to the tracker or to a ticket to submit or comment on
tickets without a Sourcehut account. If you are the operator of a bug tracker on
the service, you can configure the permissions for such users by changing the
"anonymous" permissions on your tracker. In the near(ish) future, I also plan on
extending ACLs so you can give individuals more or less permission by email,
which will make non-account holders first-class citizens on todo.sr.ht, more or
less.

## builds.sr.ht

I wrote a [blog post][bsd] about how builds.sr.ht is being used by lots of
software to improve their BSD support, give it a read if you're interested. On a
related note, I've received some offers for aid in finishing our NetBSD image,
so hopefully we'll see support for that soon.

[bsd]: https://sourcehut.org/blog/2019-09-12-sourcehut-makes-bsd-software-better/

## git.sr.ht

Arch Linux developer Eli Schwartz has put some effort into making busybox's gzip
output deterministic and matching GNU's gzip, which makes our source tarball
downloads from git.sr.ht consistently hash with ourselves and with other git
hosts. Thanks Eli!

## man.sr.ht

I redesigned it, now it doesn't look like crap. Hooray! As part of this work,
you can now explicitly enable or disable the generation of a table of contents
for any page by [updating its
frontmatter](https://man.sr.ht/man.sr.ht/#frontmatter).
