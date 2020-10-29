---
title: Mailing lists are resistant to censorship
author: Drew DeVault
date: 2020-10-29
---

As a US entity, SourceHut is obliged to comply with DMCA notices. In this event,
our next step would likely be to coach the affected project through the
counter-notice process, and contribute to their legal costs if we believe that
they're in the right. We know that the DMCA is a constantly abused force for
censorship, and there are no friends of the RIAA here. They represent much that
our mission statement &mdash; to support and improve the free- and open-source
software ecosystem &mdash; stands in opposition to.

Even beyond our principles, however, the mailing list based workflow we espouse
is resistant to this kind of censorship. Git repositories are easily re-hosted,
of course. However, if a lot of your project's value requires rapid updates and
the ongoing support of its development community, a centralized,
pull-request-style system is vulnerable to censorship.

If you use mailing lists, you might not even immediately notice that something
was wrong. That contributions pass through a centralized mailing list is often
only a formality&nbsp;&mdash; the project maintainers and others likely to have
comments will usually be Cc'd on the emails, and they'll be delivered directly
to them without the list's help. Recipients can provide feedback by replying to
the email, sending their comments directly to the contributor, and bypassing the
mailing list entirely. The list faithfully records these emails and forwards
them to interested parties, but it's not actually required for this to work.

A mailing list also provides every maintainer, contributor, and onlooker a copy
of everything which has happened on it. Like git distributes repositories to
anyone working on them, mailing lists distribute a complete archive of the list
to everyone who is subscribed to them. Taking this archive somewhere else and
carrying on is effortless.

Moreover, you would be hard pressed to make a strong argument that *new* patches
could be covered by the DMCA, as they represent original additions to the
codebase. We'd consult our lawyers to consider the specific circumstances, but
it's entirely possible that we wouldn't even have to shut off the mailing list
when dealing with this situation. SourceHut's tools &mdash; bug trackers,
mailing lists, git repos, and so on &mdash; can work independently of one other.

Embracing decentralized, open standards like email and mailing lists is a good
tool for censorship resistance. Putting all of your eggs into a basket
controlled by a single corporate entity, who will be coerced by bullies and bad
laws, is not a strategy for success. Times like these remind us why open source
projects need to use open source infrastructure, built on open standards.
