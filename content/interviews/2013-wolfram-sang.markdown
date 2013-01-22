---
year: 2013
person: Wolfram Sang 
speaker: wolfram_sang
topic: Maintaining a kernel subsystem
event: maintaining_a_kernel_subsystem
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

My name is Wolfram Sang and I come from Northern Germany. I have been hacking computers since my childhood, especially the Commodore 64. I have been hacking the Linux Kernel since 2008, mostly for the cool team at [Pengutronix](http://www.pengutronix.de/index_en.html). Nonetheless, I am going to be a freelancer in the Embedded Linux field from now on. I also maintain the I2C subsystem.

Q: What will your talk be about, exactly? Why this topic?

It will be about my challenges and workflow as a Linux Kernel subsystem maintainer. Such things are not much known. One reason is because they are highly individual. I want to present one example, my personal one. It is a talk I'd like to have attended myself, a few years ago.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Transparency, I guess. I could imagine that some people would like to simply have a look behind the scenes. Other people might get a better understanding what maintainers have to deal with and this maybe makes their upstreaming process more fluid. Very maybe, one or the other might get interested themselves to take over an orphaned subsystem, although this is not really my expectation nor motivation. It would be great, still.

Q: What exactly is the I2C subsystem and why is it so important for the Linux kernel?

The I2C bus is a quite simple, low-bandwidth bus to access devices which are typically EEPROMs, sensors or regulators. While not really rocket science, there are some details to take care about in the I2C core. And then, there are a lot of bus master drivers. Their number is quite increasing since the many new ARM chips often need new or updated drivers. If I2C fails, your mobile phone might not power-up (no access to power regulators), your tablet might not have sound (no setting up of the audio codec) or the fan control of your PC may go crazy (no temperature information).

Q: On which grounds do you decide whether you accept patches or not? What are your most common reasons to refuse patches?

They need to meet some formal criteria, like coding style and Signed-off lines. They need to use existing mechanisms and not open code something again. The solution to a problem should be as generic as possible. There shouldn't be any regression for users. And then, there is this unspecified thing called "taste". Some solutions do work, but don't look optimal to me. This is where most of the discussion goes to. I may be wrong there and can be convinced. The top reason to refuse patches are formal problems, though. Followed by open coding already existing mechanisms. Luckily, those are easily fixed.

Q: Which tools do you use to organize your workflow?

This will be covered in my talk :-)

Q: Have you enjoyed previous FOSDEM editions?

I have to admit that most of the topics are too high level for my low-level attitude. Nonetheless, the variety of topics is huge, so I always find something of interest. Also, FOSDEM attracts a number of great people, so the hallway talks are very valuable. That all set up in Bruxelles, where I had lots of fun so far, makes FOSDEM an event I always look forward to visit. Thanks to all involved for organizing it again and again!
