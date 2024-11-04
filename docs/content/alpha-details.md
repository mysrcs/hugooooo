---
title: What's the scope of Sourcehut's alpha?
---

# Sourcehut's public alpha stage

Sourcehut is considered alpha quality today. However, the service is rapidly
advancing towards stability, and is may already be suitable for your needs.

## Alpha guarantees

### Your data is safe and secure

We carefully and constantly back everything up and multiple redundant systems
have to fail before anything is lost. Our backups are regularly tested and have
been proven in emergency situations. We also take great pains to carefully
ensure the security of all of its systems.  We use a distributed architecture
and share data internally between services on a "need to know" basis.

Your data is hosted on owned hardware colocated in private, secure facilities.
We do not use public clouds and we do not share your data with any other
business, with the notable exception of payment processing (so that you don't
have to trust us with your credit card number). For details, see [our privacy
policy](https://man.sr.ht/privacy.md).

### Your alpha account will be supported in the future

As we develop the services further we carefully carry your data forward and will
continue to support alpha users into the beta and beyond.

### Payment is optional now but will be required later

When the beta begins, unpaid accounts will be limited. Affected users will be
emailed 60 days in advance of the transition. Of course, users hosting their own
instance of Sourcehut on their own servers are unaffected by this.

## Alpha caveats

- Some services are not complete and some features may be conspicuously absent.
- Documentation may be incomplete in some respects.
- Not all features available on the web are available through the API.
- Tools for bringing our services together are under development. Navigation
  between different resources underneath a single project may be difficult, such
  as finding the corresponding bug tracker from a git repo. Workarounds, such as
  links in `README.md` files, are suggested for the time being.

## Goals for the beta and beyond

The beta will be considered feature complete, but may be lacking in docs and
polish, or have minor known bugs. "Feature complete" is defined as "meeting the
basic goals in a stable and consistent package", but doesn't necessarily mean
that no new features will be developed in the post-beta period. The beta period
will be short, we will settle any issues which arise from the payment model
changing, polish and document everything, then promote it to stable.

Notable features which are under development in the alpha, to be completed
before the beta begins, include:

- Organizing users into groups and organizations
- A central project hub for connecting many resources under a single project
- A web-based workflow for submitting and reviewing patches
- Data freedom, including importing and exporting all of your account data
