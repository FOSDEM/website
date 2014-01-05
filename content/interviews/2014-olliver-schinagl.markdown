---
year: 2014
person: Olliver Schinagl 
speaker: olliver_schinagl 
topic: "ARM Allwinner sunxi SoCs and the community behind it: The most open source (friendly) SoC!"
event: arm_allwinner_sunxi_socs 
---

Q: Could you briefly introduce yourself?

Hi, I'm Olliver from the Netherlands and I consider myself a sunxi hacker/developer!

Q: What will your talk be about, exactly? Why this topic?

In the short time available, I will try to explain people what a 'sunxi' is, what [the community behind it](http://linux-sunxi.org/Main_Page) does and what has been accomplished already. This topic is so interesting because there are many sunxi chips being used all over the world already. If you have a cheap tablet from China, you might actually have a sunxi chip and not even know about it. Not only that, these chips are even more exciting, because they are so hackable and nearly unbrickable! And then there is the community. A very active community around these SoCs and their dev boards!

Q: What do you hope to accomplish by giving this talk? What do you expect?

We from the sunxi community hope to gain even more community members. A lot of work is left to be done, from documenting things and building distros to hacking on the kernel and reverse engineering the VPU. There's something for everyone. We have no expectations, other than everybody having a good time and finding the talk interesting. If however we manage to gain one single new active member, that's a win.

Q: What makes the Allwinner SoCs so interesting from the point of view of an open source developer?

The Allwinner SoCs are so interesting because they currently are very open, which is not something very common in this price range. There is a fully GPLed and actively maintained [u-boot](http://linux-sunxi.org/U-Boot). The kernel has open source drivers for nearly everything. There are manuals with register documentation to boot. Also it is one of Luc's main targets for his [Lima](http://limadriver.org/) work, meaning also the GPU is going to be open in time. To top it all off, there are many boards, some even as open source hardware. With the latest boards coming in at 35 euros, that's very attractive stuff. Not to mention that there are now dual core tablets going for as little as 40 USD with free shipping from China.

Q: What's the history of the sunxi community? How did it start and what were the biggest hurdles? And how did you get involved?

The sunxi community forked from the Rhombus-tech EOMA68 community. Rhombus-tech actually started looking for SoCs that were potentially GPL endorsable and found the A10 from Allwinner. As this started to drag in developers, a group was focusing purely on the SoC and not the EOMA68 and things around it, and thus we split off into our own thing. I joined just around this split, after finding a thread on the XBMC forums about XBMC support for the A10. While this wasn't actually hugely positive, that lead me to the EOMA68 thing and how it found the SoC to be very open source friendly. And as luck may have it at times, I got a A10 tablet for my birthday. From there on I started to first document things on the wiki and moved over to hacking on drivers.

Q: How big is the sunxi community? And how can interested people help?

While it's difficult to put a hard number here - there are always active and lurking members - we have about 130 IRC users. Also here there are obviously lurkers and actives, but if you take the mailing list into account, we have almost 600 members.

There are various means to be able to help with the sunxi community. There is the always boring, but necessary maintaining, cleaning and adding information, which is maybe the most important for new community members. Working on distro support for people who are not into writing C code. And of course, there are patches for our kernels, boot loaders and userland tooling.

Q: Which new developments can we expect in 2014 in the sunxi community?

We hope to be able to integrate Luc's Lima work this year and hopefully start to actually release some beta quality vdpau stuff. Other than that, just normal progress I guess. More drivers in the mainline kernel, better support for existing chips, new hardware support and hopefully a start at upstreaming u-boot.

Q: Have you enjoyed previous FOSDEM editions?

Always! All one of them.
