---
year: 2016
speaker: dave_neary
event: telco_on_free_software 
---

Q: Could you briefly introduce yourself? 

I'm a long-time free software activist, and (as much as it pains me to say it) former developer. I've been involved in a wide range of projects, starting with the GIMP in 1999, and for the past 3 years, I have worked at Red Hat in the Open Source and Standards team, where I have been involved in a variety of projects, including [oVirt](http://www.ovirt.org/Home), [OpenStack](https://www.openstack.org/), [ManageIQ](http://manageiq.org/), [OpenDaylight](https://www.opendaylight.org/) and (most recently) [OPNFV](https://www.opnfv.org/).

Q: What will your talk be about, exactly? Why this topic?

I will talk about Network Functions Virtualization, and how it is revolutionising the telco industry, by enabling a move from ardware based telecommunications networks to software based services, running on commodity hardware.

All of this change is being driven by free software, starting with the [Linux kernel](https://www.kernel.org/), a hypervisor like [KVM](http://www.linux-kvm.org/page/Main_Page), through virtual switches like [Open vSwitch](http://openvswitch.org/), userspace dataplane acceleration with [DPDK](http://dpdk.org/) or [OpenDataPlane (ODP)](http://www.opendataplane.org/), and on top of it all, the ability to control all aspects of your infrastructure with an SDN controller like OpenDaylight and a private cloud platform like OpenStack.

I will present the work that we have been doing in OPNFV to bring together all the pieces of the puzzle, identify gaps in functionality (mostly related to performance and workload management), and working together as an industry to fill those gaps.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to raise awareness that the telecommunications industry is changing, adopting our software, and communicate some of the things they're trying to do with it. In OPNFV, we're working to help these companies engage with open source projects and get their needs addressed upstream, and helping free software developers understand the problems and the context, and getting them excited about this pretty massive disruption, is a big part of that.

Q: Telecommunications companies have traditionally been proponents of proprietary software. Why would they change their approach and embrace an open source stack such als OPNFV?

Well, the telecommunications industry has traditionally been standards driven - telcos work together to ensure interoperability across different vendors, so it is not unusual for telcos to work together on a common problem. What is different with NFV is the industry is moving beyond standards work to collaborating on a free software implementation - and there are two main reasons for this change.

First, the cloud is dominated by free software - all of the infrastructure is built on free software, all of the tools we use to manage cloud workloads are free software, and all of the languages and frameworks we use to build applications are free software.

Second, the main motivator for the telecommunications industry is increase flexibility, reduced time to market, more agile development and deployment processes. In other words, they want to build their telecom applications more like the way open projects work.

It's worth noting that not everything will be opened up in this change - many applications will continue to be proprietary, and much of the management frameworks used today are proprietary systems management applications. The underlying infrastructure is not a differentiator for a lot of telcos, so it makes sense to collaborate on that piece.

Q: What difference will it make to end users if telecommunications companies are adopting an open source software stack?

The main difference should be more, cheaper telecommunication services. One of the things telcos are trying to do is to change their cost structure to make managing their networks cheaper, and to make the roll-out of new services faster and cheaper. Initiatives like OPNFV also create an opportunity for new open source projects moving "up the stack" - as we get a public, shared understanding of the telecommunications industry, barriers to entry are lowered, and we will see more companies building businesses around free and open source applications for the telecommunications industry.

Q: OPNFV is a relatively young project. What progress has been made in that short time?

We are getting ready for our second "release" milestone, Brahmaputra, which is due for release soon after FOSDEM. The main goal of our first release was to put in place the deployment and continuous integration infrastructure to bring together all of these projects and begin running tests, while also drafting problem statements and creating specifications for telco requirements.

This second release represents the next step, implementing some of these requirements and integrating new code into our test and validation pipeline. We have increased the number of potential stacks, as different SDN controllers have joined the initiative, and also increased the potential deployment options. In addition, we have seen a number of projects make great progress in implementing requirements, and getting their code accepted upstream. Two areas worth pointing out are the [Doctor](https://wiki.opnfv.org/doctor) project, which focusses on how to manage faults when they happen in the platform or application, and enabling management applications to react to those faults, and [Service Function Chaining](https://wiki.opnfv.org/service_function_chaining), which is about chaining together network functions to provide richer functionality.

Q: How does OPNFV's community look like? Which parties are backing it?

The OPNFV community is pretty diverse, in that it covers a lot of different constituencies from the industry. We have telecommunications operatos and cable companies sharing their requirements. Network equipment providers are the traditional suppliers of network hardware to the telcos, and they are all participating in shaping how we satisfy those requirements. IT vendors and platform vendors like my employer Red Hat are there, building an understanding of the industry, and guiding people through the reality of contributing to open source projects. And we have hardware vendors who provide the industry standard hardware for private clouds. So the membership represents a cross section of the entire industry.

Most of the participants are paid to work on the project - either as network architects, or developers. But many of the things we are working on are also interesting in other problem domains like high performance computing or financial services, so we are starting to see interest from outside the telecommunications industry too. Of course, all of the mailing lists and development resources of the project are open to all, not just members, so we welcome anyone with an interest in solving the problems we're attacking.

Q: Which new features can we expect this year in OPNFV?

I would suggest that's asking the wrong question - most code written by OPNFV members ends up somewhere else, in OpenDaylight, or OpenStack, or KVM, or Open vSwitch. Perhaps a better way to frame this is, what features will OPNFV members help create this year?

My personal opinion is that we will see a push this year on performance, focussed on the virtual switch and the hypervisor, and significant progress in OpenStack on enabling management applications to take advantage of high end server hardware and performance in the platform - enabling the scheduling of real-time guest instances on specific hosts, or accelerating guest to guest network communication, for example. We will also see increased activity in free/open source management applications, managing the lifecycle of telecom workloads to keep them running regardless of what happens (within reason) on the platform.

Q: Have you enjoyed previous FOSDEM editions?

Yes! I have been a FOSDEM regular since 2005, with the exception of one year. This will be my 10th FOSDEM, and my first time as a main track speaker - I'm looking forward to my annual dose of pomme-frites with mayonnaise, gauffres, and carbonnade!
