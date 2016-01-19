---
year: 2016
speaker: amit_shah 
event: live_migration
---

Q: Could you briefly introduce yourself? 

I'm Amit Shah, a software developer from India.  I am currently employed at Red Hat, where I've been working on QEMU/KVM virtualization for the last 8 years.  I've been a Linux developer for about 15 years, and have had the privilege to be employed working on Free Software for most of my working life.  Outside computers, I'm interested in and learning photography, and am an active practitioner of the Kyokushin style of Karate.

Q: What will your talk be about, exactly? Why this topic?

I'm talking about the challenges various use-cases have on virtualization software, especially the live migration aspect of it. There are various ways in which virtualization gets used, from personal computers, to datacenters, to infrastructure clouds.  Each have their unique set of requirements.  We, as the developers of the lower layers of the stack, need to cater to these varying needs while ensuring to not break anything.

As to why I chose this topic: I've been co-maintaining the QEMU live migration support for a while now, and have had the opportunity to talk to several people involved who use our stack.  I'm happy to have this opportunity to share some of the findings.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The more information out there, the better for everyone.  It serves as more documentation for projects; higher level / management software developers can get to know the technologies at work at the lower levels; and users know how the various cogs come together that give them the great experience they have while running our software.

Q: What are the biggest technical challenges related to live migration of virtual machines?

One of the recent ones is the guests are growing in size: tens of vCPUs and 100s of GBs of RAM inside the guest mean that the guest is always doing enough work to not allow a VM to be migrated from one host to another while not introducing any noticable downtime.  There have been advancements in this area, and I will elaborate upon these during my talk.

Q: How does live migration handle passthrough devices?

There are a couple of implementations being discussed which do this, but currently we do not allow live migration of such VMs.  The majority of passthrough (or assigned devices, as is known in QEMU/KVM), are network devices.  Newer hardware makes it easier to assign these devices to guests, but to migrate a guest without the guest's knowledge of the migration happening is difficult.  So, the solutions under discussion involve the guest in the live migration process, and make the guest adjust its networking for the duration of the live migration.

Q: What are some recent developments and new features in live migration in Qemu?

Postcopy live migration, which migrates a guest before all its memory has been moved to the destination host, is one of the newest features that has been merged in QEMU.  I will elaborate on this, and other new developments in my talk.

Q: Which new live migration improvements can we expect in Qemu in the near future?

There are some features which are user-facing, like postcopy.  Others are internal reworks which make QEMU go faster, without necessarily introducing new user-visible functionality.  As you must've noticed, the theme around live migration is to make migration go faster. There's also a proposal to checkpoint migration states, so that if some state is already available at the destination, the current state can be reconstructed by the existing checkpoint and the newer pages at the source.

Q: Have you enjoyed previous FOSDEM editions?

I can think of two responses to this question, one begins with 'fortunately', the other with 'unfortunately'.

This is my first FOSDEM, and I'm looking forward to it!
