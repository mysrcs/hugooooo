---
title: Sourcehut is the fastest. So what?
author: Drew DeVault
date: 2021-05-08
---

I'm writing this from 10,000 meters above the Pacific Ocean[^1], typing it into
a $200 ARM laptop, and I have had a pretty productive workday so far. In fact,
with 600-1200ms latency, frequent network drop-outs, and bandwidth which would
make a circa-2008 2G network hang its head in shame, I have had endured hardly
any discernible difference from my workflow at home.

[^1]: Fully vaccinated, and wearing a mask, and with a negative COVID-19 test result taken two days ago, for the record.

By objective measures, [sourcehut is the fastest and most lightweight software
forge][0][^2] by a wide margin. I am able to load a git repository on git.sr.ht
in about 3 seconds (DOM ready in 1.8s), while GitHub took 38 seconds (DOM ready
in 20s)[^3]. Working with any of the sourcehut services &mdash; browsing git
repos, reading and filing tickets, reviewing build logs &mdash; is hardly any
different in this situation than it is at my workstation at home. Browsing any
other forge, on the other hand, is miserable. In the same amount of time I can
load 3 pages on GitHub (one full minute!), I can load more than 30 on sourcehut.

[0]: https://forgeperf.org
[^2]: These tests are conducted by sourcehut, but are based on independent measurement factors, have held up under independent scrutiny, and are open to improvements from the rest of the community.
[^3]: I can get on with my work after the DOM loads, but it's still asking my browser to suck down images, leeching what precious little bandwidth I have, taking it away from anything else I'm trying to do.

That's just the network conditions, too. Recall that I mentioned I'm on a cheap
ARM laptop, basically a mid-tier chromebook. SourceHut has no mandatory
JavaScript, and the pages are very light &mdash; almost all of them load in two
requests or less, and usually transfer less than 10 KiB, even on a cold cache.
It's easy to render and use sr.ht on any class of hardware. It works half
decently in Lynx!

All of that being said, I have only actually used the web services for three or
four quick tasks today. SourceHut embraces open standards like email for
collaboration. There is no suffering through the pull request review web UI on a
craptop with a terrible connection. Patches arrive via email, and I have my
mailbox stored locally in a standardized format, which I can read with simple
text-based tools, then queue up my review as an emailed reply to be sent
asynchronously whenever the network is up for it.

For my part, this is a story that comes from privilege. I am in a self-imposed
network drought on an expensive airplane fare, and sourcehut's performance is
simply temporarily convenient. But there are a lot of people for whom this
performance is an essential necessity in their daily life. This $200 craptop
represents a substantial investment for a lot of people. The luxurious network
conditions the developed world enjoys are just that: a developed luxury. I don't
find these users less important simply because their constraints are harder to
work in. We pride ourselves on thriving under those constraints.

That ethos pays returns in many ways, like when I'm sitting here on an airplane
conducting my work without interruption, or when our simpler HTML is easier to
use for the new developer on your team who has to rely on a screen reader.
Though at first it may seem that our performance metrics are a flashy footnote,
they represent something of real importance to us and to our users, and I hope
that the rest of the web catches up with us soon.
