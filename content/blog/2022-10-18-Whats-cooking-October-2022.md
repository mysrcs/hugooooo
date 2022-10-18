---
title: What's cooking on SourceHut? October 2022
author: Drew DeVault
date: 2022-10-18
---

Greetings! Today we're joined by 623 fresh new users, bringing our total of
32,904. News is light for this month, since I've been taking some time off.
However, things are still gradually rolling forwards, and we have some important
internal changes landing soon. I'll give you the details.

## Planned maintenance next week

We are rolling out a major, high-risk software upgrade on Monday, October 24th.
This will require an outage, and we have set up a maintenance window starting
from 09:00 UTC. For details, see [status.sr.ht][0].

[0]: https://status.sr.ht/issues/2022-10-24-planned-outage/

## git.sr.ht

Vlad-Stefan Harbuz's patches adding [REUSE][1] support to git.sr.ht have landed
this month. Software which is compatible with the REUSE specification will enjoy
[native support][2] for license analysis in git.sr.ht. This feature will be
expanded in the future. Thanks Vlad!

[1]: https://reuse.software/spec/
[2]: https://git.sr.ht/~vladh/fotografiska/licenses

## lists.sr.ht

Thanks to Tanguy Fardet's efforts, mailing list owners are now allowed to
configure their lists to allow multipart text/html messages. Such emails are
still required to have a text/plain part. This is disabled by default for new
mailing lists and is discouraged for most users &mdash; you'll know if you need
it.

## meta.sr.ht

Simon has continued working on improving our OAuth 2.0 implementation, aligning
us closer with the specification and making it possible to use it with more
out-of-the-box OAuth 2.0 client libraries. Please file tickets if you notice any
additional discrepancies.
