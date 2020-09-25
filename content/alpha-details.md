---
title: What's the scope of Sourcehut's alpha?
---

# Sourcehut's public alpha

We aim for a higher standard of quality than most software & services working in
this domain. What we consider an alpha passes for a production-ready system to
some. We provide the following guarantees and caveats reagrding the
production-quality of the SourceHut hosted services.

## Alpha guarantees

### Account data is safe and secure

We carefully and constantly back everything up and multiple redundant systems
have to fail before anything is lost &mdash; all important account data is
stored with at least 4 redundancies, and as much as 8. Our backups are regularly
tested and monitored, and have been proven in contingency situations. Your data
will be carefully migrated and preserved through each stage of development, from
alpha to beta and into production; there will not be a "clean slate" event.

We also take great pains to carefully ensure the security of all of its systems.
We use a distributed architecture which shares data internally between services
on a "need to know" basis. Your data is hosted on owned hardware colocated in
private, secure facilities.  We do not use public clouds and we do not share
your data with any other business, with the notable exception of payment
processing (so that you don't have to trust us with your credit card number).
For details, see [our privacy policy](https://man.sr.ht/privacy.md).

### Your voice matters

We welcome feedback and questions in public on the
[sr.ht-discuss](https://lists.sr.ht/~sircmpwn/sr.ht-discuss) mailing list, or in
private [via email](mailto:sir@cmpwn.com). We also hold public voice meetings on
the 16th of every month, the exact time of each to be announced the date prior,
where we take questions and feedback from users.

## Alpha caveats

### Payment will be required later

From the beta onwards, unpaid accounts will be limited to read-only access to
their own projects. Affected users will be emailed at least 60 days in advance
of the transition. Users who host their own instance of Sourcehut, on their own
servers, will be unaffected by this.

Unpaid accounts will still be able to contribute to projects on the platform,
and in fact you can use most services without having an account at all. Payment
will only be required to have ownership over resources, submit build jobs, and
so on.

### Some services are incomplete

Some of our services are not complete, and you may notice conspicuously absent
features. However, if you find the current featureset meets your needs, it may
already be suitable for your use. Our documentation is also incomplete.

Some notable features which are still under development in the alpha period
include:

- First-class support for user groups/organizations.
- A web-based workflow for submitting and reviewing patches on lists.sr.ht.
- Full data autonomy, including account data import/export data, account
  deletion, and username changes.

The "beta" label is used on our
[bug trackers](https://todo.sr.ht/trackers/~sircmpwn?search=sr.ht) to indicate
tickets which are prioritized for the beta.

### The API is subject to change

We are developing a new GraphQL API which we intend to support onwards into the
future. Users of the legacy API will be notified of any deprecations in advance,
and assistance in migrating your software will be offered. The new API, once
finalized, will be supported for at least 5 years.

## Goals for the beta and beyond

The beta will be considered feature complete, but may be lacking in docs and
polish, or have minor known bugs. "Feature complete" is defined as "meeting the
basic goals in a stable and consistent package", but doesn't necessarily mean
that no new features will be developed in the post-beta period. The beta period
will be short, we will settle any issues which arise from the payment model
changing, polish and document everything, and promote it to the production phase
shortly thereafter.
