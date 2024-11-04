---
title: Four years of SourceHut
author: Drew DeVault
date: 2022-11-15
---

Today is the fourth anniversary of [SourceHut's public opening][0]. In these
four years, we have developed a free software platform which hosts nearly 10,000
projects, among them more than 68,000 repositories, 5,000 mailing lists with
nearly a quarter-million emails, 6,500 bug trackers hosting 50,000 tickets, and
914 build-days over 880,000 jobs on builds.sr.ht, all in the service of our
33,516 users.

[0]: https://drewdevault.com/2018/11/15/sr.ht-general-availability.html

I'm tremendously proud of the community that has grown on this platform. I offer
my sincere thanks to the thousands of people who have joined SourceHut and
helped build a welcoming, productive community of free software developers. I
offer my thanks to you, dear reader, for your profound role in these
achievements. I struggle to find the right words to express the enormity of my
gratitude.

In lieu of adequate words to describe it, we strive to express this gratitude
through our actions. Our work is entirely free software, and our community are
co-owners in it; our hundreds of contributors have retained the copyright for
their work and our copyleft licenses enforce our promise to forever remain free
software. Many of these contributors have graciously stepped into roles as
maintainers of various subsystems in their lines of expertise, and we have
offered them trust and responsibility equal to the degree of their contributions
and investment.

We have further increased our commitment to transparency and honesty in our
affairs this year, be it with our [financial reporting][1]; operations
[wiki][2], [data][3], and [monitoring][4]; our [staff wiki][5]; or cultural
artifacts such as striving to make our staff members directly accessible to
users for addressing their needs. We have consulted you every step of the way,
sought out and honored your insights, and carefully crafted our incentives to
institutionalize a system that places your interests at the forefront.

[1]: https://sourcehut.org/blog/2022-04-08-2021-financial-report/
[2]: https://man.sr.ht/ops/
[3]: https://metrics.sr.ht
[4]: https://lists.sr.ht/~sircmpwn/sr.ht-ops
[5]: https://man.sr.ht/staff/

I'm honored to be of service to the free software community, and I hope that we
will continue to improve and grow to thrive in this role, and do our part to
ensure the success of the free software movement.

With all of this in mind: what happened this year, and what can we look forward
to for next year?

## The year in review

SourceHut development in the past year has been focused on completing the
roll-out of our GraphQL APIs (aka API 2.0). One of the major concerns for the
alpha is the completion of a robust and stable API that we're comfortable
supporting for a long time. This effort has been quite successful; all of the
major services now support GraphQL and we're preparing to build out the
stragglers (project hub and man.sr.ht) over the next few weeks. With the
planned development of GraphQL federation, we will complete a system which
allows the federated mini-services of SourceHut to interoperate with one another
in a much more flexible and powerful manner, while still retaining their
independence and flexibility for third-party installs that only need a subset of
the services.

This period has not been absent of new features, however. We also completed and
released [chat.sr.ht][chat], a hosted IRC bouncer service for SourceHut users.
This software is built on [soju][soju] and [gamja][gamja], respectively a
bouncer and webchat service, developed as free software by SourceHut's own Simon
Ser. This service makes IRC much more accessible and easy to use, and makes it
easy for projects on SourceHut, and their contributors, to maintain and access
real-time chat services for development discussions and end-user support &mdash;
and for fun, plenty of us use IRC to hang out with our friends! Simon also began
work on [hut][hut] this year, which is a command line tool for interfacing with
SourceHut that has become a staple of many of our users' workflows.

[chat]: https://sourcehut.org/blog/2021-11-29-announcing-the-chat.sr.ht-public-beta/
[soju]: https://sr.ht/~emersion/soju
[gamja]: https://sr.ht/~emersion/gamja
[hut]: https://sr.ht/~emersion/hut/

We also expanded our roster this year. We brought on Conrad Hoffman as
SourceHut's newest full-time developer, who has been putting his talents to good
use to help prepare us to move our infrastructure into the EU. We also received
a generous grant from [NLnet][nlnet], which covered the costs to bring Adnan
Maolood onto the project, whose efforts have been indispensable in helping to
complete our GraphQL implementation.

[NLnet]: https://sourcehut.org/blog/2022-01-10-nlnet-graphql-funding/

Many of our services have been expanded with additional features, including new
features for SourceHut pages, a greater variety of build images for
builds.sr.ht, finer access controls for all services, and, recently, the
long-promised self-service account deletion and data export features &mdash;
important for our goals of enabling user ownership over their own data.

## Coming soon

As I mentioned earlier, we're putting a bow on GraphQL over the next several
weeks, as we roll out the last couple of services and start setting up GraphQL
federation. Federation will make it easier for us to implement greater
inter-service connectivity, which will offer many useful improvements, including
finally resolving the annoying "how do I get to a project from its git repo"
problem once and for all.

We also intend to overhaul our billing system in the foreseeable future, adding
support for additional currencies and payment methods, such as payments in Euro
via systems like SEPA or iDEAL. This will also resolve many long-standing
papercuts with the billing system and provide users with a greater degree of
control over their billing details. This is also important for the business side
of SourceHut, since we'll be using this opportunity to migrate our platform
revenue into Europe.

On the subject of moving into Europe, we've also started setting up our new
European datacenter installation in Amsterdam. We have provisioned a few hosts
and we're using them to experiment with better ways to deploy SourceHut
infrastructure, including, yes, the dreaded Kubernetes. If this works out, many
users who wish to deploy SourceHut into a typical cloud environment will find
the task more easily done. We're also hoping to use this effort to make strides
towards turning our four nines into five nines, improving on our already
industry-leading stability.

We also plan on tackling another long-awaited feature soon: user groups, or
organizations. This and the other features described have been blocked on the
completion of our GraphQL work, and with this work out of the way, it's time to
prepare for a flurry of new feature development to round out the alpha and
finally bring the SourceHut beta into life. All of these plans have one thing
in common: they've been identified since the start as our major priorities for
the completion of the alpha. It's happening.

## Coming later

This covers what you can expect over the next several months, but I also want to
spend a moment discussing some of the things we're planning to do in the longer
term. Here are a few possible future services which are on our minds:

### jobs.sr.ht

This service is something we drafted and mocked out several months ago, and it's
been sitting on the backburner while we address more urgent priorities. The
essential idea is to provide a jobs board for hiring developers to work on free
software.

Through a combination of hard work and luck, SourceHut has settled upon a
financial model which allows us to sustainably work on free software projects in
a manner compatible with our ethical obligations. We want to help others in the
free software ecosystem achieve similar goals for themselves, so that the free
software world can grow and flourish on the backs of healthy and happy
developers. To this end, we conceived of jobs.sr.ht.

The plan is to allow users to list themselves on the platform so that interested
clients can seek out free software developers to hire for projects. We want to
accommodate a variety of approaches: a maintainer might be hired by their users
to implement a desirable feature over the occasional weekend, or a group of free
software developers could form a collective to take on more serious contracts to
develop free software for the industry. An artist could list their services to
design the mascot for new free software projects, or a maintainer could hire a
talented developer to help them ship a new release.

Here's the ticket: SourceHut will not charge any fees to either party beyond
that of your existing SourceHut subscription. Users who receive financial aid
will also be entitled to utilize this service. We'll cover the expense of
operating this platform out of our normal platform revenue. Additionally, we
will make no efforts to insert ourselves between contractors and their clients.
You will be responsible for writing and agreeing to your own contract terms,
facilitating payment between yourselves, and will communicate normally through
email, rather than from within a walled garden. We will *never* hold your means
of income hostage. If you choose to leave or move elsewhere, you take all of
your contracts with you, and can import your details into an instance of
jobs.sr.ht hosted by anyone else.

### names.sr.ht

An older idea that we're still interested in working on is names.sr.ht, a domain
registrar and DNS hosting service. This concept is born out of the frustrations
of using a janky JavaScript record editor to update DNS records: what if we
could just push a zone file to a git repository instead?

We also intend to act as a domain registrar (or rather as a reseller, we don't
have the resources to be a first-class registrar). We will not charge any
additional margin over the price we receive, and instead will include these
services as part of your normal SourceHut subscription fee. As our purchase
volume grows, we will be able to negotiate bulk discounts and pass the reduced
prices back to you.

Not sure when we can expect to see this service &mdash; it'll probably be done
when one of our staff members gets bored for a couple of weeks and blitzes out
the initial prototype. In any case, I'm looking forward to it.

### mail.sr.ht?

We're thinking about developing a hosted email service. Email is, as you know,
very important to SourceHut's workflow. We would love to provide a killer hosted
email experience for users to better facilitate this.

Such a service would include all of the trimmings that we feel are essential
&mdash; standard protocols such as IMAP and SMTP, configurable sieve filters,
unlimited domains, and so on. We may consider researching a model which allows
for bulk mail delivery, naturally subject to the condition that you are not
using it for spam &mdash; hosting something like a development mailing list
or sending our confirmation emails for sign-ups to your Mastodon instance would
be more appropriate. We'll also add some features which are unique to SourceHut,
such as close integration with services like lists.sr.ht &mdash; and wouldn't it
be nice to see the CI status of a patch and click "apply" right in your inbox?
Once names.sr.ht is rolled out as well, we can use it to make it easy to manage
the pesky DNS settings necessary to ensure smooth delivery and compatibility
with things like mailing list forwarding.

## In conclusion

It's been a great four years so far, and we have more great years to look
forward to. We're well on our way to a more complete and reliable system, and
we've been able to provide more support for the free software ecosystem than I
ever imagined possible. I'll re-iterate my thanks to you, dear reader, for
reading this post, and for using SourceHut. You're the best.

That's all for today. Take care!