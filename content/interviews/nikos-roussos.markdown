---
year: 2018
speaker: nikos_roussos 
event: satnogs
---

Q: Could you briefly introduce yourself?

I'm a software & open source engineer. I'm a member of FSFE General Assembly and [Libre Space Foundation](https://libre.space/) board. I currently work at Greenpeace, while I voluntarily contribute to many open source projects.

Q: What will your talk be about, exactly? Why this topic?

I'll be talking about [SatNOGS](https://satnogs.org/), a distributed and accessible network of Satellite ground stations. It's one of our main projects at Libre Space Foundation with the goal to open source the whole toolchain and workflow of sateliite-ground communications, but also to make this field more accessible to satellite operators, radio amateurs, space hackers, etc.

Q: What do you hope to accomplish by giving this talk? What do you expect?

It's been 3 years since we setup a SatNOGS ground station at FOSDEM and had a lightning talk, back in the beginning of the project. Today the whole project has grown so much, that we think it's time to have a more in-depth presentation and hopefully discussion with the overall free software community. It's the community most of us come from and we believe that many people would love to contribute in various areas of the project.

Q: What's the history of the SatNOGS project? Why was it started and how did it evolve?

The project started almost 4 years ago and only a few months after our kick-off we managed to win the Hackaday prize (the first of its kind). That helped put some fuel into the project and sparked its growth. Over the course of these years the project attracted many contributors across the world. Either developers who wrote code or people who built a ground station on their rooftop. Today we have a fully functional network of satellite observations with more than 500 observation per day.

Q: Which parts of the SatNOGS hardware are open?

Everything. That was one of our initial goals and it's part of our core mission statements when we founded the foundation to back this and other similar projects. All of the hardware schematics are open and documented in a way that's easy for people to build or 3D print them.

Q: What data can you get from satellites using a SatNOGS ground station?

SatNOGS ground stations and the software that runs on them uploads observation data back to the network. This consists mainly of demodulated audio and in some cases raw hex data. In some cases the audio can be valuable on its own (eg. ISS FM transmitter) or the raw data are actually not so raw (eg. NOAA weather images). Depending on the satellite and the transmitter modulation you can extract more valuable information from these data (eg. telemetry). We are in the process of building decoder modules per satellite so we can automate this process.

Q: What does the project's community look like? How many developers are working on SatNOGS?

The community is rather distributed and it would be hard to self-organize if we didn't have great free software tools to use like Matrix, IRC, and Discourse. As an estimation I'd say we have around 10 people writing code in a more or less regular fashion and another 10 people designing our hardware and electronics. But our community is not just developers and engineers. We have of course people who build ground stations, but who are also keen in testing things, new releases, report bugs, suggest solutions, write documentation etc. Besides the ground stations currently on production and fully functional we have double more ground stations on our development instance just to test new features and bug fixes.

Q: How can interested people contribute? In which domains could the project use some help?

It's a modular project, so there are many contribution opportunities for various skills. But since we are in a developers meetup I want to emphasize to our code opportunities first. The project has many software parts. Some of them are around web technologies (JavaScript, Python). But we have also the software that runs on the ground station (Python) and our own GNU Radio module (C++). But of course people are welcome to contribute with testing and documentation. And why not, build a ground station.

Q: Which new features can we expect this year in SatNOGS?

We want to automate all things, and essentially remove the human factor out of our scheduling and processing workflows. So the idea is that we should have an automated network of fully utilized ground stations. And then, since we have all these open data, the goal is to build per satellite telemetry dashboards. To provide a clean vizualization so that the collected data, besides of being machine readable, can also be humanly readable.

Q: Have you enjoyed previous FOSDEM editions?

Yes! I'm a regular. This must be my 10th Fosdem :)
