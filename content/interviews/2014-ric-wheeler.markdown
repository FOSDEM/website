---
year: 2014
person: Ric Wheeler 
speaker: ric_wheeler
topic: "Persistent Memory: Changing the Way We Store Data" 
event: persistent_memory 
---

Q: Could you briefly introduce yourself?

I work at Red Hat as the Director of the part of our kernel team that works on file and storage systems.  Our team includes people who deal with the entire IO path, starting with device drivers and working up to local and networked file systems.  Prior to joining Red Hat in 2008, I spent 10 years at EMC working as an architect for storage arrays, including many years working with the EMC Centera team which was centered in Belgium.

My wife is originally from London.  We met while we were both in graduate school in Israel and we now live in the Boston area with our 13 year old Jack Russell since our two boys are grown and on their own.

Q: What will your talk be about, exactly? Why this topic? 

Non-volatile memory parts are a new generation of technology that is roughly the same speed, cost and performance level as traditional DRAM. They are byte-addressable and do not lose state when power is lost, so they can be used as a full functioning storage device.

On the non-volatile memory side, we are still in very early days of getting ready for the new wave of technologies that will be hitting the market in the next few years. A lot of work is already going on to reduce latency in the stack which is driven by shipping, high speed, low latency parts.  The generation of technologies coming in the next couple of years will be even faster and push the IO stack even harder.

My talk will be focused on work we are doing in the Linux community and with industry wide standards bodies like [SNIA's NVM working group](http://snia.org/forums/sssi/nvmp) which is producing a set of reference access methods that will let us use these new parts at full speed.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I love to see how these parts challenge the way we think about storage. Getting the topics broadly exposed helps us think about what the right thing to do is. Can we reuse existing file systems or do we need whole new file systems? Can we tweak APIs or do we introduce new APIs?

I have been talking about this for a year or so now and it has always been great to reach out to new developers and vendors who have plans in this space.

Q: What exactly should be changed in the Linux kernel's architecture to optimally support non-volatile memory parts?

Some of the most significant new work is from Jens Axboe on the multi-queue block layer enablement that just recently landed upstream. Jeff Moyer is working on a prototype block driver for parts (still very early work) and Intel Research has a pmfs file system prototype. Chris Mason worked on introducing atomic writes to the kernel as well which was a broader project driven by [FusionIO](http://www.fusionio.com/) and others.

Q: Will application developers have to change their code to make use of non-volatile memory parts, or is this something that can be abstracted away by the kernel or libraries?

Most applications, especially if they are not IO limited, will run unchanged on these parts. It is pretty clear that we will need to support the entire, existing IO stack with a local file system on top of a block device. There will be new access methods (or tweaks to old ones) that a handful of high performance, high value applications will take advantage of. Think of applications that use async and direct IO today - it is painful and not that common, but useful for some.

Q: We have been hearing about the promising future of non-volatile memory parts for the last decade, but they never actually became widely available. What's the problem? What technological challenges do the manufacturers struggle with?

There are some parts that are shipping today and more coming in the next couple of years. I can't discuss roadmaps or dates for a specific partner, but I think that we will see a wide variety of interesting, DRAM form factor parts coming very soon.

Not specific to persistent memory is the need to balance all of the factors that make a technology useful - is it fast enough to motivate a change? Can we build them large enough to be really useful? Are they affordable enough to be common in the market?

Q: Have you enjoyed previous FOSDEM editions?

This will be my first visit to FOSDEM, but I have spent many very pleasant weeks in Belgium back while I worked at EMC. Looking forward to a great event!
