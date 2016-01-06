---
year: 2016
speaker: michael_kerrisk 
event: design_linux_kernel_api
---

Q: Could you briefly introduce yourself?

My name is Michael Kerrisk. I'm a New Zealander, living in Munich, Germany. I spent many years as a programmer, but these days I'm primarily doing [training work and writing](http://man7.org/). Since 2004, I've been the maintainer of the Linux man-pages project, which provides the manual pages documenting kernel-user-space and C library APIs (https://www.kernel.org/doc/man-pages/).

Q: What will your talk be about, exactly? Why this topic?

The fundamental points about APIs are that they live for a very long time, and once released it is usually difficult to change them (since changes typically mean breaking existing applications that already use the API). Therefore, it's essential to come up with an initial API design that is as good as possible. The focus of my talk is looking at ways of improving API designs, with a focus on process issues, since I think that's where the problem largely lies, although I will also look at a few technical points as well.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to focus more minds -- those of both kernel developers and user-space programmers -- on improving the design of APIs provided to user space by the kernel (and closely associated layers, such as the C library).

Q: What are some of the worst API decisions made in the Linux kernel and why?

I wouldn't single out any single decision, so much as point to some recurrent problems, among the most prominent of which are lack of consistency across APIs, failures to produce APIs that are fit for purpose, and insufficient testing of APIs.

Q: Do you have some general guidelines for a kernel developer designing a kernel-user-space API?

While there are many general guidelines that I could make, I'd say the most important one is this: get as many stakeholders (kernel maintainers, user-space programmers, potential testers, documentation writers) involved as early as possible in reviewing and critiquing your proposed API. All of those people have valuable insights, but those insights become less valuable once an API is released, since from that point it becomes difficult -- if not impossible -- to fix the API.

Q: How can user-space developers help kernel developers improve the kernel-user-space API?

For user-space developers to contribute to Linux development, there's a lot of low hanging fruit when it comes to reviewing and testing APIs. (My motto when it comes to API designs is: show me a new API, and I'll show you a bug. I've found a lot of bugs over the years with some fairly basic testing of new APIs.) It's a very easy way of getting involved in the development of Linux.

Q: Have you enjoyed previous FOSDEM editions?

FOSDEM normally falls on the same weekend as we celebrate my daughter's birthday, so I've not been to FOSDEM before, though I've long wanted to. This year, the calendar fell favorably, and I'm hugely looking forward to my first FOSDEM, catching up with a lot of people I know, and enjoying some Belgian beer!

