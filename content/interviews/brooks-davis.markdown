---
year: 2017
speaker: brooks_davis 
event: hello_world 
---

Q: Could you briefly introduce yourself?

I'm a FreeBSD developer working for SRI International on a project with
the University of Cambridge.  We're designing, building, and testing
instruction set extensions that let us make C programs spatially safe
and make in-process compartmentalization extremely cheap.

Q: What will your talk be about, exactly? Why this topic?

I'll be walking through the execution of a seemingly simple "Hello,
world" program.  While the code is trivial, the pieces required to
support it are a remarkably complex bit of engineering built over decades.
I had to learn a lot of this while working on bringing up our
memory-safe variant of C and thought it would be fun to share.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to share the knowledge I've gained in the process of exploring
the C runtime and hope others will be interested.  While we usually
concentrate on the problem we're solving (most often at a much higher
level), it's sometimes useful to know what's going on in the background.

Q: Getting an understanding of a simple "Hello, world" program in C already amounts to talking about the linker, the compiler, the kernel, the memory allocator, system calls and so on. How much knowledge do you expect from the audience?

It would be helpful for people to have used a C-like programming
language and have some idea what the difference between a compiler and a
linker is.  There isn't much code in the talk (a few variants of
helloworld.c and one in MIPS assembly).

Q: Have you enjoyed previous FOSDEM editions?

I've attended a few times and gave a keynote in 2010.  I've been unable
to attend for a few years and am looking forward to attending again.
