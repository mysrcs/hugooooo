---
title: Bug trackers are for tracking bugs
author: Drew DeVault
date: 2021-04-29
---

There's a reason that we call our bug tracking software "todo": it designed to
track things that need to be done. It's *not* designed for end-user support,
handling feature requests, and so on. This is a departure from the approach of
some other popular forges.

We use our bug trackers for confirmed bugs and confirmed feature requests only.
Due to learned behaviors from other platforms, many users do not understand
this. For this reason, many project admins actually go so far as to set up
read-only trackers, so that only maintainers can file tickets. This approach
improves the quality of bug reports and sharply reduces duplicates, turning the
tracker into a narrowly-focused tool for organizing the work of the
contributors.

But what happens to end-users in this arrangement? They're not forgotten: they
are given a better venue for their problems. Most projects of this sort provide
a foo-users or foo-discuss mailing list, which encourages submissions from
end-users in a more forum-oriented style. Sometimes these discussions become
actionable, in which case a ticket is filed by a maintainer or a janitor (the
latter opening up a new contributor role for non-programmers), but more often
than not the user just has to have a few questions answered. Often the answers
come from other users, saving the maintainers time and encouraging a community
of mutual support to develop.

Many projects also set up an IRC channel for short questions, discussions, and
hands-on troubleshooting in a real-time format. Many of the discussions on IRC
can also result in tickets, or help collect information to start a good mailing
list thread, and provide another role still for non-programming contributors to
help others out. We'll soon be offering tools on sourcehut to help you maintain
your project's IRC channel.

In addition to this -users mailing list, most projects have a -devel mailing
list for development discussions and patch reviews, and often a developer IRC
channel as well. This segregation of development resources and end-user support
resources helps developers stay focused and on-topic in their work, without
interruption, and provides a *better* places for end-users to get help.
