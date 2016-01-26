---
year: 2016
speaker: james_bottomley
event: namespaces_and_cgroups 
---

Q: Could you briefly introduce yourself? 

Sure, I'm James Bottomley.  I have a long history in Open Source, mostly the Linux Kernel in SCSI and obscure architectures (Voyager and PA-RISC).  I've also done forays into Secure Boot and other community-relevant topics.  In recent years, I've been concentrating on Containers as well as various legal issues around Open Source communities.

Q: What will your talk be about, exactly? Why this topic?

It will be about the native container interfaces in Linux.  Most people only know containers through the orchestration systems like [LXC](https://linuxcontainers.org/lxc/)/[LXD](https://linuxcontainers.org/lxd/) or [Virtuozzo](http://www.virtuozzo.com/) or [Docker](https://www.docker.com/); Indeed, with all the hype, most people think Docker is containers.  However the containers these orchestration systems create don't use the full power of the native interfaces because they're designed for a specific orchestration purpose.  The object of this talk is to give an introduction to the native interfaces and show what they can do outside of orchestration systems.  The interfaces are very complex, which is usually a disincentive, but in this case I'm hoping it will be seen more as a challenge by the technical audience.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Containers today are all the rage, but if you look at what they're used for (orchestrating lightweight virtual environments) you see that virtual machine technology like [Clear Linux](https://clearlinux.org/) is determined to catch up (perhaps we've poked the bear once too often with talks about fat, bloated hypervisors).  Once it does, there will be no more need to use containers: If a VM can boot a lightweight environment in the same time as a container with the same density, why would you use a container at all?  When that happens, containers will once again be relegated to being niche technology only used by things like systemd.

What we need to do to keep containers viable and exciting is find uses that aren't simply lightweight isolation environments.  The big advantage containers have over virtual machines is their ability to be granular (you only have to use parts of the virtualization, not the whole) and their capacity for sharing.  Hopefully by exposing how containers work at a low level to a technical audience, one of them might be interested enough to come up with a great use case that goes beyond anything we've seen today.

Q: Containers have been around for some time now, but they have only become popular during the last few years. Look at the success of Docker. Why has this taken so much time?

Yes, containers, by some counts, are an older technology even than virtual machines.  The reason for their limited success up to this point is that they've always been seen as a lightweight alternative to virtual machines.  However, as a new technology, they work differently and, for the enterprise, that difference coupled with the fact that oversocked enterprise data centres could amply afford to pay the resource penalty for using virtual machines meant that there was no compelling use cases for containers.  Of course, they found a stronghold in the service provider space (and in the Googleplex), which does care about density and performance, so they've always been in use, but it's the enterprise that gets 95% of the press coverage, so containers never really got talked about.

Now, with Docker, that is all apparently changed.  However, if you examine Docker closely, you see it's a packaging and orchestration system that uses container technology to function.  This reliance on containers makes them seem like the essential new technology but, in fact, what the enterprise really wants is the lightweight packaging description Docker (and now [App Container](https://github.com/appc)) provides.  It's this that allows the agility speed up in the enterprise DevOps cycle.  So it's this use case which is driving the sudden interest in containers.  They'd always been around before but now there's a compelling use case for the enterprise to take them seriously.

Q: What are some interesting properties of containers for developers of free and open source software?

There are various stories about where containers came from, all the way from mainframes, via BSD jails and finally Solaris zones; none seems to be entirely accurate.  However, what's indisputable in the past few years is that all of the container innovation at the kernel interface level has being going on in Linux with the transformations involved in cgroup hierarchies and the addition of new namespaces.  So, I'd say the most interesting property of containers today for FOSS is that this is a technology where Linux is truly leading innovation and other operating systems are scrambling to get on board the bandwagon.

Q: What are some interesting recent developments in container technology that we should keep an eye on?

Within the kernel itself the most significant transformation is the move to what is now being called cgroups v2.  Essentially the problem has always been that the way cgroups v1 was constructed didn't allow for easy nesting (and without that you can't easily do nested containers).  This was largely because of confusions within the v1 interfaces, so the v2 interfaces are designed from the ground up to have a clean separation of control and hierarchy so now you have much more flexibility with what you can actually do with cgroups.  What we should be watching carefully is whether this expanded flexibility actually leads to any new applications of container technology.

Q: Have you enjoyed previous FOSDEM editions?

Actually, this will be my first time ever going to FOSDEM, so no, I haven't.  I've heard great things from other people, of course, but hearing isn't the same as actually being there.
