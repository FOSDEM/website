---
year: 2020
speaker: warner_losh 
event: early_unix 
---

Q: Could you briefly introduce yourself?

My name is Warner Losh and I'm a problem solver. I’ve always enjoyed a challenging problem. I've worked on high-precision time and frequency systems that measured the atomic clocks that went into UTC. I've worked on PCIe solid state memory storage devices that predated NVMe. I've worked on an X11 UI toolkit and GUI builder designed to bridge the OpenLook/Motif rift in the Unix Wars. Throughout this long career I've also worked extensively on open source software. I made my first open source contribution to the net news reader 'rn' in 1985. My first exposure to Unix was 4.2BSD on a VAX 11/750, and more recently I've been heavily involved in FreeBSD since just after it started in the 1990s. I've served on the FreeBSD core team on and off for years. These days I work for Netflix, optimizing storage performance for our OCA video servers.

I also fix dinosaurs.

Q: What will your talk be about, exactly? Why this topic?

My talk is about the hidden gems in the early history of Unix. While many talks have been given about the history of Unix, they tend to gloss over the first 10 or so years. This was quite an exciting time for Unix's development, and many interesting and exciting firsts for Unix actually happened in this period, not later as many people believe.

I became interested in this stuff a few years ago, when a copy of Venix for my old DEC Rainbow resurfaced. It was the only Unix available for the Rainbow. In the 80s when I first bought my Rainbow, Venix was too costly. However, once I got my first job and was able to afford to buy it, it was unavailable. The DEC Rainbow community thought Venix to be long lost to the sands of history. A couple of years ago installation disks for it were found, and I helped to recover the data from them them and recreate copies of the disks so I and others could install it on these old dinosaurs. This led to closer exploration of what made Venix 2.0R tick. It was a Unix 7th Edition port with some BSD and System III additions. I thought it would be cool if I could recreate Venix binaries from now-released sources. This led me to writing an emulator for Venix binaries so I could run the Venix compilers on something other than my super-slow and increasingly fragile Rainbow. That led to research into available sources, and I discovered an active community in [TUHS](https://www.tuhs.org/) (The Unix Heritage Society). Through them, I discovered different interesting papers (and sometimes source code) about cool features predating by years or even a decade my notion of when Unix got that cool feature. During this time the pdp7 Unix source was recovered from paper listings by volunteers in TUHS transcribing them and enhancing emulators so they could be run once more.

Since this started, I’ve spent hundreds of hours reading, studying and searching this history. Along the way, I found a lot of cool ideas, technology, and artifacts that I hope to share in my talk.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope this talk spurs interest in the early history of Unix. We’re missing many artifacts from the first 10 years, and I hope an increased awareness of the history will help to recover them. I also hope to remind people that all things old are new again, and that things such as virtualization of Unix have a longer, more colorful history than is generally known. I also expect to have some fun and to maybe learn from my audience additional lost gems.
 
Q: Looking back at the history of early Unix, what are some fundamental changes between Unix then and its descendants now? And what hasn't changed fundamentally since then?

The biggest change to Unix came about when it started to support multiple processing. Prior to that, the Unix kernel kept its state in global variables with the assumption that only a single thread could execute. Changing from that to a more general system has shaped what it's become. It's fascinating to see the evolution of the different multiprocessing approaches that have been used over the years as people scale Unix (and Linux) to ever more processors with changing penalties for atomic instructions. Despite these large and extensive changes to the base Unix, however, the external interface has remained relatively consistent for a long time. This is both good and bad: long-term API stability is great for software maturity. It's not so good, however, for exploiting the newer features and capabilities of the machine.

Unix's descendents, be they Linux, BSD, or Solaris, scale much better than the old Unix systems did to today's hardware. They support easily ten thousand more device types than early Unix and hundreds more CPU families and architectures. They scale to systems with millions of times more memory and billions of times more disk space than any of the early systems had (or could use). They also run software more complex and distributed than the early systems. All this raw power has also led to greater complexity and redundancy, much of which isn't really needed, that departs from the early simplicity of Unix.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS, or how did you in particular benefit from FOSDEM?

FOSDEM has acted as a European (and world wide) meeting point for different subcommunities in Open Source that would otherwise not interact. The cross-pollination of ideas and technology at FOSDEM has helped to advance the state of the Open Source art. I’ve benefited from FOSDEM’s contributions to the community, and I hope to make friends with people in other communities I’d otherwise not have a chance to meet.

Q: Have you enjoyed previous FOSDEM editions?

No. This will be my first one.
