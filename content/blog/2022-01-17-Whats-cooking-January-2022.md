---
title: What's cooking on SourceHut? January 2022
date: 2022-01-17
author: Drew DeVault
---

Hello and happy new year! After a bit of well-deserved rest during the holidays,
our staff (and many of our contributors) have spun our work streams back up and
development continues. Our userbase has grown this month by another 634 users,
bringing the total to 26,880. As usual, I'm depending on you to make our new
members feel welcome and to offer them your patience as they learn how we do
things here.

This month’s public Mumble meeting will take place tomorrow, January 18th (later
than originally announced), at 10:00 UTC in the usual place, voice.mnus.de in
the sourcehut room. I called for suggestions for an agenda on [sr.ht-discuss] —
now would be an opportune time to add your own suggestions if you haven’t
already.

[sr.ht-discuss]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCGGODWFWKK0G.3EKBVZZM5KMRA%40taiga%3E

## New staff

I [announced last week][nlnet] that, thanks to a generous grant from NLNet,
Adnan Maolood will be joining us for a while this year to help with the GraphQL
implementation. He's been hard at work on git.sr.ht's GraphQL-native webhooks
already, and I'm looking forward to having his help. Welcome! We are also
bringing on a new full-time employee (at SourceHut's expense) from February 1st,
who will be introduced in a coming blog post.

[nlnet]: /blog/2022-01-10-nlnet-graphql-funding/

## hut: A SourceHut CLI tool

Simon Ser has started developing a command line tool called [hut] for using the
GraphQL API in your terminal or in shell scripts. Check it out!

[hut]: https://sr.ht/~emersion/hut

## todo.sr.ht

I had hoped to ship todo.sr.ht's GraphQL API this week, but its inherent
complexity combined with time off during the holidays has pushed the schedule
back a bit more once again. All that remains is the completion of the legacy
webhooks for the writable API, plus acceptance testing and a security review,
then we can ship. This should land sometime this week, if everything goes
according to plan.

## git.sr.ht

Adnan has been working on GraphQL-native webhooks for git.sr.ht, which is going
well. This will also hopefully ship before the next "what's cooking".

## lists.sr.ht

A number of long-standing bugs when importing mbox files to populate mailing
lists from an external archive have been addressed thanks to contributions from
Martin Vahlensieck. Thanks Martin! A number of small fixes and improvements to
the GraphQL schema were also introduced this month.

## meta.sr.ht

Some discrepancies between our OAuth 2.0 implementation and the RFC were
discovered and corrected. Thanks to ~omz13 for the tip!
