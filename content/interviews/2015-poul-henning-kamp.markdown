---
year: 2015
person: Poul-Henning Kamp 
speaker: poul_henning_kamp 
topic: "Ntimed an NTPD replacement"
event: ntimed_ntpd_replacement 
---

Q: Could you briefly introduce yourself? 

My first published FOSS program was some time in the late 1980s
and I have been involved in FOSS ever since.  I have been a major
force in [FreeBSD](https://www.freebsd.org/), where amongst many other things I renovated the
timekeeping code.  These days I work a lot on the [Varnish](https://www.varnish-cache.org/) HTTP
accelerator and on a new family of time-synchronization programs
called [Ntimed](https://github.com/bsdphk/Ntimed).

I am also a diagnosed [time-nut](http://leapsecond.com/time-nuts.htm), having far more atomic frequency
standards, GPS receivers and LORAN-C receivers than anybody would ever
need.

Q: What will your talk be about, exactly? 

I will talk briefly about the history of NTP and computer time-keeping,
and then I will talk about the Ntimed project and how to use it.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

I want to make people think and enjoy themselves, not necessarily
in that order.  The talk will be about the history of computers
and time, talking about how the challenges have changed over time
and how this has affected the design of the Ntimed programs.

Q: What's the history of the Ntimed project? Why did you start it? 

Ntimed is Heartbleed fallout. the [Linux Foundation](http://www.linuxfoundation.org/) funded me to
work on [NTPD](http://www.ntp.org/) and after some serious source- and soul-searching I
reached the conclusion that there was nothing for it but a fresh
start.

Q: The Network Time Foundation has agreed to adopt Ntimed. What does this mean in practice? Is Ntimed the "successor" of NTPD or will both be developed independently? 

For now they continue to live in parallel, but the stated goal of
Ntimed is to replace NTPD as the default time sync software.

Q: How can interested people contribute to the Ntimed project? 

In order of importance: testing, porting, packaging, code review
and donations to the [Network Time Foundation](http://www.networktimefoundation.org/).

S: When do you expect a full production-ready release of Ntimed? And which functionality will be implemented in this release? 

The first program in the family, "ntimed-client", which will simply
steer a computer's clock to NTP servers, is out in preview release
and the first production-ready release is planned for 2015Q1.

After that a "ntimed-slave" for setting up local slave servers
in a data center or company will come out some months later.

Finally the "ntimed-master", which you can hook up GPS receivers
and other time sources to, is aimed at the end of the year.

Q: Have you enjoyed previous FOSDEM editions? 

Last year I gave a closing keynote about "Operation Orchestra"
and I really enjoyed that.
