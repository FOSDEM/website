---
year: 2017
speaker: keith_packard 
event: the_machine
---

Q: Could you briefly introduce yourself?

My name is Keith Packard and I have been working on Unix and Linux
systems since around 1981. Starting around 1984, I began doing work with
the X window system, spent four years at the MIT X Consortium and then
the next 20+ years doing X system software work at a variety of
companies, including SuSE, Compaq, Hewlett Packard and Intel. In 2015, I
started at back at Hewlett Packard doing something completely different.

Q: What will your talk be about, exactly? Why this topic?

The something completely different I went to Hewlett Packard to work on
was a project called ['The Machine'](https://www.labs.hpe.com/the-machine), which is a large-scale effort to
redefine the nature of computer hardware. Such a large hardware effort
needs lots of new software, and the talk I'm giving is all about that
software.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'm hoping to introduce more people to the radical hardware and software
changes inherent in The Machine, and show people how they can start to
explore what this new computing architecture will do for them.

Q: What's the history of The Machine? Why did Hewlett Packard start it and how did it evolve?

The Machine program started when people at HPE realized that two new
hardware technologies were coming to fruition at about the same time --
large scale non-volatile memories and silicon photonics. In parallel
with that fundamental research, HPE was working on a new datacenter
scale system interconnect called [GenZ](http://genzconsortium.org/). The combination of these three
suggested a new system architecture that flattens the storage hierarchy
across an entire datacenter.

Initial thoughts about software for the machine were that such a large
shift in hardware would require a similarly large shift in software. As
The Machine was started by researchers in Hewlett Packard Labs, it
should come as no surprise that many of them were eager to get the
chance to go write a brand new operating system.

Linux was part of the program from the very start, as a stable base for
early exploration, but there was a lot of talk about when a new
operating system would be deployed to take 'full advantage' of the new
hardware. As we talked with potential users of the hardware, and got
more familiar with how the hardware would actually operate, we realized
that Linux would be fully capable of exposing the hardware to
applications, at least for the next few years.

Q: The system software for The Machine is based on Debian GNU/Linux. How big was the effort to port Debian to The Machine? What were the biggest challenges?

To Debian, The Machine operates like a cluster of independent machines
connected via a traditional network. All of the fancy new memory
hardware appears as a peripheral within the system. As such, the changes
needed to the core operating system were fairly minor, and focused on
providing new kernel modules for the new hardware.

The Machine prototype uses an ARM64 processor, and we're happy to report
that current Linux kernels and Debian user space bits 'just
work'. Bringing up the operating system on the hardware to a shell
prompt was uneventful.

On top of the base operating system are a raft of new libraries and
system services which are designed to integrate the individual 'nodes'
within The Machine into a coherent system.

Q: What changes are needed in applications to best take advantage of The Machine's hardware?

We've got several large-scale examples of how to best take advantage of
The Machine, and the common theme is to expect fast access to huge
amounts of persistent memory, and to expect that sending data between
separate computers in the same datacenter can be done for free. Most of
the changes make applications simpler as they eliminate communication
and explicit serialization/deserialization of data.

Q: Have you enjoyed previous FOSDEM editions?

FOSDEM is a highlight of the year for me. I've tried to attend every
year since I first came in 2004. I greatly appreciate the time and energy
spent in organizing this community-focused event and hope that it
continues to delight and inform the free software community for years to
come.
