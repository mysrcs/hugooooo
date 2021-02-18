---
title: Sourcehut pages
date: 2021-02-18
author: Drew DeVault
---

I'm happy to announce that a long-awaited feature is available today: [sourcehut
pages](https://srht.site). SourceHut users can use this service to host static
websites for any of their own domains, and every user is also being given
"username.srht.site".

You can use any static site generator: Jekyll, Hugo, Doxygen, or your own cool
new thing. You can publish from git.sr.ht or hg.sr.ht, or you can set up any
publishing workflow you prefer &mdash; you just need to upload a tarball. Every
domain has TLS automatically configured for you. You get your personal subdomain
on srht.site, unlimited bring-your-own-domains, and up to 1G of storage per
site.

Check out [srht.site](https://srht.site) for the full details, but here are some 
shell commands you can run right now to be live in 3 minutes.

First, generate a [personal access key](https://meta.sr.ht/oauth2/personal-token)
and add it to your environment, something like this:

```
bearer_token=9SKUndgx8Fx55xYGNAxs1Lal8YQAh29/90m+HjsMVsA=
```

Then write a simple "index.html" file:

```html
<!doctype html>
<html lang="en">
<meta charset="utf-8" />
<title>My sourcehut page</title>
<h1>My sourcehut page</h1>
<p>Welcome to my cool sourcehut page!
```

Put it in a tarball:

```
tar -cvz index.html > site.tar.gz
```

And publish it, being sure to replace "username" with your sr.ht username:

```
curl --oauth2-bearer "$bearer_token" \
    -Fcontent=@site.tar.gz \
    https://pages.sr.ht/publish/username.srht.site
```

Hey presto, your new website is live! [Check out the rest of the
documentation](https://srht.site) for tips on automating this process, setting
up a static site generator like Hugo, and how to use your own domain name.
