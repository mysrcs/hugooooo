---
title: SourceHut is committed to making IRC better
author: Drew DeVault
date: 2022-07-06
---

Internet Relay Chat (IRC) is a wonderful protocol with a 34-year history of
helping free software, there at every step alongside the rise of the internet.
Many real-time chat empires have risen and fallen during its tenure, some of
them leaving behind lessons IRC might learn from. But even in its original form,
IRC is a simple and beautiful protocol on top of which many independent,
federated networks have been built, from simple line-oriented plain-text
messages (mostly) adhering to open standards, and implemented with free
software.

IRC has held a special place in my heart and in the hearts of my collaborators
at SourceHut, both within the company and in the broader community. We rely on
it every day, professionally and socially, and we want to help it be the best it
can be. We want this because we love IRC for what it is: simple. There are
many other solutions we could invest in, some of which are doing great things
for free software (such as Matrix), and some of which are not (such as Discord).
But, IRC is by far the simplest and most open, and these essential traits are
both compatible with our culture and something we wish to preserve.

What can we do to make IRC better while honoring what makes it so good?

Our work focuses on making IRC easier to use and more accessible to a broader
audience of free software contributors. While I might personally be satisfied
with Weechat in a terminal on my other monitor, many new programmers have
different wants. And while I was happy running my IRC bouncer for many years, I
can't exactly suggest that it is a good solution for IRC's problems.[^1]

[^1]: I might acknowledge, however, that many traits of the ephemeral
  discussions that stem from IRC's constraints are worth keeping even in the
  absence of these constraints. The lack of any expectation to scroll up and
  read the discussions you missed, and the cultural pressure to move important
  information out of chat and into more permanent mediums, like mailing lists or
  tickets, are two positive things that IRC's ephemeral nature encourages. As we
  move into a better world for IRC, let's be mindful of these things.

The most obvious contribution to IRC from SourceHut is [chat.sr.ht], our hosted
IRC bouncer which provides a "just works" IRC bouncer for SourceHut users. A
pleasant webchat ([gamja], GNU AGPL 3.0) offers a jump-in-and-go experience, and
our bouncer backend ([soju], also AGPL) provides a scrollback, automatic log
keeping, multi-device synchronization, and many other useful features that close
most of the usability gap for IRC. The maintainer of these projects, Simon Ser,
is also developing a new Android app for IRC ([goguma], (also AGPL)).
Importantly, chat.sr.ht is not a new IRC network: we just facilitate access to
independently operated and governed networks like Libera Chat and OFTC.

[chat.sr.ht]: https://man.sr.ht/chat.sr.ht/
[gamja]: https://sr.ht/~emersion/gamja/
[soju]: https://sr.ht/~emersion/soju/
[goguma]: https://sr.ht/~emersion/goguma/

chat.sr.ht is the face of SourceHut's IRC work, but there's also a lot of work
you don't see. Simon is working with the IRCv3 community to improve IRC for
everyone. Simon and others working on our stack have forwarded a half-dozen [new
IRC specifications] for review and standardization by the community, including
support for push notifications, bouncer auto-configuration, and multi-device
synchronization improvements. We also participated in the process of getting
many other extensions standardized, such as chat history, account registration,
and web socket support, and have offered [many improvements] to the
documentation at [ircdocs.horse].

[new IRC specifications]: https://github.com/ircv3/ircv3-specifications/pulls?q=is%3Apr+author%3Aemersion
[many improvements]: https://github.com/ircdocs/modern-irc/pulls?q=is%3Apr+author%3Aemersion
[ircdocs.horse]: https://ircdocs.horse

Our approach is to make conservative, obvious improvements to IRC that close the
usability gap without sacrificing the any of the things which we love about IRC.
We believe in honoring and respecting our peers in the community, focusing on
making the ecosystem stronger instead of seeking to make our foothold in it
stronger. The fall of Freenode reminds us all of the importance of a healthy
community of equal peers working to improve standards in the interests of us
all, rather than in the interests of a small few. We're proud to do our part.
\#sr.ht was registered on Libera Chat only minutes after it opened and we were
one of the first projects to make the move.

I've been using IRC for most of my life. It has played a crucial role in my
social and professional life, playing its part in the success of many of my
projects and in establishing many long-term friendships and professional
relationships. Come add your voice with us in #sr.ht (on-topic) or in
\#sr.ht.watercooler (off-topic), both on Libera Chat. See you there :)
