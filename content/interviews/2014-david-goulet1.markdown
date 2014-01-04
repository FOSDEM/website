---
year: 2014
person: David Goulet
speaker: david_goulet
topic: "Linux tracing with LTTng: The love of development without printf()"
event: linux_tracing_with_lttng 
---

Q: Could you briefly introduce yourself?

I'm the maintainer of lttng-tools, one of the component in the [LTTng](https://lttng.org/) toolchain. I've been doing full time development work for almost 3 years now on this project.

Q: What will your talk be about, exactly? Why this topic? And what do you hope to accomplish by giving this talk? What do you expect?

With the 2.x version of LTTng, we've done a lot of work in the last three years making tracing a new tool that not only Linux kernel developers can use but also system administrators and user space developers.

This talk will be about introducing Linux tracing with LTTng, showing how it can be used easily to help develop and maintain user space applications. I'll also give an overview of the new features we've added in the last years.

The goal is to show, hands on, how tracing is now accessible to everyone from web developers to low-level C developers, and to improve collaboration.

Q: What's the history of the LTTng project? How did it start and how has it evolved in all those years?

It started with LTT written in 1999 by Karim Yaghmour. After some time, while in his doctorate study, Mathieu Desnoyers took back the project and in 2005 he created LTTng (Linux Trace Toolkit Next Generation).

Some technology that the LTTng project developed, like "markers" and "tracepoints", went into the mainline kernel. After a while, a decision was made to turn the LTTng kernel tracer into modules (not needing any patches to the kernel) and thus stay out of the kernel.

Also, in 2009 a user space tracer, based on the kernel tracer technology, was created by Pierre-Marc Fournier and a year later rewritten by Mathieu Desnoyers. It's worth mentioning that the user space tracer (UST) does *not* depend on the kernel tracer thus you can have both or only one of them on the same machine working.

Q: What are currently the biggest limitations of LTTng? And on the other hand, what tasks is LLTng really good at?

LTTng does *not* support user space dynamic tracing, meaning tracing an application that was previously not instrumented with LTTng tracepoints. But we are working on that! :)

We still don't have user space perf counters support, but this is coming in 2014!

LTTng is good at performance and low intrusiveness. I'll be showing some impressive benchmarks we did about that.

Q: Do you have some plans to merge LTTng or some parts of it into the Linux kernel? For instance, is it possible to share some code with Perf and Ftrace?

As of now, there is no immediate plan to get into mainline. Of course we are *always* working closely with the core Linux kernel developer on anything that can affect tracing.

We are not in the Linux kernel but we do contribute to the kernel community in many ways.

Q: Which new features can we expect in 2014 in LTTng?

Some of the expected features:

* Kernel tracing filtering, meaning you can apply filters to a tracing session like for instance if a particular event payload "int i" reaches the value of 10, you can start ignoring it.
* User space perf counters.
* A lot of improvement in LTTng usability.

There is much more, so come to our talk! :)

Q: Have you enjoyed previous FOSDEM editions?

This will be my first one! :)

It's been a while that the LTTng project was looking forward to send someone to FOSDEM and this year is the first of many! :)
