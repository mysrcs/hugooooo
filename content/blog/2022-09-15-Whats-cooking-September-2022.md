---
title: What's cooking on Sourcehut? September 2022
date: 2022-09-15
author: Conrad Hoffmann
---

Guten Morgen, SourceHut! Today, I count 681 new users, for a grand total of
32281 registered users. As always, a warm welcome to them and the reminder to
everyone else to help them feel welcome while they get settled. Today, I am
filling in for Drew on short notice, so please excuse the brevity.

## chat.sr.ht

Simon has done some excellent work simplifying the authentication workflow of
[chat.sr.ht][1] for users. The new approach is based on standard OAuth, which
means other users of soju (the IRC bouncer running on chat.sr.ht) can benefit
from this feature and use any available OAuth server for authentication. You
can read Simon's [blog post][2] for all the details.

[1]: https://chat.sr.ht
[2]: https://emersion.fr/blog/2022/irc-and-oauth2/ "IRC × OAuth 2.0 - emersion"

## GraphQL

The ID unification rollout is still taking its toll. We are currently
building a test setup (or rather, a [test setup generator][3]) that is
reasonably close to production, yet does not include any user data. This will
give us the needed confidence that we can roll out this major change without
breaking anything.

In the meantime, the GraphQL API is now deemed mature enough that the [OAuth2
dashboard][4] has been made the default in meta.sr.ht.

[3]: https://git.sr.ht/~sircmpwn/srht-fakedb
[4]: https://meta.sr.ht/oauth2

## Infrastructure

SourceHut goes to Europe! Next week, the SourceHut team will meet in person to
inaugurate our new data-center. We'll be installing the first couple of
servers, but it will be another while before we will serve production traffic
from there. We will use this chance for some experimentation to decide on the
infrastructure we want to run SourceHut on in the coming years.

## builds.sr.ht

- Rocky Linux 9 is available
- Ubuntu Impish has been removed following its upstream deprecation
- NixOS 21.11 has been removed following its upstream deprecation
