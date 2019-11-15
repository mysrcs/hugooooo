---
title: Sourcehut's year in alpha
date: 2019-11-15
author: Drew DeVault
---

Today marks the 1 year anniversary of the commencement of [Sourcehut's public
alpha][public announcement], after 2 years in private development. I'm immensely
thankful for your support during the alpha. It's mostly been a one-man operation
here, but thanks in large part to the financial support of the alpha users, I've
been able to work on Sourcehut and free software in general full-time for a full
year as of this February. With this first year of the alpha behind us, what have
we accomplished, and what do we have planned for 2020?

*Just looking for November's status update? [It's at the bottom, this
a-way... ↓](#status-update)*

[public announcement]: https://drewdevault.com/2018/11/15/sr.ht-general-availability.html

## 2019 in summary

I'm really proud of what we accomplished in 2019. Here are some of my personal
favorite highlights:

- Deployment of APIs and webhooks throughout
- Establishing comprehensive systems monitoring
- Became profitable and self-sustaining
- Bringing on our first staff member
- Initial development of web-based code review within our design framework
- Maturation of [todo.sr.ht](https://todo.sr.ht) into a great ticket tracking system
- [Code annotations][annotations] added for [git.sr.ht](https://git.sr.ht)
- SSH access to [builds.sr.ht](https://builds.sr.ht) VMs for debugging and hacking
- Availability of Alpine, Arch, and Debian repositories for third-party sr.ht
  deployments

*Want to read plans for 2020? [Skip the pretty pictures →](#expectations-for-2020)*

[annotations]: https://drewdevault.com/2019/07/08/Announcing-annotations-for-sourcehut.html

![SSH access to build VMs](https://sr.ht/thL-.png)

<em style="text-align: center; display: block">
  <small>SSH access to a failed builds.sr.ht job</small>
</em>

![Code annotations on git.sr.ht](https://sr.ht/w767.png)

<em style="text-align: center; display: block">
  <small>Browsing an annotated codebase on git.sr.ht</small>
</em>

<video src="https://sr.ht/_fUk.webm" controls muted>
  Your web browser does not support the webm video codec. Please consider using
  web browsers that support free and open standards.
</video>

<em style="text-align: center; display: block">
  <small>Preparing patchsets to be emailed with git.sr.ht</small>
</em>

![Code review thread parsing on lists.sr.ht](https://sr.ht/sjtE.png)

<em style="text-align: center; display: block">
  <small>Reviewing a patchset on the web with lists.sr.ht</small>
</em>

## Expectations for 2020

I believe Sourcehut will enter the beta phase in 2020, and be approaching the
production phase by the end of the year. Some features I'm looking forward to
are:

- User groups/organizations
- A centralized project hub, bringing together our disparate services
- Data ownership and portability for all services
- Completed web-based patch submission/review
- Maturation of hg.sr.ht into a competitive Hg hosting service
- Integration with more projects throughout the software project hosting
  ecosystem
- The fruits of financially supporting free software developers &mdash;
  exactly what comes of this is unknown, but I'm excited as hell about it.

From developers sponsored by Sourcehut going into 2020, I'm expecting to see
more developments in Wayland and Linux graphics, mail clients *and* servers,
improvements to Alpine Linux, [mrsh](https://mrsh.sh)'s completion and initial
release, miscellaneous patches to any free software project which crosses our
path, and new projects which I expect will pleasantly surprise us.

Thank you to everyone for your support in our first year, and I'm looking
forward to continuing to serve you into the next. <img src="/party.png"
style="display: inline-block; height: 1.25rem; position: relative; top: 0.25rem;
box-shadow: none;" />

How exactly we're going to accomplish these goals is a subject worthy of some
attention, too. I frequently get questions about the stability of the alpha,
when the beta will come and how things will change, and so on. So, I've taken
this opportunity to write down The Master Plan.

## Development roadmap

First, briefly, the plan for Sourcehut's development lifecycle has been roughly:

1. Build several standalone services which each solve a problem for software
   projects.
2. Develop APIs and webhooks for each of these services.
3. Teach them how to talk to each other, creating a complete system.

We've mostly completed phases 1 and 2 and development on phase 3 is underway.

**Phase one**

Base development of git.sr.ht, builds.sr.ht, lists.sr.ht, man.sr.ht, and more.
This is close to complete, insofar as all of the unknowns are known. Some
services are missing a few features which arguably fit into this step, such as
git blame support for git.sr.ht, but for the most part everything is complete in
its own right.

**Phase two**

This phase is the introduction of APIs and webhooks for every service, which is
a necessary step before integrating everything together. The APIs and webhooks
each service will use (and now, do use) to talk to each other are no different
than those offered to end-users, which helps to prove the API design is flexible
enough to support a broad variety of use-cases and integrations with other parts
of the ecosystem.

This phase is *mostly* complete &mdash; see the [API documentation
links here](https://man.sr.ht/#service-documentation) for an idea of which
services have API coverage. The main exceptions are man.sr.ht and
dispatch.sr.ht, which don't have an API because they're low-priority targets for
integration with other services; and hg.sr.ht, which technically has an API that
is mostly compatible with git.sr.ht's API but is left undocumented for want of
an Hg specific API design document from the community.

Building out these APIs also informed a lot of design decisions which helped to
move the codebases from "experimental" into "maintainable". In phase one, we
establish the scope for each project and prove that its ideas are feasible, and
in stage two we refined the prototypes into production-worthy systems.

**Phase three**

The final phase of development is perhaps the most exciting phase, as it's in
this step that we get to deliver on many of the usability promises of Sourcehut.
Some early progress has already been made in this direction. Some examples
include:

- Teaching git.sr.ht &amp; hg.sr.ht to push CI jobs to builds.sr.ht
- Overhauling man.sr.ht to replace its internal git repos with git.sr.ht repos
- Teaching git.sr.ht to prepare and send patchsets to mailing lists, e.g.
  lists.sr.ht

Future plans include tasks like:

- Teach lists.sr.ht how to submit CI jobs to validate incoming patchsets
- Teach lists.sr.ht how to merge patches to git/hg repos
- Refactor todo to use lists in a similar way to man's use of git

An advantage of this three-stage approach is that each of these phase three
features can, in theory, be extended to include other parts of the ecosystem.
lists.sr.ht can be re-purposed to manage patches and code review for a Gitlab
repository, builds.sr.ht can be used to run CI for GitHub repositories,
git.sr.ht can be used to send patches to the Linux kernel, and so on. This is
part of our commitment to embrace existing communities rather than building a
new walled garden.

## Operations roadmap

In addition to being a software project, Sourcehut offers a hosted service at
sr.ht. The administration of this hosted service is another factor which
requires planning and plays into the stability of the service. There are three
major concerns of the operations roadmap:

- Security
- Data integrity
- Availability
- Monitoring

**Security** is the steps we take to ensure your account and its data is safe
from malicious actors. This includes careful access controls - ensuring each
system has access to only the data it needs; establishing trust levels and
securing each system accordingly - for example, the multiple layers of isolation
used for CI jobs on builds.sr.ht; and other miscellaneous concerns like secure
SSH configuration, SSL maintenance, network administration, and so on.

**Data integrity** was important to address early in the alpha period, and has
been essentially completed. For all persistent data, extreme pains are taken to
ensure that it remains consistent even in emergencies - and our systems to
ensure this have been battle tested *during* emergencies, including disk
failures on critical machines. Our multiple layers of redundancy for data
preservation were [laid out in detail][backup article] in January and have only
been improved since.

[backup article]: https://drewdevault.com/2019/01/13/Backups-and-redundancy-at-sr.ht.html

**Availability** is concerned with making sure that our services are always
online, and during the alpha is a secondary concern. Our long-term goal is to
approach zero downtime, by setting up load balancers and tiered deployments. Our
software is designed with this in mind, which will ease the eventual deployment
of high availability services. However, today we still have planned outages, and
each deployment costs between 10 and 60 seconds of outage for the affected
services.

**Monitoring** is a cross-cutting task which is essential to the success of the
other goals. Setting up systems to observe and characterize the behavior of our
services informs the planning and execution of security, data integrity, and
availability goals. For example, we use monitoring to watch for suspicious
activity, ensure our backups are up-to-date, and understand our system's load to
prevent outages. This is mostly complete but alarming is due for an overhaul -
Grafana alarms aren't great for serving all of our needs.

An operations matter that was settled early and no longer factors into our
planning is the release and deployment process for Sourcehut services. An
acceptance requirement of builds.sr.ht's initial deployment was that it be
self-hosted and self-deploying *and* support the deployment of *.sr.ht as well,
and as such this goal was met before even the public alpha began.

## Business roadmap

The health of Sourcehut as a business is also my responsibility. Providing the
hosted service is not free, and getting myself paid enough to keep food on the
table is important for the development and health of the project as a whole.
This basically involves lots of spreadsheets, tracking the income and expenses
of the business, and making projections for the future. The monitoring system
maintained by the operations work is also put to use for BI (business
intelligence) reporting and monitoring.

I basically maintain three projections: pessimistic, realistic, and optimistic.
A rough approximation of how these are done is: pessimistic projections assume
that no one signs up for new subscriptions, monthly subscriptions continue
paying out, and yearly subscriptions don't. Realistic projections amortize
yearly subscriptions over a year, assume no one cancels, but also assumes no
growth. Optimistic projections expect the current rates of growth to continue.
Most of our long-term planning is based on the pessimistic projections. These
models are going to be updated soon as we start to get data on how many users
cancel their subscription when the first yearly renewals come up this month.

This work also involves dealing with taxes, regulatory compliance, making sure
contractors are paid on time, and so on. Boring stuff, but it eats up a lot of
time. Additionally, marketing falls under this umbrella, which mainly takes the
form of posts on this blog and showing up when people talk about us online to
answer questions. I've tried asking happy users to blog about their experiences,
but most people don't have a blog or are shy about writing, so there's some [yak
shaving to be done first][make a blog].

[make a blog]: https://drewdevault.com/make-a-blog

The main business goal at first was profitability, which has been achieved.
Additional goals are to generate a revenue stream which can continue to support
investment in new hardware, sponsoring free accounts for less fortunate users,
marketing and outreach efforts, and sponsoring free software developers to work
on self-directed projects. All of these goals are proceeding nicely.

## Stability roadmap

How do these development phases play into the external stability presented by
the service? Thus far, all of this development has been considered "alpha".
There are two additional phases: beta and production. The scope and completion
criteria of each phase in the stability roadmap is informed by the progress in
each other roadmap.

For example, some of the development tasks blocking the graduation from alpha to
beta include:

- User groups (for organizations managing many accounts or projects)
- Completely web-driven patchset submission and code review
- A centralized, indexed project hub which allows you to link a project's git/hg
  repos, bug trackers, mailing lists, and so on under a single top-level
  "project"
- Data ownership, i.e. self-service data import and export tools for all
  services

In operations, an overhauled alarming system is a blocker for the beta, and high
availability is a blocker for production. Confidence in our data integrity and
security systems is a beta requirement, and has already been achieved.

On the business side, a beta task was to achieve sustainability - that is, to
make a profit - which was achieved in Q1 2019. A business which is losing money
cannot be considered stable, after all. An outstanding business task which still
holds up the beta is establishing the final pricing model for the beta and into
the future.

# Status update

Phew! What a long article. Thanks to everyone for helping out during the alpha,
I really appreciate your support. Since the last update, we have another 825
users to welcome to the platform, bringing our grand total up to 11,364. 1,320
of you have chosen to pay for your alpha account, which I am deeply grateful
for. Thank you, everyone! Let's get to the updates for this month.

## General updates

Thanks to Eli Schwartz's help, the Arch Linux package repo saw some improvements
this month, and Luca Weiss pitched in to fix some outdated database migration
scripts. Thanks guys!

## git.sr.ht

I've been working on performance improvements for git over SSH again. An earlier
attempt was an abject failure - I had moved some logic into the web app and
accessed it over an internal API, under the rationale that the web app had
already spent the Python VM and SQLAlchemy setup time. In fact what really
happened is that git operations - which happen all the time - started to pin the
web workers, because Python can't into async. The result is that the entire
stack slowed down dramatically. I rolled a nat' 1 on that one.

The new solution is way, way better. I rewrote two pieces of the pipeline in
Go and overhauled the SQL queries, and now the time-to-/usr/bin/git is
significantly reduced, often less than a second. Prior to the disastrous
change, it could be as much as 10 seconds, and post disastrous change it was as
much as 45, with the web app being slowed to a similar crawl. With this
approach, git operations are fast and the web app is buttery smooth. The last
piece to improve on is the post-update hook. You'll notice the slowness there,
since git will quickly show its push output, then stop again while we run the
post-update. I hope to improve this soon.

I know that the git-over-SSH performance has been disappointing for a while, and
I'm sorry. The pipeline here is a complex machine with lots of moving parts, and
all of them are slow. A comprehensive solution requires a lot of overhauling.

Third-party contributions to git.sr.ht have also been coming in recently, with
Ian Moody making improvements to the diff view (for hg.sr.ht, too), and Honza
Porkorny switching our tree views to a monospaced font. I've also made a number
of bug fixes to the new patchset preparation UI.

## todo.sr.ht

I've implemented half of the necessary steps for todo.sr.ht to meet its data
ownership goals, by implementing a data export tool. There is some interesting
novelty here that merits some attention. The export prepares a gzipped JSON dump
of all of your tracker's tickets and events, and is more or less just a shortcut
to the API. However, certain information - usernames, comment text, and such -
are signed with SourceHut's webhook signing key. The idea is that if you
re-import these dumps later, we can verify that anything our users have said on
the tracker has not been tampered with, and confidently show their username next
to their comments. Additionally, third-party Sourcehut instances which trust our
word upstream can check these signatures against our key and be confident that
those are authentic comments authored by Sourcehut users.

However, this will only be useful when the data import side of this work is
completed, which is still to come. In other news, Ivan Habunek has written a UI
for editing labels, and added URL parameters for auto-filling the title and
description for new tickets, which is useful, for example, to provide links to
file tickets pre-populated with stack traces.

## dispatch.sr.ht

dispatch.sr.ht can now build GitLab commits! I wanted to add merge requests as
well, but it's blocked by [this GitLab
bug](https://gitlab.com/gitlab-org/gitlab/issues/16491). If/when this issue is
addressed, running builds.sr.ht CI for GitLab merge requests will be possible as
well. This is currently available for gitlab.com and gitlab.freedesktop.org - if
you want me to set it up for your GitLab instance, please send me an email.

## meta.sr.ht

Just some small updates: I have added URLs for obtaining a user's SSH and PGP
public keys. Just visit meta.sr.ht/~username.keys or ~username.pgp. There have
also been some improvements to the billing pages, which is especially important
as the first yearly payments will start renewing soon.

## paste.sr.ht

Thanks to Mykyta Holubakha's hard work, pastes on paste.sr.ht can now be
deleted! This was non-trivial because we de-duplicate paste contents in the
database. Thanks Mykyta! We're hoping to see support for editing pastes coming
soon as well.

## builds.sr.ht

Some mundane image updates:

- freebsd/12.x builds are now using FreeBSD 12.2
- Fedora images have been improved and updated
- NixOS images have been improved and updated

Additionally, OpenBSD 6.6 support is right around the corner. Thanks to our
hardworking build image maintainers for keeping up with these releases!

## names.sr.ht

Progress has been made since this was teased in October. That's all I've got to
say :)
