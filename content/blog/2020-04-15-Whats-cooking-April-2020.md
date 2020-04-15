---
title: What's cooking on Sourcehut? April 2020
date: 2020-04-15
author: Drew DeVault
---

Greetings! Another month passes and we progress closer still to the beta. We are
joined by 464 new users, bringing our new total to 13,659. Please provide them
with a warm welcome!

## General News

In case you missed it, be sure to check out the [Q1 Financial Report][0],
published earlier this week. In other general news, I recently overhauled our
[installation instructions][1], bringing them up to date with changes since
their original time of writing, and completing the documentation overhaul I had
planned. I hope you find these useful! We were getting tired of correcting the
docs all the time in IRC as people were setting up their sr.ht instances.

[0]: https://sourcehut.org/blog/2020-04-13-sourcehut-q1-2020-financial-report/
[1]: https://man.sr.ht/installation.md

Additionally, throughout the site small improvements have been made: tables in
Markdown have been improved, as well as relative links and embedded images from
git repositories. The OAuth implementation has been brought more into compliance
with RFC 6750, and there have been minor improvements for logged-out users.
Small responsiveness improvements have also shipped throughout, improving the UI
for mobile users.

## hub.sr.ht

hub.sr.ht is going quite well, and I hope to have an initial version online for
you to start using by the time I write the next edition of "What's cooking".
I've summarized the current state of the project in this video:

<video src="https://yukari.sr.ht/hub.sr.ht.webm" controls muted>
  Your web browser does not support the webm video codec. Please consider using
  web browsers that support free and open standards.
</video>

There still remains a significant amount of work to do, but for the most part
it's clearly defined and just needs to be executed.

## git.sr.ht

After 6 months of work, five patches across 3 different projects, and several
thousand lines of code, I have finished [adding custom backend support][2] to
[pygit2][3], which unblocks a number of workstreams.  Accordingly, I've
completed the first of these new workstreams by introducing a new plumbing API
to git.sr.ht, which offers low-level access to git resources.  The rub is that
you can create a custom pygit2 backend implementation which allows you to read
and manipulate git repositories like normal, but rather than storing the
repository on your local filesystem, it reaches out to the git.sr.ht API to
complete I/O operations remotely. This plumbing API remains undocumented for the
time being, but I hope to eventually stabilize it and make it available to you
for your own needs. I'm also happy to share that SourceHut has become the first
sponsor of the pygit2 project <img src="/party.png"
style="display: inline-block; height: 1.25rem; position: relative; top: 0.25rem;
box-shadow: none;" />

[2]: https://github.com/libgit2/pygit2/pull/982
[3]: https://www.pygit2.org/

I have also begun work on a second API-related project, with git.sr.ht as the
testbed. The current set of APIs offered on SourceHut have long since left their
proof-of-concept stage and are now implemented broadly enough to pull their
drawbacks into relief. There's no time which will be more perfect to revisit the
API design than during the alpha, when breaking changes are more tolerable. To
this end, I've been writing an experimental GraphQL-based API for git.sr.ht in
Go. My initial impressions are very optimistic &mdash; I'll write up my thoughts
on GraphQL in more detail later &mdash; and I think this would be a marked
improvement over our REST-based approach today, and maps very well onto our
distributed system design. If you're curious about this work, you can see the
current status on the [graphql branch][4] of git.sr.ht. The schema itself can be
found [here][5].

[4]: https://git.sr.ht/~sircmpwn/git.sr.ht/log/graphql
[5]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/graphql/api/graph/schema.graphqls

The approach isn't fully defined yet &mdash; there's a lot of experimental code
throughout, and it's changing rapidly. Writing this backend in Go also gives me
the opportunity to revisit a lot of drawbacks in the Python codebase, and the
result is a lot leaner and meaner than the earlier implementation. If this ends
up working out, we would be wise to invest more in this architecture.

## builds.sr.ht

Image updates:

- `freebsd/current` has been removed. If you had used this image in the 30 days
  preceding its deprecation, you should have received an email letting you know.
  If you run into any additional issues, be sure to reach out on
  [sr.ht-discuss][6]

[6]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss

Some minor performance improvements to the web UI have also shipped this month.
