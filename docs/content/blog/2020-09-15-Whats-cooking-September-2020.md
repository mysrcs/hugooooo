---
title: What's cooking on Sourcehut? September 2020
date: 2020-09-15
author: Drew DeVault
---

SourceHut development continues its constant march through the alpha this month,
and I'm here to tell you all about it. Our users now number 17,194, thanks to
511 new members joining us since the last update. To our new users: welcome! And
to our older members: thanks for being here! I hope everyone new finds a warm
welcome in the rest of the community.

Earlier this month, I held a public meeting to discuss the plans for the beta,
and we felt that it was a pretty good way to connect with the community. Going
forward, the day following each status update (so, tomorrow), I'm going to hold
a public meeting where you're welcome to join up and ask any questions or
provide any feedback. In turn, I'll have questions of my own for the community,
and will be looking forward to hearing your thoughts.

The next meeting will be held tomorrow, September 16th, at 15:00 UTC, on Mumble.
We'll be meeting in the SourceHut room on the voice.mnus.de server, on port
64738. Please join us!

And following that earlier meeting, I'd like to share with you the thoughts on
the beta progress. The path towards completing the alpha is quite clear now, and
as such, I've updated all of the [bug trackers][0] to include a "beta" label,
and marked all of the tickets which block the completion of the alpha as such.
The big-ticket blockers are:

[0]: https://todo.sr.ht/trackers/~sircmpwn?search=sr.ht

- Finalize pricing (a survey will be sent out - can you recommend some software
  for this?) and billing system overhaul
- GraphQL APIs
- Work distribution overhaul for builds.sr.ht
- Web-based code review for lists.sr.ht
- More hub.sr.ht cross-service integrations

Next month marks the end of the second year of the alpha, and I'll prepare an
extended status update which goes into detail on what remains and how we're
going to complete the beta.

## General improvements

Headers in Markdown across sourcehut now include a link to that header which
appears on hover, which should be useful for linking to a specific header
anywhere on the services. Thanks to gildarts for adding that!

Admins of third-party instances will also be pleased at some recent
improvements, including better exception emails and user administration screens,
as well as fixes for long put-off exceptions in various edge cases throughout
and improvements to the soundness of the database schema.

## Project hub

Project #tags are now supported on the project hub, with the goal of making it
easier to discover projects and for communities to establish themselves around a
topic. This was only added a few days ago, so most projects don't have tags yet
&mdash; please take a moment to add some for your projects if you can! Thanks to 
наб again for implementing this feature.

## meta.sr.ht

meta.sr.ht is the primary focus for the GraphQL expansion, and work is underway
adding a new OAuth 2.0-compliant authorization process and introducing writable
GraphQL API access. See the writable-api branch if you're curious.

Some user-facing improvements have also been made this month, such as support
for TOTP recovery codes. Disable and re-enable TOTP on your account to generate
these. Additionally, I've added security emails which are sent to you whenever
anything security-relevant occurs on your account, such as a password change or
new SSH key.

наб also added a feature which allows new users to enter their PGP key during
the registration process, so that the registration email is encrypted when sent.
This makes it possible to never receive any unencrypted emails from sr.ht.

## git.sr.ht

наб has introduced many improvements to git.sr.ht this month, including a blame
view, path-specific logs, and two features for push options: updating the repo
description or visibility, and submitting arbitrary build manifests other than
`.build.yml` or `.builds/*.yml`. [Docs here][1]. Thanks наб!

[1]: https://man.sr.ht/git.sr.ht/#push-options

## todo.sr.ht

You can now edit comments on tickets.

## man.sr.ht

Adding a sorely overdue feature, gildarts implemented a user index page for
man.sr.ht, where you can list the wikis on your account. Thanks gildarts!
