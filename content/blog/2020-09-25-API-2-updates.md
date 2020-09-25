---
title: API 2.0 dev log
date: 2020-09-25
author: Drew DeVault
---

Completing the project now known as "API 2.0" is one of the most important steps
in finalizing the [sr.ht beta](/alpha-details), and I've been trying to keep the
community abreast of developments, especially on the
[sr.ht-dev](https://lists.sr.ht/~sircmpwn/sr.ht-dev) mailing list. I'm
summarizing for the blog as well today, some of our recent developments in this
respect and planned work to come.

<details>
  <summary>Read more: why is API 2.0 is important to the beta?</summary>
  <p>
  SourceHut is a distributed system of "mini-services", each fulfilling its role
  in a particular domain &mdash; git.sr.ht handles git, builds.sr.ht handles CI,
  lists.sr.ht handles mailing lists, and so on. In order for these services to
  communicate effectively, good API design is critical. A good API is also
  necessary for SourceHut users to extend sr.ht with their own tools.

  <p>
  The legacy API was designed within the context of our Flask applications for
  the purpose of quickly meeting these needs during the design &amp; development
  of the sr.ht alpha. It's... not great. The RESTful design implies a tree-like
  structure, which does not map as well onto our data model &mdash; the "graph"
  of GraphQL does much better in this regard. Additionally, the implementation
  is somewhat inconsistent and leaves a lot to be desired in terms of
  robustness. The stronger type system of GraphQL enforces a baseline of
  consistency which, while achievable with the legacy approach, is much easier
  with the 2.0 approach.

  <p>
  The API design is an essential participant in proving the architecture design
  of sr.ht. In order to meet the confidence level we need to start the beta, we
  need a greater degree of confidence than the legacy approach offered. API 2.0
  meets this requirement. Additionally, stability is going to be important
  post-beta: this is our last opportunity to make a clean break with the legacy
  API and ship a better, more stable design into production which we can
  comfortably support for longer.
</details>

## Progress updates

Some of the progress which has been completed recently includes:

### OAuth 2.0 support

The new meta.sr.ht API supports OAuth 2.0 for authentication. We previously
advertised "OAuth" support, but the new implementation is actually conformant
with [the RFC](https://tools.ietf.org/html/rfc6749). A draft of our OAuth 2.0
documentation can be read [here](https://man.sr.ht/meta.sr.ht/oauth.md).

The design makes meta.sr.ht-api the source of truth for all things OAuth, and
the meta.sr.ht-web (Python) frontend just issues GraphQL queries to manage it.
meta.sr.ht-api is responsible for issuing personal access tokens, authorization
tokens, and access tokens, and possibly refresh tokens in the future.

The relevant GraphQL resolvers are `@internal`, so meta.sr.ht-web is the only
client which is allowed to use them. However, this is a good proof-of-concept
for later work which will expand this design to other resolvers, which
third-party clients *are* permitted to use, to relocate more sources of truth
from -web into -api. The ultimate intention is to remove SQLAlchemy from the
-web services entirely and just have them execute GraphQL queries to fetch the
necessary information to present the web UI.

The access tokens themselves (both personal access tokens and bearer tokens)
take the form of a [BARE](https://baremessages.org)-encoded payload specifying
the username, client ID, authorized scopes, and token expiration, authorized
with HMAC, and base64 encoded. Resolvers which can be accessed with these
tokens, and the required scopes to access them, are controlled by the new
`@access` directive in the GraphQL schema.

To revoke a token, its SHA is computed and a revocation entry is added to Redis.
Additionally, the token record in the database has its expiration set to the
current time. When token authorization is checked, its hash is computed and the
revocation status is quickly queried from Redis. In general, Redis is treated as
an ephemeral cache on sr.ht &mdash; in the event that the data is lost, a new
revocation list can be constructed by simply querying the database for expired
tokens and issuing new revocations for them.

These changes brings the total number of authorization methods up to four:

1. `@internal` authentication, based on a single-use token encrypted with
   SourceHut internal private keys, and used for service-to-service
   authorization. It has access to resolvers which are not normally available to
   the public.
2. OAuth 2.0 authentication, via either bearer tokens or personal access tokens,
   which are limited by the scopes laid down on each resolver with `@access`.
3. SourceHut web login cookie authorization, intended for use with the
   [web-based GraphQL playgrounds](https://meta.sr.ht/graphql), which have an
   access level equivalent to personal access tokens.
4. Legacy OAuth tokens, which must have `*` permissions, and are only granted
   read-only access.

The fourth method, legacy OAuth tokens, is planned to be hastily removed. In
order to facilitate this, I intend to start recording when a legacy token is used
to access the GraphQL API. This information will be used to create a list of
users who would be affected by the removal of this feature; they'll be sent an
email with another 30 days of notice (and instructions on switching to API 2.0
tokens) before it's removed.

A side note: the new personal access token design allows you to create personal
access tokens with limited scopes, and removes the ability for third-parties to
create bearer tokens with unlimited account access.

These systems are security-critical, so some eyes on the code from the community
would be appreciated. The bulk of the code can be reviewed in the `writable-api`
branch of [meta.sr.ht](https://git.sr.ht/~sircmpwn/meta.sr.ht/tree/writable-api),
and at the tip of [gql.sr.ht](https://git.sr.ht/~sircmpwn/gql.sr.ht).

### Database abstraction

SQLAlchemy has been a major pain point for the web applications, and the
database abstraction to be used with GraphQL has been carefully designed to
avoid the same pitfalls. Specifically, it has been made as thin as possible. The
abstraction is now *mostly* done, as support was recently added for GraphQL
mutations. The only outstanding improvement might be to introduce better support
code for cursors, which are used to access lists of things (e.g. PGP keys for an
account).

Another place where there might be improvement is in reducing the number of
total round-trips. It would be feasible to defer loading detailed user
information until it's actually necessary, for example, and also possible to
cache some basic relationships (e.g. username to user ID) in memory, though such
a cache would only affect corner cases. Additionally, if we can update the
mutation support code to use PostgreSQL's `RETURNING` feature, we can avoid a
round-trip to fetch the record we intend to mutate. This may require forking
[squirrel](https://github.com/Masterminds/squirrel). In theory, it should be
possible to reduce the number of round-trips for any given request to be equal
to the number of distinct resource types it implicates. Further consolidation
may be possible with more elaborate queries in the future.

### Initial performance testing

Initial performance tests on routine read-only queries suggests that we can
expect to handle 1,000 reqs/sec/thread with a target service time of 20ms per
request. Write queries are about half as efficient, and we could expect perhaps
100 reqs/sec/thread at 200ms each. The bottleneck on write queries seems to be
in PostgreSQL, rather than in our code. More research will be necessary if it
becomes an issue. In order to scale up parallelism, we'll have to plan out the
number of connections per PSQL server; I expect that we have plenty of room with
our current deployment to tune this upwards.

For scaling in the future, read-only queries can be distributed over
horizontally scalable PSQL secondaries. The API code is already set up to use
read-only transactions when appropriate, so redirecting these should be easy.
Write access will still have to be limited to a single master server, which will
need to scale vertically. If this becomes a bottleneck in the future, we may
research sharding options. However, writes are much less common than reads, and
if we direct the read load off of the master server we should be able to scale
quite far without much cost.

Some initial testing with pgbouncer raised some issues with feature
compatibility between pgbouncer, the PSQL write protocol, lib/pq, and psycopg2.
We plan on using pgbouncer more to meet availability requirements than
scalability requirements, however, so an in-depth answer to these issues will be
explored separately.

## Future work

Some things which are next up in the pipeline:

### Async dispatch

The next major problem which needs to be addressed is the handling of
asynchronous work in the GraphQL backends. Some tasks will need to be done
async, including webhook and email delivery. Additionally, a lightweight means
of firing off small tasks to be completed async whenever needful would be
helpful to have, for small optimizations which move more logic out of codepaths
which would block delivering responses to clients.

To this end, I intend to build a general-use system for handling queuing,
executing, and re-attempting async tasks in Go applications. This will be able
to live in any Go process, and my expectation is that some of them will live
inside of the GraphQL backends themselves, and some will live in dedicated
daemons which will have work assigned to them by the GraphQL backends remotely.
Whether or not a task will be handled in- or out-process is a function of the
tasks predicted reliability and importance, and thus the need for external
management of that task queue.

For example, email delivery is likely to be handled in-process. We deliver mail
through a dedicated mail server, which has its own queuing and re-delivery
mechanisms built-in. Mail delivery is likely to succeed, and relatively soon
after it enters our task queue. The in-process queues are unlikely to get very
full. Webhook delivery, on the other hand, is important for preserving a
consistent data model across our services, and does not have a secondary queue
or redelivery mechanism like email. Therefore, managing it through a separate
daemon would be ideal. However, both of these can use the same code - the only
difference would be where the tasks come from, be it somewhere up the call stack
or a remote request.

Some things that this code will need to support are:

- Warm process shutdown (including shutting down the HTTP listener in the
  GraphQL backends to free up the port for the next daemon, or to stop accepting
  new tasks in the remote daemons)
- Queueing, executing, and re-delivery of tasks, with exponential backoff
- Observability via Prometheus (and the relevant alarms)
- The ability to serialize state to disk

This design will likely have implications for the upcoming builds.sr.ht work
distribution overhaul as well.

### GraphQL-native webhooks

To continue supporting legacy webhooks, we will first need to build an
implementation of the legacy system for the GraphQL backends. Naturally, this is
blocked by the async solution above, but it should provide a good proving
grounds for that work.

We have some basic sketches for handling webhook registration and delivery with
GraphQL, but a proof-of-concept needs to be built. The basic idea is that, when
registering a new webhook, you provide a GraphQL query which we execute before
delivering your webhook and use as the request payload for the webhook. This can
be used to eliminate any further API requests your webhook endpoint might have
to perform to gather any additional information it needs to complete its work.

A plan will need to be made for transitioning our existing code from legacy
webhooks to API 2.0 webhooks.

### Packaging

We'll need to change how we handle the distribution packages to support these
updates. It's likely that, for example, the "meta.sr.ht" package will become a
meta-package which depends jointly on meta.sr.ht-web (where the Python web
application will be re-homed to), meta.sr.ht-api (the GraphQL backend), and
perhaps meta.sr.ht-async. If we grow any additional frontends in the future
(Gemini, for instance), this will make it easy to add them. It will also make it
easy to offer GraphQL APIs without the web application, should any third-party
installations desire this.

### Other future work

- gql.sr.ht is going to be merged into core-go soon.
- A lot of refactoring has gone into the GQL support code in the course of
  developing OAuth 2.0 and the database abstraction for meta.sr.ht; git.sr.ht's
  GraphQL proof-of-concept will have to be updated to follow these changes.
- A transition plan for deprecating the legacy API entirely will have to be
  prepared prior to finalizing the beta.

Please make your way to [sr.ht-dev](https://lists.sr.ht/~sircmpwn/sr.ht-dev) to
keep up with and participate in the discussion.
