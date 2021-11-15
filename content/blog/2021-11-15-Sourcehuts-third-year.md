---
title: SourceHut's third year
author: Drew DeVault
date: 2021-11-15
---

Three years ago today, [I announced][0] that SourceHut would be making its alpha
open to the general public after two years of development in private. Since
then, in addition to moving across the Atlantic ocean, I have overseen the
development of a service, and a business, which has grown to exceed all of my
expectations. Today, SourceHut is home to 25,000 users, 5,000 projects, 42,000
git repos and 5,000 Mercurial repos. 153,000 emails have made their way to the
3,000 mailing lists hosted here, and 26,000 tickets have been filed across 5,000
bug trackers. Our CI system has completed 625,000 builds totalling 2½ years of
continuous build time.

[0]: https://drewdevault.com/2018/11/15/sr.ht-general-availability.html

And so, despite its persistent "alpha" status, SourceHut has been a comfortable
home to thousands of projects productively going about the business of building
free software. I couldn't be more proud of our work, or more thankful for the
trust and support this community has offered us.

In return, what have we offered the FOSS community? Earlier this week, [I asked
the sr.ht-discuss mailing list][1] to share some of their favorite projects on
SourceHut. The favorites include a [mobile client for itch.io][mitch], a
[multi-track audio editor][tenacity] reclaimed from the hostile takeover of
Audacity, a [hacker-first OpenStreetMap viewer][osm], a [user-first Medium
frontend][scribe], and [official mirrors of SourceWare projects][sourceware]
like GCC and glibc, all of which are new to SourceHut this year. I also recently
discovered that the French government's [new site for discovering French FOSS
projects][code.gouv.fr] uses SourceHut as well. Check out the thread for more,
or reply to add some of your own favorites!

[1]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3CCFL3CMT80O75.KMUQOE9PQ90B%40taiga%3E
[mitch]: https://sr.ht/~gardenapple/mitch/
[tenacity]: https://sr.ht/~tenacity/tenacity/
[osm]: https://sr.ht/~mil/Mepo/
[scribe]: https://sr.ht/~edwardloveall/Scribe/
[sourceware]: https://sr.ht/projects/~sourceware/
[code.gouv.fr]: https://code.gouv.fr/#/about

SourceHut staff have also been hard at work contributing directly to free
software again this year. As part of our [free software
consultancy][consulting], we have taken on projects like expanding [OpenXR][oxr]
support on Linux, contributing to projects like the Linux kernel, Monado, Mesa,
Xwayland, and more. We're also responsible for [the free software Wayland
technology][gamescope] at the heart of Valve's [Steam Deck][steamdeck]. We are
also the release managers for Wayland and Weston, and maintainers for parts of
the [freedesktop][fd.o] and [Alpine Linux][alpine] infrastructure, and we became
a [Bronze supporter][bronze] of OpenStreetMap this year.

Many new free software projects have also been developed and organized by our
staff, including an [IRC bouncer][soju] and [webchat][gamja], a [documentation
site for Go][godocs], a new [web browser][visurf] based on NetSurf, and a
project to [develop a new programming language][language]. Our
[forgeperf][forgeperf] initiative has also turned our industry-leading focus on
performance and accessibility into tangible improvements in [GitLab][gitlab] and
[Codeberg][codeberg]. We will also be hiring a third engineer in February who
will help us expand this work even more. In keeping with our tradition of
transparency, the [onboarding documents][onboarding] we prepared for them are
available to the public.

[consulting]: https://sourcehut.org/consultancy/
[oxr]: https://www.khronos.org/OpenXR/
[gamescope]: https://github.com/Plagman/gamescope
[steamdeck]: https://www.steamdeck.com/en/
[bronze]: https://wiki.osmfoundation.org/wiki/Corporate_Members#Bronze_Corporate_Members
[soju]: https://sr.ht/~emersion/soju
[gamja]: https://sr.ht/~emersion/gamja
[godocs]: https://godocs.io
[visurf]: https://sr.ht/~sircmpwn/visurf
[language]: https://drewdevault.com/2021/03/19/A-new-systems-language.html
[fd.o]: https://www.freedesktop.org/wiki/
[alpine]: https://alpinelinux.org/
[forgeperf]: https://forgeperf.org/
[gitlab]: https://gitlab.com/gitlab-org/gitlab/-/issues/222685
[codeberg]: https://codeberg.org/Codeberg/Community/issues/176
[onboarding]: https://man.sr.ht/staff/culture.md

And what of the forge itself? Our main focus this year has been on implementing
our [GraphQL API][graphql], which is now about halfway done. This is the main
blocker for the SourceHut beta, and we have by now solved most of the unknowns
and are working our way through the rote work of building out the remainder of
the services. I'll predict, for the third time, that we'll complete the alpha
and start the beta next year.

[graphql]: https://sourcehut.org/blog/2020-06-10-how-graphql-will-shape-the-alpha/

We're comfortable taking our time to do this right, especially given that we're
quite able to provide a great deal of value to the FOSS community even during
the alpha. Our definition of "alpha" has a specific meaning which differs from
many other projects, specifically boiling down to meeting four important
criteria:

- Support for user groups/organizations
- The development of a high-quality API which we can support indefinitely
- Complete data autonomy, including import and export and account deletion
- Comprehensive documentation for both hosted and self-hosting users

When we meet these criteria, we will have reached the necessary level of quality
to ship a product we can be confident in for the long-term. However, we have
*already* reached many important milestones which are uncharacteristic of many
alpha-quality products. We're committed to the longevity of user data, and we
have many levels of redundant backups and monitoring. Our services are also
extremely reliable, sporting better uptime than any of our competitors,
including big fish like GitHub. Thousands of projects are already enjoying
productive use of our services, and our goal is to provide them with a
best-in-class product which far exceeds their expectations and industry norms.

In addition to this work in advancing the GraphQL APIs towards our ultimate
ambitions of completing the alpha, we have also taken some time to develop
additional products and foster a culture of shared community ownership over our
services. We shipped [pages.sr.ht](https://srht.site) this year, and we're
expecting to ship our hosted IRC services, [chat.sr.ht][chat], very soon. We've
also continued to enjoy a great relationship with the Mercurial community, who
are directly responsible for the maintenance of hg.sr.ht, in addition to the
many volunteers representing [their operating systems][compat] on builds.sr.ht.
Members of our community are also working independently to develop names.sr.ht,
which will eventually become a domain name registrar which uses git to store
zone files and supports cool ideas like [OpenNIC][opennic]. We're looking
forward to involving the community even more in the coming years, as this is a
key advantage of SourceHut's FOSS design that many of our competitors lack
&mdash; and works to the mutual benefit of SourceHut and the communities which
rely on us. If you have a cool idea for SourceHut and you're willing to write
the code, we're willing to provide you with support and resources to deploy it
to.

[chat]: https://sourcehut.org/blog/2021-10-15-whats-cooking-october-2021/#chatsrht
[compat]: https://man.sr.ht/builds.sr.ht/compatibility.md
[opennic]: https://www.opennic.org

With that, another year goes by, and the year ahead is full of work to do. I
hope you'll join our public Mumble meeting tomorrow to look back on our
accomplishments, and look forward to the future. We're meeting in the usual
place, voice.mnus.de in the SourceHut room, at 10:00 UTC tomorrow, November
16th. Thank you for using SourceHut, and I hope we continue to serve you into
the future.

## What's cooking on SourceHut?

Let's quickly address the usual "what's cooking" items before parting ways.

## todo.sr.ht

Write support for the todo.sr.ht GraphQL API was my main focus this month, but
it has turned out to be pretty complicated. todo.sr.ht is one of the most
complex sourcehut services &mdash; submitting a ticket requires parsing user
mentions, fetching subscribers, creating ticket and event rows, fetching or
referencing new participants, sending email notifications, and more. I hope to
complete this next month.

## builds.sr.ht

Legacy Fedora images are being deprecated and removed next week. You will
receive an email if this affects you. Thanks to Haowen Liu for taking over
maintenance of the Fedora images, and to Timothée Floure for all of their hard
work up to now.

apt-key has been deprecated in Debian upstream, and builds.sr.ht has been
updated according to upstream recommendations. This is not expected to impact
users.

We have stopped allocating a PTY for build logs. This may cause your build
results to look less colorful, but should cause few problems otherwise.

Additionally:

- openbsd/7.0 is now available
- ubuntu/jammy is now available

## pages.sr.ht

pages.sr.ht now supports partially updating only a subdirectory of your sites,
which makes it easier to do things like manage different subdirectories for
different projects without having all of them necessarily being aware of the
content of the entire site.
