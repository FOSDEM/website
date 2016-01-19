---
year: 2016
speaker: philip_homburg 
event: ripe_atlas
---

Q: Could you briefly introduce yourself? 

I spent at lot of time at the VU University, Amsterdam. I worked on various topics: a world-wide distributed system, a filesystem, a microkernel operating system (MINIX3), and Android security. Then I moved to the [RIPE NCC](https://www.ripe.net/) to work on the code that runs on the [RIPE Atlas](https://atlas.ripe.net/) probes.

Q: What will your talk be about, exactly? Why this topic?

My talk will be about RIPE Atlas, a global network that measures Internet connectivity and reachability and provides a real-time picture of the Internet's health. The network runs built-in measurements on small hardware devices that volunteers around the world plug into their home or other networks, and they can also perform their own measurements using the entire network.

The data collected by RIPE Atlas is made publicly available and I think it will be of interest to the FOSDEM community. Also, we're looking for help in packaging our new, open-source command-line interface toolkit for distribution on different Linux platforms, and are hoping we might find some people who are willing to help with that.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I have two main goals:

  * Informing people about RIPE Atlas and the available tools that might be of interest to them
  * Getting developers interested in contributing to the project

Q: What are some interesting use cases of RIPE Atlas?

There are a lot of different use cases. RIPE Atlas data is publicly available, so engineers, network operators and researchers from all over the world have used it for everything from investigating Internet censorship to examining major network outages to analysing DNS infrastructure. Network operators are always interested in monitoring their own network using thousands of vantage points (probes) located all over the world, and figuring out where to place additional servers. We also have a tool called status checks that lets them plug RIPE Atlas data into their existing monitoring tools, which they find useful. You can find a whole collection of [use cases](http://labs.ripe.net/atlas/user-experiences/) online.

Q: What are the biggest challenges that RIPE Atlas is facing? Security? Scalability?

The biggest challenge for us is scalability. The current rate of results coming in is more than 3,000 per second, and (at least so far) we store all of the results indefinitely.

We also put a lot of energy into finding out how to best support our users - in particular, how to help them use the data we collect. It's a lot of data, and it can be a bit overwhelming in the beginning. But we do a lot of workshops and just started doing webinars to help our users how to get the most out of RIPE Atlas.

Q: How can interested FOSDEM participants contribute to RIPE Atlas? In which domains could the project need some help?

We're looking for developers who can help us package CLI tools for distribution across different platforms. And we want to encourage contributions to our other open-source tools, including IXP Country Jedi and OpenIPMap.

We've also started organising hackathons that focus on RIPE Atlas data, and would love to see as many people as possible participate in those events. All of the resulting tools and visualisations are always made publicly available.

We'd like to see researchers, students and academics use the data, and create their own use cases, perform their own analyses, publish their own research papers, and mix with other data types!

Network operators can host RIPE Atlas anchors, those who know a lot of people or go to a lot of conferences can help us distribute probes (become an "ambassador"), and organisations who believe in our mission can offer financial support (become a sponsor). You can learn more at [atlas.ripe.net](https://atlas.ripe.net).

Q: Which new features can we expect this year?

We're looking into enabling WiFi measurements and additional DNS types (for example TLSA).

Q: Have you enjoyed previous FOSDEM editions?

Yes, very much so. It is great to have so many open-source projects in place. Also, my colleague [gave a talk at FOSDEM 2014](https://archive.fosdem.org/2014/schedule/event/using_ripe_atlas_api_for_measuring_ipv6_reachability).
