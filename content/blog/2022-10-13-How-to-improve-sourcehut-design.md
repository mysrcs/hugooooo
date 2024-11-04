---
title: How to help improve SourceHut's design
author: Drew DeVault
date: 2022-10-13
---

[SourceHut][0] is a software development forge and it is designed with the
software engineer's needs first and foremost. The design prioritizes things like
page speed, minimal distractions, and information-forward layouts. It does not
prioritize aesthetics, and perhaps it shows.

[0]: https://sourcehut.org

Like many free software projects, SourceHut encourages contributions from its
community in the form of patches. Not all of these have to be changes to the
software &mdash; we frequently receive patches improving the documentation, for
example. There are many skillsets which are valuable to offer to a free software
projects. One of these skills is design competence, and over the years a few
people with this skillset have attempted to improve SourceHut's design, but many
of their changes were rejected. Why? How can a designer succeed in improving
SourceHut?

SourceHut's design space imposes constraints on the visual design which present
more of a challenge to the aspiring designer than most of the projects they may
have worked on. We are open to (and excited about!) improvements to the
SourceHut design, but such changes must be implemented within the constraints of
our ethos, and these constraints are often unusual and unfamiliar to the typical
web designer. SourceHut is an engineering tool first and foremost, and all of
our design decisions are made with an eye on solving problems for software
engineers. This is the prime directive, and all other concerns, such as
subjective aesthetic value, are secondary to the prime directive.

It is under this lens that any proposed design changes are evaluated, and for
this reason many are rejected. A design change for SourceHut must be carefully
thought out and must balance its aesthetic value with its effect on the utility,
usability, and accessibility of the services. To offer a small example: several
people have proposed making the [source view][1] centered to match the rest of
the UI. However, this would introduce a horizontal scroll for files with long
lines, making it more difficult to read them. The prime directive of this page
is reading code, therefore this change was rejected.

[1]: https://git.sr.ht/~sircmpwn/helios/tree/master/item/objects/memory.ha

Of course, looking nice does, in its own way, contribute to many of the same
underlying values like usability and accessibility. A page which is pleasant to
look at is more usable. The user's enjoyment of the service is derived in no
small part from its aesthetic value, and that's important to us as well.

The challenge is thus to come up with designs which are aesthetically pleasing,
but also meet our goals for broad accessibility and utilitarianism, while
simultaneously communicating our values and priorities. Our values differ
substantially from other platforms in this space. GitHub, GitLab, Gitea, they
are all fundamentally speaking the same design language and expressing the same
values. Because our values differ, our design should differ, and distinguish us
from the pack in a manner which makes our principles visually evident.

A designer who hopes to rise to this challenge should understand and internalize
these values, which is particularly difficult given the extent to which we
reject the values of the mainstream "modern web". Should you want to meet this
challenge, the community would be thrilled to work with you. I would strongly
recommend joining our [IRC channels][2] and seeking feedback early and
incrementally &mdash; most design proposals for SourceHut fail due to seeking
feedback too late or proposing a huge redesign all at once. So long as we work
together, we will find success. Good luck!

[2]: https://man.sr.ht/support.md#real-time-chat
