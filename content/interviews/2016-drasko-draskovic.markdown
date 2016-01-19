---
year: 2016
speaker: drasko_draskovic 
event: mainflux
---

Q: Could you briefly introduce yourself? 

In brief, I am an electronics and software R&D engineer and open-source enthusiast. I have been hacking around the Linux kernel and low-level software for years, and lately my interests are focused on wireless sensors networks and the Internet of Things. I find these modern technologies fascinating, inspiring and fun.

I come from Belgrade, Serbia where I finished my studies and then moved to Paris, France where I have been working for the last 10 years in the semiconductor, telecom and consumer electronics industry - in both Fortune 500 companies and technology start-ups that cherished an open-source culture and used open tools and components to bring their products to the market. Whenever possible, I try to share my experiences and expertise with the community and participate in many interesting projects, discussions and events.

I have been tackling several personal projects in parallel - related to electronics and IoT - and they led me to a lot of conferences around the globe. But when I am not coding or short-circuiting wires in my lab, I am most probably immersed in some kind of art - be it music, photography, literature or philosophy.

Q: What will your talk be about, exactly? Why this topic?

My talk will be about IoT clouds - more precisely about the [Mainflux](http://mainflux.com/) IoT cloud, as a real-world implementation example of an IoT cloud architecture built using open-source components, blocks and technologies, and licensed under Apache-2.0 and thus guaranteed to be patent-free.

As more and more "smart and connected" devices appear, there is an obvious need to manage these devices and solve problems from discovery to provisioning and control. This talk proposes one possible system architecture that begins with a client node and goes through a fairly complex server system with persistent database and a user application on the top of the stack. We will try to decompose such a system and explain technology and protocol choices. We will also discuss security issues and threats.

The importance of this topic rises as there is currently a war between industry giants for their standard to prevail, but rarely we find an open IoT server system based on open standards in order to understand (or change and adopt) the architecture and functionalities. Mainflux is maybe a unique example of such a system.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The ultimate goal of this talk would be to examine and hopefully demystify a complexity of the IoT cloud architecture:

  * What is the end node (device) and what embedded software can it handle?
  * What communication protocol should we choose for connectivity?
  * How do we handle device and user authentication?
  * How do we handle device provisioning and remote management?
  * How do we keep communication secure and what are the threats?

In the end we expect that the audience obtains information about how such a complex system can be achieved on a professional industry-grade level using only open-source components and technologies.

Q: What's the history of the Mainflux project? Why was it started and how did it evolve?

The Mainflux project started behind the [WeIO](http://we-io.net) project, which is open source hardware that we designed for the purpose of electronic prototyping. The WeIO board was easy to connect and use in a LAN, but for remote control we needed a centralized server that would act as a transparent message bridge between devices. As we started connecting other devices than WeIO - for example less powerful microcontrollers with a lot of processing and memory constraints, we started to analyze other communication protocols (such as [CoAP](http://coap.technology/) and [MQTT](http://mqtt.org/)), and decided to make a server application that can handle a large set of various sensors and actuators.

At first we did a survey of existing open systems in order to learn how such a system can be implemented. Unfortunately, we found practically no open implementation, especially not one that can be run on a local gateway or form a mesh between gateways and distributed servers.

Most of the work was done by the initial WeIO project team - thus people with expertise mostly around embedded software, networking, RTOS and the Linux kernel - but new members with expertise around databases and web-programming and devops (notably [Docker](https://www.docker.com/) and [OpenStack](https://www.openstack.org/)) jumped in to fill the gap.

Q: What are some exciting projects implemented using Mainflux?

Mainflux is a very young project, conceived mid-2015 and with real development happening actively the last 4-5 months. It is however used as a main device cloud for the more mature WeIO project.

On the commercial side, Mainflux is currently being evaluated in several companies for pilot projects:

  * a project for tracking the assets and inventory on connected shelves (asset tracking);
  * a project for tracking sensor data on a ship for international cargo transports (trajectory and vehicle tracking);
  * a project for analyzing and handling a set of sensors in a vineyard (agriculture).

Mainflux is designed to be device agnostic, so that its deployment can be all over industry.  We hope to see more Mainflux adoption once the project reaches a more mature and stable phase.

Q: How does the project's community look like? And how can interested people contribute to Mainflux? In which domains could the project use some help?

The current project community is comprised of a small number of highly skilled industry experts, which serve as project maintainers. Currently, the project is still in the phase where the architecture is researched and (re)defined and this is a very interesting phase of every project - but it demands a lot of technical skills. Common consensus is that the most modern (but proven) technologies should be used, so that development itself is very challenging and inspiring.

In the sense of organization, the Mainflux project follows the common open-source project practice of having a BDFL (Benevolent Dictator For Life) and maintainers who are responsible for their architectural sections.

Mainflux is licensed under the Apache-2.0 license, and everybody can contribute. All contribution process is very well documented in the project's [GitHub repo](https://github.com/Mainflux/mainflux/blob/master/CONTRIBUTING.md).

To facilitate contributions and guarantee a high quality of code, all contributions are done via GitHub pull requests. Because the project is guaranteed to be patent-free, all contributions must be signed-off which indicates that the contributor is accepting the [Developer Certificate Of Origin](http://developercertificate.org/) (we are using the same DCO as Linux kernel developers).

Regarding the technical domains, IoT in general is a great engineering challenge, as it covers various technical fields - we can say full stack, including hardware. There are domains of hardware electronics and firmware, both bare-metal or RTOS. Then there is networking and telecommunications. We are experimenting a lot around wireless and RF communication. Then there are server technologies and web programming, both back-end and front-end. In the end there is devops. Anyone interested in any of these fields will surely find a lot of interesting things in the Mainflux project, and it is great to participate in a project that ties all these technologies and see them all function
together in one system.

Q: Which new features can we expect this year in Mainflux?

We find it important for a well organized project to define as much as possible a clear roadmap. This is what we did, and we try to respect the milestones and release dates. However, since the project is still in the early phase, there are lot of things to be done.

There are many things planned for the future months, and some of them are:

  * Add support for missing protocols and improve APIs.
  * Finish the [LWM2M](http://openmobilealliance.hs-sites.com/lightweight-m2m-specification-from-oma) standard implementation.
  * Pub/sub context broker based on [Redis](http://redis.io/) for protocol-to-protocol translation and streaming.
  * Implement client libraries, especially embedded firmware libraries for constrained devices (in cooperation with [Project Iota](http://projectiota.github.io/)).

We expect a lot of improvements and progress on both embedded firmware libraries and web server parts.

Q: Have you enjoyed previous FOSDEM editions?

FOSDEM is the biggest and probably most influential conference on open source software in Europe and probably in the whole world. It is always a special event. This will be my first time as a speaker, so I hope for a magnificent experience.
