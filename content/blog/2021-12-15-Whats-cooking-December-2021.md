---
title: What's cooking on SourceHut? December 2021
author: Drew DeVault
date: 2021-12-15
---

Hello and happy holidays! I hope that our 26,246 member userbase is enjoying the
cold weather (or the warm weather, in the south). Remember to remind the people
you work with on SourceHut, and others besides, that you care about them. We
have many new users this month, and I hope you will extend them the same
kindness and patience which you remember from your own first steps on SourceHut.

This month's public Mumble meeting will take place tomorrow at 10:00 UTC in the
usual place, voice.mnus.de in the sourcehut room. This time, I called for
suggestions for an agenda on [sr.ht-discuss][0] &mdash; now would be an
opportune time to add your own suggestions if you haven't already.

[0]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCFXVLXTHGFRT.SDU03YTQ98E%40taiga%3E

## chat.sr.ht

Towards the beginning of this month, [we announced chat.sr.ht][1], a hosted IRC
bouncer for SourceHut users. Please give it a shot if you haven't yet. Simon has
been hard at work improving it further still since the launch, and mainly making
improvements to usability and fixing bugs. The next major development will be
the introduction of the REGISTER extension, which we will follow-up on by
writing patches for the rest of the IRC ecosystem to help nudge adoption along,
alongside [our other IRC standardization work][2].

[1]: /blog/2021-11-29-announcing-the-chat.sr.ht-public-beta/
[2]: https://github.com/ircv3/ircv3-specifications/pulls/emersion

## todo.sr.ht

Thanks to Robin Jarry's patches, you can now reference and close tickets on
todo.sr.ht from your git.sr.ht commits using standard git trailers. Check out
[the docs][3] for details. Robin was very patient with my demands for this
patchset &mdash; thanks Robin!

[3]: https://man.sr.ht/git.sr.ht/#referencing-tickets-in-git-commit-messages

Ignas Kiela has also taken it upon themselves to spend more time improving
SourceHut monitoring and performance, landing patches throughout SourceHut this
month to improve our metrics and using the information derived from these
improved metrics to guide his work in todo.sr.ht patches. Thanks, Ignas, keep it
up!

The planned writable GraphQL API release for todo.sr.ht is taking longer than
anticipated, and will require a couple more weeks still. todo.sr.ht is one of
the most complex services on SourceHut, and getting every little interaction
right is a fair bit of work. It's not helped by the fact that we're slowing down
a bit to rest at the end of the year &mdash; sorry for the wait.

## git.sr.ht

You can now upload more than one artifact to a git tag at the same time. Adnan
Maolood has also helped to refine the [vcs-autodiscovery][4] specification,
alongside ~ancarda, and implemented it both in git.sr.ht and godocs.io, to
provide a standard means of accessing forge-related metadata for git
repositories.

[4]: https://sr.ht/~ancarda/vcs-autodiscovery/

## builds.sr.ht

Image updates:

- nixos/21.11 is now available, and 20.09 has been removed
