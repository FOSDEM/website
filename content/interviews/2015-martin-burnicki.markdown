---
year: 2015
person: Martin Burnicki
speaker: martin_burnicki
topic: "Technical Aspects of Leap Second Propagation and Evaluation"
event: technical_aspects_of_leap_second_propagation_and_evaluation 
---

Q: Could you briefly introduce yourself?

I made my degree in electrical engineering. Already before this was finished I started to work at [Meinberg](http://www.meinberg.de/) in Germany, a company which already developed radio clocks for the German longwave transmitter DCF77 at that time, beside some other stuff.

Initially I developed circuits with microcontrollers, then moved over more and more to write firmware for these microcontrollers, first in assembly language, then in C. When GPS came up we developed our own GPS receiver at Meinberg which was targeted at high accuracy timing.

Today I'm maintaining the driver software for PCI cards under different operating systems, focusing on API compatibility across different operating systems, driver versions, and types of PCI cards.

All the stuff I've been working with was closely related to accurate timekeeping, including the handling of leap seconds.

Of course this also covers time synchronization protocols like [NTP](http://www.ntp.org/) and [PTP](http://ptpd.sourceforge.net/), and Meinberg is actively supporting these open source projects.

Q: What will your talk be about, exactly? Why this topic? 

When I started to work with this stuff leap seconds were very common, and inserted nearly once ever year, or every 1.5 years. People were expecting that future leap seconds would be required in even shorter intervals, but suddenly there was a span of 7 years where no leap second needed to be inserted.

Thus many developers forgot about leap seconds and young folks had often not even heard about them, so many developers didn't take care to handle them correctly in their software. And when the first leap second occurred after this long interval, there were a couple of bugs.

Recently leap seconds occurred only in relatively large intervals, so many developers still don't have them in mind, even if they are writing software where they should.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Making developers aware of the fact that leap seconds exist, what to keep in mind when dealing with leap seconds and time synchronization, and explaining potential pitfalls.

Q: How can application developers make sure that their application doesn't malfunction when dealing with a leap second? For example, what to do when various remote systems communicate timestamps but use different ways to increment their time with a leap second? 

Application developers should be aware that the system time can step back by 1 second in worst case. This is because many systems just implement the leap second this way, since it's pretty easy.

Other systems may apply the leap second gradually over a certain period, and if you compare the time of two such different systems there *will* be large differences. Developers should know why this is the case, so they can handle such a situation according to the requirements of their application.

Q: There have been a lot of bugs with applications that choke on leap seconds. What are the most crazy bugs related to leap seconds that you know? 

I think the most commonly known bugs where in the Linux kernel. At one occasion the kernel was running into a deadlock when it tried to emit a log message due to the leap second insertion in an inappropriate way. This made the affected computer stop immediately

The other one was when the Linux kernel ran into a tight execution loop causing 100% CPU usage continuously, which also increased power consumption significantly. When this happened at the same time on all machines in a computing center this caused significant additional costs.

On the other hand there is Windows, which knows nothing about leap seconds, and would continue to work with a time 1 second off if no external application would fix this.

Q: Have you enjoyed previous FOSDEM editions? 

No, I'm attending the first time.
