---
year: 2018
speaker: liam_proven 
event: alternative_histories
---

Q: Could you briefly introduce yourself?

I'm a British writer and consultant living in Prague. I've been in IT for about 30 years and currently work for SUSE as a technical writer.

Q: What will your talk be about, exactly? Why this topic?

This came out of some research I started about five years ago, looking for some interesting but obscure retro-computing tech to talk about. I stumbled across something far larger than I'd ever suspected.

Q: What do you hope to accomplish by giving this talk? What do you expect?

A very big change in the way that computers work is approaching and almost nobody has spotted it yet. It's going to cause a huge shake-up.

Some of the issues it will raise were addressed decades ago, in machines and software now mostly forgotten. I'd like to save the wheel from being re-invented yet again.

Q: What is this "very big change" and which old systems have addressed these issues?

Since the early days of mainframes, all computers have shared a design: of two-level store. The processor is connected directly to a small amount of fast but volatile store, and also by a narrower channel to a larger pool of non-volatile store. In other words, RAM and disk.

That will go away soon, at least for some machines -- i.e. not for most servers, but for client devices.

Already there is Intel 3D X-Point. You can buy flash DIMMs for servers, to put flash directly on the memory bus instead of as an SSD.

HP is working on memristors.

There will be machines with, say, at first, 512GB or so of non-volatile RAM and nothing else. No disks. No drives. No block-accessed non-volatile storage: all storage will be non-volatile.

If you think of all the assumptions in _all_ mainstream OSes, that there is some disk that you "load" code and data from into memory, and then work on it in RAM, and then "save" it back -- this is in _everything_. Windows, Unix, IBM VM, OpenVMS, all of them.

And it's going away. This looks very clear. Early products are shipping now.

When you have such a machine, many assumptions are wrong. You don't boot it or shut down; you turn on, run, turn off. It remains where it was. You don't install an OS -- what from? What to? When it's built, an OS is copied into its RAM and then you're done, for life unless you have a serious problem. There is no need for files or filenames: every byte of storage is in the CPU's memory map.

This is totally unlike how all mainstream OSes work today. In some ways it's more like a 1980s 8-bit home computer: you turn on and it starts running its ROM. No booting, no startup delay while code is copied from ROM into RAM. It executes in place.

This is a huge opportunity to lose 50 years of legacy baggage and start over.

Q: Why has this retro-computing hobby become so hugely popular now?

Because modern computers suck.

They're hugely complex, very hard to understand, almost impossible for any one person to master. They're [slower](https://danluu.com/input-lag/) than they were in real terms.

They take ages to boot which we conceal using SSDs. They are vastly complex and need software updates approaching daily. They are frequently exploited.

People remember the simple reliable machines they used when they were kids, they knew them inside out, and they miss them. So they are emulating them, building new versions, because they want computers that are _fun_ again.

Q: What's the biggest insight you got from studying a forgotten computer platform?

There's an idiom: "you can't see the wood for the trees". Studying some dead platforms showed me how remarkably widespread some modern assumptions are.

Q: Could you tell us something about some of these modern assumptions that are problematic?

I think we have a widespread cultural problem. One side won a war in the '80s. Smalltalk and Lisp machines went away and we all got Unix machines or their relatives: RISC processors, or CISC ones that work as RISC internally. OSes written in C, with all the problems that brings. The belief that C is the fastest language because it's close to the metal and so if you want performance it's the only choice. But it's hard to build big apps in it, so we layer other languages on top for doing that -- which are implemented in C. Or run in a VM, that itself is implemented in C. We build CPUs that are optimised to be fast at running compiled C.

There were once machines where the fundamental unit of storage was a linked list, not a byte.

There were machines where garbage collection was faster than manual memory management!

30 years ago people wrote the whole stack, from kernel to apps, in a single language, and people loved the result.

Other abstractions are visible in niche machines like the Apple Newton or Canon Cat. Machines with no filesystem, no distinction between source and binaries, no compilers, no applications.

All this stuff with "programs" that "load" "files" that you work on and then "save"? A convention from a couple of families of OSes that happened to sell well. One abstraction. There are others, but we've collectively forgotten them.

Q: Which of these old platforms would still be useful today and why?

Just one I am playing with currently is A2 with Bluebottle -- the full-GUI-desktop version of Niklaus Wirth's Oberon OS, written in the Oberon language. A complete internet-capable OS, with compiler, in a few tens of thousands of lines of code. It's a great educational system.

Q: Which of the current big computer platforms will probably become obsolete like some of the forgotten platforms you studied, and which ones have a bright future?

Well, depending what happens -- all of them. There are invalid assumptions embedded in the most basic design of Unix and Windows that are not in, for example, IBM i.

Q: About which assumptions are you talking and how is IBM i solving these issues?

IBM i was once OS/400 for the AS/400 machines. Now it's an OS that runs on IBM POWER servers.

It is based on the [single-level store](https://en.wikipedia.org/wiki/Single-level_store) model.

It's the last extant widely-used OS with this model.

It does not consider RAM and filesystem to be different things. Essentially, all storage blocks are disk blocks. Programs access them as they wish, the OS makes sure stuff is in RAM for speed and is written back to disk so it's still there next time.

In  a way, it's a RAM-less OS. I think we're sort of heading towards a disk-less computer instead, but it's interesting that at least one instance of this model has survived.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first, and I am really looking forward to it.
