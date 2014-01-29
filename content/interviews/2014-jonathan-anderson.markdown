---
year: 2014
person: Jonathan Anderson 
speaker: jonathan_anderson
topic: "Capsicum: Practical capabilities for UNIX"
event: capsicum 
---

Q: Could you briefly introduce yourself?

I’m a FreeBSD developer, postdoc at the University of Cambridge and soon to be an Assistant Professor [in the Engineering faculty of Memorial University](http://www.engr.mun.ca/~anderson/).

Q: What will your talk be about, exactly? Why this topic?

I will talk about why we need [Capsicum](http://www.cl.cam.ac.uk/research/security/capsicum/), how it works, who uses it and what’s next — some exciting new developments.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope that attendees will learn a little bit about different approaches to OS security, their strengths and weaknesses, and come to agree that the Capsicum model is the most appropriate tool for application sandboxing in contemporary UNIX-like operating systems. And then they’ll use it. ;)

Q: What's the history of the Capsicum project? How did it evolve? And what's your role in it?

The ideas behind Capsicum grew out of a previous research program that my colleague Robert Watson was involved in — a program that directly sparked FreeBSD’s (and OS X’s / iOS’s) Mandatory Access Control framework. Robert started blending the principles of capability systems into FreeBSD in 2006 or so, and I joined him in 2009. I worked on filesystem namespace subsetting, runtime linker changes and our application support library, as well as merging our changes into mainline FreeBSD. Since then, Pawel Dawidek has done a lot of work on our system call API and file descriptor implementation, deploying Capsicum throughout the base system and a new capability service provider called Casper.

Q: Google's Chromium web browser is the best known project that is using Capsicum primitives. Which other projects are using it? And which FreeBSD base system utilities have already been modified?

The OpenSSH team have added Capsicum support upstream when running on platforms that provide it. Currently that’s just FreeBSD, but the DragonflyBSD people are actively kicking Capsicum’s tires and we also have discussions with... companies. Various companies.

In the FreeBSD base system, we use Capsicum in auditdistd, ctld (the CAM Target Layer / iSCSI target daemon), Casper, dhclient, hastd (the High Availability Storage daemon), iscsid, kdump (the KTrace binary log parser), rwho, rwhod, tcpdump and uniq.

Q: Suppose I'm a developer of an open source project and I'm interested in adding Capsicum capabilities to my application, where do I start? And how many modifications would my code need?

That depends on the structure of your application. There is actually a parallel to linking: rights that can be described statically can also be sandboxed with static code, whereas the dynamic acquisition of rights demands an external helper (Casper, our moral equivalent of a runtime linker).

If you have an application that opens files and then does work, it’s extremely simple: just a few lines of code to restrict your file descriptors and then enter capability mode. If your application needs to acquire arbitrary access after entering the least-privileged capability mode, however, some external privileged thing needs to pass those rights in on demand, which is where Casper (or the application framework, talking to Casper) comes in.

Q: There have already been adaptations of Capsicum to Linux and DragonFlyBSD. Is it possible for an application to support the three Capsicum implementations with the same code? Or are there differences?

The Capsicum API is intended to be portable across all UNIX-like implementations. We are aiming for 100% API compatibility with the Linux port (although as a work-in-progress it currently targets the older, experimental API rather than the final, production one). We’ve had discussions with the DragonFly people.

Q: Which new features can we expect in Capsicum in FreeBSD 10.1 and future versions?

The kernel API should be stable now, so much of the future work will be in making it easier for complex applications to use Capsicum. FreeBSD 11 (and probably 10.1, or if not then 10.2) will include Casper, and I’ll be making some changes to the runtime linker to make it easier to start untrusted applications from within a sandbox, allowing us to explore capability-oriented shells!

Q: Have you enjoyed previous FOSDEM editions?

This will be my first FOSDEM, but I’m looking forward to it!
