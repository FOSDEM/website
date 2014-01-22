---
year: 2014
person: Vesna Manojlovic 
speaker: vesna_manojlovic
topic: "Using RIPE Atlas API for measuring IPv6 Reachability"
event: using_ripe_atlas_api_for_measuring_ipv6_reachability 
---

Q: Could you briefly introduce yourself?

I have been Community Builder for Measurements Tools at [RIPE NCC](http://www.ripe.net/) for the last 3 years. For 3 years before that I was self-proclaimed "IPv6-goddess", I created the "IPv6 RIPEness" brand, and gave many lectures to promote IPv6 deployment. For 3 years before that I was an Advanced Courses Trainer, giving courses on topics like IPv6, DNSSEC, Routing Registry, routing security and Internet Governance. And for 6 years before that I was a trainer for RIPE NCC, since 1999, giving LIR (Local Internet Registry) courses.

During all that time I was also active in the hackers community, attended all Dutch summer hackers conferences (HIP97, HAL2001, WTH2005, HAR2009 & OHM2013) and most of the German Chaos Camps (CCC in '99, 2007, 2011) and 28c3, 29c3 & 30c3. Currently I am a member of the Amsterdam hackerspace [Technologia Incognita](http://techinc.nl/).

Q: What will your talk be about, exactly? Why this topic?

My topic is a combination of three things I care about: [RIPE Atlas](https://atlas.ripe.net/), IPv6, and community participation.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

I want to inspire FOSDEM participants to take part in RIPE Atlas community, by either hosting a probe or contributing code, or more. And also to encourage them to use IPv6.

Q: What's the history of the RIPE Atlas project? How did it evolve? Did it fulfill initial expectations?

RIPE Atlas started three years ago with the ambitious goal to build the biggest active measurements network. It kept growing, doubling the number of distributed and active probes every year, and with a growing number of users. Currently, there are almost 5,000 active probes, and almost 10,000 users. We have plans to double it again :)

In 2013, community involvement got three boosts: ambassadors distributing probes, the measurements source code got published, and the GitHub repository became active.

Q: How can interested people help? For instance, what should they do to run a RIPE Atlas probe? 

To run a RIPE Atlas probe, interested volunteers can meet me or some of my developers during FOSDEM, or apply [at our website](https://atlas.ripe.net/apply).

There are other ways to help: I will mention some during my presentation. What we are looking for are:

 * RIPE Atlas ambassadors: people who want to promote RIPE Atlas in their own circles, by giving presentations at conferences or by distributing probes in exotic locations.

 * hosts for RIPE Atlas anchors: larger servers, at datacenters, ENREN organisations and internet exchange points (IXPs), used for regional targets and as more powerful probes.

 * sponsors: organisations who want to financially support RIPE Atlas, and to receive some positive mentions in our community.

Q: What are the most important limitations and issues with RIPE Atlas measurements that users should know? 

RIPE atlas does not measure bandwidth. We do not measure existing traffic either -- we generate our own queries (ping, traceroute, DNS...) and perform active measurements.

If users are interested in *private* measurements, maybe RIPE Atlas is not the best choice for them -- we provide a platform for performing measurements that are meant to be shared, and that are publicly available.

Although source code is published, we do not accept modifications or new measurement types from the community; instead, we encourage you to come up with new ways to analyse existing data, find good use cases, and contribute visualization code or write articles for RIPE Labs.

Q: Could you show us some interesting results that have been discovered about IPv6 reachability thanks to RIPE Atlas measurements? 

I will show more of these during my talk; here are some use cases to tickle your curiosity:

 * [How Many RIPE Atlas Probes Believe They Have IPv6 (But Are Wrong)?](https://labs.ripe.net/Members/stephane_bortzmeyer/how-many-atlas-probes-believe-they-have-ipv6-but-are-wrong)
 * [RIPE Atlas - A Case Study of AAAA Filtering](https://labs.ripe.net/Members/emileaben/ripe-atlas-case-study-of-aaaa-filtering)
 * [RIPE Atlas - A Case Study of IPv6 /48 Filtering](https://labs.ripe.net/Members/emileaben/ripe-atlas-a-case-study-of-ipv6-48-filtering)

Q: Which new features can we expect this year in RIPE Atlas? 

You tell me ;-) We listen to our community, and I will be collecting feature requests during FOSDEM.

Things we are working on are on [the roadmap](http://roadmap.ripe.net/ripe-atlas/). The coolest new feature is: T-play! It's a traceroute visualization based on [BGPlay](https://stat.ripe.net/bgplay).

Q: Have you enjoyed previous FOSDEM editions?

Yes, I love FOSDEM! I was here in 2013, and long time ago, in 2008 or something... It's a vibrant community of people passionate about free software, just like I like them :)
