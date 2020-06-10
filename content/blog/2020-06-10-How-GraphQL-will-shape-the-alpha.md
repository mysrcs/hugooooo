---
title: How and why GraphQL will influence the SourceHut alpha
date: 2020-06-10
author: Drew DeVault
---

Often I will remind users that SourceHut is an "alpha-quality product", even
though many people are already using it today and find it well-suited to their
present needs. What I mean by this is to remind you that, while many things
already work, I am still working on refining the implementation before we commit
to the design going forward. This foundational work is more important than many
high-level features, because it will give us the basis from which the broader
SourceHut platform is built and extended upon well into the future.

Almost all of SourceHut today is built with Python, Flask, and SQLAlchemy, which
is great for quickly building a working prototype. This has been an effective
approach to building a "good" service and understanding the constraints of the
problem space. However, it's become clear to me that this approach isn't going
to cut it in the long term, where the goal is not just "good", but "excellent".
The system would become more stable with the benefit of static typing, and more
scalable with a faster and lighter-weight implementation. My work on SourceHut
has, on the whole, really soured my opinion of Python as a serious language for
large projects.

One of the core requirements for the alpha to graduate to "beta" is the
implementation of complete APIs throughout the services, both for users to
access and for the services to use to communicate with each other. The
lackluster state of these APIs was the main motivator for some of the
large-scale changes I have planned. Originally I choose to use REST for the API,
because REST is boring and well-understood. Boring, well-understood approaches
are the bread and butter of SourceHut. However, I have been very unsatisfied
with the results, and have been unwilling to take this design forward into the
beta. During the alpha is the best time to reconsider this approach and build a
more sustainable API design.

Enter [GraphQL][graphql]. I have considered GraphQL a few times in the past, but
choose not to research it further for a number of reasons:

[graphql]: https://graphql.org

- The quality of server implementations has been rather poor on each of my
  research attempts, especially outside of JavaScript implementations.
- The ecosystem is heavily influenced by a web development culture which is
  flatly rejected by SourceHut's ethos. This leaks into the documentation and
  resources available for GraphQL, which makes it more difficult to evaluate
  through the lens of SourceHut's more conservative values.
- GraphQL does not solve many of the problems I would have hoped it would
  solve. It does not represent, in my opinion, the ultimate answer to the
  question of how we build a good web API. Therefore, someday there may come a
  better technology to supplant it, which makes me hesitate to base a long-term
  system design on it.
- The uptake of GraphQL in the general web ecosystem has been somewhat slow.
  The value-add is difficult to understand and even more difficult to implement
  well, making it difficult for all but senior engineering teams to understand.

However, with my dissatisfaction with the REST approach reaching its peak in the
past few months, I gave it a more serious and in-depth review. I built a
research GraphQL API for git.sr.ht, trudging through the docs and specs with the
aim of understanding it from the SourceHut perspective and how it could apply to
our outlook on software design. I also found (or designed) solutions to some of
the limitations of GraphQL which make me more confident that we can build a
future-proof solution which is not going to feel outdated or bad when The Next
Thing comes along. And, importantly, a new server-side implementation called
[gqlgen][gqlgen] has appeared since my last attempt, which, although imperfect,
is good enough for me to consider it seriously as the basis for a large system.

[gqlgen]: https://gqlgen.com

Another (potential) advantage of GraphQL is the ability to compose many
different APIs into a single, federated GraphQL schema. If this pans out, it
would be very convenient to access all of the distributed SourceHut services as
a single cohesive system, trivially composing each service or subset of services
as appropriate to the particular SourceHut deployment in question. Another area
of research which may be improved by GraphQL are webhooks: I want to experiment
with registering your webhooks with a GraphQL query, so that the webhook payload
can contain all of the information you need to process the event without any
additional API requests.

In short, I've concluded that GraphQL, while imperfect, is a significant advance
in the state of the art from REST, and is mature and sophisticated enough to be
useful as the basis of an API and an implementation that I can have long-term
confidence in. This is important to get right, because the distributed design of
SourceHut's mini-services demands high-quality communication between each
component. I cannot feel comfortable moving forward from the alpha without this
goal being met, and GraphQL makes me more confident in achieving it well.

I also mentioned earlier that I am unsatisfied with the Python/Flask/SQLAlchemy
design that underlies most of SourceHut's implementation. The performance
characteristics of this design are rather poor, and I have limited options for
improvement. The reliability is also not something I am especially confident in.
The GraphQL work was not expected to solve this problem, but it may offer an
unexpected solution.

The GraphQL services are completely standalone, and it is possible to deploy
them independently of the web application. With these, you can deploy a
SourceHut instance with no frontend at all, using the GraphQL APIs exclusively.
Today, the Python backends to the web services communicate directly with
PostgreSQL via SQLAlchemy, but it is my intention to built out experimental
replacement backends which are routed through GraphQL instead. This way, the
much more performant and robust GraphQL backends become the single source of
truth for all information in SourceHut. This could substantially increase my
confidence in the system if it pans out &mdash; the Python footprint would
become much smaller and simpler, and bugs in it would have less risk of creating
inconsistent states in the system.

These changes can be and will be made incrementally, and as a user, you should
notice no changes other than improved performance and reliability, and access to
better APIs. It is my intention to carry forward user data and continue to
support existing projects throughout with no significant service disruptions.
The performance and reliability of SourceHut today is already best in class, but
I see no reason why we can't push the envelope even further. I also think that
[five nines][99.999] is an achievable goal.

[99.999]: https://en.wikipedia.org/wiki/High_availability#Percentage_calculation

At the time of writing, there are two GraphQL APIs available for you to
play with: [meta.sr.ht](https://meta.sr.ht/graphql) and
[git.sr.ht](https://git.sr.ht/graphql). These are still considered experimental,
and some larger concerns such as write access and improvements to authentication
remain to be implemented. Give it a shot and please share your feedback!