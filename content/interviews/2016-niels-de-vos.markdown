---
year: 2016
speaker: niels_de_vos 
event: gluster_roadmap
---

Q: Could you briefly introduce yourself? 

My name is Niels de Vos and I am one of the core developers and a maintainer of the [Gluster](http://gluster.org/) project. As part of my job for Red Hat, I am a member of the team that works on improving support for NFS in the Red Hat Gluster Storage product.

Q: What will your talk be about, exactly? Why this topic?

At FOSDEM 2016 I will talk about the Gluster roadmap, recently added improvements and upcoming features. Last year version 3.7 was released and it included many new features. Some of them were marked as experimental and for many of them the latest updates make us confident that they can reliably be used. The feedback and testing we had from some of our users helped us iron out issues and improve stability.

The new features that will come later this year with Gluster 3.8 and Gluster 4.0 will need broad user testing as well. Many users are interested in new features that make Gluster an even more serious competitor to some of the other Software Defined Storage technologies that are available.

FOSDEM is one of the biggest --- if not THE biggest --- conference many (potential) Gluster users attend. Because Gluster is a big project with many features, I hope that my talk contains new and interesting information for Gluster newbies and die-hards.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The intention of the talk is to explain a little about what functionality Gluster offers. The attendees can then think about their use-cases and if Gluster would be a good fit for that. Existing users that have their production environments already, might find out about new features that they could use.

The most valuable for me to get out of the talk, is receiving feedback from potential or existing users. Most of the Gluster developers have limited experience in maintaining a real life storage environment for production use. We need to know what functionality users need and where Gluster can improve.

I hope that many of the attendees will visit our Gluster table and talk to some of the community members there. We'll make notes about the suggestions that come in, but can also explain more details about features in case people want to test them out and give feedback. Of course, I and other Gluster members will be around to answer questions about Gluster usage, give hints on troubleshooting or debugging. For us, an event like FOSDEM is a unique opportunity to meet our users, and we look very much forward to it.

Q: For which use cases is Gluster a good solution? And for which situations is it not a good fit?

Gluster is a network filesystem, so it compares mostly to a NAS (Network Attached Storage). The main access protocols to use Gluster are through a filesystem in userspace daemon (FUSE), NFS or SMB. This makes it easy for applications that work with files to utilize the functionality that Gluster offers (scale-out, high availability, disaster recovery and so on). Because of the distributed nature of the filesystem, the chance of bottlenecks caused by most other network filesystems is non-existent.

A Gluster filesystem is very well suited for content delivery networks, archival of data/backups, High Performance Computing, virtual machine storage and much more. There are integrations that provide a great virtualization experience (QEMU, libvirt, oVirt, CloudStack and OpenStack), object storage through Swift with the [SwiftOnFile](https://github.com/openstack/swiftonfile) project and backups with [Bareos](https://www.bareos.org).

One of the things where Gluster needs to improve is handling of huge directories (thousands of files in a directory). Applications that do a lot of directory listings might not particularly perform well, for example mail directories on IMAP servers. The same is true for applications that do a lot of small and random I/O, like relational databases. However, this does not stop users from using Gluster for these use cases. Sometimes the advantages of using Gluster are more important for them than performance.

Q: How does the project's community look like? And how can interested people help Gluster development?

A lot of the communication in the Gluster community is happening through different mailing lists. We also use three IRC channels on Freenode where more interactive discussions are held. These are #gluster for users and general chat, #gluster-dev for developers and #gluster-meeting where we do our weekly meetings.

The [gluster-users list](http://www.gluster.org/mailman/listinfo/gluster-users) focusses on questions by users, which get replies from other users but also developers. Like with most community projects, there is no 'official' support forum for the software. The gluster-users list is probably the main venue for users that seek support. I'm always very happy to see users helping other users. We probably do not thank those users that offer some form of support and answers to questions enough. THANK YOU!!!

We maintain a whole bunch of servers for our infrastructure. The main website, mailing lists, Gerrit and Jenkins are the most visible services that the team behind [gluster-infra](http://www.gluster.org/mailman/listinfo/gluster-infra) is responsible for.

There is [gluster-devel](http://www.gluster.org/mailman/listinfo/gluster-devel) for development discussions, one of my hopes is that developers use this list more than personal emails to other developers. This is not always the case, and sometimes technical solutions to problems seem to drop from the sky. I hope developers read this interview and see this note as a reminder ;-)

Anyone that is interested in joining the Gluster community is most welcome. Development is only a small part of what an Open Source community is about. Investigating problems that users report, answering questions and maintaining the infrastructure are topics where people without development skills can help out. There are always much more ideas and tasks that would benefit the community than we can work on.

People that are interested should just get in touch, explain what topics they can offer assistance with and I'm pretty sure we can find something that matches their profile. New developers are encouraged to start with our [EasyFix](http://gluster.readthedocs.org/en/latest/Developer-guide/Easy-Fix-Bugs/) bugs, join #gluster-dev on Freenode and send emails with questions to the gluster-devel list.

That said, there are also other pieces where users may want to help out. We have package maintainers for many Linux distributions, and the packagers always appreciate assistance. With normally three releases (for different stable versions) a month, updating the packages is a very regular recurring task. I can only encourage readers to send a short self-introduction to the [packaging mailing list](http://www.gluster.org/mailman/listinfo/packaging) so that we can all work together on getting packages ready in a timely fashion.

Q: Which new features can we expect this year in Gluster?

There is much happening in the project, so I'll share only a few things.

More features and details will be given during my talk. The roadmap for the major versions that are planned for this year is [available on our website](https://www.gluster.org/community/roadmap/).

We are planning to make our management framework more scalable with the [GlusterD2](https://github.com/gluster/glusterd2) project. There is also a big interest in providing more APIs for other management interfaces. [Heketi](https://github.com/heketi/heketi) offers such an option, and [SkyRing](https://github.com/skyrings/skyring) will hopefully become a much used web interface.

NSR (New Style Replication) is a server-side replication technique. At the moment the replication is done client side (where NFS/Samba servers are a Gluster client).

DHT2 (Distributed Hashing Translator v2) will bring better scalability for environments with many servers.

There is also a plan for improving the user experience for high-availability Samba and NFS. Both access protocols are expected to use the same clustering solution. Currently NFS-Ganesha prefers pacemaker, and Samba CTDB.

Q: Have you enjoyed previous FOSDEM editions?

The previous FOSDEMs I have attended were really great, I enjoyed them a lot. For me (especially because I work 100% from home) events like FOSDEM are a great place to meet colleagues, users and friends with similar interests.
