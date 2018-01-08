---
year: 2018
speaker: diomidis_spinellis 
event: unix_evolution
---

Q: Could you briefly introduce yourself?

I'm a professor of software engineering, a [programmer](https://www2.dmst.aueb.gr/dds/sw) at heart, and a [technology author](https://www.dmst.aueb.gr/dds/pubs/index.html#book). Currently I'm also the editor in chief of the [IEEE Software](http://publications.computer.org/software-magazine/) magazine. I recently published the book [Effective Debugging](http://www.spinellis.gr/debugging), where I detail 66 ways to debug software and systems.

Q:  What will your talk be about, exactly? 

I will describe how the architecture of the Unix operating system evolved over the past half century, starting from an unnamed system written in PDP-7 assembly language and ending with a modern FreeBSD system.  My talk is based, first, on a [GitHub repository](https://github.com/dspinellis/unix-history-repo) where I tried to record the system's history from 1970 until today and, second, on the evolution of documented facilities (user commands, system calls, library functions) across revisions.  I will thus present the early system's defining architectural features (layering, system calls, devices as files, an interpreter, and process management) and the important ones that followed in subsequent releases: the tree directory structure, user contributed code, I/O redirection, the shell as a user program, groups, pipes, scripting, and little languages.

Q: Why this topic?

Unix stands out as a major engineering breakthrough due to its exemplary design, its numerous technical contributions, its impact, its development model, and its widespread use.  Furthermore, the design of the Unix programming environment has been characterized as one offering unusual simplicity, power, and elegance.  Consequently, there are many lessons that we can learn by studying the evolution of the Unix architecture, which we can apply to the design of new systems.  I often see modern systems that suffer from a bloat of architectural features and a lack of clear form on which functionality can be built.  I believe that many of the modern Unix architecture defining features are excellent examples of what we should strive toward as system architects.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'd like FOSDEM attendees to leave the talk with their mind full with architectural features of timeless quality.  I want them to realize that architectural elegance isn't derived by piling design patterns and does not need to be expensive in terms of resources.  Rather, beautiful architecture can be achieved on an extremely modest scale.  Furthermore, I want attendees to appreciate the importance of adopting flexible conventions rather than rigid enforcement mechanisms.  Finally, I want to demonstrate through examples that the open source culture was part of Unix from its earliest days.

Q: What are the most significant milestones in the development of Unix?

The architectural development of Unix follows a path of continuous evolution, albeit at a slowing pace, so I don't see here the most important milestones.  I would however define as significant milestones two key changes in the way Unix was developed.  The first occurred in the late 1970s when significant activity shifted from a closely-knit team of researchers at the AT&T Bell Labs to the Computer Science Research Group in the University of California at Berkeley.  This opened the system to academic contributions and growth through competitive research funding.  The second took place in the late 1980s and the 1990s when Berkeley open-sourced the the code it had developed (by that time a large percentage of the system) and enthusiasts built on it to create complete open source operating system distributions: 386BSD, and then FreeBSD, NetBSD, OpenBSD, and others.

Q: In which areas has the development of Unix stalled?

The data I will show demonstrate that there were in the past some long periods where the number of C library functions and system calls remained mostly stable.  Nowadays there is significant growth in the number of all documented facilities with the exception of file formats. I'm looking forward to a discussion regarding the meaning of these growth patterns in the Q&A session after the talk.

Q: What are the core features that still link the 1970 PDP-7 system to the latest FreeBSD 11.1 release, almost half a century apart?

Over the past half-century the Unix system has grown by four orders of magnitude from a few thousand lines of code to many millions. Nevertheless, looking at a 1970s architecture diagram and a current one reveals that the initial architectural blocks are still with us today. Furthermore, most system calls, user programs, and C library functions of that era have survived until today with essentially similar functionality.  I've even found in modern FreeBSD some lines of code that have survived unchanged for 40 years.

Q: Can we still add innovative changes to operating systems like FreeBSD without breaking the 'Unix philosophy'? Will there be a moment where FreeBSD isn't recognizable anymore as a descendant of the 1970 PDP-7 system?

There's a saying that "form liberates".  So having available a time-tested form for developing operating system functionality allows you to innovate in areas that matter rather than reinventing the wheel.

Such concepts include having commands act as a filter, providing manual pages with a consistent structure, supplying build information in the form of a Makefile, installing files in a well-defined directory hierarchy, implementing filesystems with an standardized object-oriented interface, and packaging reusable functions as a library.  Within this framework there's ample space for both incremental additions (think of jq, the JSON query command) and radical innovations (consider the Solaris-derived ZFS and dtrace functionality).  For this reason I think that BSD and Linux systems will always be recognizable as direct or intellectual descendants of the 1970s Research Unix editions.

Q: Have you enjoyed previous FOSDEM editions?

Immensely!  As an academic I need to attend many scientific conferences and meetings in order to present research results and interact with colleagues.  This means too much time spent traveling and away from home, and a limited number of conferences I'm in the end able to attend.  Nevertheless, attending FOSDEM is an easy decision due to the world-changing nature of its theme, the breadth of the topics presented, the participants' enthusiasm and energy, as well as the exemplary, very efficient conference organization. 
