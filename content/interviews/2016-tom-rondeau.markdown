---
year: 2016
speaker: tom_rondeau 
event: gnu_radio 
---

Q: Could you briefly introduce yourself? 

I'm Tom Rondeau, project leader and maintainer of the [GNU Radio](http://gnuradio.org/) project. I am also a visiting researcher with the University of Pennsylvania. Most of my work, for both fun and paid gigs, is related to software radio. I am mostly focused on wireless communications, but the software and algorithms are often generic enough for many signal processing applications. I've worked with GNU Radio since about 2004 when I started using it for my graduate work and it was an important part of my doctoral work on cognitive radio. Since taking over as the head of the GNU Radio project from its founder Eric Blossom, I have been focusing a lot on the project's technical structure to improve its capabilities and usability. I have also worked to expand the community and user base of GNU Radio, and one of the focal points of the project is now the GNU Radio Conference, or GRCon, which just had its fifth successful annual run drawing nearly 250 people from around the world.

Q: What will your talk be about, exactly? Why this topic?

Because GNU Radio is a large project that is capable of working in many areas of signal processing, it is often difficult to either describe it or provide a simple introduction. Still, radio and communications are vital parts of our lives where we send and receive data of economic, cultural, and political importance. In this talk, I'll be blending the rich history of FM broadcast communications with the technical developments of this medium, all showcased using GNU Radio applications. FM is a useful tool for introducing signal processing in GNU Radio because of its technical construction, the regulatory framework and world-wide use, and the societal importance of it as a means of delivering culture and information. The talk is meant to blend all of these pieces together to provide not only information about GNU Radio as a tool and product, but also help the audience appreciate the role that radio has in our everyday lives.

Q: What do you hope to accomplish by giving this talk? What do you expect?

With the various technical and cultural aspects that I plan on hitting in my talk, I hope the audience can better understand GNU Radio and how wireless communications impacts their lives. These two concepts, the technical and cultural, also help explain why radio -- and therefore using GNU Radio -- is hard as well as the importance of understanding the role of regulations, band planning, and frequency as a resource.

Q: What's the history of the GNU Radio project? How did it evolve and what is its current focus?

GNU Radio started as Eric Blossom's idea for opening up access to wireless communications. One of the earliest applications Blossom pursued was to build and all-software digital TV (ATSC) receiver to avoid the FCC's broadcast flag, which ended up not passing, anyways. But given the framework of GNU Radio, many others, myself included, wanted to use and expand on it for many other signals problems. Many of us have used GNU Radio to explore cognitive radio concepts where radio flexibility is important as well as looking at dynamic spectrum access problems. Other applications went in almost any direction you can think that involves processing signals of any type, whether its other forms of digital communications, space science and astronomy, radar, audio/acoustic, optical, or something else. Blossom really laid the foundations of the scheduler, which is the basis of GNU Radio. The framework enables us to build modular structures where we connect blocks of signal processing elements together to form the radio application. The scheduler makes sure that data moves properly and efficiently through the blocks.

Blossom asked me to take over as project lead in 2010. Since then, we have added a message passing system to allow blocks to send data and commands directly to other blocks. We have added metadata carrying "tags" for data. We have improved our plotting and graphical tools, including significant improvements to the GNU Radio Companion, a GUI tool for constructing applications. Through all of these new capabilities, we have extended the project to be more usable in many areas of signal processing and wireless communications. We have also used the free and open source nature of the project for easier use as a tool to educate people in signals and communications. GNU Radio is now a basis for education, research, development, and deployment of signal processing applications.

Q: What knowledge and hardware do I need when I want to start experimenting with GNU Radio?

It really depends on what you want to do with GNU Radio. There are so many ways to go and things to learn. But really, just starting off, all you need is a computer, generally running Linux or OS X. There is plenty you can do playing with signals and simulations. You can read in data files provided by others or use a built-in audio system to read data from the microphone and produce data through the speaker. For those wanting to get more into actually handling signals, we often recommend the popular RTL-SDR dongles as a starter radio that allows you to receive many signals. These devices are inexpensive (under $20) but are receive-only and limited in the frequency and bandwidth of the signals they can handle. From there, you can look around at the various hardware options like the USRPs produced by Ettus Research for more serious radio signal capabilities.

Even given the hardware, you can still mostly get away with focusing on the software. Most of the hardware "radio front ends" as we call them are units that attached to a computer via USB or Ethernet. Very little hardware knowledge or work is required. It's always an option to add amplifiers and filters to manage more specific tasks, but always be aware of the legal and regulatory restrictions when doing things with real radio signals.

A seriously difficult aspect of people getting into GNU Radio is that radio and signal processing are math-intensive, sometimes dealing with unfamiliar concepts and unknown hardware and propagation issues. It's not easy, spans a huge amount of math, science, and engineering, and many issues are learned through practice and trial-and-error and may not be easily found in textbooks. Of course, this is why we have our mailing list and the IRC channel #gnuradio to provide the access to experts who understand this stuff and can help out.

Q: How does GNU Radio's community look like? How can interested people contribute?

The GNU Radio community is large, diverse, and spans the world. We have an active mailing list and IRC chat room, and we have a successful and growing annual conference. We also host what we refer to as "hackfests" in various places around the world (mostly in the US and Europe right now). In fact, we are hosting one in Berlin the week before FOSDEM. These are great times for us to get to know local GNU Radio users and anyone interested in the field in new parts of the world.

We have worked hard to improve our community of contributors. We have a great many users, and it's always a problem to get more contributors. But we have lots of information published on our website, [gnuradio.org](http://gnuradio.org), and we mirror our project on GitHub, which has really changed how we interact with our user base and dramatically improved how we manage and handle contributions.

Two more things on this point, because it's a really important area of any FOSS project. First, I will reiterate that radio and signal processing is hard and spans a huge number of areas. While that can be intimidating, it also means that there is plenty of room and demand of people skilled at and working in all sorts of areas that can be of use to us. If you think you have anything to contribute from algorithms to code to GUI systems and design or even just in how to better communicate our concepts through educational material and tutorials -- we welcome all of it.

The second point is that we are a Free Software Foundation project and require copyright transfer of most things that go into GNU Radio. This provides a bit of a hurdle for people, but it's both manageable and necessary.

Q: Which new features can we expect this year in GNU Radio?

Given the continual increase in capabilities of mobile and embedded systems, we are going to continue to push on the embedded and Android space. This means more applications, better tools, improved processing capabilities, and, I really hope, and expanding developer and user base helping us make some amazing applications. My talk will feature both a headless, embedded system running a GNU Radio application as well as an Android system with an interactive application as another radio. These are both fun as well as incredibly useful due to the sizes. Making better applications with more innovative thoughts will lead to what I think will be new ways of thinking about signals, radio, and communications. It will also force us in the development of the project to keep providing better tools and improved performance.

Q: Have you enjoyed previous FOSDEM editions?

Absolutely. 2016 will be my third time attending. FOSDEM and everything around it, like our nearby GNU Radio Hackfests, are becoming among my favorite yearly events to attend. The enthusiasm of the attendees is really amazing.
