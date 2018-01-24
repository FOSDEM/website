---
year: 2018
speaker: [dimitri_staessens, sander_vrijders] 
event: ipc 
---

Q: Could you briefly introduce yourself?

We are part of the [IDLab](https://www.ugent.be/ea/idlab/en) group at Ghent University (Belgium) that researches everything that relates to “Future Internet”. Our own research is mostly experimental, transforming cutting edge concepts into working prototypes and evaluate them on network testbeds provided by the Global Environment for Network Innovation (GENI) in the US and Future Internet Research and Experimentation (FIRE+) programs in Europe.

Q: What will your talk be about, exactly?

This talk stems from our research into addressing issues with packet switched networks such as efficient usage of network resources, QoS, security, privacy,... It will be a journey that starts from the very basics of IPC and evolves towards a decentralised packet network. [Ouroboros](https://ouroboros.ilabt.imec.be/index.html) blurs the divisions between IPC, Local Area Networks (LANs), Wide Area Networks (WANs) and Virtual Private networks (VPNs) with a very simple API. This talk will be of interest to anyone who works on distributed systems and projects such as dbus, OpenVPN, ToR, etc. The big difference between Ouroboros and most such projects, is that it can replace the complete network stack.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Ouroboros has been growing steadily and we arrived at a point where it was stable enough to be released publicly. The system has components that build on IPC, memory management, thread management and synchronisation, packet interfaces, and it contains components such as a Kademlia-based Distributed Hash Table. The FOSDEM community are people that have amazing skills and experience in all these areas. Since Ouroboros is GPL/LGPL Free Software, FOSDEM is really the perfect event for us to reach out and get more people involved in its development. We also expect some seriously tough questions.

Q: What's the history of the Ouroboros project? Why did you two decide to start developing a new IPC/network subsystem?

When reading papers by the pioneers that started building computer networks 30-40 years ago, one finds that they virtually all agreed that communication endpoints are processes.

This mindset has somewhat been lost in current networks, where we’re conceptually building networks where (virtual) machines and devices are the network endpoints. John Day gives a colorful account in his book “Patterns in Network Architecture”. Since around 2010, there are research efforts in Europe and the US that are rethinking networks based on this IPC principle and we were involved in a few of them. 

We wanted to further refine and test the ideas, so about two years ago, we started the development of a new prototype, Ouroboros. We kept this new project as deadline-free as possible, so we could focus on the research and design and redesign things whenever we felt that it was necessary. After careful evaluation, we decided to go for a user-space implementation in C89 for POSIX-compliant systems. This would give us the possibility to develop and run it comfortably on our GNU/Linux machines (and available network testbeds) and have a system that can reach a wide community of researchers and developers. 

Q: What are the main design principles of Ouroboros?

We wrote it in C for portability and tried to keep the design simple (KISS) and modular, since we wanted it to be easily modifiable and extendable for research purposes. We used a git workflow, always reviewing each others’ commits.

Q: For which applications is Ouroboros a good match? And in which situations isn't it (yet)?

Ouroboros is a very generic framework for IPC, so any application that is distributed and needs some way of communicating could at some point use it. The objectives that we target are reliability, security and privacy and we hope that the simple API and CLI will make it useful to many. 

Q: You developed Ouroboros as a research prototype. Which steps are needed to go from prototype to production?

Ouroboros stems from our research on network architectures, but the prototype was always meant to eventually evolve to a production-quality system so we can evaluate it against current production systems. The best path to a production system is to start field testing the current prototype. Most importantly, we need to get people interested, build a small ecosystem of ported applications and interconnected islands, fix the bugs and bottlenecks, and evolve the system based on those experiences.

Q: Which new features can we expect this year in Ouroboros and which future directions will you research?

Right now, we have two main priorities: bug fixing to stabilize larger and larger deployments for our research and implementing acknowledgments, retransmission, flow control, congestion control... We also plan to add encryption support (implementing a ECDH-C25519/EAS encryption scheme using libgcrypt/libssl). There’s always plenty of work to be done.

Future research would go towards trimming down the system to get minimal implementations for very small embedded systems (“IoT”). This would mean developing device-specific C/assembly code for each targeted device.

Q: Have you enjoyed previous FOSDEM editions?

Definitely! Good software, good beer, great talks by experts on a lot of different topics, there’s always something interesting going on. Except for the weather maybe, we are hoping for nice sunny days!
