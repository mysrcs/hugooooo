---
title: NLnet funding comes to an end
author: Adnan Maolood
date: 2022-11-21
---

Sourcehut was [selected for an NLnet grant][grant] in January of this year.
[NLnet Foundation][NLnet] is a Dutch organization which funds many projects to
promote an open and secure internet.

[grant]: /blog/2022-01-10-nlnet-graphql-funding/
[NLnet]: https://nlnet.nl

The typical NLnet grant is structured by milestones. At the beginning of the
grant, a project plan is drafted containing the milestones to be completed and
an agreed upon payment for each milestone. Once a milestone was completed, NLnet
verifies that the milestone had been completed and approves the payment. If you
think this might be a good fit for your project, consider [applying for a
grant][apply]!

[apply]: https://nlnet.nl/propose/

Our grant work focused on completing the GraphQL APIs for Sourcehut services to
help with Sourcehut's API 2.0 efforts. This work included many changes and
improvements to the GraphQL APIs as well as implementing support for
[GraphQL-native webhooks][webhooks].

[webhooks]: /blog/2021-08-25-graphql-native-webhooks/

Implementing GraphQL-native webhooks for git.sr.ht was the first milestone on
our roadmap. This work involved:

1. Designing and implementing the API for creating GraphQL webhooks
1. Updating the GraphQL mutations to trigger webhooks
1. Updating the Python frontends to route all necessary operations through the
   GraphQL APIs so that webhooks are triggered
1. Updates to ancillary services/daemons (gitsrht-shell and gitsrht-update-hook)

A similar process was followed for hg.sr.ht, todo.sr.ht, builds.sr.ht,
lists.sr.ht, paste.sr.ht, and pages.sr.ht.

Our focus then turned towards implementing a GraphQL API for hub.sr.ht. Near the
end of June I began experimenting with GraphQL Federation in the hopes that it
would make implementing the hub.sr.ht GraphQL API easier. This work led to the
development of [api.sr.ht], a GraphQL API gateway.

[api.sr.ht]: https://git.sr.ht/~sircmpwn/api.sr.ht

Before we can adopt GraphQL Federation, we needed to unify user IDs. Previously,
user IDs were not guaranteed to be the same across SourceHut services. This did
not play well with GraphQL Federation, which requires some sort of unique key to
identify users across services. Patches for nearly every Sourcehut service were
needed to address the issue.

In order to ensure that the ID unification roll-out went as smoothly as
possible, we decided that we needed better tools for testing. This resulted in
the development of [srht-fakedb], a tool to populate Sourcehut service databases
with fake data for testing purposes. The ID unification roll-out took place on
October 26. With that now out of the way, work on the hub.sr.ht GraphQL API can
resume.

[srht-fakedb]: https://git.sr.ht/~sircmpwn/srht-fakedb

October 30 officially marks the end of the NLnet grant. We achieved most of what
we set out to accomplish, and some more. We'll be wrapping up this work on
SourceHut's dime in the coming weeks.

Working with NLnet has been a great experience. Many thanks to [NLnet] and [NGI
Zero] for sponsoring this work! We appreciate your generosity, and are looking
forward to more projects developing under your fundraising umbrella.

[NGI Zero]: https://nlnet.nl/NGI0/
