---
title: SourceHut terms of service updates, cryptocurrency-related projects to be removed
author: Drew DeVault
date: 2022-10-31
---

SourceHut is planning to roll out updates to our terms of service, effective
in 2023. The changes most likely to impact users is the prohibition of
cryptocurrency- or blockchain-related projects on SourceHut.

These domains are strongly associated with fraudulent activities and high-risk
investments which take advantage of people who are suffering from economic
hardship and growing global wealth inequality. Few to no legitimate use-cases
for this technology have been found; instead it is mostly used for fraudulent
"get rich quick" schemes and to facilitate criminal activity, such as
ransomware, illicit trade, and sanctions evasion. These projects often
encourage large-scale energy waste and electronics waste, which contributes to
the declining health of Earth's environment. The presence of these projects on
SourceHut exposes new victims to these scams and is harmful to the reputation of
SourceHut and its community.

We recognize that the basic idea of a blockchain, as it were, may be generally
useful. However, most projects which market themselves with blockchain
technology are subject to the same social ills as cryptocurrency. Consequently,
we have chosen to include "blockchain" related projects in this ban for the time
being.

We will exercise discretion when applying this rule. If you believe that your
use-case for cryptocurrency or blockchain is not plagued by these social
problems, you may ask for permission to host it on SourceHut, or appeal its
removal, by [contacting support](mailto:sir@cmpwn.com).

Projects which seek out cryptocurrency donations are strongly discouraged from
doing so, but will not be affected by this change.

## What to do if you don't agree to the changes

If your project is affected by these changes, or you do not agree with them, you
have until January 1st, 2023 to migrate to another platform. You may use
[hut(1)][hut] to obtain an export of your account data using standard formats
that you may import into a third-party SourceHut instance, or another host which
is compatible with these formats (such as Codeberg, GNU Mailman, etc). If you
wish, you may request to have your account deleted by [contacting
support](mailto:sir@cmpwn.com).[^1]

[hut]: https://sr.ht/~emersion/hut/

[^1]: We would like to have self-service account deletion implemented by the
  time these changes are implemented, but it's a complex feature that may
  require more time to implement. In the meantime, manual requests for account
  deletion will be processed normally.

## Other changes to the terms of service

Changes to the terms of service require notifying all users, so we try to batch
them when possible to reduce the number of annoying emails everyone has to deal
with. You can review a complete diff of the changes
[here](https://paste.sr.ht/~sircmpwn/b966c63c14df7d233647ef605961c7654430557c).

Here are some other changes we're including in this update:

### Applicability of Dutch law

We are in the process of moving SourceHut to the European Union, and have
incorporated in the Netherlands. Consequently, the terms have been updated to
clarify that users are required to comply with Dutch law in addition to US law.
The requirement to comply with US law will be removed in a future update after
we close the US entity.

### "Threatening and harassing others"

We have expanded the list of prohibited behaviors to include "threatening and
harassing others". We have already banned users for this behavior (we can
terminate service at our discretion), but we decided to make this explicit. The
scope of this is intended to cover incidents where users harass other users or
make bigoted, racist, homophobic, transphobic, etc, comments on our platform.

We take account termination seriously, and use it only as a last resort. In the
history of SourceHut, only two users have been banned.[^2] The first user was
harassing maintainers and failed to respond to emails seeking to discuss their
behavior. The second used SourceHut to advocate for the rights of pedophiles to
sexually abuse children.

[^2]: Among accounts representing real people, not including bulk spam
  registrations, cryptocurrency mining abuse, etc.

### Revised content license

We have updated the license which is granted to SourceHut when you upload
content to our services. The purpose of this license is to ensure that we have
sufficient rights over your content to do our job, and grants us permission to
do things like display your content on the website.

We have clarified how this works in situations where you do not own the
copyright over the content you upload, such as when you mirror a free software
project on SourceHut, or when a project's copyright is collectively held by many
contributors. We have also removed the "indefinite" license and updated the
terms so that the content license is terminated automatically when you remove
your content from the services.
