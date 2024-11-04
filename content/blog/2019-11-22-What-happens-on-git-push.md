---
title: What happens when you push to git.sr.ht, and why was it so slow?
date: 2019-11-22
author: Drew DeVault
---

One of the most persistent, frustrating, and entirely valid, criticisms of
Sourcehut that I've heard has been that git operations over SSH are too slow.
The reason this is a frustrating complaint to hear is that the git.sr.ht SSH
pipeline is a complicated set of many moving parts, and fixing the problem
involved changes at every level. However, as many of you will (hopefully) have
noticed by now, pushing to and pulling from git.sr.ht is quite snappy now! So
after a huge amount of work overhauling everything to get us here, I thought it
would be nice to reflect on what caused these issues, how this system is
structured, and how the problem was eventually solved.

There are several major tasks that need to happen when you push or pull to
git.sr.ht. In order, they are:

1. **Dispatch** Which system are you SSHing into? git.sr.ht? builds.sr.ht?
2. **Identification** Who are you?
3. **Authorization** Are you allowed to do what you're trying to do?
4. **Execution** Hand things off to git to complete your operation.
5. **Follow-up** Do we need to submit any CI jobs? Webhooks?

During each of these steps, your terminal is blocked. You have to wait for all
of them to complete. Well, most of them, at least. Let's discuss each step in
detail.

## Dispatching

There are several Sourcehut services which you can log onto using SSH:
git.sr.ht, hg.sr.ht, and builds.sr.ht, and perhaps more in the future. Before we
overhauled it, man.sr.ht used to have a dedicated SSH service as well. In our
case, we run each of these services on their own servers at their own IP
addresses. However, this was not always the case, and we still support
third-party installations of Sourcehut services which are all sharing a single
server. Therefore, we have to have a way of identifying which service you're
trying to SSH into, and for this purpose we use the user. You use
`git@git.sr.ht`, `hg@hg.sr.ht`, and `builds@builds.sr.ht`, to log onto each
respective service.

This phase is handled by our `gitsrht-dispatch` binary, whose source code [you
can view here][dispatch source]. This is run by OpenSSH in order to generate an
`authorized_keys` file, with a list of SSH keys which are allowed to log into
Sourcehut. That's beyond the scope of dispatch, however, which delegates it to
the next step. Instead, it just figures out which service it needs to hand you
off to for authentication.

[dispatch source]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-dispatch/main.go

    [git.sr.ht::dispatch]
    #
    # The authorized keys hook uses this to dispatch to various handlers
    # The format is a program to exec into as the key, and the user to match as the
    # value. When someone tries to log in as this user, this program is executed
    # and is expected to emit an AuthorizedKeys file.
    /usr/bin/gitsrht-keys=git:git
    /usr/bin/hgsrht-keys=hg:hg

When you SSH into the service as `git@...`, the dispatcher looks up the entry
corresponding to the git user. In this case, it's `gitsrht-keys`. Then, it finds
the uid and gid for this account, setuid[^1]'s itself to that user, and
exec's[^2] into the next step.

[^1]: setuid changes the user identity of the current process.
[^2]: exec replaces the current process with another.

## Identification

Each discrete service is separately responsible for its own approach to
identifying and authorizing users. OpenSSH executed our dispatcher hoping to get
an authorized keys file, and the next step is to prepare one for it. For
git.sr.ht, this responsibility falls onto [gitsrht-keys][keys source].

[keys source]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-keys/main.go

This is where things start to get interesting in terms of performance. Ideally,
we want to get out of here with zero round-trips to remote services like SQL.
For this reason, we cache your SSH keys on a Redis instance at localhost.
OpenSSH handed us your base64'd SSH key and dispatch forwarded it to us, and we
use this to look up your key from the cache. If we find it, we can skip directly
to the final step. But, if we miss the cache, we ask meta.sr.ht if it's seen
your key before. We then cache it in Redis and make sure we have a copy in our
database as well, to save you time for the next push. But even in this worst
case, we're already starting to see hand-optimized SQL queries:

{{< highlight sql >}}
-- Getting the user ID is really a separate concern, but this saves us a
-- SQL roundtrip and this is a performance-critical section
WITH key_owner AS (
  SELECT id user_id
  FROM "user"
  WHERE "user".username = $1
)
INSERT INTO sshkey (
  user_id,
  meta_id,
  key,
  fingerprint
)
SELECT user_id, $2, $3, $4
FROM key_owner
-- This no-ops on conflict, but we still need this query to complete so
-- that we can extract the user ID. DO NOTHING returns zero rows.
ON CONFLICT (meta_id) DO UPDATE SET meta_id = $2
RETURNING id, user_id;
{{< / highlight >}}

We need to get your git.sr.ht user ID while we're here, and normally we'd look
it up in Redis. With this SQL query, we fetch the user ID at the same time as we
store your key. This kind of hacky SQL packing is a common tactic we'll see
employed throughout for improved performance.

At the end of this process, we print out a generated authorized keys file and
exit, then OpenSSH does the rest of the work to verify that the user actually
possesses the private key they claim to and so on. Then, when they're allowed in,
we move on to the shell.

    restrict,command=gitsrht-shell,environment="SRHT_PUSH=<uuid>",your ssh key here

This keys file turns off almost all SSH features (restrict), overrides the
command you will run to use our shell, and adds an assigned UUID for this push
to the environment.

## Authorization

At this point, we've found your account and verified that you're an authorized
agent of the user, using your SSH key. Now we need to know if you're allowed to
do what you're trying to do, which is where [gitsrht-shell][shell source] comes
in. Its job is to look up the repository you're trying to do and compare the
operation you want to perform (read or write) against the access control lists.
Even in the best case, we're required to do a SQL round-trip here. This is what
it looks like:

[shell source]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-shell/main.go

{{< highlight sql >}}
-- Fetch the necessary info from SQL. This first query fetches:
--
-- 1. Repository information, such as visibility (public|unlisted|private)
-- 2. Information about the repository owner's account
-- 3. Information about the pusher's account
-- 4. Any access control policies for that repo that apply to the pusher
SELECT
  repo.id,
  repo.name,
  repo.owner_id,
  owner.username,
  repo.visibility,
  pusher.user_type,
  pusher.suspension_notice,
  access.mode
FROM repository repo
JOIN "user" owner  ON owner.id  = repo.owner_id
JOIN "user" pusher ON pusher.id = $1
LEFT JOIN access
  ON (access.repo_id = repo.id AND access.user_id = $1)
WHERE
  repo.path = $2;
{{< / highlight >}}

Again, we've jammed a lot of somewhat disjoint information into a single SQL
query for efficiency's sake. We fetch everything we'll need to know later on:
what's this repo's ID and name, who's the owner, what's the repo visibility,
who's the pusher and what kind of user are they, is their account suspended and
how do we break it to them if so, and are there any access list entries for them
on this repository?

There are two reasons that this could fail: the repository has been renamed, or
it never existed. If this query returns no results, then we try to look for a
redirect &mdash; round-trip #2. The query is as follows:

{{<highlight sql >}}
SELECT
  repo.id,
  repo.name,
  repo.owner_id,
  owner.username,
  repo.visibility,
  pusher.user_type,
  pusher.suspension_notice,
  access.mode
FROM repository repo
JOIN "user" owner  ON owner.id  = repo.owner_id
JOIN "user" pusher ON pusher.id = $1
JOIN redirect      ON redirect.new_repo_id = repo.id
LEFT JOIN access
  ON (access.repo_id = repo.id AND access.user_id = $1)
WHERE
  redirect.path = $2;
{{</ highlight >}}

You'll notice that we're also fetching a whole lot of information at once here.
In case we do find a redirect, we don't want to do a third round-trip to fetch
all the information we'll need for that repo, either.

Say this fails, too. Now we definitely know that your repository doesn't exist.
This is the point at which git.sr.ht's autocreate-repos-on-push feature kicks
in, if the repo you're pushing to is under your user namespace. [That code is
fairly simple and involves an additional round-trip][autocreate code], you may
study it in your own time.

[autocreate code]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-shell/main.go#L263

But, if we get this far, then we have everything we need to finish authorizing
you. If you do have permission to complete the operation you've requested, we
exec into the appropriate git binary.

## Execution

At this point, you're in git's hands. We've handed you off to one of their
binaries to complete the push or pull operation. The tools that can be run at
this point are [git-receive-pack][git-receive-pack],
[git-upload-pack][git-upload-pack], or [git-upload-archive][git-upload-archive]
&mdash; follow the links if you want to learn more about them.

[git-receive-pack]: https://git-scm.com/docs/git-receive-pack
[git-upload-pack]: https://git-scm.com/docs/git-upload-pack
[git-upload-archive]: https://git-scm.com/docs/git-upload-archive

## Following up: hooks

There's one last task for us to do before we can send you on your way, and it's
split into three parts. These are our [git hooks][git hooks]. These are only run
on git pushes, not for fetching. We use these hooks to complete some
housekeeping after your pushes complete, and to implement a few features. The
remaining tasks for us to do at this point are:

[git hooks]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks

1. Update the mtime of your repository
2. Submit any necessary builds.sr.ht jobs
3. Deliver webhooks

This doesn't seem like much, but it's in fact the most complicated part of the
process so far. It's handled by [gitsrht-update-hook][hook source]. These tasks
correspond, though not 1:1, to three steps, each mapping to a different git
hook:

[hook source]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook

1. hooks/update
2. hooks/post-update
3. hooks/stage-3 (this is a pseudo-hook that we made up)

The [entry point][hook main] is pretty simple. It just figures out what stage
we're on and changes its behavior accordingly. The first step, the [update
hook][hook update], is really simple; we just use it to collect data from git
for use in later stages. In theory we could reject your push here, but in
practice we don't have anything set up to do so right now. git executes us once
for every updated ref, with the old and new sha's for that ref, and we just
shove them into a local Redis instance for later use.

[hook main]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/main.go
[hook update]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/update.go

"Later use" comes with stage 2, the [post-update hook][hook post-update]. This
is where the majority of the work for this stage starts to get done. We first
pull the "push context" out of the environment, which is some data that
gitsrht-shell prepared for us earlier, to avoid fetching the same data in two
different stages. We don't get off completely scot-free, though, and we hit the
next required SQL round-trip:

{{<highlight sql >}}
-- With this query, we:
-- 1. Fetch the owner's username and OAuth token
-- 2. Fetch the repository's name and visibility
-- 3. Update the repository's mtime
-- 4. Determine how many webhooks this repo has: if there are zero sync
--    webhooks then we can defer looking them up until after we've sent the
--    user on their way.
UPDATE repository repo
SET updated = NOW() AT TIME ZONE 'UTC'
FROM (
  SELECT "user".username, "user".oauth_token
  FROM "user"
  JOIN repository r ON r.owner_id = "user".id
  WHERE r.id = $1
) AS owner, (
  SELECT
    COUNT(*) FILTER(WHERE rws.sync = true) sync_count,
    COUNT(*) FILTER(WHERE rws.sync = false) async_count
  FROM repo_webhook_subscription rws
  WHERE rws.repo_id = $1 AND rws.events LIKE '%repo:post-update%'
) AS webhooks
WHERE repo.id = $1
RETURNING
  repo.name,
  repo.visibility,
  owner.username,
  owner.oauth_token,
  webhooks.sync_count,
  webhooks.async_count;
{{</ highlight >}}

This query helps us determine what work we'll need to do in the rest of the
process, and gets us some of the information we need to complete that work. We
update the mtime of your repo, but we also do some hacky joins and subqueries to
sneak more information out of SQL in one round-trip. We grab the OAuth key we'll
need to submit builds on your behalf to builds.sr.ht, and the number of
synchronous and asynchronous webhooks registered for your repository. If there
are any synchronous webhooks, that means (by definition) that we need to
complete those in this stage, and a second query is performed:

{{<highlight sql >}}
SELECT id, url, events
FROM repo_webhook_subscription rws
WHERE rws.repo_id = $1
  AND rws.events LIKE '%repo:post-update%'
  AND rws.sync = true;
{{</ highlight >}}

[hook post-update]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/post-update.go

Next, we open up your git repository to have a peek inside. We iterate over
each ref which you updated during your push, and pull the old and new references
out of Redis from stage 1. We pull some info out of git and turn it into a
webhook payload to be delivered later, and we look for builds.sr.ht manifests.
If we find one, we set up a [build submitter][submitter] for it, and it kicks
off any necessary CI jobs.

[submitter]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/submitter.go

That webhook payload we've prepared now needs to be submitted to any synchronous
webhooks before we let go of your terminal - after all, it's a feature that
these webhooks can return some text to show to the pusher before they're off.
The [webhook code][webhook code] is pretty straightforward, with one minor
exception: webhook payloads are signed.

[webhook code]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/webhooks.go

Once that's done, we can finally release your terminal and send you on your way.
However, we're not done: we still have to run stage 3.  Actually, we only have
to run stage 3 if there were any synchronous or asynchronous webhooks on your
repository. In the interests of speed, we don't record your synchronous webhook
deliveries into SQL right away, and by definition we do your asynchronous
deliveries asynchronously. So, we [execute stage 3][stage-3-exec] as a detached
child before we leave, and we send it any information we've already collected
for it to complete these tasks.

[stage-3-exec]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/post-update.go#L280

[Stage 3][stage 3 code]'s job can be undertaken at a much more leisurely pace.
First, it looks up any asynchronous webhooks, then delivers the same payload to
them, graciously forwarded by stage 2. It collects all of their deliveries,
combines them with a list of deliveries forwarded from stage 2, and records them
in SQL. Now, at long last, this lengthy process is complete.

[stage 3 code]: https://git.sr.ht/~sircmpwn/git.sr.ht/tree/master/gitsrht-update-hook/stage-3.go

## So why was everything slow?

Well, for a few reasons. First, each step of this pipeline used to be written in
Python, not Go, which matched the rest of Sourcehut's implementation. Spinning
up the Python VM and pulling in all of our imports - including, for example, all
of our SQLAlchemy riggings - is not cheap. Each of these steps would separately
incur a startup cost on the order of up to a second each.

Another reason is that the SQL riggings were not especially well optimized. In
the worst case, it could take upwards of 20 SQL round-trips before your push
operation was completed. This was mainly due to poor design choices, mostly
motivated by DRY (Don't Repeat Yourself (Don't Repeat Yourself)), which tried to
leverage more generalized and less efficient code used by the web application to
perform some of these steps. In the best case, the new approach makes only one
SQL round-trip for pulls, or 2 round-trips for a push.

A major misstep was, in the process of optimizing these steps, the decision to
move some of this logic into the web application. Python isn't very good at
asynchronous operations, and Sourcehut's codebase pre-dates asyncio. We use
Gunicorn as our web daemon, which runs several worker processes to handle web
requests. At one point, to reduce the Python startup time, I thought it would be
smart to bundle up all of your information in a little HTTP request and shoot it
over to the web worker, which already had a SQL connection and a warm Python VM.

However, the process was still very slow even with those bottlenecks removed -
which was a huge problem. Because there are a fixed number of web workers, and
they can only do one thing at a time, the addition of processing complicated git
push logic to their workload would quickly pin workers, causing the web
application *and* git pushes to slow. Before I fixed this mistake, the average
time for an HTTP request and a git push were pushing 60 seconds. That was an
awful, terrible, no good, very bad idea.

## Now we're fast! Or are we?

Astute observers and frequent git-pushers may notice that the ideal performance
of git pushes on git.sr.ht have been vastly improved, to the point of often
appearing instant, but they are not *consistently* that fast. There is one
remaining bottleneck: I/O throughput. When git.sr.ht's servers are busy, we can
still tie up I/O serving various other users before we get to your requests.
This is a limitation of our current hardware deployment, which is more I/O bound
than anything else. To address this last bottleneck, new server hardware is
being provisioned, with different I/O constraints, and git.sr.ht will be moving
to it as soon as it arrives and is put together. And then we'll be blazing fast,
all the time, hooray! At least until we can afford better peering...
