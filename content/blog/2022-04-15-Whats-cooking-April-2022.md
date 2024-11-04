---
title: What's cooking on SourceHut? April 2022
author: Drew DeVault
date: 2022-04-15
---

Hello! Another month of improvements rolls on by, and I'm here to tell you all
about them. In terms of site growth, we saw 510 new users join us, bringing our
total to 28,406. As always, please be patient with our new peers as you help
them learn about the site.

## General news

This month we released our [annual financial report][0]. In summary, SourceHut
is financially healthy. Feel free to browse the full report to get all of the
details.

[0]: https://sourcehut.org/blog/2022-04-08-2021-financial-report/

We have been making excellent progress on the GraphQL initiative thanks to
Adnan's help, and I anticipate that we will be able to put a bow on this
sometime in the next couple of months.

## hg.sr.ht

Work is underway on integrating improvements to the hg.sr.ht GraphQL API. The
API is now writable, supporting all essential resource mutations, and GQL-native
webhooks should be landing shortly.

## builds.sr.ht

Setting the oauth keys in your build manifest will now pre-configure your build
environment for use with the [hut][1] tool.

[1]: https://sr.ht/~emersion/hut

Image updates:

- Plan 9 support has been fixed and improved thanks to Benjamin Riefenstahl
- FreeBSD 12.x has been updated to FreeBSD 12.3
- Alpine 3.11 was removed following its upstream deprecation

## lists.sr.ht

We have integrated the new [go-emailthreads][2] library with lists.sr.ht, which
provides much better heuristics for parsing mail threads into trees. We will
soon update the lists.sr.ht frontend to take advantage of this.

[2]: https://git.sr.ht/~emersion/go-emailthreads

## git.sr.ht

The branch name is now included in the build tags when submitting pushes to
builds.sr.ht. You may want to update your badge URLs if you use them.

## pages.sr.ht

It is not available yet, but in the next few days we expect to merge support for
configuring per-file cache behavior for your site.
