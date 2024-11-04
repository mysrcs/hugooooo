---
title: What do we do when you lose your 2FA codes?
date: 2020-03-04
author: Drew DeVault
---

By far the most common sort of support request I receive from SourceHut users on
a day-to-day basis is from users who have lost access to their TOTP
([Time-based One-time Password algorithm][totp]) codes. Losing your phone,
getting a new one and forgetting to migrate the keys, or wiping it to install a
new OS are common reasons to accidentally lose access to your two-factor
authentication.

[totp]: https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm

Naturally, we cannot just disable 2FA on your account, no questions asked. The
purpose of 2FA is to increase the level of scrutiny that's placed on attempts to
make authorized requests for your account. Therefore, we seek some alternative
method of authenticating that you are who you say you are.

The easiest way is PGP: about 10% of sr.ht users have added a PGP key to their
account. If your support email is signed with the PGP key we have on file for
you, then we can assume it's you with no further questioning. If not, we can ask
you to send a follow-up email which is signed. Even more users have an SSH key
added to their account, about 30%. For them, I asked my friend minus to write a
small tool, [sshign](https://git.sr.ht/~minus/sshign), which can
cryptographically sign messages with your SSH key.

<div class="alert alert-info">
  You can add PGP and SSH keys to your account on the
  <a
    href="https://meta.sr.ht/keys"
    rel="nofollow noopener"
    target="_blank"
  >key management page</a>.
</div>

Those strategies are my preference, but there are still a fair number of users
who need 2FA turned off but haven't added any keys to their account. I have to
get more creative with these. One way I'll often choose is looking at the
website added to their profile page. If they can add a file to the website or
update a DNS record in response to a challenge, then that'll often be
sufficient.

One thing we used to do, but no longer, is to ask you for the last four digits
of the credit card number on file for your account. I have known other services
to use a similar approach. Eventually I decided to stop using this, because it's
fairly easy to get the last 4 of your CC# from anywhere you've used it. This
information has been leaked from many services after many security incidents. I
will, however, use this much information to cancel your subscription payment
upon request.

There are a small number of users who ask to have 2FA reset, but have
little-to-no secondary information to their account. For these few, there is no
recourse &mdash; I have to tell them that I cannot help them regain access to
their account. I doubt any of these folks have actually not been the authentic
owner of their respective accounts, but the security of 2FA rests on this extra
level of additional scrutiny.
