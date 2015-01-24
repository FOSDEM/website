---
year: 2015
speaker: antti_kantee 
event: what_is_wrong_with_operating_systems 
---

Q: Could you briefly introduce yourself? 

Professionally, I offer consulting services to fix small problems in operating systems, though I keep hoping that someone will have the initiative to fund solving the big, gaping ones.  Academically, I hold a doctorate in software systems, though I'm more interested in solving engineering problems which constitute the difference between a working and non-working system.  Personally, I like eating and cooking, though not necessarily in that order.

Q: What will your talk be about, exactly? Why this topic?

The talk is about raising the question of whether you unconditionally need an operating system or whether you really want something else, and what you'd actually want from an operating system if you do happen to need one.  To give a cliché transportation analogy, now that people are critically thinking about whether they actually need a car, many are realizing that they actually do not need one. Instead, they need a method for moving around. In a majority of the cases (but not always!) a bicycle is better for that than a bulky, expensive and wasteful car.

Emerging use cases like the cloud or the Internet of Things (IoT) introduce new requirements to the operating system, because in those cases the person deploying the application is in charge of the entire software stack, and there is no need to artificially bifurcate the software stack between application and system software. That makes the topic, hmm, topical.

So it's not so much of the "here's what I've done and here's why I think it's useful for you" type of talk that I usually give.  It's more of a "these are some of the twists that we really should think more about instead of just ploughing straight forward" type of talk.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope that people will start thinking about the role of the operating system and if it is necessary for their software stack.  I do not expect a revolution in the week following FOSDEM, but I think that in 5 to 10 years we will no longer be in a situation where every scenario in computing starts with "boot an OS" (well, not an OS as we know them today, at any rate).

Q: Where do current operating systems fall short?

Let's first think about what an operating system should do.  One answer is that an OS provides abstractions and mediates access to resources.

Abstractions are provided by drivers.  Sometimes people take the word "driver" to mean only hardware device drivers, but I like to think of drivers as encompassing software constructs too.  For example, a NIC driver is a device driver while the TCP/IP stack is a network protocol driver.  HTTP processing is also done by a driver.  The TCP/IP drivers are often implemented in the kernel, while the HTTP driver is implemented in userspace.  Why?  One could start arguing about it from the historical viewpoint where network packet creation was a holy operation.  However, these days with 10 internetworking devices falling out of your pocket whenever you try to find your car keys, separating one driver from another does not matter so much.  Note that you _do_ need those drivers for your application software to run, but you do not necessarily need the driver bits to be a black box for the application bits.

What about resource sharing and arbitration, i.e. giving everyone their and only their fair share?  Modern mainstream operating systems do not do a very good job at that.  You cannot safely run untrusted software without isolating it into another OS instace.  In most cases you do not even want to run trusted software against unsafe input, because the OS will not catch you if your software falls.

So, based on the above definition, one could argue that current mainstream operating systems do nothing but fall short ;)

Of course, there are other important features that a OS may need to support somehow, including configuration, package and content management.  The form these functions might or might not take depends on the operating environment, e.g. in a single-image system you might want your packages to come from a pool and when there's a reason to upgrade, you'd simply create the entire image; in a more traditional system you'd want flexible upgrades on the fly.  That said, I have more knowledge about the OS roles that I listed at the beginning of this question, so that's what the talk will at least concentrate on.

Q: If you look at it from a bird's-eye view, how have operating systems evolved during the last couple of decades? What are the biggest changes and in which domains do current operating systems still look a lot like their predecessors?

This question is difficult since it's so wide.  The first thing that comes to mind is that my Ubuntu laptop seems slower and less stable than my Slackware desktop from almost 20 years ago.  Pulling from that thought, the big change I, a user, can think about is that the web browser no longer freezes if there is a problem when doing a DNS lookup.

So, I'd say that operating system evolution in the recent decades is more of the same sometimes done a little bit better.  Perhaps there was no reason for operating systems to radically evolve until now?

One might be tempted to say "virtualization" here, but when you think about it, it is the biggest possible non-evolution in operating systems: nothing changed.  It's actually a likely reason why virtualization became so popular so quickly: nothing changed.  Sure, virtualization solved a problem, but it did so by figuring out how to cram the existing operating system onto the new playing field.

One might also be tempted to mention the growing Microsoft/Apple/etc. UI candy -- and some of it does make sense -- but I'm not.

Q: An ongoing discussion in operating system development, also among Linux kernel developers, is what to do in userspace and what in kernelspace. What's your take on this? Do you have general guidelines to facilitate a decision when this question comes up?

There is little difference between userspace and kernelspace; there is no magic which makes kernel code run faster or crash less.  In practice, kernel code tends to crash less because of an obvious reason -- I truly hate the word "obvious", but I think I used it justly here.  Kernel code will run faster only if all of the processing takes place in the kernel.  Since the full application stack rarely runs in the kernel, especially networking people are discovering that things are actually much slower in the kernel.  Ultimately, if we are talking about drivers, my general opinion is that such discussions are about arguing if one should type "mutex\_lock()" with or without "pthread\_" in front.

Q: At previous FOSDEM editions, you have talked about the anykernel concept and rump kernels in NetBSD. Which lessons about operating systems have you learned by working on rump kernels?

For people unfamiliar with that work, rump kernels are a method for running drivers on top of a thin hypercall interface which has been implemented for example for userspace, cloud hypervisors or bare metal.  Apart from the driver or drivers, a rump kernel carries very little policy, and does not include for example a thread scheduler, but rather relies on host policies for those.  The anykernel is a term meaning "kernel codebase allows drivers to run as rump kernels".  The NetBSD kernel is an anykernel, i.e. the exact same driver will run both in the monolithic kernel and a rump kernel without modification, so we can infer that unmodified NetBSD kernel drivers will run in any environment.  There are of course details, but that's the short version.

The lesson from that work related to this talk is that we can throw the policy heavy OS out of the window and move forward with baby steps in software stack experiments.  The key is that the slate can be wiped selectively clean without sacrificing the ability to run existing applications on existing hardware using existing production quality drivers.

That said, this talk will not directly be about rump kernels.  Anyone wanting to know more is invited to look at [rumpkernel.org](http://rumpkernel.org/) and [book.rumpkernel.org](http://book.rumpkernel.org/), or to invoke a hallway track session at FOSDEM.

Q: Have you enjoyed previous FOSDEM editions?

I do keep coming back every year ;)
