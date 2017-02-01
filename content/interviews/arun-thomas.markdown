---
year: 2017
speaker: arun_thomas 
event: riscv
---

Q: Could you briefly introduce yourself?

I am a researcher at BAE Systems R&D. I tend to do work at the
hardware-software interface. That's why I became interested in
RISC-V. I've been involved in various open source projects over the
years, but my current mission, in my [RISC-V Foundation](https://riscv.org/) role, is to
grow the RISC-V community.

Q: What will your talk be about, exactly? Why this topic?

I will talk about about RISC-V, a new open instruction set
architecture (ISA). Unlike x86 and ARM, RISC-V does not require any
licensing fees or lengthy contract negotiations for those who want to
build RISC-V cores. RISC-V is an open instruction set specification
that any hardware vendor (or individual) can implement. It also
happens to be a well designed, extensible ISA that targets the full
range of computing devices. As such, RISC-V is a good foundation for
open hardware efforts.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'm hoping to increase awareness of RISC-V in the open source
community. I'd like to encourage hardware and software developers to
contribute to the RISC-V ISA and various RISC-V projects. I also
want to give open source maintainers a heads-up about RISC-V, since
there will be many RISC-V patches coming their way in 2017.

Q: What's the history of the RISC-V project? And how did you become involved?

Krste Asanovic and David Patterson, professors at UC Berkeley, and
their graduate students Andrew Waterman and Yunsup Lee embarked on a
"three-month project" in summer 2010 to create a simple, extensible ISA
for their research. Four years later, the frozen RISC-V user ISA
specification was released.  In August 2015, the RISC-V Foundation was
formed to foster the development of the RISC-V ISA.

I became involved with RISC-V in 2014. I was working on the
DARPA-funded CRASH/SAFE project, a joint research effort between BAE
Systems, the University of Pennsylvania, Harvard University, and
Northeastern University to design new hardware/software security
mechanisms. My team decided to explore replacing our custom CRASH/SAFE
ISA with RISC-V. As I worked more with RISC-V, I started to submit
pull requests for various things, and I eventually got sucked into the
RISC-V community. It's the classic open source story.

Q: What are the advantages of the RISC-V architecture for hardware designers? And in which domains does it shine?

In addition to being open, RISC-V has several technical
advantages. RISC-V has a small base integer ISA that has fewer than 50
instructions. This makes it possible to implement very small RISC-V
cores. Hardware designers can choose to layer standard extensions
(e.g., floating point) on top of the base integer ISA or they can
design their own extensions. By adopting this base+extensions approach,
RISC-V allows for easy customization and allows a single ISA to scale
from microcontrollers to big iron. Currently, there is substantial
interest in using RISC-V in IoT applications, supercomputing, and
accelerators.

Q: How's interest in the RISC-V architecture in the semiconductor industry? And are there already usable RISC-V processors?

There is strong interest from industry. The RISC-V Foundation boasts
over 50 members and includes Nvidia, IBM, Google, Hewlett Packard
Enterprise, Microsemi, Microsoft, Oracle, Qualcomm, AMD, Lattice,
Micron, NXP, Western Digital, and Bluespec. There have been a number
of talks at past RISC-V Workshops that describe how companies such as
Nvidia are using RISC-V in their products.

[SiFive](https://www.sifive.com/), BlueSpec, [lowRISC](http://www.lowrisc.org/), [IIT Madras](https://www.iitm.ac.in/), [ETH Zurich](https://www.ethz.ch/en.html) and others have RISC-V SoCs that
can be used today.

Q: What can we expect this year in the RISC-V world?

I expect we'll see more RISC-V silicon shipping in 2017. SiFive is the
first company to ship RISC-V silicon, but there are several other
projects that plan to ship silicon this year. I also expect to see a
lot more RISC-V software this year. Now that binutils is upstream and
GCC is days from being upstream, I expect more Linux distros to pick
up RISC-V support. (I should note that [FreeBSD](http://freebsd.org) and the [Zephyr](https://www.zephyrproject.org/) kernel
already have upstream support for RISC-V.) I also expect we will make
progress on various ISA and platform specifications as well.

Q: What does the project's community look like? How can interested people contribute? In which domains could it use some help?

The RISC-V community includes industry, academia, hackers, makers, hardware
folks, and software folks from all over the world. We hold RISC-V Workshops
every 6 months to get the community together. The next RISC-V Workshop
will be in Shanghai on May 9-10. I would encourage interested
contributors to attend a workshop if they can. It's a great way to
meet the community and find out about all the exciting RISC-V
happenings.

Most development and coordination happens on mailing lists and
GitHub. RISC-V ISA enhancement proposals can be sent to the isa-dev
mailing list, and GitHub pull requests can be submitted to the various
RISC-V hardware and software projects. We would appreciate any help
porting software to RISC-V and writing/improving documentation. We
would like to see RISC-V support for all the major Linux distributions
in the near future. Debian, Fedora, Gentoo, and Yocto ports are all
underway. Open source RISC-V hardware projects (e.g., Rocket Chip and lowRISC) could also use contributions.

Q: Have you enjoyed previous FOSDEM editions?

I had a blast at FOSDEM 2011 and 2012. I'm looking forward to finally
making it back. It's been far too long.
