---
title: "Announcing chat.sr.ht: a persistent IRC session for sourcehut users"
author: Simon Ser
date: 2021-11-29
---

About one month ago, we began a private beta for [chat.sr.ht], the next
flagship sourcehut product. Starting today, this service is now available to all
paid sourcehut users.

chat.sr.ht is a hosted IRC bouncer service, which maintains a persistent IRC
connection for you and extends IRC with useful features like offline messaging,
log persistence, and various other improvements. In addition to accepting
connections from any third-party IRC client, chat.sr.ht offers a ready-to-use
web client.

![A screenshot of chat.sr.ht's web chat feature, showing the #sr.ht chatroom](https://l.sr.ht/iqm-.png)

Like the rest of the SourceHut services, chat.sr.ht is powered by free software.
The bouncer is based on [soju] and the web chat is based on [gamja]. There are
many other soju deployments in the wild &mdash; chat.sr.ht is just the newest.
gamja is a standalone web client: it doesn't depend on specific server software
and several independent networks provide it to their users today.

The IRC networks you use with chat.sr.ht are independent entities, governed by
their own stewards and unaffiliated with SourceHut. Thanks to the standard, open
protocols that IRC is built on, chat.sr.ht users are able to participate in the
established community of IRC networks like [Libera Chat].

Our main goal is to make IRC easier to use for free software projects. For
example, the bouncer exposes a special protocol extension to automatically
connect to all of your IRC networks, which helps skip the tedious process of
configuring every network you use. The web client can also be configured to open
irc:// links around the web, so that getting involved in a project's discussion
can be as easy as clicking a link in the project's README.

Our work is not limited to chat.sr.ht itself &mdash; we want to improve the IRC
ecosystem as a whole. We are involved in upstream [IRCv3] development: we
participate the standardization process by providing implementations and
feedback for work-in-progress specifications (for instance [chathistory]), and
we're also pushing new specifications (for instance [extended-monitor]).
Additionally, we've been contributing to [modern-irc], the de-facto IRC
reference document. We want chat.sr.ht to be a platform for improving the IRC
community.

Moving forward, we plan to continue collaborating with the IRC community and
improving the IRC standards. Our first priority is to develop the
[account-registration] implementation in upstream ircds, which will bring a
first-class network registration protocol to IRC. We're also hoping to add
anonymous access to chat.sr.ht, so non-paying users or users without a sourcehut
account can participate in your project's chat room.

In the meantime, please give it a shot! Head over to [chat.sr.ht] to take it a
spin.

[chat.sr.ht]: https://chat.sr.ht
[soju]: https://soju.im
[gamja]: https://sr.ht/~emersion/gamja/
[IRCv3]: https://ircv3.net/
[chathistory]: https://ircv3.net/specs/extensions/chathistory
[extended-monitor]: https://ircv3.net/specs/extensions/extended-monitor
[modern-irc]: https://modern.ircdocs.horse/
[account-registration]: https://ircv3.net/specs/extensions/account-registration
[Libera Chat]: https://libera.chat
