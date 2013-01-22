---
year: 2013
person: Thomas Petazzoni 
speaker: thomas_petazzoni
topic: ARM support in the Linux kernel
event: arm_in_the_linux_kernel
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I'm Thomas Petazzoni, 29, living in Toulouse, in the south-west of France. I currently work as an embedded Linux engineer and trainer at [Free Electrons](http://free-electrons.com/). I am also amongst the most active developers of the [Buildroot](http://buildroot.uclibc.org/) project, an embedded Linux build system, and contributing to the Linux kernel support of Marvell ARM processors.

Q: What will your talk be about, exactly? Why this topic?

As one of your following question states, about two years ago, Linus Torvalds was not happy with the state of ARM. This dissatisfaction, combined with other reasons, has lead the ARM kernel community to make a number of fairly large changes, both at the development process level and at the code level. This talk will try to summarize those changes for those who are not following the ARM kernel development on a daily basis. As ARM platforms are more and more popular for embedded developers, and especially hobbyists, I thought giving such a talk at FOSDEM would be of interest to some people.

Why this topic? Well, simply because I'm currently working, with my colleague Grégory Clement at Free Electrons, in bringing into the mainline Linux kernel the support for the latest Armada 370 and Armada XP ARM processors for Marvell. This contribution allowed us to follow quite closely the ARM developments since about a year, so it sounded like a good idea to summarize what we've learned.

Q: What do you hope to accomplish by giving this talk? What do you expect?

As said above, thanks to the appearance of numerous low-cost ARM development platforms (such as the [BeagleBone](http://beagleboard.org/bone), [Rasberry Pi](http://www.raspberrypi.org/), and many more), the number of open-source developers who are jumping into the ARM world is increasing. Giving them an overview of how the kernel support is done for those platforms is the main goal of the talk. Hopefully, they should have a better idea on how to make changes to the kernel to take into account peripherals that they add to their development board, or to adapt it to other ARM platforms.

Q: Less than two years ago, Linus Torvalds was extremely dissatisfied with the state of the ARM tree in Linux, but nowadays the situation has improved considerably. How did this sudden change of direction happen?

As I wasn't part of the people taking those decisions back a few years ago, I can only give a few speculations here. Linus' claim two years ago was nothing really new, most of the ARM people were already conscious that there was a problem. In addition to that, distributions were asking for a single binary kernel image feature, which also required large scale changes to the ARM support. And the [Linaro](http://www.linaro.org/) consortium, who started to gain traction at about the same time, also played an important role here.

Q: What are the most important improvements in the ARM tree from the last two years?

Since it's the core part of the talk, I'll only be giving the big keywords: change in the development process, usage of the Device Tree, introduction of new subsystems such as the pinctrl and clock subsystems, introduction of the multi-platform support. Those different topics will be explained during the talk.

Q: Which challenges is the ARM tree in Linux still facing?

Again, I may not have the big vision to fully see all the challenges, but from my point of view, there are two challenges:

 * Bring all the existing platforms supported by Linux up-to-date with the large changes that have occurred in the ARM tree. On one side, Linux and open-source developers in general like to keep support for old platforms for a long time (a value that has often been raised as an advantage of open-source as opposed to proprietary software). On the other side, some of the old platforms don't have a lot of users, hardware may be difficult to find, and the incentive to spend development time on those platforms is quite low.
 * Handle the increasing complexity of ARM processors. More and more complex features are being integrated by silicon-vendors at the hardware level, and most of those features require some sort of software support. Supporting this complexity is a challenge, and this challenge is even higher when you strive at designing generic subsystems and interfaces (as opposed to highly hardware specific hacks). This requires a lot of discussions between kernel developers working on different families of ARM processors.

Q: What are the most important points of attention for developers porting Linux to a new ARM hardware platform if they want to get hardware support into the mainline Linux kernel?

Depends on whether we're talking about porting Linux on a new board for which the ARM SoC is already supported by Linux, or if you're porting to an entirely new ARM SoC. The difference between the two is quite significant. But in both cases, the biggest change that took place, affects all ARM kernel developers, and is not really trivial, is the introduction of the Device Tree.

Q: How can we prevent the Linux ARM support from becoming a mess again like it was two years ago?

Having more development time dedicated to cross-sub-architecture review, and more time and funding to get ARM kernel developers together discussing how to solve the complexity using generic subsystems and interfaces are probably the key solutions.

Q: Have you enjoyed previous FOSDEM editions?

Of course! I've been somewhat late at discovering the awesomeness of FOSDEM, as I've only been attending since the last 4 years or so. That said, I now book my flight very early, generally as soon as the dates of FOSDEM are announced, even if the schedule hasn't been published yet: at FOSDEM, you have a 100% guarantee of getting a great set of talks. And also, the Buildroot project has been organizing a developer meeting right before or after FOSDEM since a few years, which makes the entire trip even more useful and interesting.
