---
year: 2019
speaker: jeremie_galarneau 
event: lttng
---

Q: Could you briefly introduce yourself?

I’m Jérémie Galarneau, and I’m Vice President at [EfficiOS](https://www.efficios.com/), a
consulting firm specialized in operating system efficiency research
and development. I have been working on tracing tools for the last six
years and I‘m the maintainer of the [LTTng-tools](https://github.com/lttng/lttng-tools) and [Babeltrace](https://diamon.org/babeltrace/)
projects.

Q: What will your talk be about, exactly? Why this topic? And what do you hope to accomplish by giving this talk? What do you expect?

Typically, when people think of system tracers (such as LTTng, perf,
ftrace, etc.), they think that the information that they capture can
only help kernel developers hunting down driver bugs, race conditions
and the like. While those have been the traditional use-cases for
system tracers, there is now a growing number of users using LTTng in
production to monitor their infrastructure at a very low level.

Over time, we have interacted a lot with those users and we have been
working on LTTng to make it easier to use in those scenarios. There is
a part of the talk that will show the steps that we took to do so. The
biggest step so far has been the addition of a “session rotation”
feature, which Julien Desfossez presented last year at FOSDEM, that
has now been upstreamed in the project.

Because collecting traces continuously has now been made easier, we’re
noticing that existing system trace processing tools don’t really
scale all that well and are hard to integrate in existing monitoring
tools. Hence, another part of the presentation will show the new
challenges that our users are now facing.

I have started to work on some ideas to distribute trace processing
and I’ll show an early prototype implementing those ideas at the end
of the presentation. I really look forward to discussing this topic
with attendees. I also hope to get the feedback of people who deal
with performance and latency problems day to day.

Q: What's the history of the LLTng project? What are its biggest milestones?

[LTTng](https://lttng.org/) (Linux Trace Toolkit Next Generation) is the successor of LTT, a
project that was started in the late 90s. LTTng itself was started in
2005 by Mathieu Desnoyers. For a while, LTTng was a set of kernel
patches that needed to be applied to a vanilla kernel.

Since the 2.x series, the development of which started around 2010,
the project no longer requires any sort of kernel modifications. The
project also shifted its focus towards production use-cases and
started to provide LTTng-UST, a user-space tracer that applies a lot
of the ideas used in the kernel tracer.

Q: Tracing and logging have a lot in common. But what are the differences and how does that impact the trade-offs you have to make in LTTng?

That’s one of the question I get the most often! Tracers are not
completely different from loggers. In a sense, they are both used to
save information used to understand the state of an application or of
the kernel. The fundamental difference lies in the throughput that
both are expected to deal with.

Typically, loggers handle high-level events in the form of text
strings. Conversely, system tracers will tend to focus on very
frequent, low-level, events such as system calls, scheduling events,
filesystem operations, etc.

To give you an idea, on a busy 8-core server, LTTng has to cope with
around 3 million events per second. Capturing this magnitude of
information requires a number of strategies to minimize the space and
run-time cost of each event.

One that is immediately apparent to users is that LTTng traces are
stored in a binary format and require a decoder, typically Babeltrace,
to read its traces. Otherwise, the fact that we want to allow changes
to the tracing configuration (enabling events, filtering, etc.) “on
the fly”, without disrupting the target or restarting applications,
means that we have to use a number of lockless and wait-free data
structures and think very carefully about any change that we make.
Those constraints make LTTng a very challenging project to work on,
but it is also very fun and rewarding!

Q: Last year saw the introduction of a session rotation mode in LTTng, which makes it easier to integrate fine-grained monitoring in production environments. How does this work and what were the biggest challenges in implementing this mode?

The binary trace format LTTng produces can’t be read while it is being
produced. Essentially, this has forced users to capture a trace for a
given period, and then perform their analysis once the tracing was
stopped. This did not really allow continuous monitoring of systems.
In effect, most users were using a “sampling” approach and would hope
that they could capture problems while tracing was active.

At the same time, we got requests from users to add support for
various message queues in LTTng as a way to make it easier to
transport traces. What we figured is that we needed to implement
something resembling log rotations, but for traces. The session
rotation feature allows the user to trace and specify a time interval
or size threshold after which the tracer must write to a new trace. At
that point, it becomes safe to work with the old trace, send it over
the network, or discard it.

The main challenge we encountered is that supporting this required a
lot of changes to the core of our trace control infrastructure. It has
also meant that we had to change our trace streaming network protocol,
while maintaining backward compatibility. Making those changes was
half of the battle, since there was also a long period of back and
forth with our users to improve the stability and usability of the
feature. LTTng 2.11, the first release since this feature was merged
is now in the “release candidate” phase and we’re very excited to
finally make this available to everyone in a stable release.

Q: What does the LTTng project's community look like? How can interested developers contribute? In which domains could you use some help?

The core developers working full-time on LTTng are employed by
EfficiOS, but we also collaborate with the DORSAL laboratory of École
Polytechnique in Montréal (Canada). We get contributions from a fairly
diverse crowd as LTTng is used anywhere from embedded systems to
servers, under very different constraints.

Right now the domain where we could use the most help is in the
visualization tools. It is very challenging to present the information
we extract with LTTng in an intuitive way and anyone willing to
contribute code, ideas, or prototypes would help us tremendously.

However, I’ll take the chance to say that taking a few minutes to
provide feedback, whether you are an experienced user or a newcomer,
is also a great contribution as we are always trying to improve the
ease of use of LTTng.

Q: Which new features can we expect this year in LTTng?

There are a number of upcoming features that our users have been
requesting for a long time and that we are finally getting the chance
to work on this year. One of them is what we call “container
awareness” and, in fact, Michael Jeanson will be [presenting a talk about this](https://fosdem.org/2019/schedule/event/containers_lttng/) at FOSDEM!

Another one is the support for triggers. To make a long story short,
we want to make it possible to use existing kernel and application
instrumentation to control tracing and emit notifications. For
instance, this would allow you to start tracing when a given system
call returns an error, or if your application calls into a trace point
with a given argument value. In a lot of ways, this feature is the
next step to what I’m presenting in my talk.

Q: Have you enjoyed previous FOSDEM editions?

Absolutely! FOSDEM is one of the few conferences that is all about
collaboration between projects and getting project developers and
users to meet face to face. Also, given the scope of FOSDEM, it has
allowed me to get the perspective of people with very different
backgrounds, or who contribute to completely unrelated projects, on
the challenges we face in developing LTTng. It’s also a great forum to
get the wish list of our users!
