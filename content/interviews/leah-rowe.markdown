---
year: 2017
speaker: leah_rowe 
event: libreboot
---

Q: Could you briefly introduce yourself?

I'm Leah. I run the [Libreboot](https://libreboot.org/) project. I work on free software in
general, and on activism in other areas in my free time.

Q: What will your talk be about, exactly? Why this topic?

I will be talking about free software at the boot firmware level,
something which is lacking in most systems that people use today. This
is the root of trust in a system, and most people don't think of it.
It's just there, and it boots their operating system. A lot of manufacturers these
days put nasty malicious features in the boot firmware, so a project
like Libreboot is very important, especially for security. More about
this will be discussed in the talk.

More broadly, the talk will be about current issues that we face
regarding hardware and software freedom, and what can be done about it.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I aim to make more people aware of the dangers of non-free boot
firmware, in terms of security and freedom. I also wish to attract
developers to the Libreboot project, which seeks to implement free
boot firmware so that people can use entirely libre systems.

Q: Is libreboot a fork of coreboot? Or how would you describe the project? And how do both projects collaborate?

Libreboot is not a fork of [coreboot](https://www.coreboot.org/). It's a distribution of coreboot.
We take coreboot for various systems, and provide an automated build
system around that, combining coreboot with payloads such as [GRUB](https://www.gnu.org/software/grub/),
SeaBIOS, [petitboot](http://ftp.cvut.cz/kernel/people/geoff/petitboot/petitboot.html) (planned), [depthcharge](https://libreboot.org/docs/depthcharge/), etc. We integrate
everything, with automated build and installation processes which we
document on our website.

At present, we are seeking to abandon coreboot as an upstream, and
switch to using [librecore](http://librecore.info/) instead. More about this will be covered in
the talk. Librecore is a fork of coreboot, formed in December 2016.

Q: You already talked about libreboot at FOSDEM last year. What are the most important developments that happened during this last year?

We attempted to create an OEM that preinstalls Libreboot as the
factory. This was spearheaded by [Raptor Engineering](https://www.raptorengineering.com/), with their [TALOS](https://www.raptorengineering.com/TALOS/prerelease.php)
workstation project. Unfortunately, that [failed](https://www.crowdsupply.com/raptor-computing-systems/talos-secure-workstation).

We've added support for several new systems, most notably RockChip ARM
chromebooks. We're working on adding more. We're also working on some
new Intel laptops in Libreboot.

Q: Libreboot has planned support for POWER8 and POWER9. What are the biggest challenges to support those platforms?

Consumer interest, mainly. The hardware is very expensive to produce,
and the price is very high for people who want to buy it. This means
that we face severe issues when competing against the likes of Intel,
AMD etc. who sell cheaper, but non-free, systems.

We also need to make sure that IBM does not lock down the new POWER9
platforms.

There are existing POWER systems out there that can be freed through
reverse engineering, from cheaper Chinese brands (they often don't
release source code, because in order to be cheap they take code from
all kinds of places and they don't want to risk going to prison for
copyright violation so they withhold the source code, unfortunately).
This is not our main focus, however.

Currently, it is unknown what will happen to POWER as an option in the
future.

Q: What does libreboot's community look like? How can interested people contribute and in which domains could you use some help?

We have an IRC channel at #libreboot on Freenode and a [bug tracker](https://libreboot.org/tasks/) on our website. We have other means of communication linked on the homepage of [libreboot.org](http://libreboot.org). We also explain [how to submit patches](https://libreboot.org/git/).

We need help currently, with:

  * integrating x86 boards/utils into the new build system, which is now merged. Libreboot has 2 build systems; an old one, and a new one. The new build system has support for rockchip ARM chromebooks, but not x86 systems.
  * We need more hardware to be supported, so that the project can expand. We especially need hardware manufacturers to ship Libreboot by default (TALOS was an example, but that campaign failed).

Q: Which new features can we expect this year in libreboot?

  * new build system completed, with older systems supported in it;
  * integration of Petitboot as payload option;
  * support for building and integrating a Linux kernel payload in a variety of configurations;
  * support for building libreboot with alternative compilers e.g. LLVM (we currently only support GCC);
  * more hardware support in general;
  * better BSD support. we currently have limited support for a few BSD systems.

Q: Have you enjoyed previous FOSDEM editions?

I enjoyed FOSDEM 2016.
