---
title: What's cooking on Sourcehut? May 2020
date: 2020-05-15
author: Drew DeVault
---

Greetings! Another month of alpha development progresses and brings us that much
closer to the SourceHut beta. We reached a few important milestones this month!
Today we are 14,763 users strong, with 1,104 new users joining us this month.
Please give them a warm welcome!

## General news

Quick thanks to Eli Schwartz for patches across the board which simplify the
installation process and improve support for a broader variety of distributions.
Thanks also to Daniel Gröber and Thorben Günther for additional improvements in
the installation process and self-hosted SourceHut experience.

## hub.sr.ht

As you likely are already aware, the SourceHut project hub was opened this
month. Since its opening, users have added 215 of their projects to the [public
index][0]. If you want to add your project, [create a project][1] and complete
the new project checklist to be added to the index. And, be sure to check out
(and contribute to!) the cool projects other users have made! If you want to
know more about the project hub and the future plans for it, read up on the
[original announcement][2].

[0]: https://sr.ht/projects
[1]: https://sr.ht/projects/create
[2]: https://sourcehut.org/blog/2020-04-30-the-sourcehut-hub-is-live/

## git.sr.ht

The experimental [GraphQL][3] API I've alluded to in previous "what's cooking" posts
is now available for users to play around with. It's still subject to change,
but please take a look and share any feedback you have. I have deployed the
GraphQL Playground at [git.sr.ht/graphql][4] for you to play with.
Unfortunately, this is a big JavaScript SPA, entirely atypical of the SourceHut
web design ethos &mdash; but rest assured that before the GraphQL workstream is
done, this will have been replaced with an in-house UI which better meets your
expectations.

[3]: https://graphql.org
[4]: https://git.sr.ht/graphql

The other major improvements I have planned for GraphQL include an overhaul to
authentication, and a gateway through which all sr.ht APIs can queried through
a single GraphQL request. On the whole I'm pretty satisfied with the
implementation, and I'm optimistic that it will provide a much better foundation
for the API going forward into the beta. It should open the doors to a lot of
interesting future features as well. I will be doing a write-up on GraphQL for
the sourcehut.org blog in the foreseeable future, so keep your eyes peeled for
that if you're curious to learn more.

## builds.sr.ht

The 9front distribution of Plan 9 is now available for user builds. This is an
unusual build target; check out the [release announcement][5] to learn how it
works. Other build image updates:

[5]: https://sourcehut.org/blog/2020-05-11-sourcehut-plus-plan-9/

- nixos/20.03 has been added and nixos/stable has been updated to it;
  nixos/19.03 has been removed
- ubuntu/lts now refers to Ubuntu Focal
- dockerd now starts up correctly in Alpine Linux and Debian guests; Alpine is
  now the recommended guest for builds utilizing Docker

Thanks to Francesco Gazzetta, Denis Laxalde, and Ace Eldeib for their patches
this month.

## hg.sr.ht

Ludovic Chabant has been hard at work on bugfixes and performance improvements
for hg.sr.ht. The changes are subtle, but users should notice faster pushes at
least.
