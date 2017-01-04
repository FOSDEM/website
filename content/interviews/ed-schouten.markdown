---
year: 2017
speaker: ed_schouten 
event: cloudabi
---

Q: Could you briefly introduce yourself?

My name is Ed Schouten and I've been a F/OSS enthusiast since 2003.
Back when I started studying, I decided to join my university's UNIX
Users Group ('Dispuut Interlink'). Over there, a bunch of us worked on
all sorts of wacky projects. I remember that at one point we even
managed to get [FreeBSD running on the original Microsoft Xbox](https://www.freebsd.org/platforms/xbox.html), which was lots of fun.

Later on I worked on various other projects for FreeBSD in the areas
of terminals, consoles, compilers ([LLVM](https://wiki.freebsd.org/BuildingFreeBSDWithClang)), code quality and
POSIX/C standards conformance. I've been a developer for the FreeBSD
project since 2008 and for the LLVM project since 2009. Lately I've
also been contributing to the [Prometheus monitoring system](https://prometheus.io/), which I think is a pretty nice project.

Q: What will your talk be about, exactly?

I'm going to give a talk about a project I've been working on, called
[CloudABI](https://nuxi.nl/). CloudABI is a framework that allows you to design C, C++ and
Python programs that are very strongly sandboxed and easier to test
and deploy. It realises this by enforcing the use of [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection).
Programs can no longer open files on disk or connect to hosts on the
network arbitrarily; they must be injected into the program in the
form of file descriptors. This model makes it even possible to safely
run programs that you don't trust at all, as long as you don't provide
them file descriptors to things that should remain off-limits.

Q: What's the history of the CloudABI project? Why did you start it and how did it evolve?

Mid 2014 I was working on a spare-time project where I was trying to
build a distributed/replicated database where you could use Google's
[Dart](https://www.dartlang.org/) to write stored procedures. The
entire thing was obviously far too ambitious for a spare-time project,
but it was a good excuse to experiment with new tools and libraries.

One of the things that I wanted to do was to make use sandboxing, so
that if there is a security bug in the Dart virtual machine, the
impact would still be minimal. What I learned very early on is that if
you're writing a program that uses third party libraries, it is
practically impossible to use conventional sandboxing techniques like
Linux's [seccomp](http://man7.org/linux/man-pages/man2/seccomp.2.html)
and FreeBSD's [Capsicum](https://www.freebsd.org/cgi/man.cgi?query=capsicum&sektion=4). Even
if you write sandboxing-aware code yourself, it doesn't mean that the
libraries you use will behave properly when sandboxing is enabled. The
worst example that I encountered was a crypto library that if
denied access to /dev/urandom, used unsafe random seeds for its crypto
algorithms without any warnings or log messages. This means that
sandboxing may potentially reduce the security of a piece of software,
which is just silly.

This triggered me to start working on CloudABI, which is essentially a
separate environment in which programs are always sandboxed. Unlike
seccomp and Capsicum, programs don't switch into a sandboxed mode
where features are disabled selectively. These features have been
removed entirely, so that existing code will fail to build exactly in
those places where it needs to be adjusted. This may sound bad at
first, but trust me: fixing the code to build is a lot easier than
tracking down regressions due to sandboxing at runtime.

Early 2015 I had support for running CloudABI programs on FreeBSD,
which got upstreamed relatively quickly. Linux and NetBSD support
followed a couple of months later. That same year we also started
working on [a package collection for CloudABI](https://github.com/NuxiNL/cloudabi-ports), meaning that if you're
interested in a sandboxing-enabled copy of a certain library (e.g.,
crypto, image/video processing), there is a chance there's already a
binary package available for you.

In 2016 we also added support for running CloudABI programs on macOS
and extended the number of supported hardware platforms. CloudABI is
now available for x86-32, x86-64, ARMv6 and ARM64.

Q: Why would I use CloudABI to isolate/secure an application instead of virtualization, containers, Capsicum, SELinux, seccomp, ...?

When compared to Capsicum and seccomp, I'd argue that CloudABI is a
lot less painful to use. Instead of potentially spending a lot of time
trying to figure out why your program only works partially when
sandboxing is enabled, you'll already uncover those kinds of issues
during development.

SELinux and AppArmor are implementations of discretionary/mandatory
access control systems, whereas CloudABI is capability-based. The
downside of SELinux and AppArmor is that the policies that you put in
place are fairly redundant. They essentially rehash what you already
explained in a program's configuration file. With CloudABI, a
configuration file essentially is the program's security policy. It's
guaranteed to be correct.

Virtual machines and containers have the downside of reducing
transparency and debuggability. They also tend to make networking more
complex, as they often need to be attached to bridged/NAT networks.
They therefore tend not to improve security, but move the
responsibility to a different domain. CloudABI programs are just
traditional UNIX programs, except that they allow for isolation by
default. "Keep it simple, stupid!"

Q: What do I need to do to make an application use CloudABI? Is it much work?

The most important thing that you'll need to do is to build your
application using a cross compiler for CloudABI. Though this may sound
very scary at first, there is some good news: the latest releases of
LLVM/Clang can target CloudABI out of the box, so there is a chance
your distro's copy of Clang is already sufficient. After you've
installed a prebuilt copy of CloudABI's standard C library from our
package repository, you should be able to build programs for CloudABI.

The second party to the story is that you also need to use an
operating system capable of running CloudABI programs. FreeBSD 11.0
and later ship with CloudABI kernel modules, but Linux still requires
a set of patches. Eventually we want to get to the point where Linux
can also be supported through a kernel module, but that still requires
more work.

Q: How does the project's community look like? How many contributors are there? How can interested people help?

Right now our community is still fairly small. There's an IRC channel
(#cloudabi on EFnet) on which 20 people hang out, but the number of
actual contributors is about a handful. We're always interested in
attracting more people who want to help out, as there is lots of stuff
to be done and many options to explore.

I can think of a couple of things where the project could be improved a lot:

- First of all, we should have more applications ported over. We
initially spent a lot of time porting many commonly used libraries
over to CloudABI, as they are a prerequisite for getting most
applications to build. Now that we've demonstrated that that's
feasible, we should shift the focus towards getting actual
applications ported over. Are you the maintainer of a C/C++ project?
Regardless of how simple or complex your software is, be sure to
experiment with pulling your code through CloudABI's cross compiler to
see what happens.

- Streamline the process of using CloudABI on Linux. I'm not going to
lie: using CloudABI on Linux is pretty hard compared to using it on
FreeBSD and macOS. We really need better cooperation with both the
Linux kernel maintainers and the people working on Linux
distributions. Are you a fanatic of a certain Linux distribution and
dying to see CloudABI be readily available for your favourite distro?
Be sure to get in touch with us!

Q: What do you hope to accomplish by giving this talk? What do you expect?

The idea behind CloudABI is that we're trying to create more secure
software by removing features from UNIX that provide bad security and
isolation, as opposed to adding yet another framework to 'staple on
security' afterwards. I hope that by giving my talk, people understand
that writing securely sandboxed software doesn't need to be hard, it
can be easy and fun as well.

My goal is to trigger people to help us to achieve our goal, which is
to end up with computers on which running sandboxed programs is the
norm; not the exception.

Q: Which new features can we expect this year in CloudABI?

One of the things that I'd love to see happen personally is that we
provide support for more programming languages. Right now we support
C/C++ and have a working port of Python, but lots of new software is
also being written in languages like Java, Go and Rust. It would be
awesome if we could welcome software developers from those communities
as well.

Q: Have you enjoyed previous FOSDEM editions?

Yes! The first edition of FOSDEM I went to was back in 2004. Since
then I only skipped the conference twice. Once because of a wedding,
and another time because I was invited to speak at Linux.conf.au,
which happened to be at the same time. This means that I'm going to
attend FOSDEM for the twelfth time!

What I like about FOSDEM is that it's a really great venue for meeting
up with communities of many different Open Source projects. I can only
hope that CloudABI will have its own developer room at some point in
time. ;-)
