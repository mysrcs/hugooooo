---
title: How does SourceHut's free software consultancy work?
author: Drew DeVault
date: 2022-08-23
---

SourceHut offers a [consultancy][0] in which we offer our services as experts in
free software to work exclusively on free software development. Through this
work we have developed improvements to Wayland, graphics, virtual reality,
email, and more, entirely through free software developed in public. Our work
can take the form of developing new free software from scratch, contributing
improvements to projects that our client depends on, offering what sage advice
we can spare, or, often, all of the above.

[0]: https://sourcehut.org/consultancy/

How does this actually work in practice? Following a discussion in our off-topic
IRC channel today, I thought that it would be nice to write about the actual
logistics of our operation so that others who want to sell free software
consulting services are better equipped to do so, and so that future customers
know better what to expect from us.

The process begins with client on-boarding. We don't do much in the way of
marketing &mdash; customers mostly come to us. When someone new comes to us with
an idea, the first thing we do is seek a basic alignment on the project goals
and needs, on our process, and regarding our unique free-software requirements.
We evaluate proposals based on a few criteria:

- Does this project benefit the free software ecosystem?
- Does our team have the necessary experience?
- Are the right engineers available to work on it?

Roughly half of our proposals clear this stage. In addition to a reasonably
complete project proposal, we need to establish with the client an understanding
of our requirements, namely:

- All work is published under a free software or open source license
- All work is conducted in public &mdash; no <abbr title="non-disclosure agreement">NDA</abbr>s

Though we require the results to be released to the public as free software,
we're open to assigning copyright to the client. Not all clients want this,
though. If the customer has a clear idea of what's required, a few emails back
and forth are suitable to establish a consensus. If a deeper analysis is needed,
we might ask for a temporary contract to cover costs of initial research and
planning.

Following this, we'll draft a contract and seek consensus on the expected
pricing and effort required. Our contracts are short and simple, generally
covering matters like logistics for payment and the contract period, but also
explicitly addressing our requirements regarding subjects like software
licenses. Sometimes the client prefers to use their own contract templates,
which we're open to, but generally this requires more negotiation to remove
"standard" clauses for things like NDAs.

We bill for each of the engineers we plan to bring on board separately. Our
pricing is essentially a function of two competing factors: we target free
software and small- to medium-sized businesses, which pushes our prices down,
and we offer high-end services from an experienced team, which pushes up. Right
now this balance settles on a $250/hour and $150/hour standard base rate for our
senior and junior engineers respectively.

The rates are generally only somewhat negotiable &mdash; but we may tweak our
rates depending on things like our perception of the positive impact a contract
might have for free software, or the means of the client. An early-stage open
hardware vendor might get a reduced rate for our work developing graphics
drivers for them, for example. We will generally expect a deposit from
unfamiliar customers.

Once everything is signed and it's off to the races, the execution of these
contracts involves a non-traditional planning style. We push back against
suggestions like waterfall or agile, and prefer instead to work like a free
software project often does &mdash; with broad long-term goals, loosely defined,
and narrower short-term goals, more concretely defined. We also set research and
planning as an objective in its own right, as this allows us to illuminate
unknowns and secure a better idea of the implementation process for each task.
We prefer to express progress and planning in terms of the complexity of the
work required rather than the expected time to complete it.

Facilitating this mutual understanding of the work involves monthly "status
update" emails sent alongside the invoices for each month's work. These updates
cover the tasks recently completed and those planned for the near future, and
explain how these tasks relate to the broader objectives.

This is a good opportunity for us to seek consensus where required. Often the
client will follow up with questions and clarifications, which a brief email
exchange squares up. We'll also use this as an opportunity to seek
clarifications on our end, or to communicate when a decision is required from
the client. We occasionally will entertain such exchanges mid-cycle as well, but
we plan to anticipate decision points well before they become blockers so that
we can work autonomously mid-cycle. We seek to understand and internalize the
client's vision so that we can make the right choices autonomously, reducing the
opportunities for our team to be blocked and increasing the client's confidence
in the project.

Though this approach is extraordinarily effective, it relies on a great deal of
mutual trust. We aim to secure this by maintaining a reputation for careful,
skillful engineering, fierce honesty and transparency, and a history of shipping
reliable production software. Insisting on working on free software in public
puts weight to these words: our results are independently verifiable.

---

The model works. Our clients have expressed unanimous satisfaction with our
services, and we've been able to do a lot of great work for the free software
community. Our successes includes [VR on Wayland][wxrc] and many improvements
([1], [2], [3]) to the Monado OpenXR runtime, the [Wayland software][gamescope]
powering the [Steam Deck](https://www.steamdeck.com/en/), and a new [webmail]
and a [calendaring and contacts server][tokidoki].

[wxrc]: https://git.sr.ht/~bl4ckb0ne/wxrc
[1]: https://gitlab.freedesktop.org/monado/monado/-/merge_requests?scope=all&state=merged&author_username=bl4ckb0ne
[2]: https://gitlab.freedesktop.org/monado/monado/-/merge_requests?scope=all&state=merged&author_username=ddevault
[3]: https://gitlab.freedesktop.org/monado/monado/-/merge_requests?scope=all&state=merged&author_username=emersion
[gamescope]: https://github.com/Plagman/gamescope/pulls?q=is%3Apr+author%3Aemersion+is%3Aclosed
[webmail]: https://sr.ht/~migadu/alps/
[tokidoki]: https://sr.ht/~sircmpwn/tokidoki/

If you'd like to hire us to work on your project, take a look at our [consulting
page][0] for details. If you'd like to emulate us, I hope that you found this
resource helpful. Feel free to ask for advice in #sr.ht.watercooler on Libera
Chat.

We have been planning to develop a jobs board for SourceHut users which allows
FOSS developers to list themselves for hire called hire.sr.ht. We intend to
provide this service as part of your normal SourceHut subscription,[^1] and will
not take a margin on top of your contracts. You would handle your own contracts
and billing, control the communication channels with your clients, have the
freedom to take clients off of the platform, and enjoy full ownership over your
consulting income.

[^1]: Including for users who receive financial aid

We have not been able to prioritize this work, but we have developed [enough of
it][hire.sr.ht] that we can work with potential contributors. If you're
interested in helping us bring this service to life, familiarize yourself with
the existing code and see what you can do. Check out the GraphQL backend first.
Patches to
[~sircmpwn/sr.ht-dev@lists.sr.ht](mailto:~sircmpwn/sr.ht-dev@lists.sr.ht).
Cheers!

[hire.sr.ht]: https://git.sr.ht/~sircmpwn/hire.sr.ht
