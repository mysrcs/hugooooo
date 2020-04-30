---
title: Announcing the SourceHut project hub
date: 2020-04-29
author: Drew DeVault
---

I'm happy to announce that the SourceHut project hub is now available for
general use! This is one of the most important developments in the progress of
the SourceHut alpha thus far. If you want to see how it works interactively, try
checking out the [SourceHut project][sourcehut hub], [add your own
projects](https://sr.ht), or [browse the public project
index](https://sr.ht/projects). For a more wordy introduction, read on.

[sourcehut hub]: https://sr.ht/~sircmpwn/sourcehut
![Screenshot of the public project index on the SourceHut project hub](https://l.sr.ht/i0Uj.png)

So why is the project hub necessary and/or interesting? SourceHut is composed
of many small Unix-style tools for software development, which each "do one
thing and do it well". These tools are things like git hosting, bug tracking,
mailing lists, CI, and so on. This allows you to use them independently and
compose them however you please, which maps well onto the reality of how many
projects are organized. Compare this to platforms like GitHub, GitLab, Gitea,
and so on, where resources like bug trackers and pull requests map 1:1 to a git
repository, even when it doesn't make sense.

In reality, many projects have dozens of git repos but would prefer to receive
bug reports in one place, for example. There are many ways projects are
organized, and with a one-size-fits-all approach, many of them are forced to
resort to meta-repositories, bots to chase down lost users posting things in the
wrong place, and so on. Additionally, this insistence on a single git repo being
the face of your project is very developer-centric. Only a fraction of visitors
to your project actually want to browse the source code &mdash; many others are
looking for documentation, bug reports, support channels, and so on; and
frontloading the source code can be intimidating.

The ability to freely compose resources on SourceHut to suit your project's
needs addresses this. The primary disadvantage of our approach has been
difficulty in finding out what resources belong to which projects, and getting
around between them. The new project hub addresses this with a single "hub" for
your project, with a more general introduction to the project and links to the
each of the tools your project is using. You can have zero, one, or any number
of git or Mercurial repos, mailing lists, and bug trackers, in any combination
which is useful for your needs, and the project hub will organize them for you.
It streamlines the workflow for new projects and will make it easier for new
users to figure out how to get started on SourceHut.

The project hub also solves a problem which has long been a matter of interest
to SourceHut users: discoverability. How do you find what projects are hosted on
the platform? The hub solves this with the [public project
index](https://sr.ht/projects). Each public project which you create on the hub
is listed here, and you can search through all of them to discover interesting
projects to use or contribute to. I've also added a list of featured projects,
where I will be hand-picking interesting projects to share.

This version of the hub is the <abbr title="Minimum Viable Product">MVP</abbr>,
and there's more development I want to do in the future. Some of this includes:

- Adding project tags, like #python or #linux.
- Linking back to the parent project from resource pages.
- Handling more project resources, like wikis.
- RSS feeds everywhere!

The hub also comes with smaller changes to the rest of the site &mdash; the
"sourcehut" link on every page's navigation will now take you back to the hub,
and hg.sr.ht has been made a first-class target in the nav.

Please give the new service a shot and send along any feedback that comes to
mind, via [sr.ht-discuss](https://lists.sr.ht/~sircmpwn/sr.ht-discuss) or by
[emailing me directly](mailto:sir@cmpwn.com). Enjoy!
