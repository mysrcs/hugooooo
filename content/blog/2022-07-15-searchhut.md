---
title: Introducing SearchHut
author: Drew DeVault
date: 2022-07-15
---

[SearchHut](https://searchhut.org) is an experimental free-software search
engine by SourceHut, which is now available, though of limited utility while we
build the index. SearchHut is a *curated* search engine &mdash; we're not
crawling the entire Internet. We are focused on specific, high-quality websites
which provide high-quality results for specific domains. It works: we fixed the
blog spam problem by just not crawling spam blogs.

![A screenshot comparing DuckDuckGo to SearchHut](https://l.sr.ht/Bksj.jpg)

*SearchHut started getting attention earlier than we expected, so I published
this blog post today. It was planned for next week and there are still several
loose ends with the search engine. YMMV.*

One of the goals of this project was to make it easy for third parties to use it
to spin up custom search engines for specific domains. You could build a search
engine for academia, or hackerspaces, or underwater basket weaving resources, or
as the search backend for your own website or websites. Rather than a single big
search engine trying to take on the entire web, we're looking at a vision where
lots of smaller search engines excel in their own problem space.

In order to make it simple and easy to deploy & maintain, the backend is a very
simple PostgreSQL database, utilizing its full text search features and the
[RUM] index to speed up queries. It remains to be seen if this approach will
scale to our intended size (not that big &mdash; probably south of 100 million
records), and we may have to switch something like Lucene in the future. So far,
however, I'm happy with the performance and quality of postgres with RUM, and
the gains in simplicity and ease of deployment/maintenance are not to be sniffed
at.

[Deploying it yourself] is pretty straightforward:

[RUM]: https://github.com/postgrespro/rum
[Deploying it yourself]: https://searchhut.org/docs/docs/sysadmins/installation/

```
# Add a website:
$ sh-admin example.org
# Crawl it:
$ sh-index example.org
# Run the API:
$ sh-api &
# Run the web service:
$ sh-web
```

Speaking of the API, [we have one][api]. Free public anonymous access for search
queries, the very same API used to implement the frontend.

[api]: https://searchhut.org/docs/docs/users/api/

The kinds of websites we're indexing are focused on providing high-quality
results. We keep track of "authoritative" websites (e.g. official documentation
for a FOSS project) and give them a bump in the rankings. We're also indexing a
handful of larger sites: Wikipedia, MDN, arXiv, etc. Sites can be indexed with
[the crawler][crawler], or with a custom importer, like [this one for
Wikipedia][wiki]. The full criteria for inclusion is [documented
here][criteria]. To request to have your domain or a domain you like added to
the index, please fill out a [domain request][req].

[crawler]: https://searchhut.org/docs/docs/webadmins/crawler/
[wiki]: https://git.sr.ht/~sircmpwn/searchhut/tree/master/item/import/mediawiki/main.py
[criteria]: https://searchhut.org/docs/docs/webadmins/requirements/
[req]: mailto:~sircmpwn/searchhut-discuss@lists.sr.ht

We are also working on some nice features for making searches easier. For
instance, each website is stored alongside with a set of useful tags that apply
to its content, such as #docs or #python, which you can use to refine your
search results. We also have @example.org (or site:example.org, both work), and
tools to filter out pages with JavaScript or pages over a given maximum size. We
are also adding support for DuckDuckGo-style bangs, to redirect you to other
search engines with queries like !duckduckgo or !wikipedia.

We'd like to expand it more in the future. Tools for domain owners to manage
their websites in the index would be a good start. If it takes off and we see an
ecosystem of topic-specific search engines grow, we can look into a federated
meta-search which queries many search engines at the same time. What's important
is that it's all based on free software and directed by users looking for good
search results &mdash; not by SEO spammers trying to game the system or large
corporations trying to get ad revenue or conversions.

For now, though, this project is still pretty experimental, essentially the
product of a discussion on IRC and a week of motivated hacking. I'm pretty
confident in the design and I think that it will scale to our desired size
(note: not Google sized), while still keeping costs manageable and performance
fast. But it remains to be seen if it will work out in the long term. Let's try
it out and see!
