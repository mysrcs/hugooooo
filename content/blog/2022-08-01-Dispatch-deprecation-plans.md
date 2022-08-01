---
title: Planned deprecation of dispatch.sr.ht
author: Drew DeVault
date: 2022-08-01
---

[dispatch.sr.ht] is a SourceHut service which provides integrations between
SourceHut and third-party services like GitHub and GitLab, and it is scheduled
to be deprecated and shut down. Here's the plan:

[dispatch.sr.ht]: https://man.sr.ht/dispatch.sr.ht/

**2022-08-01**: Creation of new dispatch tasks is disabled.

**2022-09-01**: Dispatch users will be emailed with information about migration.

**2022-10-01**: Dispatch is shut off.

This blog post will explain the motivations for these changes and offer
solutions for users who wish to migrate.

## Why is dispatch being deprecated?

There are a few reasons for deprecating dispatch.

For a start, dispatch has not lived up to its initial expectations. Initially
envisioned as a kind of IFTTT-for-development, the actual implementation falls
far short of that goal and there is no clear path for improvement. There is also
not a clear path for upgrading dispatch to support our plans for the GraphQL
rollout.

Additionally, dispatch provides integrations with non-free services, which is
something that we have a stated policy against. Dispatch pre-dates this policy
and was grandfathered in &mdash; it was originally written to allow me to rig up
builds for [sway], which is hosted on GitHub.

[sway]: https://github.com/swaywm/sway

Users of dispatch also tend to use more resources than other kinds of users. The
GitHub and GitLab workflow encourages frequent pushes to PR/MR branches, which
causes many builds to be submitted. builds.sr.ht is the most expensive service
SourceHut operates, so this can add up. Among the top ten users ordered by total
build-hours consumed, one is a cryptocurrency miner we banned, one is an account
operated by a Linux distro that builds all of their packages on SourceHut,[^1]
and the remainder are GitHub users. In total, GitHub users account for 51% of
all build hours executed in the lifetime of builds.sr.ht.

[^1]: A use-case we are proud to support.

At some point we have to question if this is in our best interests. These
projects generally *only* use SourceHut for builds, and have no intention of
migrating anything else. I would not necessarily have a problem with it if
GitHub and GitLab were free software, per SourceHut's mission to "make free
software better". But as it is, it feels like we're propping up non-free forges
and giving users an excuse not to [migrate elsewhere].

[migrate elsewhere]: https://sfconservancy.org/GiveUpGitHub/

So, in summary: dispatch is difficult to maintain and has no clear path for
addressing its implementation problems, is exceptionally expensive to operate,
violates our policies for integration with non-free software, and serves a
community which is largely external to SourceHut and dependent on non-free
platforms.

## Options for migration

All of that said, we don't want to leave users who are depending on dispatch out
in the cold. To this end, we have been working on providing alternative means of
achieving similar functionality. Today, dispatch provides four configurable
"tasks":

* GitHub commits to builds.sr.ht jobs
* GitHub pull requests to builds.sr.ht jobs
* GitLab commits to builds.sr.ht jobs
* lists.sr.ht patches to GitLab merge requests

Each of these use-cases is now available via a third-party tool. For GitHub
integration, see [hottub][0]. For GitLab builds, see [dalligi][1]. Support for
forwarding patches to merge requests is being implemented via [hashiru][2], but
this is not complete &mdash; it will be before dispatch is shut off.

[0]: https://sr.ht/~emersion/hottub/
[1]: https://sr.ht/~emersion/dalligi/
[2]: https://git.sr.ht/~sircmpwn/hashiru

Affected users who wish to receive a refund for the remainder of the SourceHut
subscription may [contact support](mailto:sir@cmpwn.com) to receive one.

I hope that these tools will be effective for your project, and if you have any
questions about migration we would be happy to assist you on IRC or on the
sr.ht-discuss mailing list. However, I have a humble request for those who
choose to migrate to these tools: if you are using a non-free platform like
GitHub or GitLab (.com/EE) for your project's primary hosting, please make a
plan to migrate from builds.sr.ht. GitHub provides GitHub Actions and GitLab has
its own CI system as well. If you're not comfortable moving to SourceHut or
another free-software platform, that's your choice and we respect it &mdash; but
it is a bit burdensome for us to accommodate you. Thank you for your
understanding.
