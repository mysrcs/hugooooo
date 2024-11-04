---
title: What's cooking on SourceHut? October 2021
author: Drew DeVault
date: 2021-10-15
---

Welcome back for another month's status update! As of today, our community
numbers at 25,074 &mdash; the first time we've had over 25,000 users &mdash;
after another 522 users joined our ranks. Please show them the courtesey and
patience you've always done as they learn the ropes, and welcome these new users
to our community with open arms.

This month’s Mumble meeting will take place on Monday, October 18th, at
10:00 UTC. We’ll be on voice.mnus.de, port 64738, in the sourcehut room. See you
there!

## chat.sr.ht

The first item on today's agenda is a tiny preview of a new flagship SourceHut
product: chat.sr.ht. More details will come in a dedicated announcement in a
couple of weeks, but in short, chat.sr.ht is a hosted IRC bouncer based on
[soju][0] which will offer all paying SourceHut users a persistent IRC session,
and a webchat based on [gamja][1], which will also provide a non-persistent
session for non-paying and anonymous users.

[0]: https://sr.ht/~emersion/soju/
[1]: https://sr.ht/~emersion/gamja/

![A screenshot of chat.sr.ht's web chat feature, showing the #sr.ht chatroom](https://l.sr.ht/iqm-.png)

Short answers:

- We aren't running an IRC network ourselves. We're going to encourage users to
  use [Libera Chat](https://libera.chat) for their projects, though you can
  configure it to use any network (or networks) you want.
- You can connect to the bouncer directly using your own IRC client, or use the
  webchat at chat.sr.ht.
- irc:// links in your README and throughout SourceHut will be rigged up to
  auto-join your channel in our webchat when clicked.

The service is up and running, but currently set up as a private beta so that we
can get everything tested and validated on a small scale. If you want to try the
private beta, reach out to emersion on libera.chat.

## GraphQL

This month, I implemented both read & write support for paste.sr.ht's new
GraphQL API, which you can try out here:

- [paste.sr.ht GraphQL playground](https://paste.sr.ht/graphql)
- [paste.sr.ht GraphQL schema](https://git.sr.ht/~sircmpwn/paste.sr.ht/tree/master/item/api/graph/schema.graphqls)

No native webhooks, but that'll come later. I have also started working on write
support for todo.sr.ht, which is actually quite complex and challenging &mdash;
todo.sr.ht is one of the most complex services on SourceHut. I'm hoping to
finish that over the course of the next month, and hopefully I can tick off
another check-mark on the list as well.

<dl>
  <dt>meta.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-success">✓</strong> webhooks</dd>
  <dt>git.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>hg.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>todo.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>builds.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>lists.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>hub.sr.ht</dt>
  <dd><strong class="text-danger">✗</strong> read <strong class="text-danger">✗</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>paste.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
  <dt>pages.sr.ht</dt>
  <dd><strong class="text-success">✓</strong> read <strong class="text-success">✓</strong> write <strong class="text-danger">✗</strong> webhooks</dd>
</dl>

## todo.sr.ht

In addition to the ongoing GraphQL work, todo.sr.ht has received some major
updates with how it handles permissions and access lists. If you were affected
by the change, you should have received an email explaining how to address it
for your trackers. In short, trackers now have a "visibility" parameter which
behaves the same as for git repos (public, private, or unlisted), and the
default permissions have been consolodated into one field which applies to any
users who do not have a more specific ACL entry. A similar change will soon come
for lists.sr.ht.

## git.sr.ht

Eli Schwartz has implemented a novel system based on git notes for attaching
cryptographic signatures to git tags. He'll be writing a guest post for this
blog sometime soon which goes over this feature in detail.

## builds.sr.ht

Image updates:

- freebsd/11.x has been removed following its upstream deprecation.
- GNU Guix is now available.
