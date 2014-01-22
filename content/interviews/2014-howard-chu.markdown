---
year: 2014
person: Howard Chu 
speaker: howard_chu
topic: "What's New in OpenLDAP"
event: whats_new_in_openldap 
---

Q: Could you briefly introduce yourself?

I've been working on [OpenLDAP](http://www.openldap.org/) since 1998, officially joined the project in 1999, and became Chief Architect in 2007. I've been developing open source software since 1985, having worked on all of the GNU tools back in the day, and maintaining a couple of gcc architectures/ports.

Q: What will your talk be about, exactly? Why this topic? 

That's difficult to answer in brief. My aim is to cover what we've been working on in OpenLDAP since 2011, coinciding with the LDAPCon prior to last fall's LDAPCon 2013. Of course, there's a significant fraction of OpenLDAP users who are still stuck using distro releases based on 10 year old code, and everything would be new to them.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Mainly to raise awareness of where we've been and where we're headed next. The vast majority of application developers out there are either using SQL RDBMSs or have jumped onto the NoSQL fad for their data management needs, without realizing what key guarantees the NoSQL folks have omitted. The Directory community has been doing distributed data management for 25+ years, and we've already learned the hard lessons they have yet to understand.

Q: In what circumstances is the Lightning Memory-Mapped Database a good choice? And on the other hand, which workloads are less suitable for it? 

We wrote [LMDB](http://symas.com/mdb/) to replace BerkeleyDB in OpenLDAP, so its first and best use is in a workload that also uses a transactional key value store. There are a lot of workloads out there that are currently using non-transactional key value stores, and many of them would be improved by using transactions. There are some cases of heavy random-access writes with small data values where LMDB is currently not the most optimal. Also there are plenty of cases where the data model is more complex and a higher level language like LDAP or SQL would be more suitable than using LMDB directly.

Q: Could you enumerate some projects outside OpenLDAP that use LMDB? 

Sure. Early on in LMDB's development we targeted projects that OpenLDAP depends on, like Cyrus SASL and Heimdal Kerberos; these projects got LMDB support a couple years ago. Other projects like CfEngine, Postfix, and PowerDNS adopted LMDB more recently.

Q: Let's say I'm interested in the advantages of LMDB for my open source project. What do I have to do to port my code? 

It generally requires a fair amount of rewriting effort, but there are wrappers/API adapters available now for over a dozen languages, and many of these are modeled after existing database APIs, so in some cases it can be an easy drop-in. But LMDB has some unique features, such as zero-copy reads, that requires explicit support in the application to leverage.

Q: Which new features can we expect in OpenLDAP 2.5? 

The main focus for 2.5 is a final fleshing out of the online configuration mechanism, as well as offline support for modification and deletion of directory entries. There's also the usual variety of new overlays, new features, and new performance improvements. Some of these performance enhancements may not be visible to typical users; some of the bottlenecks we've removed only show up on larger (e.g. 64 core) servers under very heavy load.

Q: Have you enjoyed previous FOSDEM editions? 

As a matter of fact last year was my first FOSDEM experience, as an attendee. I'm looking forward to returning this year. Thanks for putting on a great event and giving me the opportunity to add to it this year.
