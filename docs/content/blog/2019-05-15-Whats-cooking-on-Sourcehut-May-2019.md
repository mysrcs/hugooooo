---
title: What's cooking on Sourcehut? May 2019
date: 2019-05-15
author: Drew DeVault
---

Another month of Sourcehut development passes! I've got some really cool news
to share today. And a big welcome to our 240 new users, who bring our total up
to 8,560. Thanks again to everyone for supporting Sourcehut during the alpha!
I'd like to briefly remind you that Sourcehut depends on your financial support
to thrive - please consider [purchasing a subscription][sub] if you haven't
yet. We just released our [Q1 financial report][Q1 financial report], which
breaks down our income today and explains where your subscription fee ends up:

[sub]: https://meta.sr.ht/billing
[Q1 financial report]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss/%3C20190426160729.GC1351@homura.localdomain%3E

Please let me know if you have any questions. Now to the development news!

## lists.sr.ht

Let's start with lists.sr.ht, because I have some exciting news: the initial
version of web-based code review is now available! [Check out an example
here][example].

[example]: https://lists.sr.ht/~philmd/qemu/patches/5556

This is generated from a normal patch review, with no additional human input.
You just respond to patch emails like you always have, and lists.sr.ht
automatically applies heuristics to incoming emails to generate a web view of
that discussion. In the future, I intend to expand on this with support for
*authoring* reviews on the web, as well as expanding git.sr.ht to support
sending patchsets from the web.

## git.sr.ht, hg.sr.ht

git.sr.ht and hg.sr.ht both now have an API! [The API reference can be found
here][git api reference].

[git api reference]: https://man.sr.ht/git.sr.ht/api.md

Docs for the hg.sr.ht API are pending a design for how to expose hg.sr.ht
internals over the API, but is compatible with the git.sr.ht API for any API
method not dealing with git internals.

They also support webhooks - and there's a pretty neat feature that comes with.
When you configure a post-update webhook (equivalent to git's own post-update
hook), you have the option of making it synchronous - this will submit the HTTP
request during git push, and will print the response body to the console of the
person executing git push. This can be used for custom integrations which
behave like git.sr.ht does when submitting builds.sr.ht jobs, printing the URLs
of the jobs which started as a consequence of your git push.

hg.sr.ht has also grown support for the Mercurial evolve plugin this month -
thanks to Ludovic again for working on that! You can enable this support on
your repo's settings, under the "features" tab. Ludovic and I will be attending
an Mercurial conference in Paris in 2 weeks, where we hope to discuss this and
more features for hg.sr.ht in the future.

## todo.sr.ht

You can now submit tickets and participate in discussions on todo.sr.ht by
sending an email to the tracker you want to work with. For example, to file a
bug for todo.sr.ht, you can email it to ~sircmpwn/todo.sr.ht@todo.sr.ht.

You can also do things like closing tickets via email - [docs here][todo docs].

[todo docs]: https://man.sr.ht/todo.sr.ht/#email-access

I've also started working on an API for todo.sr.ht. It's fairly complete now,
but I still haven't written the docs. Stay tuned!

## builds.sr.ht

I'm happy to announce that OpenBSD is [now supported][openbsd] on builds.sr.ht!

[openbsd]: https://man.sr.ht/builds.sr.ht/compatibility.md#openbsd

Major thanks to Jarkko Oranen for putting in the work to realize this feature.
Timothée Floure has also made some improvements to Fedora support, and
Francesco Gazzetta added NixOS 19.03. Thanks to Andres Erbsen as well, who
fixed a bug with git submodules which have been updated outside of the default
branch. My friend minus has also helped me set up an experimental caching proxy
for Alpine Linux packages, which shaves a few seconds off of every Alpine Linux
job. I'd like to expand this to other distros and things like npm and pypi as
well.

## meta.sr.ht

Our friends at Gitlab were recently in the news, as several of their users had
their repositories overwritten with a ransom notice. The cause of this was
users with weak passwords. I'd like to briefly share how Sourcehut is not
affected by the same problem, and explain improvements I made to the service
anyway.

First, I take a backup of git.sr.ht every 5 minutes. I can restore the state of
your repository as it appeared at any point in time in the event that your
account is compromised. Additionally, login attempts to sr.ht are throttled and
monitored for suspicious activity, and I get an alarm when someone is making a
lot of login requests, which quickly leads to an IP block and an investigation
of any successful logins.

Even so, I've taken this opportunity to improve Sourcehut to prevent this, by
enforcing strong password requirements when you sign up and when you reset your
password. No, I don't accomplish this with silly requirements for multiple
numbers and letters and symbols and such - instead, I use Dropbox's zxcvbn
library to estimate the entropy of your password and require a minimum inherit
complexity. In the case where your password isn't strong enough, you'll be
shown a message like this:

This password is too weak - it could be cracked in less than 5 minutes if our
database were broken into. Try using a few words instead of random letters and
symbols. A [password manager][pass] is strongly recommended.

[pass]: https://passwordstore.org

I haven't enforced these requirements retroactively, so if you're concerned
about your account you should [reset your password here][reset].

[reset]: https://meta.sr.ht/security

You can also review your audit log on this page to check for any suspicious
activity on your account. Shoot me an email if you have any concerns.

## paste.sr.ht

Thanks to Mykyta Holubakha, you now have the option to set the visibility of
your pastes on paste.sr.ht. The "public" and "unlisted" options are presently
indistinguishable, though, because there's no public profile page for listing
someone else's pastes at yet. Hopefully we'll see that soon!
