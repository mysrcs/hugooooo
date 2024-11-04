---
title: What's cooking on Sourcehut? August 2019
date: 2019-08-15
author: Drew DeVault
---

Thank you for continuing to support Sourcehut during the alpha period! I
have loads of exiting developments to share with you today. Let's
welcome our newest 369 users to the platform, which now totals 9,711 in
number.

## builds.sr.ht

I'm happy to announce lots of cool features for builds.sr.ht this month.
First, the VMs for failed builds are now being kept alive for 10 minutes
after the completion of your build, and you can SSH into them to examine
the failure more closely (if you do so, the 10 minute deadline is
extended to the original time limit for your build).

![Screenshot of a failed build prompting the user to SSH into the VM](https://sr.ht/thL-.png)

You can also SSH into build jobs just if you'd find it useful. Need an OpenBSD
shell to try something out?

    image: openbsd/latest
    shell: true

Paste that into builds.sr.ht/submit and you'll get your SSH connection
details a few moments later. You can also still add all of your tasks,
packages, repos, and such; perhaps cloning your dotfiles repo and
installing your favorite text editor.

SSH access is still in its early stages, but development is well
underway on features like submitting build manifests over SSH, e.g.

    ssh builds@builds.sr.ht submit < .build.yml

as well as `tail -f`-ing build logs in your terminal.

Additionally, I have progress to announce on experimental multi-arch support.
arm64 is now available for Debian images, and is being kept up-to-date with
automated builds. I've also made progress on ppc64el support using a similar
approach. Currently this is done with software emulation via qemu, but in the
next couple of months, I expect to have ppc64le hardware builds available.

The `ubuntu/latest` image now points to Ubuntu Disco and `freebsd/latest` to
FreeBSD 11.3, following their respective upstream releases.

## man.sr.ht

Thanks to the hard work of Ryan Chan and after a complex migration
process, a major update to man.sr.ht has been deployed. No longer are
the backing git repos stored with man.sr.ht itself - they've now been
transferred to git.sr.ht repositories and man.sr.ht uses webhooks and
the git.sr.ht API to fetch content from them. This means you can now
browse your wikis on git.sr.ht using the fully featured git repository
browsing interface, but you can also put your wikis directly into the
git repos they document under a "wiki" branch or something similar.
Thanks to Ryan for all your hard work!

## git.sr.ht

A problem which has plagued git.sr.ht for some time now is slow performance on
git operations over SSH. Though there's still many improvements to be made, I
spent some time this month whetting down the bottlenecks and, as a result, git
pull is 5x faster and git push is 2x faster. Thanks to Preston Carpenter for
helping to identify some of the bottlenecks! The remaining bottlenecks are
well-understood and I expect to make further improvements soon. Anyone
interested in helping on this should reach out on IRC - there's a lot of cool
stuff involved.

Additionally, following the announcement of code annotations for git.sr.ht,
several projects have grown which add support for their favorite programming
languages:

- [POSIX shell](https://git.sr.ht/~emersion/annotatesh)
- [Python](https://git.sr.ht/~ihabunek/annotatepy)
- [Rust](https://git.sr.ht/~wezm/annotate-rust)

If you're working on one yourself, please let me know!

## lists.sr.ht

Because Sourcehut requires the use of plaintext email, many email clients will
run into this limitation quickly with their default configuration. Previously,
you'd get a very user-unfriendly bounce message from postfix which doesn't give
you much help towards fixing this problem. Instead, the bounces are now sent
from lists.sr.ht itself and replace the mail server diagnostic info with a
friendlier description of the problem and resources to address it - namely,
[useplaintext.email](https://useplaintext.email).

Other error messages which can be returned by lists.sr.ht have received
similar treatment.

## Interesting projects using Sourcehut

The [mutt email client](http://mutt.org/) is experimenting with a sr.ht git
mirror and mailing list, as well as builds.sr.ht CI.

[Gio](https://gioui.org) is an immediate mode GUI toolkit for Golang.

Thanks for using Sourcehut, guys! Be sure to let me know about your new
projects - post them to the [sr.ht-discuss][discuss] list.

[discuss]: https://lists.sr.ht/~sircmpwn/sr.ht-discuss
