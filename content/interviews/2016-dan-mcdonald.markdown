---
year: 2016
speaker: dan_mcdonald 
event: illumos_overview
---

Q: Could you briefly introduce yourself? 

I'm Dan McDonald, OmniOS Engineering lead at OmniTI, and illumos RTI (Request To Integrate) advocate.

Q: What will your talk be about, exactly?

I'm giving an overview and brief history of the [illumos](http://wiki.illumos.org/display/illumos/About+illumos) project, including explaining how illumos falls between Linux (kernel only) and FreeBSD (whole-ball-of-wax) with respect to what it contains, and why there are distros of illumos like there are distros of Linux.

Q: Why this topic?

Since I've joined illumos, there's always been talk of having an illumos presence at FOSDEM. I wanted to make sure it was further represented as a first-class open-source citizen, and giving a main-track talk aids in that goal.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to clearly explain the illumos project, how the community and its distros work, how people can use it, and how people can contribute to it.

Q: How does Sun's famous engineering culture live on in illumos?

The process for changes is a bit higher overhead than others, to my knowledge.  The illumos RTI process derives from the Solaris RTI process. Also, the nature of feedback given often reflects the "FCS quality all the time" (where FCS == First Customer Ship... basically, customers should be able to run the code at any time) attitude that permeates Solaris development.  Everyone in illumos wants to avoid the [Quality Death Spiral](http://wiki.illumos.org/display/illumos/On+the+Quality+Death+Spiral) identified in very early revisions of Solaris, and addressed during its lifetime at Sun.

Q: How can people interested in illumos contribute? In which domains could illumos use some help?

I will be talking about how people can contribute at the talk. There are far more bugs and RFEs than we have people to address them. Furthermore, for progress to be made in new things (e.g. [Joyent's LX zone work](https://wiki.smartos.org/display/DOC/LX+Branded+Zones), new devices, improved filing protocols and technologies) the pool of available people shrinks further.

Furthermore, I will be directing a request to hardware OEMs --> do illumos first. By starting with Oracle Solaris in a driver, one cuts off all illumos distributions, forcing reinvention. By doing illumos-first development, a port (if a port is even needed, as the systems are still more similar than different) to Oracle Solaris is still straightforward, and does not eliminate a whole swath of potential hardware customers.

Q: Which new developments can we expect this year in the illumos landscape?

The LX work that's going on in SmartOS is amazing, and hopefully will be appearing in other distributions sometime in the next 12 months. Joyent is also doing other virtualization work in SmartOS that we hope to see upstream. [OpenIndiana's Hipster](http://wiki.openindiana.org/oi/Hipster) is improving constantly, and sharing work in IPS along with OmniOS. [OmniOS](http://omnios.omniti.com/) just enabled itself to be a solid build platform for stock illumos-gate, and we at OmniTI hope this will encourage more developers. Both Delphix and Nexenta are leaders in [OpenZFS](http://open-zfs.org/wiki/Main_Page), and since illumos is the reference implementation for OpenZFS, expect progress there as well.

Q: Have you enjoyed previous FOSDEM editions?

I have not previously attended, but am looking very much forward to it.  Many European illumos users & developers will be in attendance:  some of whom I have never met in person.  I'm excited about face-to-face encounters.
