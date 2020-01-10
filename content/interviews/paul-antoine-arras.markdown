---
year: 2020
speaker: paul_antoine_arras 
event: sabre
---

Q: Could you briefly introduce yourself?

I'm Paul-Antoine Arras, a French computer scientist excited with low-level stuff. I did my PhD on the acceleration of video decoding on heterogeneous embedded platforms (see my [PhD disseration](https://tel.archives-ouvertes.fr/tel-01118687v1) in French). During my first postdoc, I worked on functionally-asymmetric multiprocessing with the [RISC-V](https://riscv.org/) open ISA. Then I went to Imperial College London to work on multi-version execution and binary rewriting.

Today I'm working as an independent consultant in low-level software development and hardware architecture.

Q: What will your talk be about, exactly? Why this topic?

I'll be presenting the result of my work at Imperial College on binary rewriting. More precisely, I'll introduce a tool called [SaBRe](https://github.com/srg-imperial/SaBRe/) that can be used to intercept system calls on Linux. By intercepting, I mean not only tracing them but also possibly changing the arguments and returning values in a user-defined fashion; actually SaBRe allows to execute virtually any piece of C code both before and after the actual call.

SaBRe is not the first tool to provide this instrumentation capability. However, to the best of our knowledge, it is currently the only free software that does it at such a low overhead and without the need for any third-party library. That makes SaBRe usable in production and suitable even for small embedded systems. Such good performance could only be achieved through binary rewriting. I'll show exactly why with simple but realistic examples during my presentation.

I understand that nowadays software development techniques have reached such a level of maturity that it may seem futile and quaint to focus on low-level topics like binary rewriting. However, at a time when green computing is gaining ground consistently, I believe that working at lower levels of abstraction is one of the best solutions to limit the waste of computing resources and power.

Q: What do you hope to accomplish by giving this talk? What do you expect?

As mentioned earlier, I hope to demonstrate that binary rewriting is the best option when it comes to intercepting system calls and also regular function calls. More broadly, I'd like to reconcile developers with binary code. Even though the vast majority of software built in 2020 is written in high-level languages like Python and JavaScript, the CPU still only understands 0s and 1s, and abstractions, as good as they can get, still leak. I'm obviously not advocating writing assembly code by hand unless absolutely necessary. However, I think that any proficient developer should have at least some basic knowledge of low-level constructs.

I would really appreciate to get some feedback both on SaBRe, on binary rewriting in general and also on how fellow developers feel about low-level programming these days.

Q: What are the biggest accomplishments in the domain of binary rewriting from the last few years?

As regards static rewriting, [Multiverse](https://github.com/utds3lab/multiverse) guarantees to rewrite arbitrary x86 (32 bits) binaries without heuristics. Other tools usually rely on assumptions that prevent their use on obfuscated code such as malware. To guarantee a correct recovery of all legal instruction, Multiverse leverages a so-called "superset disassembly" technique, i.e. brute-force disassembling all executable byte offsets.

In the field of dynamic rewriting, [RL-Bin](https://iaria.org/conferences2019/filesICSEA19/RajeevBarua_AFrameworkForRobust.pdf) shrinks the runtime overhead to 5% on average, even for self-modifying or dynamically-generated code. In comparison, DynamoRIO, which is older but still a reference in the domain, incurs a 16% slowdown. Such good performance is achieved through just-in-time analysis of discovered code and in-place rewriting, contrary to most other dynamic rewriters that rely on code caching.

Finally, a comprehensive survey of the state of the art in binary rewriting techniques has recently been [conducted by Austrian researchers](https://doi.org/10.1145/3316415) and constitutes both a good introduction and update on the subject.

Q: Have you enjoyed previous FOSDEM editions?

Unfortunately, I wasn't able to attend past editions. However, I followed them closely and with great interest over the Internet.

By the way, I'd like to take this opportunity to thank all the teams involved in recording the talks in video and bringing all the presentation material to us, both for the main tracks and the devrooms. You're doing an amazing outreach job that all the FOSS community is grateful for!
