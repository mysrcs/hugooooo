---
title: What's cooking on Sourcehut? June 2019
date: 2019-06-15
author: Drew DeVault
---

Thanks again for following SourceHut during the alpha! I hope you're all
enjoying the service. Remember to send me your feedback, good or bad!
Another month passes and another 430 users join our ranks, bringing our
total to 8,990 - just shy of 9,000 strong. To our new members: welcome!
And to the 874 users who've chosen to pay for their account despite the
alpha level of quality the service presents today, a special thanks:
your support is the reason I'm able to work so hard on the service and
free software in general.

## aerc

Direct progress on SourceHut has been somewhat slower than usual this
month, because I've been focusing on pushing a side project to its
initial pre-release: aerc. I normally don't mention my other projects in
these articles (though if you're interested, I suggest checking out my
blog), but given the deep focus on email in SourceHut's design I find
that aerc may be relevant to your interests. It's an email client for
your terminal and it offers many design improvements over existing mail
solutions. Please check it out if you have the chance!

[aerc-mail.org](https://aerc-mail.org)

Back to your regularly scheduled updates.

## Mercurial conference update

Ludovic and I attended the Mercurial conference in Paris, and met many
of the Mercurial developers. I'd like to extend my gratitude to them for
putting on such a great event, and to Ludovic for coming along to make
me look like less of a moron! I learned a lot about hg thanks to the
patience of the Mercurial devs. We spent a lot of time talking about
their plans and discussing design directions for hg.sr.ht. Our offering
stands to become the premier hosting destination for the Mercurial
open-source community, and I was glad we had a chance to set our course
carefully towards that end.

## todo.sr.ht

A big update comes today for the bug tracking service: it now has an API
and webhooks! [The documentation is available here][todo api docs].

[todo api docs]: https://man.sr.ht/todo.sr.ht/api.md

todo.sr.ht is the last major SourceHut service to receive these features,
putting a bow on this workstream and unblocking a lot of others. The first of
these now-unblocked workstreams is an overhaul to dispatch.sr.ht, which will
bring us lots of long-awaited features. Check out [the design doc][design doc]
I posted to sr.ht-dev the other day.

[design doc]: https://lists.sr.ht/~sircmpwn/sr.ht-dev/%3CBUTMP0M9HDGV.16DDFWUTXGJTE%40homura%3E

Feedback welcome!

## git.sr.ht

Just minor news on this front: with git.sr.ht now growing to over 6,000
repositories, it has outgrown its old VM. To accommodate for this, I've
provisioned a new host in our datacenter and given half of it to
git.sr.ht, giving it a lot of room for future growth. Thanks for
enduring a couple hours of partial downtime this week as I migrated to
the new server.

Also, thanks to ~ignaloidas for putting git.sr.ht through a stress test
with a repo designed to break web interfaces - found and fixed a few
bugs thanks to that!
