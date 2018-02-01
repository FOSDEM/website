---
year: 2018
speaker: palmer_dabbelt 
event: riscv
---

Q: Could you briefly introduce yourself?

I'm Palmer Dabbelt, the system software team lead at [SiFive](https://www.sifive.com/). I (along with a handful of other people) maintain the [RISC-V](https://riscv.org/) ports of various open source software projects.

Q: What will your talk be about, exactly? Why this topic?

I'll be talking about the state of the RISC-V open source ecosystem: both software and hardware.  I work at SiFive, the market leader in RISC-V systems, maintaining the RISC-V ports of various open source projects.  At SiFive we produce RISC-V core IP that is based on Rocket Chip, an open source RTL implementation of RISC-V, so I will also be discussing the state of open-source RISC-V hardware to an extent.  I've also been around the RISC-V project for a while, so I'll start with a bit of a history of the RISC-V ISA.

I'm giving the talk because I think it's a very exciting time if you're interested in systems software or hardware development.  The RISC-V ISA has really started to gain traction in the industry, RISC-V software has started to get stable enough that you can build large-scale systems, and SiFive's base platform provides an open source implementation of a commercially viable SoC to an extent that's never been seen before.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to get the word out about RISC-V.  We've made huge strides in the last year: much of the key software ecosystem is upstream, simulators have gotten a lot more stable, hardware is starting to become readily available, and the open source RTL implementations are usable.  We've gotten lots of traction in the hardware community (Western Digital announced they're moving everything - 1 billion cores a year - to RISC-V, for example), but there's been less buy-in among the software community.  I view this talk as a way to announce RISC-V to the larger open source community, as it's now ready for prime time.

My hope is to get people excited about RISC-V, convince them they should abandon whatever else they're working on, and get everyone on board with porting their favorite project to RISC-V.

Q: How did you become involved in the RISC-V project? What attracted you to it?

I was a PhD candidate at UC Berkeley, and I sat in the lab right next to Andrew Waterman.  I'd always been a bit of a half hardware, half software guy: at the time I was working on a parallel machine with a custom ISA and a distributed operating system.  The RISC-V stuff just seemed more fun, so I started working on it.  I eventually ended up getting a MS from Krste Asanović and then following much of the lab to SiFive where I work on system software for SiFive's platforms, which are all based on RISC-V.

Q: What were the biggest challenges in getting RISC-V support in binutils, GCC, glibc and Linux?

The biggest challenge has been the scale of the project: essentially the goal is to port all of software to RISC-V.  While most ISA ports will have a team of experience people involved, up until recently RISC-V was an academic project so everyone involved was doing this for the first time.  SiFive has helped a lot, as we have now hired a bunch of people who know what they're doing.  Additionally, RISC-V has been gaining a lot of traction in both the software and hardware communities, and the additional manpower has been a huge help.

Q: When will we start seeing distributions being ported to RISC-V? Which ones are actively working on support?

About two years ago :-).  I dug up an email from January 2015 where Martin and I were talking about giving demos of our Gentoo and OpenEmbedded ports at an ASPIRE workshop.  Porting a distribution is a huge amount of work, and it shakes out lots of bugs in the toolchain, so it's something we wanted to do early.  We've had early-stage ports of OpenEmbedded, Fedora, Debian, Gentoo, and OpenWRT floating around for a while, and I anticipate that if we manage to make the glibc deadline that we'll have distributions start to become usable in 2018.

Q: What does RISC-V's community look like? How can interested developers contribute? In which domains could it use some help? What is still missing?

Since RISC-V is such a large and unique project, we have a wide ranging community, including:

  * Academic computer architecture researchers, who are interested in RISC-V  because it's the only viable option for performance large scale RTL-based  research.  The combination of an extensible ISA and an open-source RTL  implementation has fundamentally changed the projects that are available to  a research group.
  * Open source enthusiasts, who are interested in having the lowest level  details of the system available to them in a way that's never going to happen  in systems based on proprietary ISAs.
  * Industrial or hobbyist micro architects who are interested in building their  own RISC-V based implementations, either from scratch or by leveraging SiFive's open source RTL generator or commercial products.
  * Compiler experts, who are interested in optimizing for the current set of  RISC-V ISA extensions as well as the upcoming explicitly parallel extensions  like the V extension for Cray-style vectors.
  * Kernel hackers, who are interested in using systems that they can see the  workings of at a level that has not yet been possible.
  * Simulator writers, where the simplicity of the RISC-V ISA allows for very low  overhead software implementations.
  * Performance programmers, who are often interested in designing new RISC-V ISA  extensions to extract better performance.

While we've made great strides in RISC-V land recently, the scope of the project is so large that there's a lot of work left to be done.  The biggest things now are probably Java (and the upcoming J extension), the platform specification (everything outside the ISA in a modern SOC), and the vector extension (both hardware implementations and software tools).

If you're interested, the easiest way to get started is to start improving the RISC-V port of your favorite project: maybe improve GCC's code generation, add features to Linux, bring up more devices in QEMU, or port some packages to your distro.  We're generally active on each project's mailing list, but a good catch-all for getting started is sw-dev@groups.riscv.org or #riscv on freenode.  The twice-annual RISC-V workshops are a great way to meet people and get new projects started, see [the RISC-V website](https://riscv.org) for more details.  You'll probably want to join the RISC-V foundation as a personal member, which will allow you to contribute to specification development.

Q: What is open in SiFive's chips, what isn't, and why?

SiFive ensures that there is a high quality open source implementation of the base RISC-V platform, but unfortunately it's not feasible to have an entire chip be open source:

  * RTL for the base platform is open source, which on the current chips includes  the cores and the L1 caches.
  * Some of the RTL on the chip is not open source, with the big part being the  L2 cache on the upcoming U54-MC based chip.  In general there's always going  to be a few bits of proprietary components, or items that will take a little bit longer to open source.
  * The simpler interfaces (those where we can produce the controller and phy)  are largely open source, which includes things like SPI and UART.
  * The third-party IP we've licensed is not open source, which includes things like the DDR  controller and phy.  There's not much we can do about this.

On chips like the FE310-G000, which have no complicated analog interfaces, it's feasible to have the vast majority of the chip open source.  Chips like the upcoming Freedom U design are trickier to build that way, we'd need a mechanism for doing open source analog design on modern processors first. 

Our software SDK for the chips is open, as are our platform specifications, memory maps, register bits, and items that software care about. SiFive is built on RISC-V, which is built on a free and open philosophy.

Q: What are SiFive's plans in 2018?

We hope to release many interesting RISC-V implemenations, along with improving the general state of the RISC-V software ecosystem. We will also continue to see commercial adoption of RISC-V among more system and chip vendors. My hope is to have mainstream Linux distributions have experimental releases for RISC-V in 2018.

Q: Have you enjoyed previous FOSDEM editions?

This is my first FOSDEM.  I haven't been to a lot of conferences in the past, but we're trying to go to more in the future.

