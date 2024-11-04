---
title: The state of SourceHut and our plans for the future
author: Drew DeVault
date: 2024-06-04
---

Good morning! It's been a tough year for SourceHut and I know many of our users
are waiting to hear from us. Our last update was the [post-mortem][0] following
the DDoS attack we sustained in January, and we have some additional news
following this update as well as plans for the coming months to share.

[0]: /blog/2024-01-19-outage-post-mortem/?ref=footer

I apologise for the reduced communication as of late. We are a small team
dealing with a lot of big problems, and between keeping the lights on, dealing
with issues as they arise, and leaving time for us to rest and spend time with
our families, there has not been as much room for keeping you up to date.
Nevertheless, our ship sails on, things have quieted down now, and we have an
opportunity to get you filled in today.

## So far in 2024

I'll be honest with you -- it hasn't been great. We are not facing an
existential crisis -- we have extensive disaster planning for many scenarios we
might face, and our situation is well within the scope of our planning -- but
nevertheless it has been a challenge.

As you know, during the DDoS we suffered a total network outage on our primary
datacenter and had to perform an emergency overnight migration of all of our
infrastructure to our research installation in our datacenter lease in
Amsterdam. Our infrastructure became stable following this intervention, but we
have been operating at a reduced capacity since -- we are running SourceHut on
infrastructure provisioned for research, not production. Currently we are
supplementing our owned-hardware compute with a lease from OVH for build server
cycles.

Following the failure of our primary datacenter, we arranged to have our
equipment shipped overseas to our research datacenter, so that we could install
this equipment and restore our infrastructure to its full production capacity on
SourceHut-owned hardware. At our now-deprecated site we had ten servers
totalling an investment of about $50,000 USD. Some of this equipment was at the
end of its operational life and was disposed of accordingly, but we arranged to
have five servers shipped to Amsterdam. However, all five servers were lost in
the mail. These parcels were insured with the shipping provider, but we have
been unable to reach the provider for any information regarding the status of
the parcels or any resources for filing an insurance claim. After several months
of attempts, we have ultimately had to write these servers off.

Moreover, we are facing some financial issues. The loss of this equipment
represented a significant lost investment, and the shipping costs were
substantial. Additionally, we are working with a tax issue in which we were
over-taxed by about $20,000; we filed an appeal months ago but that money is
tied up for the time being and the tax authorities have sent us timely notices
every 60 days informing us that they require an additional 60 days to process
the issue. We still have an entirely sustainable financial situation, but we
lack access to the capital we would ideally be using to build out our
infrastructure and address other needs for growth.[^1]

[^1]: If you have the financial means and wish to help, this would be a great
    time to consider upgrading your paid subscription -- though it is by no
    means necessary for us to keep things running.

You may have heard that we also had to part ways with one of our staff members
recently. This reduces our headcount to two. For the time being we will not be
hiring a replacement, but our near-future plans are achievable with our current
headcount. Though we usually aim for transparency to the maximum extent
possible, we will not be sharing further details about this departure, as a
matter of reasonable privacy.

As you can imagine, it has been a stressful time for us. However, I wish to
stress that everything we've been dealing with is planned for in our models,
both technical and financial. There is no existential threat to SourceHut.
Nevertheless, we are grateful for your patience and support.

There is some good news to share -- some old colleagues of ours generously
provided us with eight servers to shore up our capacity in the new datacenter
and mitigate some of the losses from the bungled overseas shipments. These were
installed last week, and we are provisioning them now and preparing to bring
them into service. We also did a marvelous job at upgrading our research
installation to production readiness, polishing it into a much more robust
system over the weeks and months following the disastrous DDoS attack.

Also, as a happy side-effect of our surprise move to Amsterdam, SourceHut's
datacenter installation is now entirely powered by renewable energy sources.
We have also finally rolled out IPv6 support for most SourceHut services as part
of our migration!

## In the months to come

It follows from our story that we have been focusing on two things this year:
provisioning and managing our infrastructure and getting as much rest as
possible. Our situation has calmed down, and while we still have a lot of loose
ends to attend to I'm happy to say that we're resuming a sense of normalcy here
and preparing to resume our work on the features you need.

Our plan for the coming months involves the following objectives:

1. Implementing Kubernetes for managing our infrastructure
2. Paying down tech debt in the codebase
3. Fleshing out the remaining "alpha" feature goals

Conrad will continue leading the efforts to k8s-ize our production
infrastructure. Our AMS datacenter installation was provisioned with k8s in
mind, rather than with the parameters we used for our earlier libvirt-based
infrastructure. As a temporary measure, we have bolted our libvirt approach onto
the servers we have installed here, but we are planning on gradually migrating
our deployment to a k8s-based approach which is better suited to the
infrastructure we have provisioned, as well as (hopefully) being more robust and
scalable, meeting the original objectives of our k8s research. We have migrated
our large persistent storage system to Ceph, and are working on moving our API
and web services into k8s one at a time.

Then there is the matter of "tech debt". SourceHut's codebase traces its lineage
directly to our early prototypes, and there are many design choices and bright
ideas which are not so bright in hindsight. We had initially planned to work on
paying down tech debt between the "beta" and "full production" phases of
SourceHut's development lifecycle, but these areas are causing us enough
headache that we have made the decision to spend some time reducing our tech
debt today. In particular, we have the following goals:

- Remove Celery from our architecture
- Remove SQLAlchemy from our codebase (and route web frontends through the
  GraphQL APIs instead)
- Deprecate internal users of the legacy APIs and webhooks (and redesign
  services with a single source of truth for each data store)
- Refactor user management in core.sr.ht, in particular to get rid of the old
  "delegated OAuth" subsystem

Following this we intend to finish up the remaining "alpha" feature goals, which
includes the following:

- Overhaul our billing system and migrate to a new payment processor. This will
  include support for paying in more currencies, an improved invoicing system,
  and support for many more payment methods, such as iDEAL and European bank
  transfers.
- Overhaul and expand the web patch contribution and code review workflows.
- Implement user organizations and shared resources.

We have further plans over the long-term: reducing the use of Python in our
codebase, overhauling builds.sr.ht and expanding its features, improvements to
man.sr.ht, and so on, but for now the goals enumerated above are chief among our
priorities.

## Thanks for sticking with us

Thank you for your continued support and patience while we get our house back
into order. We hope you are continuing to enjoy SourceHut for your needs and the
needs of your projects.

If you have any questions about the events of this year, or our plans for the
future, or anything else -- feel free to reach out. You can reach all of us in
private by [emailing support][support], or the community in public at
[sr.ht-discuss], or you can reach me (Drew) directly via [sir@cmpwn.com]. We're
also around on IRC -- #sr.ht on Libera Chat.

[support]: mailto:~sircmpwn/sr.ht-support@lists.sr.ht
[sr.ht-discuss]: mailto:~sircmpwn/sr.ht-discuss@lists.sr.ht
[sir@cmpwn.com]: mailto:sir@cmpwn.com

Take care!
