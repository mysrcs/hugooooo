---
title: What's cooking on SourceHut? September 2021
author: Drew DeVault
date: 2021-09-15
---

Another month passes us by, recording further progress on the road to the sr.ht
beta. Joining us on this journey are another 448 new souls, bringing our total
number to 24,552. As always, I'm depending on you to show them kindness and
patience as they learn how to use SourceHut.

This month’s Mumble meeting will take place on the tomorrow, September 16th, at
10:00 UTC. We’ll be on voice.mnus.de, port 64738, in the sourcehut room.

## General news

SourceHut put out a [job posting][0] (now closed) a few weeks ago, and we have
received many excellent applications. We are planning on making an offer to one
of these candidates, and the details will be announced in the next status
update. We have also spoken with [NLnet][1], who may be interested in funding
some additional contributors to work on SourceHut. Exciting stuff!

[0]: /blog/2021-08-23-work-at-sourcehut/
[1]: https://nlnet.nl

Also, as of this month, SourceHut is a bronze sponsor of the [OpenStreetMap
Foundation][osm]. We are proud to support a critical resource for free software
and open data.

[osm]: https://wiki.osmfoundation.org/wiki/Corporate_Members#Bronze_Corporate_Members

## GraphQL

Following the deployment of the first implementation of [GraphQL-native
webhooks][2] for meta.sr.ht, our GraphQL completion chart has a new column:

[2]: /blog/2021-08-25-graphql-native-webhooks/

<dl>
  <dt>meta.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>git.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>hg.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>todo.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>builds.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
</dl>

Additionally, we deployed write support for lists.sr.ht this week. You can find
the updated schema here: [lists.sr.ht schema.graphqls][3].

[3]: https://git.sr.ht/~sircmpwn/lists.sr.ht/tree/master/item/api/graph/schema.graphqls

I have written up a draft for the paste.sr.ht GraphQL API design here:
[paste.sr.ht schema.graphqls][4], which I intend to flesh out with an
implemenation in the coming weeks (and also add GQL webhooks &mdash; it's simple
enough that we should be able to ship a complete GQL implementation in the first
iteration). Ludovic and co. have also been hard at work on the first round of
GraphQL support for hg.sr.ht, which is likely to ship in the foreseeable future.
Following these, I would like to either implement a read-only hub.sr.ht GQL API,
or add write support to todo.sr.ht, either of which is a considerable effort in
their own right.

[4]: https://git.sr.ht/~sircmpwn/paste.sr.ht/tree/api/item/api/graph/schema.graphqls

## todo.sr.ht

Thanks to Ivan Habunek's work, you can now specify the sort order of results on
todo.sr.ht searches. Thanks Ivan!

## builds.sr.ht

Image updates:

- Rocky Linux is now available (thanks Haowen Liu!)
- debian/bookworm is now available, and stretch has been removed
- ubuntu/xenial has been removed

Tanguy Fardet also sent in their first patch this month, adding a "go to top"
button on the build logs page. Thanks Tanguy!
