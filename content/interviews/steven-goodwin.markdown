---
year: 2018
speaker: steven_goodwin 
event: digital_archaeology
---

Q: Could you briefly introduce yourself?

My name is Steven Goodwin, known colloquially as Steev, and I'm a general-purpose computer geek from London! Professionally, I've written computer games, built enterprise-scale web platforms, and worked with Linux and open source for over 15 years. I've also written a few books on these, and other, topics... including three on beer!

Q: What will your talk be about, exactly? Why this topic? And what do you hope to accomplish by giving this talk? What do you expect?

It's about the problems involved in preserving our digital heritage, and some of the solutions. This includes the problem of large-scale bit rot, where the code hasn't been used (let alone compiled) for decades and is consequently unusable. It also covers the physical problems in dealing with antiquated cassette tapes, floppy discs, and the copy-protection schemes that went with them.

I suspect it's the first time many people will have considered the topic, so the best I can hope for is to raise awareness and plant the seeds of interest in a new audience. Hopefully, by demonstrating the work that's often necessary to recover old software, we can be proactive with our current code bases to prevent them from suffering the same fate.

Plus, if a few people decide to devote some time to help on any of these projects, that's a bonus!

Q: When and why did you decide to preserve our computing legacy?

I started around 1993 by creating a digital archive of old cassette tapes from the microcomputer era in the 1980's because I could see the physical tapes were disintegrating and might not last much longer. At the same time I saw a Sinclair ZX Spectrum being emulated for the first time, and I realised that preserving these machines in software was a more scalable approach than trying to keep the physical hardware working. I'm hoping that enough ground work can be laid now so that the knowledge learned from the earlier electronic computers can be preserved while there are still developers around with first hand knowledge.

Since then I've been lucky enough to work with the [Centre for Computing History](http://www.computinghistory.org.uk/) in Cambridge to both educate the public on these retro computers, but to help preserve them as well.

Q: What are the primary issues you encountered during your digital archaeology efforts?

Copyright and community feudalism! But usually the combination of the two is a greater problem than either alone, since neither the law nor humans are very easy to work with {LOL}  

From the technical side, understanding and implementing the minutiae of older machine is tricky because you have very little corroborating evidence with which to check your understanding.

Q: What's the role of free and open source software in digital archaeology?

It's role is that of a facilitator - it's a current technology that maintains an old technology.

Q: What are some interesting FOSS projects that can be helpful?

The most interesting are usually the emulators and cross-platform development environments, that foster small but dedicated groups of retro hackers to keep the proverbial flame burning - I'll provide links in the talk as well as adding them to my [digital heritage](http://marquisdegeek.com/digital_heritage) page. I'll also debut parts of a web-based emulator framework at FOSDEM, which could become a very interesting project... with enough help!

Q: How can interested people help preserve our computing legacy?

Many ways. If you've used old(er) machines in the past, then it's helpful to pass on that knowledge by scanning old manuals, noting your memories, or writing code that explains the 'how' and 'why' things worked in the way they did. I've recently started a 'Digital Heritage Archive' project to capture this information. In fact, anyone interested in computer history and taxonomies could help to ensure we're capturing this information in the best way possible.

If you like working with systems, it would be helpful to build virtual and containerised environments allowing anyone to run old code, on obsolete operating systems; be this emulators, compilers, or old software. At an event in Cambridge I saw a Dragon 32 emulator running on an Amiga emulator, running on Windows 7, which was virtualised on a Mac! Some software will only work on a specific version of hardware or operating system, so finding a way to keep those available in the future is an interesting and ongoing problem. For example, Microsoft recently released the source code to MS Word, and EA did the same with Deluxe Paint, so there's likely to be more coming in the future. I think it would be fantastic if a student of computer history could recompile and run this code easily, and so demonstrate software as being something dynamic and alive, instead of being a forgotten text file on a disc.

Finally, if you're a coder, then writing, maintaining, and documenting emulators is a worthwhile project. In the same way that backup tapes should be refreshed regularly, so should emulators. If the only emulators and tools for a particular retro platform are written in F#, for example, and there's no one in the community that understands F# then all the knowledge gained by writing that emulator gets lost. Consequently developers of any (and all) programming languages have a role to play - either to document and maintain these tools, or to safely port the code to something else and release it under a FOSS license. Right now, for example, there is a project to rebuild an Elliott 903 (a computer from 1965) as a Javascript emulator, since Javascript is an approachable language and likely to garner more interest from other communities.

Q: Have you enjoyed previous FOSDEM editions?

They're wonderful! I've attended every single FOSDEM since the start (missing only the initial OSDEM event) and blogged about my escapades at [my FOSDEM diary](http://marquisdegeek.com/words_fosdem).
