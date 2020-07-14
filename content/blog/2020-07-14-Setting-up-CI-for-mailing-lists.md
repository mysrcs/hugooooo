---
title: SourceHut adds continuous integration for mailing lists
date: 2020-07-14
author: Drew DeVault
---

SourceHut offers a continuous integration platform called
[builds.sr.ht][builds], which will boot up a virtual machine from any of [nine
operating systems][compat][^1], including various Linux, BSD, and Plan 9
distributions, using KVM, then clone your source code repository (or
repositories) and run user-defined tasks to validate the code, automate
deployment, run linters, and so on. A simple example manifest from [one of my
projects][scdoc] is the following:

[builds]: https://man.sr.ht/builds.sr.ht
[compat]: https://man.sr.ht/builds.sr.ht/compatibility.md
[scdoc]: https://sr.ht/~sircmpwn/scdoc

[^1]: At the time of writing, at least. We're working on adding more.

```yaml
image: alpine/edge
sources:
- https://git.sr.ht/~sircmpwn/scdoc
tasks:
- build: |
    cd scdoc
    make
- check: |
    cd scdoc
    make check
```

For some time now, we've automatically submitted these build manifests on your
behalf when you push to your Git or Mercurial repository. To set this up for
your repos, [consult the tutorial][builds guide] and the
[documentation][builds].

[builds guide]: https://man.sr.ht/tutorials/getting-started-with-builds.md

SourceHut also famously endorses the email-driven workflow that git was designed
for, with tools like [git send-email](https://git-send-email.io). This allows
contributors to prepare patches locally, then email them to your project's
mailing list. Now, after the introduction of the
[project hub][hub announcement], we are well positioned to connect the disparate
resources of your project &mdash; repositories, mailing lists, bug trackers, and
so on &mdash; to bring out more functionality, and as of this week, that
includes the automated testing of patches sent to your mailing lists.

[hub announcement]: https://sourcehut.org/blog/2020-04-30-the-sourcehut-hub-is-live/

[![A screenshot of build status indicators for a patchset on lists.sr.ht](https://l.sr.ht/Z328.png)](https://lists.sr.ht/~emersion/mrsh-dev/patches/11599)

This is already working now for all projects on the project hub &mdash; to
configure yours, just [create a project][create project] and add both your
source code repository and your mailing list to the project, and it'll take care
of the rest automatically.

[create project]: https://sr.ht/projects/create

There are some limitations, however:

- Patches have to have their subject prefix configured to match the name of the
  repository being tested. For example, "[PATCH example v2]" will be matched to
  a repository named "example". Senders can configure this like so:

      git config format.subjectPrefix 'PATCH example'

  This is done automatically for patches submitted using the git.sr.ht patchset
  preparation interface. We plan on improving this later by testing the patch
  for applicability against each of the repositories on your project.
- [Job groups](https://todo.sr.ht/~sircmpwn/builds.sr.ht/52) remain
  unimplemented on builds.sr.ht, which means that projects with many build
  manifests may see a lot of noise from the CI.
- Mercurial repositories are not yet supported.

Leveraging the project hub to connect your resources together is something which
we intend to do in a few other domains as well. For example:

- Marking patchsets as integrated when they're applied upstream
- Linking git commits to tickets, and vice versa
- Adding the patch submitter to the build job access list so that they can SSH
  into failed VMs to diagnose the problem without the project admin's
  intervention

And of course, this will play nicely into our plans of a more sophisticated
maintainer-side workflow for handling patch submission on the web. Enjoy!
