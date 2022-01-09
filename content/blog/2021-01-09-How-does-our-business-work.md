---
title: How does SourceHut's FOSS business model work?
author: Drew DeVault
date: 2022-01-09
---

SourceHut makes a profit, but we are not motivated by profit. I founded
SourceHut with the explicit goal of making my free software work sustainable
full-time. As SourceHut grows, we aim to expand and generalize this approach. We
want to make free software better, and the business is a tool we use to
facilitate this.

We have two lines of business which provide us with revenue: the SourceHut
software-as-a-service (SaaS) platform, and free software consulting. You can run
the SourceHut platform yourself ([instructions are available here]), but it's
expensive and time consuming to maintain the platform, so most people pay us to
do it for them via monthly or annual subscription fees. This model sets up
incentives which favor users over investors,[^investors] which gives us an
honest focus on user-motivated design (as opposed to profit-motivated design)
and ensures that we are dis-incentivized to use unethical means to make our
margin, such as selling your personal information. Your payments also provide
for the development and maintenance of the service, which we try to honor by
ensuring reliable uptime & performance, comprehensive backups, and so on, via a
robust operational strategy which is not economically practical for small-scale
deployments.

[instructions are available here]: https://man.sr.ht/installation.md
[^investors]: Which we don't have. Investors, that is.

Our second line of business is free software consulting. Free software has eaten
the world: it is ubiquitous in all software products. This has created a market
for free software experts who have a broad understanding of the free software
ecosystem and experience working upstream. We provide consulting services to
this market, in which we are paid to write or contribute to free software.
Upstream projects we've worked on under this model includes software like
[Linux], [Mesa], [X.org], [Monado], and many others, for clients like [Valve
Software], [Status.im], and [Migadu]. We have also developed greenfield software
for these clients, such as [alps], [wxrc], and [gamescope], as well as
improvements to software which our team maintains independently, such as
[wlroots] or [Wayland].

[Linux]: https://kernel.org
[wlroots]: https://gitlab.freedesktop.org/wlroots/wlroots
[Mesa]: https://mesa.freedesktop.org/
[Wayland]: https://wayland.freedesktop.org/
[X.org]: https://x.org/wiki/
[Monado]: https://monado.dev/
[Valve Software]: https://www.valvesoftware.com/en
[Status.im]: https://status.im/
[Migadu]: https://www.migadu.com/
[Alps]: https://sr.ht/~migadu/alps/
[wxrc]: https://git.sr.ht/~bl4ckb0ne/wxrc
[gamescope]: https://github.com/plagman/gamescope

We use the revenue from these lines of business to fund free software projects
through the work of our full-time employees, of which there are two: myself and
Simon Ser. We work at our discretion on free software projects, some of which
are not obviously monetizable, for the purpose of making the free software
ecosystem stronger as a whole. Sometimes this work ultimately provides revenue
&mdash; for example, Simon's [soju] and [gamja] projects were developed
independently and eventually were incorporated into the paid [chat.sr.ht]
product. We also developed [wlroots] together (starting before SourceHut was
founded), which eventually was the basis of much of our consulting revenue. It's
more common that these projects don't produce a return.

[soju]: https://sr.ht/~emersion/soju
[gamja]: https://sr.ht/~emersion/gamja
[chat.sr.ht]: https://sourcehut.org/blog/2021-11-29-announcing-the-chat.sr.ht-public-beta/

Many of our projects have no profit motive and are probably unmonetizable. Our
mission is to make free software better, profitable or not. Projects like
[visurf] or [gemini], our upcoming [systems programming language], upstream work
in [Alpine Linux] or [freedesktop], or sponsorship of projects like
[OpenStreetMap] &mdash; none of these have obvious returns for us. We work on
them because we believe that they are important. If we were pressed to justify
this in business terms, we might say that we are growing the free software
market as a whole through this work, or that they are good for marketing (both
of which are true), but fundamentally it's because we believe in free software.

[visurf]: https://sr.ht/~sircmpwn/visurf/
[gemini]: https://gemini.circumlunar.space
[systems programming language]: https://drewdevault.com/2021/03/19/A-new-systems-language.html
[Alpine Linux]: https://alpinelinux.org
[freedesktop]: https://www.freedesktop.org/wiki/
[OpenStreetMap]: https://wiki.osmfoundation.org/wiki/Corporate_Members#Bronze_Corporate_Members

We will be hiring a third full-time engineer in February, who we will introduce
to you when the time comes. Following our tradition of transparency, you're
welcome to read the [onboarding manual] we have prepared for them, which goes
into more detail on what it's like to work for SourceHut. We also occasionally
bring on temporary workers to work within specific goals. For example, thanks to
an [NLNet sponsorship], we will have Adnan Maolood on for the year to help with
the GraphQL work. We have also hired contractors for things like consulting
work, or for help with some of our independent FOSS projects or upstream needs.

[onboarding manual]: https://man.sr.ht/staff/culture.md
[NLNet sponsorship]: https://nlnet.nl/project/SourcehutGraphQL/

This is how we do business. Does it work?

In short: yes. We will answer this question in great detail in our coming annual
financial report,[^report] but I can summarize it for you now. The books for
2021 are not quite closed yet, but it looks like we're going to end up in the
vicinity of half a million dollars in gross revenue, which I think is pretty
damn good for a bootstrapped company in its third year, especially one which
gives away 100% of the software it builds free of charge.

[^report]: If you're wondering where these went, this is the answer. They're too much work to do quarterly, especially as our business situation was complicated by the recent introduction of a Dutch business entity and our growing consulting revenue. Sorry that these stopped for a while! I will write up the next one soon.

There are many ways to finance free software. This is our way, and it works. We
fund improvements to hundreds of free software and free culture projects, many
which would be otherwise impossible to do profitably or even sustainably. All of
our profit has been or will be invested strictly in free software and free
culture projects, most of which are not even maintained by us. There's no "open
core" going on here: every line of code we write is genuine free-as-in-freedom
software.

I'm very proud of what we've built.

We built it with your help. Many SourceHut community members have taken on
serious roles in our projects, contributing heaps of code to every project, even
maintaining some subsystems, or occasionally entire sourcehut services like
hg.sr.ht, in their spare time. We have had community contributions to thank for
many improvements in functionality, reliability, documentation, and more. Even
the simple choice to host your projects with us is an investment in our
community, and one which can be difficult to make against the temptations of
more popular nonfree or semi-nonfree platforms in the market like GitHub or
GitLab. I am grateful to everyone who has had a hand in this success. Thank you.

---

Making free software better means making it better for everyone, not just us. We
want to make free software profitable for **you**, too. One of our upcoming
products is "hire.sr.ht", which will provide an index of independent free
software contractors to solicit clients.

[![Mock-up of a profile on this service](https://l.sr.ht/o31H.jpg)](https://l.sr.ht/o31H.jpg)

<div class="caption">(click to enlarge)</div>

I hope to see this platform used for a variety of free software work. It could
be weekend hackers who maintain some projects in their spare time and get paid
by users to implement the features they want, or weekend hackers who get paid by
users to send patches to *other* projects. Or, you could be working on a FOSS
project of your own and hire someone with a relevant skillset to help you get it
started. Maybe we'll see full-time free software consultants listed here, taking
on larger long-term engagements to work on free software for businesses, or even
free software consultancy co-ops or businesses like SourceHut itself.

We plan on offering this service as part of your normal sourcehut subscription
fee,[^subsidized] without taking any commissions or trying to control the line
of communication between you and your clients. You will write your own
contracts, negotiate with clients directly, handle billing and payments without
our involvement, and retain complete and independent ownership over your work
and client relationships. We will support you in figuring these things out, and
I hope to see an organic community of mutual support form between contractors
(and clients) to provide these things for each other, without tying your
livelihood up under SourceHut's control.

[^subsidized]: Including for users who need financial aid and rely on our subsidized or free subscriptions.

Like the rest of SourceHut, this is an open source project, and we're developing
it *with* you as much as we are developing it *for* you. We could use your help
in building this. If you're interested in working on this project, please [reach
out]. There's also a grassroots community project to build out domain
registration and DNS hosting services on SourceHut which could use your help. If
you have any other ideas, I want to hear them. If you have time, passion, and
ideas, we've got servers and a community. Let's talk.

[reach out]: mailto:sir@cmpwn.com
