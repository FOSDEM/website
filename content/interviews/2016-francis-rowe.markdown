---
year: 2016
speaker: francis_rowe 
event: libreboot
---

Q: Could you briefly introduce yourself? 

My name is Francis Rowe, I'm a Free Software developer and activist. I founded the [libreboot](http://libreboot.org/) project 3 years ago, and have been working on it ever since. Libreboot is a free/libre BIOS replacement.

Q: What will your talk be about, exactly? Why this topic?

My talk will be about libreboot. Why this topic?

Most people who think about free software and want to use it, go install GNU/Linux. This is all well and good, but what about the BIOS?

Most people don't think about the BIOS. Libreboot aims to make them think about it! And to give it to them.

Free boot firmware is as important as having a free operating system. The same arguments can be made about security, freedom and reliability that you can make about free operating systems. The struggle is much harder in the boot firmware level, because there are far less people working on it, and far less people interested in it. We also face much harder resistance from hardware manufacturers, especially Intel and AMD.

Q: What do you hope to accomplish by giving this talk? What do you expect?

To increase awareness about both the libreboot project and [coreboot](https://www.coreboot.org/) project (the project upon which libreboot is based). I expect that people will be interested in the project, and that potential contributions (even new full-time developers) will come as a result of this talk.

Libreboot has already had great success, relatively speaking, especially over the last year. More people have been inspired by the project, and have contributed to it. We aim to increase that trend.

One of our long-term goals is also to see the creation of OEMs (maybe even ODMs and IBVs/independent BIOS vensors, if we're lucky) based around libreboot. In fact, such projects are already underway (ones we know of, and ones we don't). We expect that there will be people capable of this at FOSDEM, and we want them to be inspired by the work that we do.

Q: What's the history of the libreboot project? Why did you start it and how did it evolve? Has it become what you planned it to be?

It originally started through my company, back then it was called Gluglug (gluglug.org.uk) but now it is [Minifree](http://minifree.org). I was selling the ThinkPad X60 with coreboot pre-installed, and people got wind of that.

It started to become popular. I had been thinking about creating something like libreboot, but delayed doing so for several months. Then a friend contacted the FSF, and they contacted me to tell me about their [RYF (Respects Your Freedom)](http://www.fsf.org/resources/hw/endorsement/respects-your-freedom) hardware certification program. One of the conditions for having your product endorsed by this was to have it all as free software.

So it was, that in December 2013, the libreboot project was founded. I spent several days removing blobs (proprietary software) from the coreboot source code, things like microcode updates and so on, to create a fully free software version of coreboot. This was originally done manually, but in subsequent releases the deblobbing is handled by automated scripts which sort-of work like virus scanners, in finding patterns that look like blobs, and then we go through the list of what it finds to decide what are blobs are what are not.

It's not just deblobbing that we do. In fact, this is now a very small (albeit essential) part of the project. Coreboot is very difficult to build and install, so libreboot provides an automated build system around the coreboot project, integrating everything together much like you see in GNU/Linux distributions, to create a single coherent package that's easy to install and use.

All of this will be elaborated on in the talk.

Q: How does libreboot's community look like? How can interested people contribute? In which domains could the project use some help?

There are many people who have contributed small patches. There are also people who do a lot of critical work, [listed here](http://libreboot.org/contrib/). This list can be added to, if you want :)

We also have a mailing list, which currently consists of a few hundred people (subscribers). In addition to that, we have an IRC channel which is fairly active most of the time.

People who are interested in contributing can look at [this page](http://libreboot.org/git/).

We have also a page listing [current areas of interest to work on](http://libreboot.org/docs/tasks.html). This can be expanded upon, and we will later implement a bug tracker on debbugs.gnu.org.

Libreboot is also joining the GNU project. There's still some [remaining work that we need to complete](http://libreboot.org/gnu/).

Q: How difficult is it to install libreboot on your own system and which advantages do you get then?

Fairly easy, if you follow the instructions on the libreboot website (they are written for non-technical users). We also provide support on the IRC channel and mailing lists, in case you get stuck.

Advantages:

  * Freedom
  * Freedom
  * Freedom (I [can't stress this enough](https://www.gnu.org/philosophy/free-sw.html).)
  * Faster boot speeds (literally less than a second before GRUB, and then you immediately boot GNU/Linux - on a system with an SSD, from power button to desktop can be under 5 seconds if you know what you're doing)
  * More secure - more on the libreboot website, and in the upcoming talk

Q: Which new features can we expect this year in libreboot?

More hardware support, mainly. General polishing. Libreboot is quite mature at this point, and we like to focus on getting more hardware supported (the main goal).

Q: Have you enjoyed previous FOSDEM editions?

Yes, I watch keenly on all free software conferences. They always have interesting people and organisations in them.
