---
year: 2020
speaker: [james_bottomley, mike_rapoport] 
event: kernel_address_space_isolation
---

Q: Could you briefly introduce yourself?

**James:** Sure, I'm James Bottomley. I've been active in Open Source,
specifically the Linux Kernel, since 1992, both as a user of Linux as
well as a contributor.  My major open source contributions were to
Linux SCSI beginning in 2002 as the Maintainer and also helping to
create the Linux Foundation Technical Advisory Board in the old OSDL
in 2006. 

**Mike:** I'm Mike Rapoport. I have been in the IT industry for more than 20 years and
during all this time I was fascinated by free software. Back in the
nineties I've started to use Linux at home and Emacs at work. When I
was working on design and bring-up of an embedded board in 2005 I
realized that the changes I've made to U-Boot and the Linux kernel
could be contributed to the community and since then I'm contributing
to the Linux kernel. Currently I'm mostly involved with the memory
management subsystem, in particular I maintain the memblock - Linux's
boot-time memory allocator.

Q: What will your talk be about, exactly? Why this topic?

We will talk about using the MMU and page tables to improve isolation
of Linux containers. The Linux kernel has a single address space that is
shared by all privileged code. We are trying to see how we can divide
this address space to improve the isolation and security on the one hand
and without sacrificing the performance from the other hand. Creating
efficient mechanisms that will allow restricted address spaces in
the Linux kernel for particular contexts is one of the ways to harden
the kernel and provide better security properties to the userspace.

Q: What do you hope to accomplish by giving this talk? What do you expect?

We would like to present the problems we are trying to solve and the work
we've been doing so solve these problems. We think it's important to
get some feedback. And we hope there will be developers who are
interested to collaborate on this topic.

Q: What are the most important use cases for address space isolation in the Linux kernel?

From our perspective the driving use case is Linux containers. If
we restrict the code and data visible to the kernel code running on
behalf of a particular container we would significantly reduce the
attack surface. Of course, the ability to have restricted contexts in
the kernel will also benefit other users, e.g. KVM developers intend
to use restricted address spaces to improve mitigation of hardware
vulnerabilities.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS?

FOSDEM is a deeply technical conference with really wide coverage of
different areas. We think it gives people a good opportunity to discuss
technology.

Q: Have you enjoyed previous FOSDEM editions?

**James:** I have, although I managed to miss out last year, I gave talks at
FOSDEM in 2018 and 2016

**Mike:** I've been only to FOSDEM 2018 and I really enjoyed it.
