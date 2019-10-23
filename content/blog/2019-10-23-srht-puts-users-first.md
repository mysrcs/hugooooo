---
title: "Our model is customers first, investors never"
date: 2019-10-23
author: Drew DeVault
---

SourceHut was built by veterans of the Internet, who have watched the turbulent
lifecycle of Internet-based businesses coming into popularity and fading into
obscurity time and again. Most large online businesses these days are for-profit
companies funded with venture capital, and that leads to a certain set of
incentives. It was no surprise to us, accordingly, to receive this email from
GitLab today:

> We have launched important updates to our Terms of Service surrounding our use
> of telemetry services. Starting with GitLab 12.4, existing customers who use
> our proprietary products (that is, GitLab.com and the Enterprise Edition of
> our self-managed offerings) may notice additional Javascript snippets that
> will interact with GitLab and/or third-party SaaS telemetry service (such as
> Pendo).
>
> For GitLab.com users: as we roll out this update you will be prompted to
> accept our new Terms of Service. Until the new Terms are accepted access to
> the web interface and API will be blocked. So, for users who have
> integrations with our API this will cause a brief pause in service via our API
> until the terms have been accepted by signing in to the web interface.
>
> For Self-managed users: GitLab Core will continue to be free software with no
> changes. If you want to install your own instance of GitLab without the
> proprietary software being introduced as a result of this change, GitLab
> Community Edition (CE) remains a great option. It is licensed under the
> [MIT license](https://en.wikipedia.org/wiki/MIT_License) and will contain no
> proprietary software. Many open source software projects use GitLab CE for
> their SCM and CI needs. Again, there will be no changes to GitLab CE.

You can read the whole email [here][email], or in your inbox if you have a
GitLab account. The summary is that GitLab will soon:

[email]: https://paste.sr.ht/~sircmpwn/23e31a29f427066ef261b2ffa7fd9bf46530d904

- Disable web and API access until users consent to be tracked
- Add third-party telemetry to their hosted and enterprise offerings
- With obfuscated, third-party, proprietary JavaScript

This can naturally be frustrating to privacy-concious users of their service,
and to free software enthusiasts alike. This follows closely on the news that
GitLab [updated official policy]["blood money" incident] to state that they will
do business with those who don't share their values, which many see as a
response to GitHub taking fire for accepting [ICE][ice] contracts a few days
prior. These kinds of changes are not implemented with the user in mind - these
decisions are more easily explained by following the money. GitLab is trying to
figure out how it can turn a profit that can support its [$2.75B
valuation][valuation]. The nature of this business model leaves businesses like
GitLab indebted to investors, who've sunk millions into the business and demand
a return. An individual user's investment is comparatively meaningless, and the
incentives this creates easily leads to compromises like the ones we're seeing
in GitLab recently.

["blood money" incident]: https://gitlab.com/gitlab-com/www-gitlab-com/commit/b5a35716deb4f63299a23a40510475f5503c11c4
[ice]: https://en.wikipedia.org/wiki/U.S._Immigration_and_Customs_Enforcement
[valuation]: https://www.forbes.com/sites/alexkonrad/2019/09/17/gitlab-doubles-valuation-to-nearly-3-billion/#79593f2c1794

I[^1] have written about the up-and-down lifecycle of Internet businesses [as
early as 2014][image hosting article], when I noticed a trend among image
hosting websites to make decisions which increasingly favored their business at
the expense of their users. This culminated in the failure of an early business
venture of mine, MediaCrush, when we chose to close the service instead of
making these compromises. In the years since I've found that this problem
generalizes across the entire industry and beyond. When designing the business
model for SourceHut, I vowed that this would never be our fate.

[image hosting article]: https://drewdevault.com/2014/10/10/The-profitability-of-online-services.html

SourceHut has never accepted any outside funding, it's completely bootstrapped.
I started the business while working a full-time job and built it in my spare
time over the course of two years. Next month will mark the third anniversary of
the project and the end of the first year of public alpha. Today, it's a
profitable business and we've just brought on [our first full-time sponsored
free software developer][emersion post]. Some people have complained that paying
for their account on SourceHut is a deal breaker. But, consider that the
incentives that this approach creates hold us accountable *only* to the users.
When you let venture capitalists foot your bill, you also give them power over
you. And in any case, free SourceHut accounts are available by request to anyone
with extenuating circumstances[^2].

[emersion post]: https://sourcehut.org/blog/2019-10-15-whats-cooking-october-2019/

Thanks to this incentive model, SourceHut can easily skip anti-features:

- We don't send your data to third parties[^3]
- No tracking whatsoever
- Everything works without JavaScript anyway
- No opt-out marketing emails
- No advertisements in the UI
- The hosted code is the same as the open source code
- No one can strong-arm us into taking on unethical business partners

Since we get all of our income directly from the users, we don't have to worry
about finding other ways to monetize you. To me that seems like a pretty good
business model, even if it's never going to be a "unicorn".

[^1]: Hi, I'm Drew DeVault, founder of SourceHut and your friendly neighborhood sysadmin.
[^2]: Technically, you don't have to pay at all during the alpha.
[^3]: The exception is your billing information, but we don't have much of a choice about that.
