---
year: 2013
person: Daniel Pocock 
person2: Peter Saint-Andre
person3: Simon Tennant
person4: Evan Prodromou
person5: Daniel-Constantin Mierla
person6: Emil Ivov
speaker: daniel_pocock
speaker2: peter_saint_andre
speaker3: simon_tennant
speaker4: evan_prodromou
speaker5: daniel_constantin_mierla
speaker6: emil_ivov
topic: Free, open, secure and convenient communications
event: free_open_secure_communications
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>), [<%= @item[:person2] %>](/schedule/speaker/<%= @item[:speaker2] %>), [<%= @item[:person3] %>](/schedule/speaker/<%= @item[:speaker3] %>), [<%= @item[:person4] %>](/schedule/speaker/<%= @item[:speaker4] %>), [<%= @item[:person5] %>](/schedule/speaker/<%= @item[:speaker5] %>) and [<%= @item[:person6] %>](/schedule/speaker/<%= @item[:speaker6] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

We are a group of software developers responsible for some of the more significant real-time communication, social networking and micro-blogging (which we will just refer to as RTC) projects based on the publicly beneficial principles of open source and open standards.

Although we each come from different projects and communities, we are working together as a group to bring this presentation to FOSDEM because in RTC, more than in any other area of software development, interoperability is essential and collaboration between different projects is essential to achieve that.

Q: What will your talk be about, exactly? Why this topic?

We will talk about some of the history of RTC, why open source and open standards haven't become as widespread as proprietary solutions, itemising some specific technical limitations. We will also comment on specific solutions to some of the common technical issues.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Before people even come to FOSDEM, we are hoping the publicity around this session will encourage people to familiarise themselves with some of the free software solutions for RTC:

* [Jitsi](http://www.jitsi.org), the universal desktop softphone and chat
* [Lumicall](http://www.lumicall.org), mobile VoIP, a free alternative to Viber
* [status.net](http://status.net/), microblogging
* [BuddyCloud](http://buddycloud.com/), open social networking

We know many people in the free software community already have their own virtual servers and domain names, and with a little nudge in the right direction, we are hoping many more people will deploy SIP, [XMPP](http://xmpp.org/) or both for their domains.  People can already use solutions like [Kamailio](http://www.kamailio.org/w/), [repro](http://resiprocate.org/About_Repro) and [ejabberd](http://www.ejabberd.im/) that are conveniently packaged on major Linux distributions.

We are also hopeful that people will join the user and developer communities for some of our projects, participating in our mailing lists, giving feedback about products and maybe even contributing patches with enhancements or feedback about environments that we haven't been able to test ourselves. 

Q: There's this sensible attitude "If it ain't broke, don't fix it". Many people outside the open source world think there's nothing broken about Skype, Viber, Twitter, Facebook, Google+, LinkedIn, and so on. How do you convince them to use open source alternatives and open standards for their communication? 

From a technical perspective, we've already seen the Blackberry meltdowns (e.g. October 2011) that demonstrated the foolishness of relying on a proprietary solution with a central point of failure. Thanks to that scandal, many large corporations are seriously looking at open solutions to achieve technical resilience and independence from individual vendors.

From a political perspective, many governments and large corporations, particularly those not of the same nationality as Microsoft, dread the idea of having all their communications routed through the US.                                                                                                         

Before the Microsoft acquisition of Skype, it was possible to license a Skype connectivity module for the [Asterisk](http://www.asterisk.org/) open source PBX.  The rather sudden end of that arrangement has sent a clear message to deployers of IP PBXs.                                                                                                              

The average person on the street is gradually waking up to the risks of Big Data: whether it is having money frozen forever in PayPal or losing control of a Facebook account, more and more people have either suffered such an incident or know somebody else who has.  There is a general awareness that these highly centralized, impersonal services have unpleasant risks attached.                                   

Even the Pope has recently joined the debate about privacy and technology, commenting that the use of full body scanners on airline passengers is a step too far.  The public is becoming more and more aware just how much their physical and virtual privacy is at risk.                                                                    

None of these intrusions could have been brought in suddenly (just look at the way the politicians promoting the Australia Card were burnt at the stake in the 1980s), rather, it is a death by a thousand cuts.  A little more privacy is lost every day with every new change of terms and conditions, every new `must have' social networking app and every new scheme to open up these vast databases to random searches by government employees of varying grades of trustworthiness who don't even need a search warrant any more.                                                                                                                                   

We would contend that while people are not marching in the streets to rein in the privacy violation excesses of modern technology, people will adopt new solutions rapidly if the free software community delivers high quality and interoperable alternatives that are easy to use.

Q: We have open standards and open source software for a lot of communication types, but most people still use proprietary solutions. What do the open solutions need to become more successful?

Many pieces of the puzzle already exist, and are simply scattered all over the place.  For example, we have low bitrate codecs that are suitable for battery powered mobile devices, or we have protocols like SIP and XMPP that are implemented in most major programming languages like C++ and Java.                                       

What is missing is that many solutions currently assemble only a few pieces of the puzzle.  For example, the [Empathy](https://live.gnome.org/Empathy) softphone deployed in a default Debian/Gnome desktop lacks support for TURN (NAT traversal) and SIP (convenient for networking with IP phones on desks) and it also lacks some codecs like H.264.  The Lumicall mobile softphone works well for SIP, but has no XMPP support, while some XMPP clients for mobile have only text chat support.  

Q: Have you enjoyed previous FOSDEM editions?

Yes, very much, many of us are FOSDEM regulars and are very excited about being part of an event that brings people from all around the world.  FOSDEM always has many different dimensions, from curious new users of free software to experienced hackers who are catching up with old friends.  This all makes for a very worthwhile weekend with a lot of technical and social benefit all at once.
