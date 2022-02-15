---
title: What's cooking on SourceHut? February 2022
author: Drew DeVault
date: 2022-02-15
---

Hello again! Today is a rare sunny and beautiful day in Amsterdam, and I am
spending it inside writing this post with the blinds down, as is befitting of a
proper hacker. I'm pleased to welcome 529 new users to our service this month,
who together bring our community to 27,409 members. I hope our new members are
enjoying the service, and that our existing community does its part to make them
feel welcome.

This month's Mumble meeting will not take place, as the [call for agenda
items][0] went unanswered. Please add topics to the [March agenda][1] if you
wish to address any matters in next month's meeting.

[0]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCH8QXZ08BYJ3.3H23LG5R594XS%40megumin%3E
[1]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCHWKTDCPKRAY.WK9EW0VG9AHU%40taiga%3E

## New staff v2

Last month, I introduced Adnan Maolood, who, thanks to a generous sponsorship
from NLNet, will be working with us on GraphQL for a while. This month, I am
pleased to [introduce Conrad Hoffmann][2], who joins us as the latest full-time
free software engineer working on SourceHut. Check out the blog post to meet
him!

[2]: https://sourcehut.org/blog/2022-02-02-welcome-conrad/

## todo.sr.ht

After many delays, the todo.sr.ht writable GraphQL API has finally shipped!
Thank you for your patience. The documentation is [available here][3] and you
can play with it directly on the [todo GraphQL playground][4].

[3]: https://man.sr.ht/todo.sr.ht/graphql.md
[4]: https://todo.sr.ht/graphql

## git.sr.ht

Adnan's first batch of GraphQL improvements landed yesterday as we shipped
support for GraphQL-native webhooks in git.sr.ht alongside a number of other
improvements. Nice work, Adnan! Adnan will continue with more GraphQL
improvements for other services in the next few weeks.

## pages.sr.ht

One of Conrad's first contributions to SourceHut introduced Content-Encoding
support and compression which, together with improvements from Umar Getagazov,
should make the performance of SourceHut pages noticably better. Dhruvin Gandhi
also added support for custom 404 pages. Great work, everyone!

## builds.sr.ht

Image updates:

- ubuntu/hiruste has been removed following its upstream deprecation
- Fedora images now include dnf-plugins-core by default

Improvements are also underway for Guix and Plan 9 support. Thanks to Haowen
Liu, Ryan Gonzalez, Dhruvin Gandhi, and Benjamin Riefenstahl for their work in
these areas.

## names.sr.ht

More community members have been expressing interest in working on names.sr.ht
as a grassroots, community-led effort. Conrad has set up [a project][5] to
organize these efforts, and I have posted [a summary of my thoughts][6] to offer
some direction. Please get involved if this interests you!

[5]: https://sr.ht/~bitfehler/names.sr.ht/
[6]: https://lists.sr.ht/~bitfehler/names.sr.ht-discuss/%3CCHVUXZKXJJ4C.NB3VSS2CBXE1%40megumin%3E

## Other news

A quick "thanks!" is owed to Ignas Kiela for his continued work on improving
SourceHut's monitoring infrastructure this month. Thanks to his work on our web
services, we have sane data available for response codes like 500 errors and
alarms configured to alert us when they occur in volume.

Another quick shout-out to the emacs community, who, in the process of
evaluating SourceHut for their needs, sent a dozen or so patches improving
lists.sr.ht, particularly with respect to importing third-party mbox archives.
Many thanks!
