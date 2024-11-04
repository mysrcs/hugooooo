---
title: What's cooking on Sourcehut? August 2020
date: 2020-08-16
author: Drew DeVault
---

Another month passes and we find ourselves writing (or reading) this status
update on a quiet, rainy Sunday morning. Today our userbase numbers 16,683
members strong, up 580 from last month. Please extend a kind welcome to our new
colleagues! Thanks for reading these posts and keeping up with what's new on the
platform.

First, I'd like to extend a thanks to contributor наб, who has been sending an
[impressive number][0] of patches lately, and is responsible for most of the
features detailed in this update. Other contributors who deserve thanks this
month include 2xsaiko, Amin Bandali, Chris Vittal, gildarts, and Peter Sanchez.
Thanks, everyone!

[0]: https://lists.sr.ht/~sircmpwn/sr.ht-dev?search=from%3Anabijaczleweli

For my part, I've been focused on operational work this month. I oversaw the
installation of and migration to the new hg.sr.ht server, which should enjoy
improved performance and support a larger number of repositories going forward.
The same server is also going to be useful as a testbed for our new standard VM
server setup, which will scale better to long-term high-availability plans.
Additionally, our PostgreSQL robustness deployment has been overhauled, which
should lend improvements both to integrity and availability.

## git.sr.ht

git.sr.ht now supports default branches other than master. For details on
changing your default branch name, [consult the docs][1].

[1]: https://man.sr.ht/git.sr.ht/#changing-the-default-branch

Many additional minor bug fixes and performance improvements have been made
throughout. For example, non-UTF-8 branch & tag names are handled better now,
with additional improvements heading to pygit2 upstream.

## builds.sr.ht

The Ubuntu images have been overhauled to more closely map to the upstream
release schedule. [Consult the compatibility page][2] for details. Affected
users were emailed before the update rolled out; if you did not receive an email
then it is unlikely that you will have to change your build manifests.

[2]: https://man.sr.ht/builds.sr.ht/compatibility.md

## todo.sr.ht

A number of improvements have been made for logged-out/anonymous users, mostly
minor changes. One larger change is that users without accounts may now
subscribe to specific tickets by email.

## lists.sr.ht

Searching by username is now supported in the From, To, and Cc fields, via the
`from:~username` search key format. Additionally, git patches prepared with `git
send-email --rfc` are now correctly recognized as such.

## project hub

When the hub submits CI jobs to builds.sr.ht for patches in mailing lists, a
builds.sr.ht job group is now utilized. This reduces the number of emails sent
in response to one, even for repos with many build manifests.

Additionally, a number of small improvements have been made to increase the
visibility of featured projects.

## meta.sr.ht

For users who run their own instance of meta.sr.ht, PAM support has been added
for authentication, allowing you to use the Unix account database for usernames
and passwords rather than storing them in SQL.
