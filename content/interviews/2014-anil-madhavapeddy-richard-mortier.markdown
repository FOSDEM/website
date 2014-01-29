---
year: 2014
person: [Anil Madhavapeddy, Richard Mortier] 
speaker: [anil_madhavapeddy, richard_mortier]
topic: "MirageOS: compiling functional library operating systems"
event: mirageos
---

Q: Could you briefly introduce yourself?

We're academics with a past -- before our current jobs at the University of Cambridge and the University of Nottingham, we've (independently!) worked for and founded a wide range of technology companies.  We are currently "systems researchers", which is academic parlance for having fun hacking complex systems together and improving on their behaviour.  Our particular focus is on integrating modern programming languages with operating systems to build safer networked systems.  Almost all of our work is released as open source software.

Q: What will your talk be about, exactly? Why this topic? 

We're talking about [Mirage](http://www.openmirage.org/), a programming framework for building efficient, secure cloud services for platforms from Amazon EC2 down to low-power ARM-based home servers.

Mirage takes "full stack" programming to the extreme.  It compiles high-level code (written in the [OCaml](http://ocaml.org/) language) directly into specialized kernels that run directly on a hypervisor such as [Xen](http://www.xenproject.org/), without requiring a full Linux stack.  However, debugging microkernels is no fun, and so for day-to-day development the same source code can also be compiled as Unix binaries.  We're going to explain how the OCaml module system (one of the most powerful in any programming language) lets us rearrange the protocol stack to permit this degree of portability.

You can read more about Mirage and the research behind it in [a recent ACM Queue article](http://queue.acm.org/detail.cfm?id=2566628).

Q: What's the history of the Mirage project? What was the original motivation and how did it evolve? 

**Richard**: It evolved from a desire to radically improve the way we build cloud services for personal data management. It draws on Anil's PhD work ("Melange") in which he built languages and tools for implementing type-safe high-performance network protocols in OCaml. Our original vision was [published in 2010](http://anil.recoil.org/papers/2010-bcs-visions.pdf) -- we wanted to be able to implement secure, lightweight network services on devices that range from PICs to Amazon EC2.

**Anil**: The fun aspect of Mirage has been taking it from a research prototype (we published this at [USENIX HotCloud in 2010](http://anil.recoil.org/papers/2010-hotcloud-lamp.pdf)) into a real open source system.  Along the way, the project has developed some tools that are gaining increasing popularity in the OCaml community such as the [OPAM package manager](http://opam.ocaml.org).  I published an end-of-year blog post that summarises [a lot of the activity in 2013](http://anil.recoil.org/2013/12/29/the-year-in-ocamllabs.html).

Q: What do you hope to accomplish by giving this talk? What do you expect? 

**Richard**: Having recently announced the first release of Mirage, we hope to accelerate the growth of its community and see it used to build even more interesting and exciting applications and services.

**Anil**: Our goal in the next year is to take the Mirage codebase as a platform for constructing a resilient, secure "edge cloud" for personal data.  This isn't just for privacy (although that's a strong driver), but also because it works offline, and is much lower latency than communicating with a central service all the time.  We're calling this system ["Nymote"](http://nymote.org), and a lot of the components are working well enough now to self-host our homepages using them!  We're aiming to show this off at FOSDEM and get feedback/patches from the always-enthusiastic FOSDEM crowd.

Q: How does Mirage compare to the JeOS concept (Just enough operating system) that was popular a couple of years ago? 

It discards even the notion of a traditional OS kernel, building on the concept of a "library OS" from the 1990s to reconstruct each app as a self-contained bootable image.   Mirage kernels can be squeezed down into less than a megabyte, for example for a DNS server.  We're also focussed on static type safety to ensure that the kernel is free of obvious buffer overflows, which should be a minimum standard for anything Internet-facing in 2014!

Q: A Mirage image is compact and promises stellar performance because it contains only facilities that it uses and runs directly on the hypervisor. But could you give some interesting numbers about size and performance? Are the advantages big enough to use this concept in real applications? 

We'll present these in the talk :)  But one headline is that our DNS server beats the high-performance [NSD](http://www.nlnetlabs.nl/projects/nsd/) DNS server by approximately 8% on identical hardware (and the traditional BINDv9 DNS server by a factor of two).  You can read some detailed benchmarks in our [ASPLOS 2013 paper](http://anil.recoil.org/papers/2013-asplos-mirage.pdf), which covers DNS, HTTP and OpenFlow here.

Q: Which new features can we expect this year in Mirage? 

We're working towards a v2 release now which will include a restructured and more flexible network stack, as well as a more flexible and powerful configuration system.  As we gain more users, the focus is now on polish and tooling to make using Mirage more pleasant.

Q: Have you enjoyed previous FOSDEM editions? 

**Anil**: I had a great time in 2011 presenting some I/O optimization work in a keynote, and I've always enjoyed walking into random dev rooms to see what's going on.  I've never been to a conference that can compare with FOSDEM for the sheer amount of energy in one place!
