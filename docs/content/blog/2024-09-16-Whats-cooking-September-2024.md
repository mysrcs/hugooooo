---
title: "What's cooking on SourceHut? September 2024"
author: Drew DeVault & Conrad Hoffman
date: 2024-09-16
---

Hello everyone! It has been [some time][previously] since we last wrote a
"What's cooking" for you. We'd like to resume this tradition as of this
September. We haven't been totally radio silent -- you can get caught up on
what's been happening over these past two years [reading the blog
archives][archives] -- but we'll be resuming monthly updates to keep you more
informed about the minutiae of our operations. We'll be presenting our updates
from the perspective of each of our staff members, Drew and Conrad.

[previously]: https://sourcehut.org/blog/2022-10-18-whats-cooking-october-2022/
[archives]: https://sourcehut.org/blog

## Drew's updates

Hi folks! As promised in our update in [June][june update], I have mostly been
working on paying down our tech debt recently, in addition to shouldering a fair
bit of ongoing maintenance, minor bug fixing, and so on. At the moment I am
working on the steps which will unblock our legacy REST API in favor of the
GraphQL API.

[june update]: https://sourcehut.org/blog/2024-06-04-status-and-plans/

The main focus of my work in this area is on refactoring internal users of our
legacy API (e.g. the project hub queries git for repository details via REST). I
have mostly updated the project hub accordingly, and I'm taking a small
diversion to buff up our [GraphQL-native webhooks][gql hooks] so that I can
migrate the project hub away from using legacy webhooks. For this purpose I am
developing and rolling out a more sophisticated approach to [git hooks] which
allows users to prepare GraphQL queries that are executed during a git push,
whose payloads are delivered to an arbitrary user-defined server. For now these
are done asynchronously and cannot affect the outcome of git push, but I will be
expanding it to allow users to accept or reject git pushes based on their own
policies, such as enforcing an OWNERS file.

[gql hooks]: https://sourcehut.org/blog/2021-08-25-graphql-native-webhooks/
[git hooks]: https://git-scm.com/docs/githooks/2.27.0

Following this work I will continue refactoring internal users of the legacy
API, and in this process I plan on aggressively refactoring out legacy code in
our shared Python codebase, core.sr.ht, which is the most important user of the
legacy API right now. Once a bow is put on all of this work, I will start
planning the deprecation of the legacy API and reach out to contemporary
third-party users of the legacy API to assist with a migration plan for their
use-cases. The next big tech-debt priorities after this will be the removal of
Celery and SQLAlchemy from our dependency tree.

Aside from tech debt, the next big user-facing features I plan to address are
the billing overhaul and improvements to the lists.sr.ht code review workflows.
The tech debt I have on my plate is pretty substantial though, so we may not
have any updates on this front by next month.

## Conrad's updates

You came for the fun, now you get to stay for the infrastructure updates
(mostly)! I've been hard at work following up on the plans [outlined
earlier][infra update].

[infra update]: https://sourcehut.org/blog/2024-06-12-infrastructure-updates/

Let's start with the elephant in the room: we successfully migrated our DNS
infrastructure back in-house. While I think this is great, it had the
unfortunate side-effect of it being unavailable for a brief period last Friday,
due to an upstream ISP issue. But let's be clear: even if DNS would have
continued to work, all servers were unavailable anyways. That's a trade-off you
make when you'd rather own your infrastructure than operating at "planet
scale", and we continue to be proud believers in this approach.

We have also completed the separation of the Kubernetes cluster from the VM
hosts. See the [previous post][infra update] for details, but this finally
allows us to migrate actual workloads to Kubernetes. The first one is our new
Prometheus setup, which you can already see at
[metrics.srht.network](https://metrics.srht.network). It has already taken over
the production monitoring and alerting. There are just a few more bits and
pieces that need to be moved over before I'll be able to shut down the first
VM for good: `metrics.sr.ht`.

I've also performed several upgrades of Kubernetes itself and am currently
preparing an Alpine upgrade on the bare metal hosts. Once all that is
completed, the fun part will start: moving actual services -- or parts thereof
-- into the cluster.

On the application layer, I am still pursuing the busywork of making our Python
packages PEP440-compliant. I have also been on a mission to address some
resource leakage in soju, unfortunately with mixed success. We're slowly
getting there, but the turn-around time is rather high, as we cannot constantly
annoy network operators (and users) with reboots of the bouncer.

Once the major infrastructure tasks outlined above are complete, I hope to
spend more time on actual application code again. But the Alpine upgrades,
especially the one involving our main storage host, might still keep me busy
for a while.
