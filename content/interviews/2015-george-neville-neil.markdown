---
year: 2015
person: George Neville-Neil 
speaker: george_neville_neil 
topic: "Computers, Clocks and Network Time: Everything you never wanted to know about time"
event: computers_clocks_and_network_time 
---

Q: Could you briefly introduce yourself? And how did you become interested in the topic of time keeping? 

I have always had an interest in time and time keeping, but my work in network time protocols started
when I was asked to investigate ways of keeping a data center full of servers synchronized to
within a microsecond.  That request led me to the, then defunct, [Precision Time Protocol open
source project](http://ptpd.sourceforge.net/) which I resurrected and have been working on ever since.

Q: What will your talk be about, exactly? Why this topic? 

The talk will cover both the basics of computer based time keeping, outlining the challenges
and terminology, as well as provide an in depth description of the state of the art
in network time protocols.  I chose this topic because it is important in a world where
most significant applications are implemented across a distributed system.  The proliferation
of data center, and other distributed applications has meant that getting distributed time
right is a hard requirement.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

The goal of the talk is to provide a high level of understanding of how computer time works,
what can be expected from network time distribution, and how best to implement systems
that need to keep time synchronized across a network.

Q: Most of the FOSDEM visitors have probably heard of NTP, but what's PTP exactly? How does the Precision Time Protocol compare with NTP? 

PTP is targeted at local area networks while NTP is meant to keep time across the entire internet.
By using multicast as its communication mechanism PTP has several advantages over NTP in a data center,
on a factory floor, or other, similar environment.  PTP routinely achieves far higher levels of synchronization than NTP due to its use in low latency, low jitter, environments.

Q: Could you give some examples where PTP is needed to reach accurate synchronized clocks? 

PTP is used by cellular communication networks where accurate timekeeping is necessary
to provide services, factory floors where machinery is coordinated over a local area network,
and financial services where large sets of systems are recording and responding to trading
information.  All of these environments have requirements measured in micro or nanoseconds.

Q: Why do we actually need protocols like NTP and PTP? Why can't we build computers that keep better track of time without outside help? Is it just because the right components cost too much? 

This will be covered in my talk.

Q: Have you enjoyed previous FOSDEM editions? 

This is my first time attending FOSDEM.
