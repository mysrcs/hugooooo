---
title: Prioritizing simplicity improves performance and reliability
date: 2020-04-20
author: Drew DeVault
---

We recently put together some automated testing which evaluates the performance
of various software forges without bias[^1]: the [Software Forge Performance
Index](https://forgeperf.org). The goal is to push our community of software
forges to strive for higher performance, to tighten your workflow loop and to
better service communities without access to high-speed internet or newer
computer hardware. I also included results for accessibility testing, hoping
that we can push each other to improve on that front as well.

[^1]: I am confident that these results are accurate and without bias towards SourceHut.  We run only standard benchmarks, maintained by a neutral third-party (Google Lighthouse), and the results are corrected for latency and bandwidth differences. This was verified by having the same test suite run in several locations across America and Europe, showing consistent results even with more generous routing to our competitors. You can run it, too, and verify the results for yourself &mdash; it's pretty easy to set up the software on Linux and it only takes about an hour to produce the full report. I'm also sure that the results are not cherry-picking pages for which SourceHut has an advantage &mdash; it's easy to contribute new pages if you think we missed a spot.

These tests show that SourceHut has room for improvement. For one, some
important features are conspicuously absent, like a git blame view. GitHub beats
out our performance at rendering commits and tickets, and on several pages
GitHub and Bitbucket both have better accessibility scores than the equivalent
sr.ht page. But the overall results are clear: SourceHut is the best performing
code forge, and by a wide margin. The data also shows that our approach delivers
the best reliability: our friends at GitHub and GitLab have struggled with
outages [15 of the last 90 days][github status] and [18 of the last 90
days][gitlab status], respectively. SourceHut has had [two outages in
2020][sr.ht status], both of which were planned and announced a week in advance,
and only one of which affected more than one subsystem.

[github status]: https://www.githubstatus.com
[gitlab status]: https://status.gitlab.com/pages/history/5b36dc6502d06804c08349f7
[sr.ht status]: https://status.sr.ht

The secret is, as you may have guessed, to prioritize simplicity. It's all too
easy for a development team to chase after shiny features &mdash; I know because
it tempts me, too. But sooner or later the chickens come home to roost, and you
have a giant single-page application downloading a megabyte of JavaScript and
pinning a CPU for several seconds before the page is useful (if scrolling at 3
FPS can be considered useful).

Every SourceHut page, on a cold cache, requires two HTTP requests to complete.
On a warm cache, it requires only one. The typical sr.ht page is about 30 KiB.
Both of these figures are ten times better (or, in some cases, *one hundred
times* better) than the competition. Even with a cache, your web browser has to
parse your JavaScript and CSS, warm up the JIT, run all of your initialization
code...  this stuff doesn't come for free, especially on anything but
top-of-the-line hardware &mdash; which I know many of my peers
[are using][old hardware]. There is a lot of developer attention on improving
the performance of the status quo, but to earn the order-of-magnitude
performance improvements SourceHut has, you need to make order-of-magnitude
reductions in complexity.

[old hardware]: https://drewdevault.com/2019/01/23/Why-I-use-old-hardware.html

This culture of simplicity extends to our backend servers, too, which is how we
deliver on reliability. We have no Kubernetes here, no Docker, no
CloudFormation, no monorepos. SourceHut has 10 dedicated servers and about 30
virtual machines, all of which were provisioned by hand. We prefer [Alpine
Linux][alpine] because it's lightweight and simple &mdash; our average
production server has only 20 to 30 packages installed, which means no moving
parts that we don't understand. Our application design helps as well: many pages
are designed to make only one or two round-trips to the database, the queries
for which can be carefully optimized with joins and indices built to-purpose.

[alpine]: https://alpinelinux.org

Our distributed "miniservice" application design also allows any of our services
to fail independently without causing a total outage. And, because we embrace
email for collaboration, our entire service could be offline without affecting
your workflow &mdash; the email system has 50 years of battle-tested fault
tolerance and redelivery mechanisms, you can keep working normally and our
servers automatically get caught up when they're back online. We achieve
reliability on several levels: simple servers which don't break unexpectedly,
monitoring which alerts us to problems before they're serious, and a design
which works even if we do experience an outage.

Microsoft bought GitHub for 7 billion dollars. GitLab is valued at 3 billion
dollars. Together, the two companies have over 2,000 employees. [SourceHut made
4 thousand dollars in Q1][financial report] with two employees and an intern.
How do we deliver on this level of reliability and performance compared to these
giants? The answer is a fundamental difference in our approach and engineering
ethos. I hope that [forgeperf.org](https://forgeperf.org) is a good start for
pushing our industry to mount a serious attack on the eternal problems of high
performance and reliability once more.

[financial report]: /blog/2020-04-13-sourcehut-q1-2020-financial-report

If you want to learn more about our approach to reliability, check out our
public [operations manual](https://man.sr.ht/ops/), join our #sr.ht.ops channel
on irc.freenode.net to watch our operations in real-time, or query the raw
monitoring data yourself from our [public Prometheus
instance](https://metrics.sr.ht/graph).
