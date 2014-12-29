---
year: 2015
person: Giulio Eulisse 
speaker: giulio_eulisse 
topic: "IgProf: The Ignominous Profiler"
event: igprof_the_ignominous_profiler
---

Q: Could you briefly introduce yourself? 

Sure! I'm the co-coordinator of the Core Software group of the [Compact Muon Solenoid (CMS)](http://home.web.cern.ch/about/experiments/cms) experiment at CERN. CMS is one of four main experiments that take place at the [Large Hadron Collider (LHC)](http://home.web.cern.ch/topics/large-hadron-collider) and one of the two that announced the discovery of the Higgs Boson in 2012. Among other things my team is responsible for development tools and in helping with performance improvements of the experiment's software. Due to the fact thatthe  CMS software keeps tens of thousands of cores busy all year round, it's extremely important that we have instruments to monitor and improve its performance, and that's where [IgProf](http://igprof.org/), our in-house (but generic) profiler comes into play.

Q: What will your talk be about, exactly?

The talk will start from IgProf, an in-house profiler we have developed in the last 10 years within CMS. My plan is not only to talk about the profiler itself and how it evolved over the years but also to show our experience with profiling software of a large non-homogeneous organization like CMS (which comprises thousands of people coming from more than 100 different institutes) and with developing open source tools for an environment as peculiar as High Energy Physics.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

I would like to share our experience so far, in the hope someone who has to deal with similar issues as ours will find it useful and will start an interesting discussion about performance analysis of "real world" software. I also hope someone will get interested in IgProf and start to use it and, why not, propose changes to make it better. I would also like to have the usual remark on how using open source software is the key to make performance improvements: the only software you can reasonably think to optimize is the one which you can see the sources of!

Q: What's the history of the IgProf project? What was the motivation to start it? How did it evolve? Is this what you planned it to be? 

The origin dates to more than a decade ago, when I first arrived at CERN. Together with my fellow colleague and friend, Lassi Tuura, we started to look into performance optimization of the experiment's software. Since none of the tools we had at the time was able to cope with the scale of our problem, we decided to write our own. Over the years IgProf has evolved a lot and it has been rewritten at least three times. When Lassi moved to work for Google, I picked up being a maintainer for it and we tried to give it a more "standard open source project" spin, moving it to GitHub and trying to have students contributing to it. In the recent years, thanks in particular to the efforts of Peter Elmer, from Princeton University, we have been quite successful in finding brilliant students who could contribute to the project. In particular Mikko Kurkela and Filip Nybäck have done a great job in porting the profiler to ARM.

Q: What are the strengths and weaknesses of IgProf compared to other profiling tools? 

I think the biggest strength of IgProf is to have a proven track record to allow non-experts to profile a large codebase in a simple and straightforward way. The fact we do not require any kernelspace / root privileged helper is also a strong plus in extremely maintained environments like university and research center clusters. I personally also find the performance of the memory profiler to be quite satisfying. The main weakness is probably the fact that since the profiler itself is not our "core business" we tend to assume that if it works it's good enough. For example better multithreading support is long due, but since we did not have multithreaded payloads until recently we did not have the push to improve it. Things are hopefully changing this year, though.

Q: Are there any other high-profile IgProf users besides CERN? 

The [Geant4](http://www.geant4.org/geant4/) collaboration, which produces a toolkit for particle simulation and which is not strictly CERN related, has used IgProf extensively over the years. There are also some astrophysics groups at Princeton which I know have used it.

Q: Which new features can we expect in IgProf in 2015? 

My hope is to get another bright GSoC student to work on a more in-depth integration with Python, so that Python and C / C++ callstacks are seamlessly merged together. This is particular useful for some of the high-energy physics experiments, because they use Python to drive the heavy duty C++ code. Moreover, since last year we got initial [PAPI](http://icl.cs.utk.edu/papi/) support I would like to have that more extensively used in particular for the energy measurement part.

Q: Have you enjoyed previous FOSDEM editions? 

I must say I've never been at FOSDEM in person, but I do enjoy watching videos and reading slides, so I'm really looking forward to it!
