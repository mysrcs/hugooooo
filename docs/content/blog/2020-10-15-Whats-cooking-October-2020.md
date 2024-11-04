---
title: What's cooking on Sourcehut? October 2020
date: 2020-10-15
author: Drew DeVault
---

Once again we meet to discuss the status of the ongoing SourceHut alpha, which
has made progress by leaps and bounds this month. We're joined by 521 new users
this month, bringing our total up to 17,715. As always, please welcome them
warmly and show our new friends the ropes.

Tomorrow, we'll be holding the second public Mumble conference, where you're
welcome to join us to ask questions, share feedback, or just to listen in. We'll
be meeting tomorrow, October 16th, at 16:00 UTC, in the SourceHut room on
voice.mnus.de, port 64738. I'll see (or hear) you there!

I mentioned last month that today would mark the second year of the sr.ht alpha
&mdash; my mistake! It's actually next month. I'll put together a more detailed
status update then which summarizes our progress this year and outlines the
plans for next year. I should also have the Q3 financial report done by then.

## General improvements

A few weeks ago I wrote [a detailed log](/blog/2020-09-25-api-2-updates/) going
over the progress and planning for the API 2.0 efforts. OAuth 2.0 support has
been completed, and most of the new database abstractions are done. Since that
post, I've also completed the work on asyncronous task management, and based on
that also the necessary bits for legacy webhook delivery. This is the last
blocker which prevents shipping the writable API into production even in an
early form, as it would have caused inconsistency between services without.
Accordingly, I expect to ship an early version of the writable meta.sr.ht
GraphQL API into production in the next few weeks.

We've built a new ops tool this month called [chartsrv][chartsrv], which
generates SVG plots from Prometheus data, like this live chart of the load
average across builds.sr.ht workers:

![](https://metrics.sr.ht/chart.svg?title=Build%20worker%20load%20average&query=avg_over_time%28node_load15%7Binstance%3D~%22cirno%5B0-9%5D%2B.sr.ht%3A80%22%7D%5B1h%5D%29&max=64&since=336h&stacked&step=10000&height=3&width=10)

[chartsrv]: https://sr.ht/~sircmpwn/chartsrv

Thanks are also due to gildarts and Ignas Kiela this month, for their work
adding links to Markdown headings throughout SourceHut, to allow users to easily
obtain a link to a specific heading. Thanks folks!

## builds.sr.ht

Debian users should be advised that an update to the Debian riggings is going to
affect how packages are installed in a way which may break your builds. An email
was sent to all users who have submitted Debian builds in the last 30 days with
details, and another email will be sent out before the change is deployed, 15
days from now.

Thorben Günther has also improved the Arch Linux images to make them faster and
more reliable. Thanks!

## todo.sr.ht

наб added a user preference to todo.sr.ht this month which allows users to
choose to have email notifications sent to them for their own activity on
todo.sr.ht. Thanks наб! I have also fixed a minor issue with tracker
import/export which may have affected users with older bug trackers.

## meta.sr.ht

Thanks to Timothée Floure's work, meta.sr.ht now includes an LDAP authentication
backend, which third-party installations of sr.ht may find useful for
integrating with their existing authentication system. Thanks Timothée!

## git.sr.ht

Thanks due to наб and Thorben Günther for small patches this month, respectively
for improving symlinks and observability, and for fixing an issue with build
submissions.
