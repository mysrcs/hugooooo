---
title: What's cooking on Sourcehut? December 2019
date: 2019-12-15
author: Drew DeVault
---

This is our last "what's cooking" of 2019! We're seeing out the year with 11,927
registered users, 563 stronger than November. Please give our new members a warm
welcome! We have some cool progress on many fronts this month.

## General News

First of all, we finally got single-sign-on sorted out this month. Now, logging
in once will log you in everywhere. Many other problems which stemmed from this
have also been fixed - long time users will no doubt have seen the "log out and
back in to enable builds.sr.ht integration" message on a git push, but
thankfully that annoyance will be unknown to new users going forward. This was
also a pre-requisite for dealing with user groups, which will be the next main
focus of account management work.

I've also been experimenting with Ceph and preparing to provision our new Ceph
cluster, which will give us three things: (1) object storage, (2) filesystem
storage, and (3) block device storage. Each of these separately unblocks a
number of features. (1) gives us things like attaching binaries to tags or
publishing build artifacts from builds.sr.ht jobs, (2) gives us things like a
GitHub-pages-style feature, and (3) can be leveraged for build caches. Ceph is
complicated and I want this deployment to be sustainable indefinitely, so I'm
going to take my time to provision it carefully and understand every piece - so
please have patience while I get this set up.

## git.sr.ht

The first series of performance improvements to git.sr.ht landed this month, and
I wrote [an article](https://sourcehut.org/blog/2019-11-22-what-happens-on-git-push/)
which goes into a great deal of detail for the curious. The next step is to
improve the I/O throughput of the server, which can only be done with
revprovisioning. Unfortunately, the hardware to do this has been a real pain in
the ass to obtain - SuperMicro has been having issues with their fulfillment
pipeline recently and I'm struggling to complete the build. We may be in for a
bit of a wait while I try to get the parts together. If I don't have this
squared away by January, I'm going to redesign the server with different parts.
I already have half of the parts, and I'd rather they don't go to waste, so I'm
going to spend a little more time trying to get this system built per the
original specification.

## lists.sr.ht

You can now grant a new access control privilege to users: "moderate". This
allows users to update patchset status and remove emails from the archives.

## builds.sr.ht

Minor maintenance updates:

- Debian packages are now available.
- Fedora 31 is now available.
- FreeBSD 12.1 is now available.
- NixOS 19.09 is now available.
- OpenBSD 6.6 is now available.

## names.sr.ht

Wow, this is complicated. I think having an open-source implementation of all of
these rules will be a boon to the ecosystem, though. Despite the complexity, I
still have a reasonably complete image of what the system should look like in my
head, and we're slowly progressing towards realizing it. Here's another
screenshot to tease you in the meanwhile:

[![Screenshot of domain contacts on names.sr.ht](https://sr.ht/LLkW.png)](https://sr.ht/LLkW.png)
