---
title: What's cooking on Sourcehut? July 2020
date: 2020-07-15
author: Drew DeVault
---

As the unfeeling hand of time drags us relentlessly through its cold maw, we
occasionally spend some of our precious moments writing (or in your case,
reading), monthly status updates on the progress of the SourceHut alpha. Today
is such a day - welcome back! Our audience has grown by 645 members this month,
bringing our total userbase to 16,103. Please give a hearty welcome to our new
peers!

## General news

A short outage for hg.sr.ht is planned to take place sometime in the next few
weeks, as we migrate to a new box.
[The plan is outlined on sr.ht-dev][migration plan], and we expect to experience
anywhere from 5 to 30 minutes where hg.sr.ht is read-only. The final dates will
be posted on [status.sr.ht](https://status.sr.ht) and announced on
[sr.ht-announce](https://lists.sr.ht/~sircmpwn/sr.ht-announce) when the plan is
finalized.

[migration plan]: https://lists.sr.ht/~sircmpwn/sr.ht-dev/%3CC46HQADCD895.383VE5JFF0N24%40homura%3E

We have also migrate all services to a new markdown engine based on
[Mistletoe](https://github.com/miyuchina/mistletoe). If you encounter any
strange Markdown-related problems, please
[file a ticket](https://todo.sr.ht/~sircmpwn/sr.ht) and mention ~araspik. Thank
you for taking on this work, ~araspik! It took several months of effort to
carefully test everything.

I have also completed a lot of system operations work in this past month. We
have [planned out improvements to our PostgreSQL strategy][psql], which will
enable us to have real-time backups and failover capability. This is mostly
useful for limiting downtime during planned maintanenace, but is also useful for
the long-term goal of high availability.

[psql]: https://man.sr.ht/ops/robust-psql.md

## lists.sr.ht

The most exciting development in this round of updates is likely to be the
integration between lists.sr.ht and builds.sr.ht to bring continuous integration
to mailing lists on SourceHut. You may have seen the announcement on the blog
yesterday &mdash; give it a read. The tl;dr is that if you [create a
project][hub] on the project hub, and add a mailing list and git repositories,
it'll automatically submit any patches sent to your mailing list using the
`.build.yml` (or `.build/*.yml`) from the repository. The subject prefix (for
example, "[PATCH my-project]") is used to identify the git repository that the
patch is intended for (in this case, "my-project").

[![A screenshot of build status indicators for a patchset on lists.sr.ht](https://l.sr.ht/Z328.png)](https://lists.sr.ht/~emersion/mrsh-dev/patches/11599)

[hub]: https://sr.ht/projects/create

Additionally, at the request of Elias Naur, I have added a button to each
patchset and thread in the mailing list archives which will forward the whole
thread to you, so you can reply and comment on patches from the comfort of your
inbox even if you were not subscribed to the mailing list at the time.

Finally, mailing list deletion has been implemented at long last.

## Project hub

Following the addition of mailing list deletion to lists.sr.ht, the project hub
was updated to support removing mailing lists and, if you so desire, deleting
entire projects.

## builds.sr.ht

Routine build image updates:

- NixOS images have received robustness updates (thanks Francesco Gazzetta!)
- Ubuntu 18.10 and 19.04 has been removed, following their deprecation upstream
- Ubuntu 20.10 (Groovy) has been added as ubuntu/next
- Alpine 3.8 has been removed, following its deprecation upstream
- FreeBSD 11.x has been upgraded to FreeBSD 11.4
