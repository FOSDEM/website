---
year: 2013
person: Lennart Poettering 
speaker: lennart_poettering
topic: systemd, Two Years Later
event: systemd_two_years_later
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I am Lennart Poettering, I have created the [systemd](http://www.freedesktop.org/wiki/Software/systemd) system and service manager, the [PulseAudio](http://www.freedesktop.org/wiki/Software/PulseAudio) sound server and the [Avahi](http://avahi.org/) Zeroconf stack among other things.

Q: What will your talk be about, exactly? Why this topic?

I will be talking about the systemd project and all the amazing progress we made in the past two years. At FOSDEM 2011 I already did a talk about systemd and a lot happened since then. We gained much wider adoption, and have been shipping in a number of major distributions. There's considerable commercial push behind systemd now. We also changed the focus a bit, from being purely an init system into being the basic set of tools you use to build a Linux-based operating system from. And all that deserves some wider attention by the community, I believe. I'd like to shed some light on our successes as well as our failures, and maybe where we'd like to take this thing in the coming two years.

Q: What do you hope to accomplish by giving this talk? What do you expect?

As a crucial part of most Linux operating systems we need to make sure we actually work on something people are interested in. So in this talk I hope to encourage this interest, and hope to clarify things so that more folks who are wondering what systemd is all about see its value. Also, as in most of my talks I really hope to put a lot of focus on questions and requests of users, so that we can collect feedback and get new ideas and suggestions.

Q: While systemd is still relatively young (almost three years old), it's already enabled by default in quite some high-profile Linux distributions, so we could call it a big success. Looking back at the reasons why you started with systemd, did you achieve what you wanted? Or are there some hurdles you still want to tackle?

Yes and no. On one hand we wanted to experiment with a new init system that worked the way we thought an init system should work. That experiment turned out to be really successful and is now nicely established, stable and at the core of various commercial offerings.                                                                   

However, one of our other goals was to unify the fragmented Linux landscape, reducing the various lower-level differences between the distributions, and I guess we only partially succeeded with that. We did not convince the Ubuntu folks that systemd and unification was a worthy goal, and we certainly have to take (at least partial) blame for that. But then again, not everything is bad, and with the exception of Ubuntu the big commercial distributions are a good chunk closer to each other now.    

Unifying the most basic bits of our stack is unlikely to be ever complete, but at least we'd like to unify the most boring bits where there's really no point at all in being different. But even for that, there's still a lot to do. In fact, the systemd source code still has way too many #ifdef sections for the various distros in there. Our rough plan is to get rid of those until next year or so.

Q: BSD users weren't happy that systemd is Linux-centric, others complained that systemd doesn't comply with the Unix philosophy, and recently the Gentoo developers forked udev (which was merged into systemd earlier). How did you deal with these controversies?

Actually, I think the interest of the BSD folks in systemd is rather minimal, so they actually aren't unhappy about systemd being Linux-specific, they probably don't care at all. On the BSDs much of the userspace tends to be developed jointly with their kernels. This userspace is generally not portable unmodified. For example, the OpenSSH server that is quite commonly used on Linux is actually developed pretty close to OpenBSD and a special portable vesion is maintained by separate team, which regularly does the non-trivial portability work.
                                                                       
One can say that with systemd we are actually much closer to this BSD model in a way, since we now develop much of our most core userspace much more integrated and focus much closer on what our kernel offers us.

Hence, as far as I see it, portability of the most basic userspace is hardly anything the BSD or Solaris folks are interested in, as they tend to maintain theirs independently, too. The idea that the most basic userspace should be kernel agnostic is primarily an idea coming from the Debian/Gentoo camps, since they (or at least some of their developers) think it's fun developing their userspace in parallel for multiple kernels.

So, in our development model we are in a way closer to what the BSDs use, which are (in contrast to Linux) true Unixes. Also, systemd reintroduces a number of Unix concepts back into normal Linux systems, such as native [multi-seat support](http://www.freedesktop.org/wiki/Software/systemd/multiseat) (something which existed in Unix for text terminals since time began -- but text terminals are hardly the preferred way to communicate with your system anymore). systemd exposes all services in the file system (via the [cgroup](http://www.kernel.org/doc/Documentation/cgroups/cgroups.txt) fs), which in a way can be seen as an implementation of Unix' "everything is a file motto". So, if you put this altogether I doubt that systemd wouldn't "comply with the Unix philosophy". We drive a lot of inspiration from Unix, we go closer to it in some ways, even if we might depart a bit from it in others.                                                            

Ultimately, Unix is something different for everybody. For some, specific implementations of Unix concepts are Unix. For us, Unix is less specific, but an idea to drive inspiration from, and we do that constantly. And hence I'd still claim that a systemd system is still very much a Unix-style system.                                 

Anyway, we keep wondering ourselves why we end up being somewhat successful with our stuff despite all those controversies. I guess for some reason we (the folks involved in systemd) learnt to ignore all the hateful comments we get, and reduce them to their technical contents (if there is any) ignoring all the emotions in them. I guess we are lucky folks that we are capable of doing that, it's a trait of personality. I used to care more about the emotional part of the controversies and responded more emotionally. Being successful in Open Source in an area like this where a lot of emotional (almost religious) attachment exists to some technical concepts requires a very thick skin, and I guess we are just lucky to have thick skins.

Q: How many developers are currently working on systemd?

Depends how you count. 15 people have commit access (from a number of backgrounds: Debian folks, community folks, Arch Linux folks, Red Hat folks, even one Canonical guy!). 373 people have contributed patches so far. The biggest part of core development is done by 3 people or so, but there's a group of 10 people who regularly contribute major new components too. We have at least 5 people now who get paid for upstream systemd work. 

Q: Which new features can we expect to appear in systemd in 2013?

Good question. Primarily we'll focus on improving the things we already have in place. However, do expect some bigger new additions to the Journal subsystem, primarily in regards to network/web connectivity.

Q: Have you enjoyed previous FOSDEM editions?

Yes, very much so, I have attended 6 or 7 or so now. It's a fantastic conference, and unlike any other. 
