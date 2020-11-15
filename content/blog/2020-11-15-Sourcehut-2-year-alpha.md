---
title: SourceHut's second year in alpha
date: 2020-11-14
author: Drew DeVault
---

Today is the second anniversary of [SourceHut being made available to the
general public][alpha announcement] during its alpha phase of development, and
the end of the fourth year of development. What a year it's been! If only I
could send a warning to the younger me who wrote [last year's article][1 year].
As the second anniversary comes around, despite the trials we've endured this
year, I feel positive about our accomplishments.

[alpha announcement]: https://drewdevault.com/2018/11/15/sr.ht-general-availability.html
[1 year]: /blog/2019-11-15-sourcehut-1-year-alpha/

One year ago, I wrote that I expected SourceHut to enter its beta phase in 2020,
and I was wrong. However, we do have a well-defined, finite list of action items
to be completed before we can kick off the beta. We hit a lot of important
development milestones this year, and we'll put the cherry on top in 2021.

This month's public Mumble conference will take place tomorrow at 17:00 UTC, in
the sourcehut room on voice.mnus.de, port 64738. Please join us to celebrate our
second year, and ask any questions or provide any feedback that you might have
about sourcehut.

Let's take a moment celebrate our accomplishments in 2020, and lay out our plans
for 2021.

## 2020 in summary

Here are some of the more important things we got done:

- The project hub
- Initial GraphQL APIs for meta.sr.ht, git.sr.ht
- git.sr.ht release artifacts, git blame & path logs
- builds.sr.ht job artifacts, RSS feeds
- lists.sr.ht CI integration
- todo.sr.ht tracker data import/export
- [Public access](https://man.sr.ht/ops) to operations data & documentation

And some of the numbers for 2020:

- 7,344 users signed up
- 1,447 mailing lists established; 37,164 emails sent
- 2,024 bug trackers and 9,210 tickets filed
- 15,754 git repositories and 2,662 hg repositories made
- 233,000 build jobs completed
- 2&times; increase in revenue

And, 2,000 projects on the brand-new project hub! You can browse [the 723 public
projects right here](https://sr.ht/projects). Some notable projects which
started using SourceHut this year include:

- Dozens of [Gemini projects](https://sr.ht/projects?search=%23gemini) started
  on sr.ht this year
- sr.ht is the home of [the Plan 9 renaissance](https://sr.ht/projects?search=%23plan9)
- The [Zrythm](https://git.sr.ht/~alextee/zrythm) Digital Audio Workstation
  moved in
- [vis](https://sr.ht/~martanne/vis/) and [mutt](https://sr.ht/~kevin8t8/mutt/)
  set up sr.ht mirrors and CI
- [alacritty](https://github.com/alacritty/alacritty/tree/master/.builds) and
  [Nim](https://github.com/nim-lang/Nim/tree/devel/.builds) rigged up our CI
- More in [this thread](https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CC732POCJYTNF.3H7H6HK42HCJZ%40taiga%3E)
  and [this thread](https://cmpwn.com/@sir/105208976033597297)

We've also contributed to many FOSS projects upstream, including:

- git send-email improvements
- Mercurial patches
- Linux documentation patches
- New pygit2 and libgit2 features, and financial support
- musl financial support
- Redis vulnerability reported & fixed
- [PeerTube](https://joinpeertube.org/) financial support

And our engineers, under the open-ended directive of "make FOSS better", have
contributed to Wayland, Mesa, Vulkan, Go, the Linux kernel, IRCv3,
[Gemini](https://gemini.circumlunar.space), and more. Our [FOSS consulting
arm](https://sourcehut.org/consultancy) has produced 100% free-software output
in Mesa, Xorg, and more, and built a brand-new
[FOSS webmail](https://sr.ht/~migadu/alps), for clients like Valve Software and
Migadu.

![](https://l.sr.ht/7wYp.png)

![](https://l.sr.ht/uB2_.png)

![](https://l.sr.ht/Wuvf.png)

![](https://l.sr.ht/6gzm.png)

## Expectations for 2021

Well, I'll go ahead and make the same ill-fated prediction this year: the beta
will begin sometime in 2021. One of the blockers I mentioned last year still
remains to be completed &mdash; user groups/organizations &mdash; but the main
blocker is the completion of [API 2.0](/blog/2020-09-25-api-2-updates/). I've
also added "beta" labels to all of our [bug trackers][trackers], if you want to
explore the fine details of what features and bugs are considered blockers.

[trackers]: https://todo.sr.ht/trackers/~sircmpwn?search=sr.ht

The business and operational goals laid out in last year's post have been met.
The only business-related blocker is determining how the long-promised pricing
changes will take shape when the beta begins, which will be heavily influenced
by the ultimate implementation of user groups. Of course, the community will be
involved in every part of this discussion. And, as always, I'll re-iterate that
the plan is not to price users out of the service &mdash; those who are unable
to afford payments, as always, will be issued free service.

The API 2.0 efforts are of particular importance for the beta. Their completion
will be necessary to establish an API that we can be confident in supporting for
many years into the future, and enable us to expand the services and their
awareness of one another to any degree we please. The performance, scalability,
and reliability of our services is also expected to increase substantially with
the completion of API 2.0.

We also made substantial progress on data ownership &mdash; you can now export
and import almost all of your data on sourcehut, much of it in standard formats
&mdash; but we also want to expand on this by implementing self-service account
deletion and renames, and a unified solution for downloading all of your data at
once.

So, in short, we have this to look forward to for the beta:

- User groups/organizations
- API 2.0 completion
- Improvements to the cross-service awareness
- Completion of data ownership goals

We still have a lot of work on the horizon, but we have a well-laid plan towards
the finish line and the start of the beta phase. Once the beta begins, we'll
focus on refining our model, flushing out bugs, improving our already
[best-in-class](https://forgeperf.org) performance and reliability, and
establishing enough confidence in the system to declare it production ready.

SourceHut has much higher standards for production readiness than most software.
Many users are already enjoying SourceHut as the platform of choice for their
own production-ready projects, and we already make stability and security
guarantees which many would consider necessary as such. But we're not going to
declare our system production ready until we've well exceeded the standards of
the industry &mdash; we want *the best* performance, *the best* reliability, and
we want to leave a wide margin for everyone else to catch up. We're only going
to declare it production ready when we're far ahead of the pack and prepared to
support all of our features and users for decades to come. SourceHut will be
"production ready" when it's prepared to become the bedrock of free software,
and not before.

## What's cooking on SourceHut? November 2020

Now, for your regularly scheduled status update, I'll keep it brief. Most of the
work has been behind the scenes, on API 2.0.

### meta.sr.ht

- gemini:// and gopher:// URLs are now permitted for profile URLs

### builds.sr.ht

- nixos/20.09 is now available
- openbsd/6.8 is now available
- ubuntu/20.10 is now available
- freebsd/12.x has been updated to FreeBSD 12.2
