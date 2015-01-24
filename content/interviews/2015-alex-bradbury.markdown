---
year: 2015
speaker: alex_bradbury 
event: lowrisc 
---

Q: Could you briefly introduce yourself? 

I'm a researcher at the [University of Cambridge Computer Laboratory](http://www.cl.cam.ac.uk/) and
co-founder of the [lowRISC](http://www.lowrisc.org/) project. Up to now, my research has been based
around compiler technology for [a novel many-core architecture we are
developing](http://www.cl.cam.ac.uk/~rdm34/loki/). In my spare time, I'm a
long-time contributor to the [Raspberry Pi](http://www.raspberrypi.org/) project, contributing towards OS and
software work since the first alpha hardware has been available, as well as more
general educational work (Robert Mullins, who leads the lowRISC effort was of
course one of the Raspberry Pi co-founders). I've also been producing a
[weekly summary of LLVM developments](http://llvmweekly.org/) for just over a
year now.

Q: What will your talk be about, exactly?

LowRISC is a not-for-profit project to produce a completely open source SoC (System on Chip),
with a plan to produce volume silicon and low-cost development boards. My talk
will cover the aims of the project, our current status, future plans, and
more. Open source silicon is seen to have the odds stacked against it with
issues such as the very high costs of silicon production, limited pool of
skilled hardware designers, and long iteration cycles. My talk will discuss
our approach to these problems, how people can get involved, and the
opportunities a clean-slate open source SoC design offers.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to raise awareness of our project and our vision for open source
silicon as well as attracting new contributors and collaborators. It's also a
great opportunity to get more feedback on our direction and target feature
set. We were initially worried about sharing details of the project at such an
early stage, but the feedback and help we've received so far have helped us
move forwards at a much faster rate than we would have been able to otherwise.

Q: What's the history of the lowRISC project? What was the motivation to start
it? How did it evolve? Is this what you planned it to be? What have been the
biggest challenges?

The roots of the project go back to the Raspberry Pi, which Rob Mullins
co-founded and I became a major contributor to. This opened our eyes to the
level of interest in hardware from the open source community and the wider
hacker/maker communities. During the summer of last year, Gavin Ferris got in
touch and kicked off a discussion about what it would take to produce an open
source SoC and how we might be able to succeed where others have failed.  We
started looking at choices regarding what instruction set architecture to
adopt, and ultimately settled on RISC-V which also has the advantage of
allowing us to build upon the excellent 'Rocket' RISC-V core implementation
from Berkeley, which has been taped out several times at 45 nm and 28 nm.

Open source hardware has been moderately successful for PCB designs or
mechanical designs (e.g. for 3D printers) but hasn't had that same level of
acceptance in silicon design. We want to show the viability of open source
silicon and to ultimately exist as a successful open source project with a
wide contributor base. Our motivation is that we feel an open source reference
SoC design that is competitive with existing proprietary offerings will
improve the pace of innovation in the semiconductor industry, both by
providing an easier path to transition research ideas to real world use and by
lowering the barrier of entry for new semiconductor startups.

I'd say it's definitely too early to judge whether the project has truly
become what we planned it to be. The main way the project will evolve over the
coming months is in terms of open development. As we release more code, an
increasing percentage of our work and discussion of design decisions will
happen in public with the wider community. We're already seeing a number of
interesting design discussions take place [on our mailing
list](http://listmaster.pepperfish.net/cgi-bin/mailman/listinfo/lowrisc-dev-lists.lowrisc.org).

There are a range of challenges in getting the first test chip out of the door
and the longer path to production silicon. With digital logic, it's relatively
easy to simulate and have some assurance it will work in the actual chip. More
difficult are the lower level aspects of the chip design that are often
overlooked, such as packaging and integration of things such as the physical
memory interface. We're seeing a number of viable paths to this first test
chip but these issues certainly take up a lot of time and we're grateful to
the advice we've received so far. At this stage, a 28 nm test chip is not
outside of our reach and I should point out we're not new to chip design -
e.g. we have a 128-core test chip for a separate research project due to be
taped out this summer.

Q: What is tagged memory and which attacks does it prevent? And does it have
other applications outside security?

The basic concept of tagged memory is simple. Each memory location is
associated with a tag (metadata). Our initial motivation was security, in
particular to prevent control-flow hijacking attacks. All attacks in this
category at some point require overwriting a code pointer, whether it be a
return address, function pointer, or vtable. By using these memory tags to
provide fine-grained read-only protection, we can prevent buffer overflows
from overwriting code pointers and thus prevent these attacks (see the
[memo](http://www.lowrisc.org/docs/memo-2014-001-tagged-memory-and-minion-cores/)
we released for more details and some subtleties). Although security was the
initial motivation there are also a range of other potential uses, including
accelerating debug tools like Google's [AddressSanitizer](http://code.google.com/p/address-sanitizer/)/[ThreadSanitizer](http://code.google.com/p/thread-sanitizer/)/etc
series of tools, marking pointers for garbage collection, or (with some extra
hardware support) as full/empty bits for lightweight synchronisation. Part of
our overall design philosophy is to try to come up with reusable functionality
rather than single-purpose solutions to a particular problem.

Q: What are minion cores and how do they compare to external microcontrollers
and FPGAs to extend I/O functionality?

Minion cores are our approach to implementing I/O in software. A lowRISC chip
might for instance contain 8 or more minion cores, each implementing the
RISC-V ISA.  They are smaller and more power-efficient than the main
application cores.  Initially we're targeting low-speed protocols like
SPI/I2C/I2S/SDIO, though in the future we hope to explore implementing more
complex, higher-speed protocols like USB or Ethernet. Like tagged memory, this
isn't a completely new idea. There are numerous examples of using a processor
to implement I/O from the present day 'PRUs' in the TI Sitara used in the
BeagleBone Black going back to the CDC6600. Advantages include an easier way
of handling real-time tasks, the ability to do more processing or filtering on
the minion cores, the ability to execute security sensitive code in a
hardware-separated execution environment and a reduction in the number of
individual SoC components (or 'IP blocks') that need to be implemented and
verified. The main advantage versus external components is that we can get
this flexibility on-chip, all using the same instruction set as the main
application cores, potentially with tight integration into the memory
hierarchy.

Q: Are you in touch with semiconductor startups or have they expressed
interest in the lowRISC project?

We've been in touch with a range of people already in the semiconductor
industry - both startups and more established players. There's plenty of
interest in both lowRISC and the RISC-V instruction set architecture. For
instance we just took part in the [first RISC-V
workshop](http://riscv.org/workshop-jan2015.html) which sold out, with 140
attendees from around the world including many from well-known Bay Area
companies.

Q: How can interested people help?

People can help in a range of ways. There are opportunities to contribute to
the high-level design (discussed mostly on our [mailing
list](http://listmaster.pepperfish.net/cgi-bin/mailman/listinfo/lowrisc-dev-lists.lowrisc.org)),
plus of course contributing to the hardware implementation (e.g. the Berkeley
[Rocket SoC generator](https://github.com/ucb-bar/rocket-chip) and our soon to
be released fork with tagged memory support), or porting software to RISC-V.
With the platform being at this early stage of development I think there's a
whole range of really exciting opportunities to have a large impact. One of
our goals is to make the process of contributing as easy as possible, so you
may want to keep an eye on [our website and announcement
list](http://www.lowrisc.org) for new documentation and how-to guides.
Documentation is of course another area where we'd be very grateful for
external contributions.

Q: When will we see the first production release of the lowRISC development
board? What specifications will it probably have and do you have a specific
price target in mind? Which Linux distribution will run on it?

One of our goals is to run Linux 'well'. It's a little early to be talking
precise specs, but I'd expect dual or quad core at 1 to1.5 GHz. Reference
development boards are likely to include a WiFi/Bluetooth LE module. Our aim would be
to produce production silicon towards the tail end of 2016 or beginning of 2017.
As for pricing, there are a number of unknowns there as well. For instance
we'd like to offer a board with an FPGA for prototyping and development,
though we don't know at this stage whether we'd simplify things by having an FPGA
on all boards. It's a little too early for me to feel comfortable throwing out
a certain price, but I'd certainly expect it to be in the range of pricing of
currently shipping higher-end single board computers. As for Linux
distributions, I expect we'll have a Debian port by the time of release and
the RISC-V community already has Yocto and the beginnings of a Gentoo port.

Q: Have you enjoyed previous FOSDEM editions?

I'm almost ashamed to say this will be my first one. Everyone I know who has
been is extremely complimentary, I think unanimously declaring it one of the
best Free Software events. I'm very much looking forward to experiencing it
for myself.
