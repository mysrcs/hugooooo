---
title: What's the scope of Sourcehut's alpha?
---

# Sourcehut's public alpha

We aim for a higher standard of quality than most software & services working in
this domain. What we consider an alpha passes for a production-ready system to
some. Today, SourceHut is relied upon by thousands of projects as a robust,
secure, and reliable service. We have [better uptime](https://status.sr.ht) than
[GitHub](https://www.githubstatus.com/) or [GitLab](https://status.gitlab.com/).

## Alpha guarantees

We provide the following guarantees regarding the production quality of the
SourceHut hosted services:

### Your account data is safe and secure

We take frequent backups and use highly redundant systems to store your data.
We utilize [extensive active monitoring](https://man.sr.ht/ops) and frequent
testing to ensure the reliability of our backup systems. Each development change
which requires changes to our storage systems is carefully planned for to ensure
your account data is carried over intact. There will be no "clean slate" event
as we progress from the alpha to the beta to production.

We also take great pains to carefully ensure the security of all of its systems.
We use a distributed architecture which shares data internally between services
on a "need to know" basis. Your data is hosted on privately owned hardware
colocated in private, secure facilities. We do not use public clouds. We store
only as much data as is necessary to faciliate your services, and data is shared
with third-parties on a strict need-to-know basis, and only after you have
explicitly consented to this sharing. For details, see
[our privacy policy](https://man.sr.ht/privacy.md).

### Your voice matters

We welcome feedback and questions in public on the
[sr.ht-discuss](https://lists.sr.ht/~sircmpwn/sr.ht-discuss) mailing list, or in
private [via email](mailto:~sircmpwn/sr.ht-support@lists.sr.ht).

## Alpha caveats

However, we also hold some caveats regarding the alpha.

### Payment will be required later

From the beta onwards, unpaid accounts will be limited to read-only access to
their own projects. Affected users will be emailed at least 60 days in advance
of the transition. Users who host their own instance of Sourcehut, on their own
servers, will be unaffected by this. Additionally, financial aid will be
provided to those who cannot pay; no one is going to be priced out.

The exact details of any billing changes will be discussed extensively with the
community well in advance, and you are welcome to make yourself heard in these
discussions.

See the [billing FAQ](https://man.sr.ht/billing-faq.md) for details.

### Some services are incomplete

Some of our services are not complete, and you may notice conspicuously absent
features. However, if you find the current featureset meets your needs, it may
already be suitable for your use. Our documentation is also incomplete.

Some notable features which are still under development in the alpha period
include:

- First-class support for user groups/organizations
- A web-based workflow for submitting and reviewing patches on lists.sr.ht
- Full data autonomy, including account data import & export, account
  deletion, and username changes

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
