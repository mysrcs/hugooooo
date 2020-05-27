---
title: Achieving accessibility through simplicity
date: 2020-05-27
author: Drew DeVault
---

I have received many emails complimenting SourceHut's simple design and
lightweight pages[^1], but I have received a surprising amount of positive
feedback from a particular group of users: the blind community.

[^1]: And, to be fair, a handful of emails to the contrary, too.

For many software teams, especially web developers, accessibility is an
extremely burdensome task. Many companies have written checks with an
uncomfortable number of zeroes on them to get the job done. Sprinkling [ARIA
tags](https://en.wikipedia.org/wiki/WAI-ARIA) all over your DOM to annotate
elements with their purpose, and updating these as your DOM changes over time,
is no small task, and makes your code more difficult to maintain. It's not
especially surprising that many blind users are constantly frustrated when
trying to use the web.

How did SourceHut make such an accessible website, even in the face of these
trials? In truth, even though accessibility is important to me, I haven't
worked especially hard to make SourceHut accessible &mdash; I have devoted no
more than three or four hours, in total, explicitly towards accessibility.
Instead, SourceHut is accessible because the core principles of simplicity upon
which it is built naturally lead to an accessible design. We're here today to
share our thoughts so that you might apply the same principles to your own
website.

First, consider the audience you're designing for. Your users have a diverse set
of abilities, and a varied approach to accessibility is necessarily required to
accommodate for them. Different users will have a different experience with your
website. There are different levels of visual impairment &mdash; near- and
far-sighted users, colorblind users, and many degrees of vision impairment ahead
of totally blind. Talking about accessibility might bring forth thoughts of the
latter group, but a lot of users with partial sight would also benefit if you
put care into your visual design. There's also other considerations than vision
&mdash; for example, avoid high precision mouse actions for users with limited
mobility, and add subtitles to videos for the deaf and hard of hearing.

For general advice on web accessibility, I would start with the following:
"trust the web browser". Leave the page at its default font size and avoid
using custom fonts, preferring to use vague selections like "sans-serif" and
"monospace". Don't mess about with the scroll wheel, don't override default
behaviors on the right click and text selection. Don't use JavaScript to create
custom input elements like text boxes, combo boxes, or scrollbars. The web
browser will do all of these things for you &mdash; trust it to do a good job.

Remember that the browser is the *user* agent, not the *developer* agent.  By
trusting its defaults, you leave room for users to customize them, choosing a
larger text size, a different font, and so on.  The user is already comfortable
with the way their browser works, and you will fail to capture the subtle
nuances of their user agent with your pretty imitations. When accurately using
the mouse is a struggle, a user who has gotten used to using the arrow keys in a
`<select>` box is faced with an unreasonable challenge when they encounter a
custom drop-down that hasn't implemented this behavior quite right.

Another case to be careful of is the use of color, contrast, and images. Always
make sure that text the user is expected to read is sufficiently distinguishable
from its background.[^2] Also avoid putting text over a variable background,
such as a gradient or tiled background. Be conservative with your use of color
&mdash; limit bright, visually attractive colors to one or two actionable items
on the page, or use them to draw special attention to timely notices, or to warn
the user of potentially dangerous actions like deleting data.

[^2]: The Lighthouse tests built into Chrome-derived web browsers can be used to help identify UI elements with too-low contrast.

Try not to use a purely visual representation of information, such as an icon:
these should always be paired with text. Such explanatory text shouldn't require,
for example, hovering to see it &mdash; a task which requires high mobility to
hit a small target with the mouse, and holding it steady for long enough to make
a tooltip appear. Also avoid *moving* information around &mdash; animations and
visually complex state transitions. When adding images, always include an "alt"
tag with a plain-English description of the image.

Do this exercise with me: cross your eyes, then close one eye. Through this
blurry view, can you still identify the major elements and action items on your
page?  Does anything demand too much or too little attention?

The "alt" tag reference a moment ago is the first time we've touched upon many
of the conventionally repeated wisdoms about "accessibility" on the web, often
included because its value is intuitive and easy to implement. It's no mistake
that we've covered little of such conventional wisdom so far: the typical user
who benefits from an accessible website is not completely blind, using a screen
reader and taking advantage of your ARIA tags. The hard truth is that you just
have to make your website simpler and easier to use &mdash; for everyone.

But, it wouldn't do to forget the users with screen readers in any case. Some
general advice for such users would be to make good use of semantic HTML, such
as `<main>`, `<article>`, `<section>`, `<nav>`, and so on; along with other
elements like `<p>` to mark paragraphs, `<ul>` and `<ol>` as appropriate to mark
lists of things, `<quote>` for, well, quotes, and so on. Screen readers can
interpret these to understand the layout of your page better and provide
contextual clues to the user.

Prefer to organize your site's information *logically*, rather than *spatially*.
A logical hierarchy of information is more intuitive if you have less visual
awareness. Make sure your page is organized so that if read linearly, from start
to finish, without CSS, it still makes sense. Avoid littering marketing garbage,
superlatives, and ads for other parts of the site (or even ads outright)
throughout your page, as skipping these is more difficult for a screen reader
than for the typical visitor. A good way of simulating the screen reader
experience is to view your page with [Lynx][lynx]. Conveniently, Lynx does not
support JavaScript. 😉

[lynx]: https://lynx.browser.org

This seems like a lot of effort to go to for accessibility! But, if you read
closely, this is mostly a list of things to *avoid* doing. The SourceHut
approach side-steps many of these problems by focusing on simplicity. The
JavaScript-free interface is more accessible right out of the gate, and by not
cramming too much into a single page it's much easier to flow and organize in an
accessible way. This advice also leaks quite generally into the broader subject
of *usability*, which is no mistake: investing in accessibility makes your
service better for everyone.

SourceHut also benefits from some design choices which extend beyond the web.
For example, by focusing on email for discussions, patches, and code review,
and [insisting on plain text](https://useplaintext.email), many blind users can
choose to completely side-step the web interface and interact with the services
and users on it from the comfort of their mail client, using only Plain Jane
Text emails. Then, when they have questions, they can join our IRC chat room,
a medium used exclusively to exchange short, plain-text messages, without the
nightmare of navigating the Slack interface with a screen reader.

In summary, if you want to get accessible quick, a good start for your new
website might eschew `npm install` in favor of this:

```
<!doctype html>
<meta charset="utf-8 />
<title>My cool website!</title>
<main>
  <h1>My cool website</h1>
  <p>Welcome to my cool website!
</main>
```

Which, in case you were unaware, is a completely valid HTML 5 document!
