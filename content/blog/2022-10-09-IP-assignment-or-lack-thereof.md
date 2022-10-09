---
title: SourceHut does not ask for IP assignment from employees or contributors
author: Drew DeVault
date: 2022-10-09
---

A "standard" clause you'll see in most employment contracts is an IP assignment
clause. This clause assigns the intellectual property produced by an employee in
the course of their work to the business that they work for. This generally
extends both to copyrights and patents, and the more egregious of these clauses
include work done outside of company time and without the use of the company's
assets and equipment. Often this is accompanied with a burdensome process of
identifying every copyright owned by the employee on a little sheet that
accompanies the employment contract.

Free software projects overseen by businesses also often want to control the
copyright of external contributors. This is usually done by imposing a
Contributor License Agreement, or CLA, on the contributor before accepting their
change. These either assign the contributor's copyright outright, or does so in
all but name by signing over all of the rights associated with their copyright.

In the absence of such agreements, copyright for each contribution to a free
software project remains held by the contributors themselves. Thus, ownership of
that project's IP is collectively held by its contributors. Consequently, the
"owners"[^1] of the project cannot change the license to make it more
restrictive, or more permissive, or non-free outright, without the written
consent of each of the copyright holders.[^2] The project stewards are offered
the same FOSS license terms for each contribution that they offer to everyone
else for their own.

[^1]: I've taken to generally referring to people and entities in this role as
  "stewards", because, well, they literally do not own it.
[^2]: They can also rewrite the contributions from those who do not agree to
  change the license.

SourceHut does not ask our staff to sign an IP assignment, and we do not ask our
external contributors to sign a CLA. Consequently, SourceHut, the business
entity, does not own its intellectual property. It is collectively owned by the
individuals who have worked on it, both internal and external. When I say
SourceHut belongs to its users, I'm not using flowery doublespeak &mdash; I mean
it literally.

To re-enforce this, we rely on copyleft software licenses. Copyleft, to offer a
simplified explanation, essentially requires that any changes to the project
must also be released under the same software license. If we held the copyright
for our software, we could disregard these terms, but because contributors
license *their* copyright to *us* under the same copyleft licenses, we are
obligated to use their contribution under the same terms and release *our*
changes as free software as well. If we used a permissive license like MIT or
BSD, we could fork the project and keep our changes closed-source, but using
copyleft closes this path to us and serves as a strong promise to the community
that SourceHut will always be free software.

We do things a bit differently from the industry "standards". We honor and
respect each contributor's work, both internal and external, and their copyright
forms an important piece of the safeguards we use to establish trust with our
community. We honor and respect our staff members as well, and do not impose
upon them IP assignments, non-disclosure agreements, or non-competes. This
approach is a more just way of doing business, and is our strategy for building
a long-lived and sustainable free software platform, hand-in-hand with the
community, on equal terms as peers working towards a shared vision.
