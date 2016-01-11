---
year: 2016
speaker: daniel_pocock 
event: free_communications
---

Q: Could you briefly introduce yourself? 

I've been interested in computing and communications since I was quite young, having started programming assembly code and qualified for a ham radio license while in junior high school.  I graduated from the University of Melbourne and then moved to Europe.  I've worked for a range of companies in finance, trading, Internet service and telecoms. I'm active in many free software communities large and small including Debian and Fedora, FSF Europe, reSIProcate and a lot more.

Q: What will your talk be about, exactly? Why this topic?

My recent blog about a [mission statement](http://danielpocock.com/mission-statement-for-free-rtc) for free real-time communication probably answers the "Why" question:

> "Making it as easy as possible to make calls to other people and to receive calls from other people for somebody who chooses only to use genuinely Free Software, open standards, a free choice of service providers and a credible standard of privacy."

The talk itself will look at the different ways to achieve this mission, why free software has been struggling to achieve it and some specific steps we can take to change the situation over the next 12 months.

If you can identify with this mission statement, then I would really encourage you to come to FOSDEM, visit our dev-room and Real-time lounge and come to my talk on Sunday morning.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Hopefully this talk will engage more developers from the wider free software community.  For example, it would be great if any application that stores or processes email addresses had a way to click those addresses and start an SIP or XMPP session.  Another example would be people taking the [DruCall](http://www.drucall.org) module (for Drupal) and making similar modules for other CMS and web frameworks like WordPress, MediaWiki and Django.

Many of the most successful and long-lasting projects, such as Debian, are successful because they make the community just as important as the technology.  Engaging more developers in these goals will hopefully help create a sustainable community around this mission.

Coming to this talk will be a great step towards making this community, which spans so many other communities, successful.

Q: At FOSDEM 2013, you gave a talk together with some other leading developers of free real-time communications software, about replacing Skype, Viber, Twitter and Facebook. Looking back, it seems those proprietary solutions are even more pervasive now than three years ago. Why haven't free and open source solutions become more successful?

There are numerous reasons for this.

Cloud providers have a commercial imperative to make it as easy as possible for users and they invest heavily in doing so.  Any cloud provider who didn't realize that has probably already gone out of business, leaving just those who made things easy for their users.

In the free software world, we are struggling at every step.  Not only is some of the software awkward to use, but even when small changes would make things easier, people resist.  For example, many Linux distributions insist on installing the GNOME Empathy softphone and chat client by default but it is fundamentally flawed with NAT traversal. That means every user has to go and install an additional package, but there are many to choose from like Jitsi, Linphone and SFLphone and many users look at all the options and give up.

No one person can resolve this. Distributions need to get serious and ensure that each new major release automatically installs their best softphone by default, not just whatever is suggested by the desktop vendor.

If distributions took this approach and even made a competition out of it, the developers of softphones would have more incentive to improve as they would all want the opportunity to be the default in distributions like Debian, Fedora, Ubuntu and SUSE.

There are other questions too, such as whether to use SIP or XMPP and how to set up servers for federation.  That is why I produced the [RTC Quick Start Guide](http://rtcquickstart.org), everybody following the guide will end up with a roughly similar server setup that can inter-operate with other servers.

These ideas provide a vision of how we can bring about change if everybody in the free software ecosystem plays their part.

Q: How can people who support your vision contribute? Which free software solutions need some help?

This will be revealed in much more specific detail in the talk so it is really important for people to come along.  Attending the dev-room or visiting the Real-time lounge at FOSDEM would also be helpful.

I would encourage people to come and join the [Free-RTC](https://lists.fsfe.org/mailman/listinfo/free-rtc) mailing list, look at the [RTC Quick Start Guide](http://rtcquickstart.org) and also look at my blog.

Q: Have you enjoyed previous FOSDEM editions?

In my own country, Australia, we have linux.conf.au at about the same time as FOSDEM every year.  The weather is always great, people can swim, but for some reason, despite the snow and ice, the difficulty choosing from so many beers at Delirium and now the talk of an Islamic State terrorist cell, I still keep coming back to Brussels.
