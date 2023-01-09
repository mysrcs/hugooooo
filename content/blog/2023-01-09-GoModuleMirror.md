---
title: SourceHut will blacklist the Go module mirror
author: Drew DeVault
date: 2023-01-09
---

SourceHut will disable git access for the [Go Module Mirror][0] on February
24th, 2023. This will cause a service impact for Go users. This article explains
why this step is necessary and how Go users can work around the issue.

[0]: https://proxy.golang.org/

## tl;dr

From February 24th, users running `go get` or a similar command on Go packages
which import modules from SourceHut repositories will be met with an error
message similar to the following:

```
$ go get
go: downloading git.sr.ht/~sircmpwn/foobaz v0.0.0-20230108094957-81402546c10e
go: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: verifying module: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: reading https://sum.golang.org/lookup/git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: 404 Not Found
	server response:
	not found: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: invalid version: git ls-remote -q origin in /tmp/gopath/pkg/mod/cache/vcs/568e5edafe93f7887c0b6f718b0f17ea91c63c35822fb28628535f172b5429b7: exit status 128:
		fatal: unable to access 'https://git.sr.ht/~sircmpwn/foobaz/': The requested URL returned error: 429
```

The following workaround will correct the issue:

```
$ export GOPRIVATE=git.sr.ht
$ go get # works
```

For more detail, read on.

## Background

The Go programming language fetches modules via git, such that a user who
imports "[git.sr.ht/~sircmpwn/dowork][1]" will cause the toolchain to fetch the
corresponding repository via git in order to make it available in the user's Go
environment. Each of these requests is routed through a proxy service at
[proxy.golang.org][0], which provides a number of features:

[1]: https://git.sr.ht/~sircmpwn/dowork

- Offers reliable and fast access to module downloads via Google's cache
- Stores redundant copies of Go modules to ensure availability
- Records an independent source of their checksum for the checksum database
- Provides an index of new Go modules

This comes with a number of downsides. For example, most Go users are unaware
that every package they fetch is accompanied by a request to Google's servers,
and implies a trust relationship with Google to return authentic packages.
Additionally, should the underlying source repository disappear or become out of
sync with the cache, the problem is hidden from Go users, which can cause their
software to become dependent on modules or module versions which no longer
exist.

More importantly for SourceHut, the proxy will regularly fetch Go packages from
their source repository to check for updates -- independent of any user
requests, such as running `go get`. These requests take the form of a complete
git clone of the source repository, which is the most expensive kind of request
for git.sr.ht to service. Additionally, these requests originate from many
servers which do not coordinate with each other to reduce their workload. The
frequency of these requests can be as high as ~2,500 per hour, often batched
with up to a dozen clones at once, and are generally highly redundant: a single
git repository can be fetched over 100 times per hour.

This traffic produces an excessive background workload which is constantly being
serviced by git.sr.ht. Due to the relatively large traffic requirements of git
clones, this represents about 70% of all outgoing network traffic from
git.sr.ht. A single module can produce as much as 4 GiB of daily traffic from
Google.

## Seeking other solutions

Blacklisting GoModuleMirror is our last resort, and we wanted to avoid it if
possible. We attempted to work with the Go team on a solution, but were
unsuccessful.

On February 24th, 2021, we [reported an issue][issue] to the Go team regarding
this problem. The Go team initially helped us narrow down the cause, first by
setting an appropriate User-Agent to help identify this traffic, then through
discussions regarding the behavior of this system. We made recommendations to
Google for how to service their requirements without generating an excessive
amount of redundant traffic. However, the discussion stalled and no further
changes were made by Google to address the issue, and we continued to receive an
excessive amount of traffic from the module mirror.

[issue]: https://github.com/golang/go/issues/44577

The situation remained so for over a year. In that time, I was banned from the
Go issue tracker without explanation, and was unable to continue discussing the
problem with Google. With few options left, I wrote [a blog post][blog] on May
25th, 2022 outlining the issue and petitioning the public for support in
addressing this problem. However, the problem remains unsolved.

[blog]: https://drewdevault.com/2022/05/25/Google-has-been-DDoSing-sourcehut.html

February 24th, 2023, the date that we plan to disable Go traffic, marks two
years since the initial complaint was submitted to the Go team. The cost of
bearing this traffic is no longer acceptable to us, and the Go team has made no
attempts to correct the issue during this time. We want to avoid causing
inconvenience for Go users, but the load and cost is too high for us to continue
justifying support for this feature.

## Recommendations for the Go team

From February 24th, git clone requests with a GoModuleMirror User-Agent will
receive a 429 (Too Many Requests) response. To restore service, we have the
following recommendations for the Go team:

1. Obey robots.txt, including the Crawl-Delay directive, to control the rate at
   which modules are fetched.
2. Perform a shallow git clone rather than a full git clone; or, ideally, store
   the last seen commit hash for each reference and only fetch if it has been
   updated.
3. Reduce redundant traffic: fetch each git repository less often. It should not
   be necessary to fetch the same git module up to 2,000 times per day.

If these issues are addressed, we would be pleased to re-enable GoModuleMirror's
access to our services. The Go team can reach me [via
email](mailto:sir@cmpwn.com) to discuss the matter further, if you have ideas
for other solutions or require any additional details to address the problem.

## Recommendations for Go users

Unfortunately, this will affect Go users and will require workarounds to be
implemented in order to compile Go software which depend on modules hosted on
git.sr.ht. If you encounter an error similar to the following:

```
$ go get
go: downloading git.sr.ht/~sircmpwn/foobaz v0.0.0-20230108094957-81402546c10e
go: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: verifying module: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: reading https://sum.golang.org/lookup/git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: 404 Not Found
	server response:
	not found: git.sr.ht/~sircmpwn/foobaz@v0.0.0-20230108094957-81402546c10e: invalid version: git ls-remote -q origin in /tmp/gopath/pkg/mod/cache/vcs/568e5edafe93f7887c0b6f718b0f17ea91c63c35822fb28628535f172b5429b7: exit status 128:
		fatal: unable to access 'https://git.sr.ht/~sircmpwn/foobaz/': The requested URL returned error: 429
```

You can correct it by bypassing proxy.golang.org:

```
$ export GOPRIVATE=git.sr.ht
$ go get # works
```

We will enable these variables by default for builds.sr.ht jobs prior to
disabling service for the Go module mirror.

We understand if Go users need to migrate away from SourceHut to deal with these
problems. We apologise for this inconvenience, and we hope to see you return
should the problem be resolved. The SourceHut team is available to assist with
any necessary migration efforts via
[sr.ht-discuss](https://lists.sr.ht/~sircmpwn/sr.ht-discuss).
