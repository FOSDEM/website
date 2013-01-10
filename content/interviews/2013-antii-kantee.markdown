---
year: 2013
person: Antti Kantee
speaker: antti_kantee 
topic: The Anykernel and Rump Kernels
event: operating_systems_anykernel 
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I've been toying with open source operating systems since high school, first with Linux and later with the BSDs.  I've contributed to a number of open source projects, but to none more than to [NetBSD](http://www.netbsd.org/) where I've worked from third party packages to userspace utilities to documentation to pretty much all corners of the kernel. I believe my most widely ported open source code is CIRCLEQ_LOOP_NEXT/PREV() in [queue.h](http://ftp.netbsd.org/pub/NetBSD/NetBSD-current/src/sys/sys/queue.h) back from 2005 when I needed to cycle through billboards in an early mobile 3D virtual reality application -- it's my ironic not-quite 15 lines of fame which took not-quite 15 minutes to implement.

Q:  What will your talk be about, exactly? Why this topic?

I finished my doctoral work on the subject some weeks ago.  While I consider the NetBSD implementation my main contribution, for graduation purposes I had to produce several hundred pages of text and pictures. I can refer to [my dissertation](http://lib.tkk.fi/Diss/2012/isbn9789526049175/isbn9789526049175.pdf) for technical details and figures and instead concentrate on giving an enjoyable and understandable talk.

I'll talk about the [anykernel](http://www.netbsd.org/docs/rump/), which is a slightly tongue-in-cheek term I came up with for describing an operating system where drivers are not restricted to a single kernel organization (monolithic, microkernel, exokernel, etc.). By drivers I mean the wider concept including for example file system drivers and networking protocol drivers and focus less on hardware device drivers.  Currently, NetBSD is the only anykernel.

A related concept is a _rump kernel_, which is a virtualized instance of a driver or set of drivers running outside of the monolithic kernel. A rump kernel is not a virtualized OS instance.  You could think of a rump kernel as _"kernel-as-a-service"_ (guess that's KaaS, then).  A rump kernel is similar to POSIX 1003.13 Profile 51 which means the minimum runtime is a single process without a file system.  However, it is not restricted to such a minimalist configuration, and it is possible to make requests to a rump kernel from multiple address spaces, including over the network. One way to think of a rump kernel is to think of a kernel driver running as a library inside a userspace process, although the concept is wider.

After graduation I've been taking some time off to work on a few features which make the implementation usable beyond NetBSD, so the talk is also a good place to introduce those.

If the above seemed abstract, don't worry, I plan to show demos during the talk for a more enlightening view of what's going on.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The first goal is to introduce the work to potential users, both programmers and non-programmers.  The second goal is to argue to people working on the kernel side that's there's really no excuse for not implementing a general purpose OS as an anykernel.  Third, in the spirit of open source, I'll present some work currently looking for a volunteer.  Most of the suggested work items are not very difficult, and most of them require a person with a skillset disjoint from my own.

Q: What's the history of the anykernel and rump kernel projects in NetBSD? Why were they invented?

The original itch was virtual machines being too clumsy for kernel filesystem development.  I had written a userspace file systems framework for NetBSD, an equivalent of the now-ubiquitous [FUSE](http://fuse.sourceforge.net/), and noticed how much nicer it was to develop file systems in userspace.  However, a userspace file system framework did not enable running existing kernel file system drivers in userspace -- understanding this distinction between framework and implementation is very important!  For kernel development you still had to run a full virtual machine.

It took about two weeks to make NetBSD kernel FFS driver run as a userspace server, most of which was spent on fixing bugs in my code for block offset calculations.  Then it took about 4 years to figure out some additional details, including how to avoid having to reimplement the difficult block offset calculations.

Q: What is the difference between a NetBSD rump kernel and operating-system level virtualization on Linux, such as OpenVZ and LXC?

This is a good question.  The goals of these approaches are different and they do not have much in common apart from providing a virtual instance of the kernel's namespaces (directory tree, fd, network configuration, etc.).  OS level virtualization is concerned with how to provide multiple disjoint application environments in a low-overhead fashion.  In other words, you have one copy of code use it to simulate n sets of namespaces. With rump kernels, you have n isolated copies of the driver code (though using shared libraries is possible).  Anything that happens in one rump kernel, such as code changes or runtime crashes, will not affect others.

Q: What are the most common use cases for rump kernels?

Kernel driver testing is a big one, cf. my original motivation. The official NetBSD continuous testing runs alone bootstrap over 10k rump kernels daily with some tests using several rump kernels for problems such as network code testing.  A few of the tests are for experimental kernel features where testing may cause kernel panics.  The ability to easily detect and analyze kernel driver failures is one of the winning aspects of rump kernels in this use case.

A more user-oriented use case is security.  Making disk-based file system drivers secure against untrusted images is all but impossible. This problem has been published years ago, but unfortunately it is very little talked about.  Every time you mount an untrusted file system image (e.g. USB stick, DVD) with a file system driver running in a monolithic kernel, you are taking a security risk.  On NetBSD, you can isolate the file system driver instance from the monolithic kernel totally transparently into a userspace server by giving the `-o rump` flag to mount when mounting a file system of fishy provenance. And no, if you think about it, you'll realize FUSE alone does not form the entire solution.

Q: What is the performance overhead of rump kernels in NetBSD 6?

A rump kernel runs as native code on the CPU without instruction-level emulation or virtualization.  Performance differences come from making requests and the hypervisor doing I/O.  A null system call into a local rump kernel is approximately twice as fast as a system call into the native kernel (as measured on an x86), i.e. that overhead is negative.

I/O speed depends on how you access the I/O device from the rump kernel hypervisor.  For example, some file system operations run faster from userspace because of more aggressive caching.  Some file system operations run slower because a userspace process does not have as much control as the kernel over the synchronous writing of metadata blocks, which is necessary for maintaining file system integrity.

Let's examine overhead also from a virtualization perspective. The bootstrap time for a rump kernel on my laptop from 2007 is 10 milliseconds give or take some milliseconds.  The memory overhead is one megabyte give or take some bytes depending on the exact configuration. Unless you are constantly starting and stopping tens of thousands of rump kernels, the practical overhead is negligible.  For example, if mounting a file system takes 10ms longer, you are not going to notice a difference, but 100ms is already perceivable to humans.

To offer another perspective for performance, using rump kernels allows you to customize drivers, e.g. the TCP/IP stack, precisely to the needs of a high-performance application without having to worry about everything else running on the same host.  I'd like to raise a counter-question: what is the overhead of using a non-optimized driver for a performance-critical application?

Q: In which circumstances could a rump kernel on a non-NetBSD platform be interesting?

The question I've been asked most often over the years is if it's possible to take the NetBSD TCP/IP stack and plug it into another system.  A full-featured open source TCP/IP stack with IPv6, IPsec, routing etc. with clear component interfaces is an interesting option for embedded vendors who do not want to ship an entire open source OS kernel due to e.g. size concerns and do not have the resources for an implementation maintained in-house.

On the other end of the spectrum, we have interoperability between systems.  Since running NetBSD kernel file system drivers is possible on non-NetBSD platforms, it is always possible to access a file system which was mounted on a NetBSD host even if no native version or userspace reimplementation of the driver exists.  This puts a twist on the worn-out "NetBSD is portable" adage.

Q: On which hypervisors can a NetBSD rump kernel run?

A rump kernel runs on a hypervisor called rumpuser which implements a set of high-level operations such as "create a thread" and "allocate a page of memory".  My [crossbuild script](https://github.com/anttikantee/buildrump.sh) hosted on GitHub can build NetBSD-based rump kernels on Linux, FreeBSD, DragonFly BSD and Solaris. To give an example, I've used a NetBSD-based rump kernel on a Raspberry Pi running Arch Linux.  I've also run NetBSD-based rump kernels on Windows and [a web browser's JavaScript engine](https://blog.netbsd.org/tnf/entry/kernel_drivers_compiled_to_javascript), so if you have a wild imagination, only the sky is the limit.

Discussing the hypervisors from a hypothetical perspective is interesting too.  Since the hypercall interface places very few requirements on the host and does not mandate an MMU, it should be possible to implement the hypervisor on the simplest of hosts, e.g. directly on top of a firmware on an embedded system.

Q: Have you enjoyed previous FOSDEM editions?

FOSDEM 2012 was my first time, but I was extremely impressed by the conference and the organization.  In addition to the technical content, I was pleasantly surprised by the offerings of the cafe.
