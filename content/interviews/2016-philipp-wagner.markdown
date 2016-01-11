---
year: 2016
speaker: philipp_wagner
event: digital_hardware_design
---

Q: Could you briefly introduce yourself? 

I'm Philipp Wagner, open source enthusiast and developer for quite some time now. Currently I'm pursuing a PhD in Electrical Engineering at Technical University Munich (TUM), working on adding tracing support to chip architectures.

Q: What will your talk be about, exactly? Why this topic?

As part of my work, I got deeper into digital hardware design than I ever expected. And I realized that while access to hardware like FPGAs is getting easier, the tooling and community around those topics is still not as evolved as in the software world where I come from. By asking "Why is it still so hard?" the talk will look into key differences between the software and the hardware world, and how we can learn from each other.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The main message of the talk should be "Fear not! Digital hardware design isn't hard." It will provide the listeners with some hints how to get started. At the same time, show them where the gaps and pitfalls of the current tooling and environment are. Besides this practical aspect, I hope to trigger some thoughts in an audience of hardware and software developers, leading to a better collaboration and a narrowing of the gap of understanding between the two worlds.

Q: What's the history of the Free and Open Source Silicon (FOSSi) Foundation? What was the motivation to start it?

The challenges of digital hardware design are not just felt by me, but by many great people of the community as well. At a meeting of the OpenRISC community in Munich in late 2014 we decided that it's time to approach those challenges together, and quickly found out that we need some kind of legal framework. That led to the founding of the [FOSSi Foundation](http://fossi-foundation.org/) late 2015, and made us "ready to attack" just perfectly timed for FOSDEM. And maybe we'll also have a surprise announcement for you at the talk, who knows?

Q: How can interested developers get involved in the FOSSi Foundation? What kind of help does te foundation need?

It's an free/open source effort, so getting involved is as simple as [joining the mailing list or the IRC channel](http://fossi-foundation.org/getinvolved.html). In my talk I'll also outline some topics where we could use some help.

Q: What tools and approaches can prospective free and open source digital hardware designers borrow from the software world? And in what domains is designing hardware fundamentally different than developing software?

Hardware usually isn't very useful if used standalone, software always plays a vital role these days. The FOSS community is great at providing portable, high-quality tools from compiler toolchains to libraries even for exotic platforms. That effort is extremely helpful in getting started with a new SoC platform. On the hardware design side, a lot of "utilities," like make or TCL interpreters (especially well loved in the hardware world) are very useful.

There are differences, of course, and most of them appear when the hardware design is getting closer to either chip manufacturing or prototyping on an FPGA. In this domain, borrowing tools is harder.

Q: What do I need to create my own processor design using free and open source tools? Are all the tools available yet?

Today it's rather easy to create a full processor design with free and open components, and many people have done so. Using free and open tools, you're also able to simulate your design. Unfortunately, it's not really possible to bring such a design onto an FPGA, and it's even less possible to manufacture it into a physical chip, using only FOSS tools.

Q: Have you enjoyed previous FOSDEM editions?

Absolutely, it's one of my favorite conferences and I try to attend it every year -- if just for the beer event! Thanks a lot to the organizers, you've always done a fantastic job.
