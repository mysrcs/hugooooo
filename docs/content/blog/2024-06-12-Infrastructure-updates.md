---
title: Update on our infrastructure plans
author: Conrad Hoffmann
date: 2024-06-12
---

Now that Drew has provided [an update][0] on the general state of SourceHut, I
would like to follow up with one focusing on our infrastructure. Much has
happened under the hood, a lot has _not_ happened, and plans come and go as
reality changes its mind every now and then. So, let's take a quick look at
where we are right now, what our plans are, and how we hope to get there.

[0]: /blog/2024-06-04-status-and-plans/

First and foremost, let me state the TL;DR: our grand plan has not changed, and
we are still planning on moving most services to Kubernetes. But to talk about
why that's taking so long, how we are preparing for this, and what this means
for folks running their own instances, I need to set the stage a little bit.

## Quick recap

As Drew already mentioned, we hastily migrated all our services to our research
facilities in Amsterdam during the [recent DDoS attack][1]. This was a
desperate measure, and while it actually had _some_ benefits, it came mostly
with drawbacks.

[1]: /blog/2024-01-19-outage-post-mortem/

Our research facilities at the time consisted of a "grand" total of three
servers. They provided two things: a Ceph cluster and a Kubernetes cluster. The
Kubernetes setup was far from ready for production. But in a stroke of luck it
had been just recently that I had upgraded our Ceph cluster from the few
spinning disks we used for toying around to a significant number of SSDs that
were intended for production use. And so, we made the decision to migrate our
storage to the new Ceph cluster, but keep running the services in VMs like we
did before.

The research hardware is quite powerful, but it was still clear we would need
more. It is also close to impossible to provide any level of redundancy with
just three servers. We decided to rent two physical servers as build runners,
an intensive and at times unpredictable workload. We also decided to keep our
DNS in Digital Ocean, where we had moved it to get it out of the DDoS blast
radius. These setups remain in place to this day.

## The good, the bad, and the ugly

The migration was done under pretty intense pressure, as all our services were
unavailable. Once the dust had settled after the DDoS, it was time to inspect
the result more closely.

The obviously good outcome: it worked! We had managed to bring all of SourceHut
back up in Amsterdam and were able to restore service. That was quite a feat.
Another outcome I was initially very excited about was data locality. All of a
sudden, there was a chance to bring up a service in Kubernetes and let it
handle some production traffic without worrying about transatlantic latency
for internal requests. We'll see how that turned out in a minute, though.

The bad part was - at least initially - the Ceph cluster. While we had the
storage capacity we needed, there had not been any performance testing yet. So
this unfortunately happened in production, with the predictable, occasional
hiccup. But by now, things have settled down and it seems the cluster can
handle the load just fine. The object storage still feels a little less
performant than before, but bearable. We'll continue to tweak things, and hope
things will get even better once we start using the advanced features of Ceph
for horizontally scaling our services.

Since most time was spent tending to the Ceph cluster, it took a while until
the ugly part dawned on me. In our old setup, every service was running in a
VM, and the hosts that ran the VMs did nothing but that. When we frantically
moved all that over as-was, we ended up in a silly situation. All the VMs were
using _macvtap_ interfaces, which are very easy and convenient to set up, but
have one very annoying quirk: they can talk to anything on the network, [except
the very host they run on][2].

[2]: https://wiki.libvirt.org/TroubleshootMacvtapHostFail.html

As you can imagine, with just three servers running a Ceph cluster and a
Kubernetes cluster, using any of those _only_ for running VMs was not an
option. And so, a service brought up in Kubernetes was unable to talk to VMs
that happened to run on the same host that it was scheduled on.

I spent many days thinking about workarounds, but they would have all been
extremely foolish. We had very little headroom to shuffle things around. In the
end, I decided that the only sane option to run anything in Kubernetes was to
get rid of the macvtap interfaces, switching to a proper bridge setup. But this
would have required bringing down the entire host network, which would have had
a huge impact on many services. I made plans, but hesitated with the actual
execution. The situation was extremely frustrating.

## The plot twist

It was just then, that we received an offer that would change everything. An
anonymous saint (<3) gifted us eight servers. They are of the kind that is
considered old in some places, but they are perfect for us. At this point, I
decided to just postpone running anything in Kubernetes. These servers would
allow us to move things around carefully and straighten out the kinks without
interrupting service.

It took a few weeks of preparation and planning, but the servers are now
installed and operational. So, finally, we are able to move forward. And this
is how we, at last, get to the interesting part.

## What's next?

The first task will be to bring our DNS back in-house. This is needed to bring
back some features we need for Kubernetes, like DNS dynamic updates for
completing ACME challenges.

Then, we will physically separate the Kubernetes cluster and the VM hosts, so
everything can properly talk to each other. This will finally unlock
experimenting with production services in Kubernetes.

On the topic of Kubernetes, I know a lot of people are excited about that, but
I feel a word of caution is in order. While it will facilitate some aspects of
running an instance, I am not sure it will be an "off-the-shelf" solution
anytime soon. For example, some of our services will rely on CephFS for
horizontal scaling. This can probably be reproduced even at small scale with
Rook, but we currently do not use it, and I am not sure if we ever will.

Another issue is that SourceHut in its entirety includes several services that
are not a great match for Kubernetes in the first place. Kubernetes is first
and foremost designed for HTTP requests. But we have multiple services that
require for example SSH, which is notoriously hard to load-balance, and does
not have any equivalent of SNI. Our candidate setup for that involves dedicated
IPs (external load balancers), which are usually a platform-specific feature.
What works for us, may not work for you.

That said, I think solutions will pop up, and it makes sense to cross that
bridge when we get there. One reason for the lack of tangible Kubernetes
services so far was that we believe in solving the hard problems first. We have
had a working prototype of build workers running, and proofs of concept for SSH
routing. But knowing that it is all possible, priorities have shifted slightly.
We will keep the rented build workers for a little longer, until we are
confident in our infrastructure setup. We'd also like to do some refactoring of
the builds.sr.ht codebase before moving those to Kubernetes. So, once the above
steps are completed, the time may have truly come to start testing some of the
"simpler" services in Kubernetes. That is, of course, unless reality changes
its mind again...

## Thank you for your patience

I hope this update answers some of the questions I occasionally see on IRC.
It's always hard to give brief answers to seemingly simple questions when the
reality is such a complex mess. That said, I'll do my best to monitor both
#sr.ht and the [sr.ht-discuss list][sr.ht-discuss]. But even if I don't
respond, I am quite hopeful you will see answers soon.

[sr.ht-discuss]: mailto:~sircmpwn/sr.ht-discuss@lists.sr.ht

Cheers!
