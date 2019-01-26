---
year: 2019
speaker: kyle_rankin
event: cloud_is_another_sun
---

Q: Could you briefly introduce yourself?

My name is Kyle Rankin and I'm a long-time Linux user both as a desktop and
as a server. I'm the Chief Security Officer at [Purism](https://puri.sm/), SPC, a company that
makes security- and privacy-focused laptops (and soon a phone) that run
free software. I'm also a columnist and editor for Linux Journal magazine
and have authored a number of books on security, systems administration,
and Linux in general for many different publishers.

Q: What will your talk be about, exactly? Why this topic?

My talk will compare the proprietary server platforms of the past, in
particular Sun hardware and its Solaris OS, with the current dominant
proprietary OS for servers ---infrastructure cloud providers. I chose this
topic because I've noticed that due to all of the gains Linux and FOSS have
made in the world, we have collectively started to forget the problems with
proprietary software and vendor lock-in. The cloud today is just as
proprietary as Sun and Solaris were twenty years ago but with a greater
risk of lock-in. If you use the cloud as vendors encourage you to, you do
not interact with Linux or FOSS ---just some proprietary APIs and services.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to remind people of the problems with proprietary operating systems
and vendor lock-in, and point out that Linux's current dominance in cloud
servers isn't a given. If trends continue down their current path, there's
nothing stopping cloud providers from replacing Linux and FOSS-backed
services with proprietary ones.

Q: Linux and FOSS have killed proprietary UNIX systems such as Solaris. What were the most important reasons behind this success?

The main reasons for Linux and FOSS's success over Solaris were its faster
pace of improvements, and the fact that it could run on all sorts of
hardware. One of the first things many Solaris administrators did was
install GNU tools over the top of the ancient included command-line tools
to get more up-to-date features.

I also can't understate the importance of the Apache web server and the
fact that its innovative virtual host feature allowed people to host more
than one website on a piece of hardware during the initial dotcom boom.
This allowed people to throw Linux, Apache, MySQL and Perl on a commodity
x86 server and host multiple websites. If you are selling expensive server
hardware, you have less of an incentive to add features like that to your
own proprietary web server.

Sun developed very ingenious and sophisticated hardware for
high-performance and high-redundancy workloads, but those advanced features
made the servers very expensive. Linux could run on commodity x86 hardware
so engineers started facing a choice between a $200k Sun server with
sophisticated hot-swap CPUs and RAM or a few $3-5k commodity servers
running Linux in a cluster. Commodity hardware won.

Q: In the last decade, more or less the whole computer industry switched to using cloud services. Unfortunately, most of them are proprietary, even if they build upon FOSS. How can we get back our freedom from these proprietary cloud services? Can we use some lessons from our victory over proprietary UNIXes?

The most important thing people can do is resist the urge to use all of the
proprietary features and APIs these cloud providers tempt you with. They
are banking on features that lock you into their platform and make it
incredibly expensive to move to a competitor.

One of the ways that Linux won over proprietary UNIXes was by providing
cross-platform compatibility with not just the OS, but most of the
services. Because it was freed from the hidden requirement to lock users
into a particular platform, it created its own open ecosystem of tools.
Adapted to cloud infrastructure, it means the community would ideally focus
on tools that allow people to switch between cloud providers, and would
also provide similar features as some of the proprietary cloud providers,
but without the proprietary APIs and lock-in.

Q: What's currently the biggest threat of proprietary cloud services?

The biggest threat is losing the current set of open protocols and
interoperability we still enjoy on the Internet. We take for granted that a
network service will probably use an open standard to communicate and that
cloud providers will support our favorite FOSS tools, but when you consider
how many cloud customers do not interact with Linux or FOSS at all, but
just write API glue code and interact via a web interface, there's no
reason that those FOSS services that are hiding behind this proprietary API
couldn't be replaced with a proprietary service.

Once these vendors have a critical mass of customers, they have an
incentive to keep them. That creates a perverse incentive to reduce
interoperability so customers can't move to a competitor easily, and if any
one of these cloud vendors gets ultimate market dominance, it opens up the
possibility for them to dictate new network protocols and server frameworks
that only they control.

Q: What can interested FOSS developers do to contribute to more freedom in the cloud? In which domains do you suggest they should look?

First I would suggest that developers vote with their wallet and support
providers that themselves support open standards and avoid proprietary APIs
that lock you into their platform. Second I'd suggest that if developers do
choose a proprietary cloud provider, that they resist the urge to use all
of their proprietary tools and instead take a more traditional approach of
building services on that platform using FOSS tools and services fully
under their own control. Finally, help the cause by developing modern FOSS
tools that provide developers and administrators better (and
cross-platform) features than the proprietary services.

Q: You're Chief Security Officer at Purism. The company has developed the Librem 13 and 15 laptops, the Librem key and the PureOS operating system, and now it's developing the Librem 5 smartphone. How does the cloud come into the picture at Purism?

We will be offering a bundle of services to be announced later this quarter
and will continue to expand this initial bundle. That's all I can say right
now :-)

Q: Have you enjoyed previous FOSDEM editions?

This will be my first FOSDEM! I've heard so many good things I can't wait
to be there!
