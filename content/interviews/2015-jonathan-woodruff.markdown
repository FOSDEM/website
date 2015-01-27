---
year: 2015
speaker: jonathan_woodruff 
event: beri
---

Q: Could you briefly introduce yourself? 

I am Jonathan Woodruff, a beginning researcher in computer architecture.  I like to hack on processor internals and make things faster!

Q: What will your talk be about, exactly?

I will present the [Bluespec Extensible Research Implementation (BERI)](http://www.cl.cam.ac.uk/research/security/ctsrd/beri/) as an open source research processor and wider system which runs [FreeBSD](https://www.freebsd.org/) on FPGA.  I'll tout the accessibility of the design due to its friendly high-level language, and also show off debugging features for decloaking software behaviour.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to see a larger community using BERI for research so that we can improve its extensibility until BERI can be parametrised as a design competitive with state-of-the-art processors from a clock-for-clock perspective.  Optimal frequency and area are not crucial for research validity, but a clean, parametrisable, and extensible design is important.  While this is my hope, my expectation is to get a lot of interesting questions and comments, and then go back to working alone in my dungeon.

Q: What's the history of the BERI project? Why was it started and how did it evolve?

BERI started as a multi-threaded 64-bit MIPS implementation by Greg Chadwick at the University of Cambridge, and I have picked up his work and developed it into a full implementation including caches, pipelining, TLB, and full operating system support.  This work was funded by the [CTSRD](http://www.cl.cam.ac.uk/research/security/ctsrd/) project which wanted a prototype of a modern RISC Capability machine, which is called [CHERI](http://www.cl.cam.ac.uk/research/security/ctsrd/cheri/).

Q: The first BERI-based research project is CHERI, which is presented in another talk at FOSDEM 2015. Are there other research projects
planned based on BERI?

Another team is looking at making the tag architecture from CHERI more flexible, and we are working on many-core infrastructure.

Q: What changes were needed to port FreeBSD to the BERI architecture? Are there plans to port other operating systems?

When bringing up FreeBSD, we extended the processor to support the OS when we ran into issues rather than the other way around.  We enabled FreeBSD trivially to recognise our larger TLB and line sizes. We have also written several drivers specific to our FPGA platform, such as an SD card driver, an Ethernet driver, and a USB driver.  We have our hands full with FreeBSD at the moment, but expect that CHERI would run other operating systems that support vintage 64-bit MIPS.

Q: Could you give some examples of where BERI is currently used for teaching or research and what unique advantages it has there?

BERI is used in research for adding Capability addressing to the 64-bit MIPS ISA, and is being used for Multi-core design.  The approachability and flexibility of the design has allowed a very small team to be highly productive to explore the design space while running a full operating system in hardware.  We have also used BERI for a masters' course in computer design where students have developed an effective branch predictor as well as a plethora of student projects.  The language makes it possible for a masters' student to make a meaningful, working contribution to the project in just a few weeks.

Q: Have you enjoyed previous FOSDEM editions?

I have not yet attended FOSDEM, but hope to do so more in the future!
