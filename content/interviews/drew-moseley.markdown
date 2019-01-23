---
year: 2019
speaker: drew_moseley
event: mender
---

Q: Could you briefly introduce yourself?

My name is Drew Moseley and I am currently a Technical Solutions Architect working on the [Mender.io](https://mender.io/) open source project, which aims to make it easy to deploy software updates to connected (IoT) devices. My career started in the mid nineties as a deeply embedded software engineer building an RTOS for a graphical 2 way pager. Since then I have worked professionally on open source software including GNU tools, bootloaders and embedded Linux.

Q: What will your talk be about, exactly? Why this topic?

The prevalence and growth of Linux in IoT devices has exposed the fact that in the connected device market updating devices in the field is a much harder task than it seems at first glance. Many examples have appeared in the media showing how vulnerable these systems can be. This talk will discuss our project, the Mender open source OTA update manager. Using Mender, developers of connected devices can easily add OTA update capability into their project while maintaining focus on their differentiating skills and features. This also ensures there are no sacrifices around security and robustness when deploying updates.

We will also discuss the project details, including how other developers can contribute to the project.

Q: What do you hope to accomplish by giving this talk? What do you expect?

We hope to convince developers of the need to consider OTA updates early in their project and hopefully, to convince them that Mender is an option worth considering. Being an open source project, Mender also relies on community engagement and contributions. 

Q: What's the history of the Mender project? What was the motivation to start it and how did it evolve?

The Mender team started about 3.5 years ago and our 1.0 release was about 2 years ago. After many discussions with embedded and IoT developers, it became clear that there was a real need for a fully open source end-to-end system (i.e. both client and server) that could be used as an off-the-shelf component. It started supporting only a QEMU emulated device and a Beaglebone Black running Yocto. We have since added support for many different boards, and recently released tooling to allow Mender to be integrated into other target operating systems such as Debian.

Q: What were the biggest technological challenges in developing reliable and secure OTA software updates?

Before starting the development of Mender, we interviewed more than 100 embedded developers to understand the pitfalls they encountered developing a homegrown updater. The hardest part and what is commonly overlooked in homegrown updaters were all the nuances required for ensuring 1) robustness and 2) security.

Robustness means that a device should never be bricked, regardless of what happens to it. You have to answer questions like: what happens if the device loses power at any point in the middle of a software update? Can the software update manager guarantee that you can always deploy another update? It turns out that this is very technically challenging to get right, and it requires support for atomic updates, keeping a fallback copy and redundant bootloader data storage, to mention a few.

Security also comes multi-faceted. The most important is to ensure that the update comes from a trusted source, typically implemented with digital signing. But then you also have transport security, where you must ensure that there can be no man in the middle feeding the device an insecure/old update and that nobody on the network can see which update is being applied. This in turn requires secure key management and a secure device provisioning process.

Given both the difficulty and importance of getting these challenges addressed properly, we were motivated to start Mender as an open source project so the industry can start reusing something that meets the requirements, rather than continuing to reinvent inadequate OTA update manager solutions.

Q: Suppose I'm developing an embedded Linux device and I want to use Mender for OTA updates. Where do I begin and what do I need? What are some of the requirements I have to know?

The best place to start is our [Hosted Mender](https://mender.io/product/hosted-mender) service available from our web site. It is free to try.

Help documents are available to show you how to setup either a Raspberry Pi 3, a Beaglebone Black, or a virtual QEMU device with a demo image. This image will automatically be able to connect to the [Mender server](https://hosted.mender.io). Once that is complete you can install an OTA update to get a feel for the workflow of the Mender system.

Once you have completed those steps, the next best place to visit is the [Mender Hub](https://hub.mender.io). This is a community site where we have details on how to integrate Mender into a wide variety of hardware platforms and target operating systems.

Q: What does Mender's community look like? How can interested developers contribute? In which domains could you use some help?

We have a community mailing list as well as blog posts, GitHub repositories, etc. The details are on our [developer portal](https://mender.io/developers/developer-portal).

We are happy to have contributions.  Our list of issues we are looking for help with are in [our Jira tracker](https://tracker.mender.io/issues/?filter=11500).

Also, community members can post details of any integrations they have done on the [Mender Hub](https://hub.mender.io) to make it easier for others to use similar setups.

Q: Which new features can we expect this year in Mender?

We are working on a feature called "Update Modules" which will allow users to deploy any type of software using Mender. Essentially, the installation actions of the software is handled by modules, which can be written by the community. There are modules planned to enable support for package managers, simple application files, as well as container images. This will enable Mender users to deploy any kind of software, extending beyond the full image updates available today. We are also planning to support a community around update modules, and we are excited to see what the community will create!

Q: Have you enjoyed previous FOSDEM editions?

This is my first exposure to any FOSDEM edition and I’m very excited to participate!
