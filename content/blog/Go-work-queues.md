---
title: In-process work queueing for Go
author: Drew DeVault
date: 2020-10-06
---

In the course of our [API 2.0 efforts][api 2.0], it is necessary for us to
implement some kind of mechanism for queueing and retrying work in our Go
platform. The most obvious examples of this work is sending emails and
delivering webhooks, but there are more subtle examples, too &mdash; just about
anything which can be moved out of the request&nbsp;→&nbsp;response hot path
would improve performance for the end-user. As such, some kind of task queue is
called for.

[api 2.0]: https://sourcehut.org/blog/2020-09-25-api-2-updates/

Our Python codebase uses [Celery][celery], and we have already had some
experience at building Celery workers [in Go][go-celery]. However, on the whole
we're pretty dissatisfied with Celery. It's too complicated and inflexible for
our needs. Something lighter weight and more toolkit-oriented (as opposed to
midlayer-oriented) would address our use-case better.

[celery]: https://docs.celeryproject.org/en/stable/getting-started/introduction.html
[go-celery]: https://github.com/gocelery/gocelery

So, I set out to design us a bespoke task queueing system for our Go daemons.
Some of the goals were:

- Ability to manage work in Goroutines instead of separate daemons[^1]
- Easy handling of re-attempts with an exponential backoff
- Graceful termination (stop accepting new tasks and flush the queue)
- Observability with [Prometheus][Prometheus]

[Prometheus]: https://prometheus.io/

[^1]: Without necessarily making it difficult to move executors to separate processes or machines later on

The solution came in the form of our new
["dowork"](https://sr.ht/~sircmpwn/dowork/) Go library. Here's the basic usage:

```go
import "git.sr.ht/~sircmpwn/dowork"

queue := work.NewQueue()
queue.Start(context.Background()) // Does not block
queue.Submit(func(ctx context.Context) error {
    // Do work...
    return nil
})
queue.Shutdown() // Blocks until all pending tasks are complete
```

If you want to handle retries, create and enqueue your task in two steps:

```go
task := work.NewTask(func(ctx context.Context) error {
    // Do work...
    return nil
}).Retries(5)
queue.Enqueue(task)
```

This will automatically retry your task with an exponential backoff if it
returns an error.

Let's take a look at this in action! Consider our email handling module.

```go
// Returns a task which will send this email for the work queue. If the caller
// does not need to customize the task parameters, the Enqueue function may be
// more desirable.
func NewTask(ctx context.Context, m *gomail.Message) *work.Task {
	conf := config.ForContext(ctx)
	return work.NewTask(func(ctx context.Context) error {
		return Send(config.Context(ctx, conf), m)
	}).Retries(10).After(func(ctx context.Context, task *work.Task) {
		if task.Result() == nil {
			log.Printf("MAIL TO %s: '%s' sent after %d attempts",
				strings.Join(m.GetHeader("To"), ";"),
				strings.Join(m.GetHeader("Subject"), ";"),
				task.Attempts())
		} else {
			log.Printf("MAIL TO %s: '%s' failed after %d attempts: %v",
				strings.Join(m.GetHeader("To"), ";"),
				strings.Join(m.GetHeader("Subject"), ";"),
				task.Attempts(), task.Result())
		}
	})
}

// Enqueues an email for sending with the default parameters.
func Enqueue(ctx context.Context, m *gomail.Message) {
	ForContext(ctx).Enqueue(NewTask(ctx, m))
}

// Creates a new email processing queue.
func NewQueue() *work.Queue {
	return work.NewQueue("email")
}
```

Some code for [handling contexts][contexts] is omitted for brevity. Here we use
a closure to enclose the message to be sent, and some extra details like the
config file (which includes our SMTP details). We configure it for up to 10
retries, and log the result after the task is complete. Sending an email with
this is pretty straightforward:

[contexts]: https://git.sr.ht/~sircmpwn/core-go/tree/master/email/worker.go

```go
m := gomail.NewMessage()
m.SetAddressHeader("From", "jdoe@example.org", "Jane Doe")
m.SetAddressHeader("To", "jsmith@example.org", "John Smith")
m.SetHeader("Subject", "An email subject")
m.SetBody("text/plain", "An email body")
email.Enqueue(ctx, m) // Doesn't block!
```

The next interesting component comes when it's time to terminate the process. We
want to do the following things:

1. Stop accepting new connections and free up the HTTP port for the new daemon
2. Finish servicing existing requests, up to a timeout
3. Finish running any already-queued tasks
4. Terminate the process

So the process looks like this:

```go
mail := email.NewQueue()
mail.Start(context.Background())

// ...

go qserver.Serve(qlistener) // Asynchronously start the main HTTP server

sig := make(chan os.Signal, 1)
signal.Notify(sig, os.Interrupt)
<-sig
signal.Reset(os.Interrupt)
log.Println("SIGINT caught, initiating warm shutdown")
log.Println("SIGINT again to terminate immediately and drop pending requests & tasks")

log.Println("Terminating server...")
ctx, cancel := context.WithDeadline(context.Background(),
  time.Now().Add(30 * time.Second))
qserver.Shutdown(ctx)
cancel()

log.Println("Terminating work queues...")
work.Join(mail)
qserver.Close()
log.Println("Terminating process.")
```

As a bonus for observability, we also set up a secondary HTTP server on a
kernel-assigned TCP port, which we can use to monitor the shutdown process:


```go
mux := &http.ServeMux{}
mux.Handle("/metrics", promhttp.Handler())
pserver := &http.Server{Handler: mux}
plistener, err := net.Listen("tcp", ":0")
if err != nil {
  panic(err)
}
log.Printf("Prometheus listening on :%d", plistener.Addr().(*net.TCPAddr).Port)
go pserver.Serve(plistener)
```

I also added a little extra log during the shutdown process:

```go
log.Printf("Progress available via Prometheus stats on port %d",
  plistener.Addr().(*net.TCPAddr).Port)
```

This is just to print the Prometheus port closer to the shutdown event in the
logs, for easy reference.
<code>curl&nbsp;http://[::1]:<strong>$port</strong>/metrics</code> will provide
Prometheus metrics, including the queue drain progress for the sysadmin to
monitor.

That's it! Some future improvements along these lines will include:

- Rigging this up with OpenRC so that our service manager can oversee these
  kinds of restarts
- More sophisticated coordination between the old and new server processes to
  reduce the window during which connections might be dropped[^2]
- Dumping the queue state on the second SIGINT so that the admin can review and
  possibly re-queue some of the tasks later
- Moving the queue into a secondary process or a remote machine, through some
  kind of remote submission mechanism
- Applying this work further towards the upcoming builds.sr.ht work distribution
  overhaul

Stay tuned.

[View the "dowork" project on SourceHut →](https://sr.ht/~sircmpwn/dowork/)

[^2]: Update 2020-10-07: We've successfully tested using [SO_REUSEPORT](https://github.com/kavu/go_reuseport) to allow the replacement daemon to start up before the defunct daemon starts shutting down, which completely eliminates the window during which connections could be dropped. We still need to work on coaxing OpenRC into handling this service lifecycle; we'll likely write a follow-up post about this.
