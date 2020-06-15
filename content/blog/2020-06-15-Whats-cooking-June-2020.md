---
title: What's cooking on Sourcehut? June 2020
date: 2020-06-15
author: Drew DeVault
---

Hello! With May behind us and July looming, we have another month of progress on
the alpha in our cap. Today we're joined by 695 new users, bringing our total
strength to 15,458 brave hackers. Give our new peers a warm welcome, please!

## General news

Please be advised that today, June 15th, starting at 18:00 UTC, we have a
planned outage. Services are expected to be intermittently available for a period
of up to an hour. Each outage is expected to be limited to one service at a
time, and should last no more than 15 to 30 minutes each. Consult the [status
page](https://status.sr.ht/issues/2020-06-15-planned-outage/) for more
information.

I'd also like to thank Eli Schwartz once again, for stepping up as the new
official maintainer of the SourceHut Arch Linux package distribution. He will be
handling the maintenance of the Arch Linux repository going forward; please
direct your inquiries and patches to him. Thanks Eli!

## meta.sr.ht

A new GraphQL API for meta.sr.ht is now available. [Play with it here!][meta] As
promised in the last update, the GraphQL playground is now JavaScript-free. I am
also working on an improved means of API authentication, with finer-grained
access controls and more compatibility with industry standards like OAuth2.

If you're curious to learn more about the application of GraphQL to SourceHut, I
wrote [a blog post][gql article] on the subject last week.

[meta]: https://meta.sr.ht/graphql
[gql article]: https://sourcehut.org/blog/2020-06-10-how-graphql-will-shape-the-alpha/

## builds.sr.ht

The manifest submission page has replaced ace.js with CodeMirror for the
JavaScript-enabled build manifest editor. This should work better on mobile
devices and feels a bit more native to use (because it is a bit more native). As
before, users with JavaScript disabled will still be able to use a plain
textarea to submit build manifests.

- alpine/3.12 is now available
- openbsd/6.7 is now available
- openbsd/6.5 has been removed

## dispatch.sr.ht

Builds submitted for GitHub pull requests now include the `GITHUB_PR_BODY` in
the environment, thanks to Paul Spooren's patches for OpenWRT. Thanks Paul!

## todo.sr.ht

Ivan Habunek has implemented support for previewing the rendered Markdown for
ticket descriptions and comments, and it was further refined by René Wagner.
Gabriel Augendre also rigged it up so that you're copied on tickets submitted by
email, so you get the ticket number that was assigned sent back to you, and
Benjamin Lowry submitted several bug fixes. Thanks, everyone!

## git.sr.ht

The GraphQL API has grown support tag artifacts, and learned many bug fixes.
Thanks for helping to test this!
