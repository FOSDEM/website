---
year: 2016
speaker: cliff_click 
event: h2o_machine_learning
---

Q: Could you briefly introduce yourself?

I am the CTO and Co-Founder of [H2O](http://h2o.ai/), makers of H2O, the opensource math and machine learning engine for Big Data.

I am an old-school 40 yrs hacker; I wrote my first compiler when I was 15 (Pascal to TRS Z-80!).  My most famous compiler is the HotSpot Server Compiler (the Sea of Nodes IR).  That compiler is invoked daily about 1 trillion times (crude lower bound estimate: 1 million Java developers, 100 Java launches/day each, 10000 compiles/launch).  I helped Azul Systems build an 864 core pure-Java mainframe that keeps GC pauses on 500Gb heaps to under 10ms, and worked on all aspects of that JVM.  I speak regularly at industry and academic conferences and have published many papers about compilers and JVM technology.  I hold a PhD in Computer Science from Rice University and about 20 patents.

Q: What will your talk be about, exactly? Why this topic?

I want to introduce the innards of H2O to a technical audience, instead of talking about what you can do with H2O - this is a systems engineering talk, not a data-science or machine-learning talk.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to expose H2O to an audience that might be interested in using the platform for doing thinks outside of machine learning.  E.g. all sorts of parallel and distributed computation.  I'm hoping to expand the platform's use cases, as well as I'm looking for systems' engineers who are interested in contributing.

Q: What's the history of the H2O platform? Why was it started and how did it evolve? Has it become what you planned it to be?

Originally we started out as a super-fast distributed Key/Value store (we remain one of the fastest, if not *the* fastest K/V store) - but that market is well served by other technologies.  About 6 months in we pivoted into doing Big Math and distributed computation on distributed data - and quickly moved into Machine Learning after that.  ("fastest K/V store" comment: we take a lot of shortcuts: no HA, no persistence (disk), so simple in-memory K/V only - but interestingly we preserve the full Java Memory Model semantics on a distributed system - and keep our speed.)

Nonetheless, the platform goes a long way to solving the 70's-era Single System Image programming model: it's relatively straightforward to code really complex computations on Big Data.  All the issues around inter-node communication are handled under the hood - and importantly handled *efficiently* under the hood.

Some algorithms can (and must) be network-bound, but many obvious codes are simply memory-bandwidth or compute-bound, without hardly a glance at the distributed and parallel nature of the platform.

Q: Often optimizations make use of special cases in a clever way. However, the H2O platform, while very fast, seems to be quite generic. How did you optimize that much without losing the ability to use the platform to solve various types of problems?

A lot of solid systems' engineering, with a focus on usability for performance.  We can't/don't/won't solve all large problems fast.  Instead, we take a broad swath of problem types, and make those very easy to code up - and make it hard to mess up performance along the way.  "Standard good" code will run fast, run well, run distributed and parallel.  Also, we tackled the memory-bandwidth problem head-on early on; we do math on compressed data directly - and thus lower typical memory bandwidth needs for a lot of hot loops.

Coding styles we directly address:

 * Data parallel and BSP (bulk synchronous parallel).
 * Any linear-algebra type codes on large 2D tables; these are particular easy to use and execute particularly fast.
 * Includes stencils (we do all the edge case handling), excludes loop-carried dependencies (you have to break those manually).
 * Includes all reductions (we do all the broadcast and gather codes).
 * Works on column-compressed data directly, "as if" working directly on plain arrays.
 * Divide-and-conquer algorithms.
 * Graph-like parallel and distributed computations (less support but the infrastructure is there).

Q: How can interested people contribute to H2O? In which domains could you use some help?

We need a full-time data-ingest engineer, or lots of independent contributions anyways; there's a number of interesting data formats we'd like to ingest directly: Avro, JDBC driver, Parquet to name a few.  These ingests are ideal for open-source contributors; each one is probably a month of a full-time engineer, or a few months of a part-time engineer.  There's quite a few more interesting formats, so there's room for a number of independent contributors.

Optimizing our REST execution engine - its how we accelerate Python and R - with classic old-school compiler optimizations like Loop Fusion.  Yes:  H2O needs more compiler writers.

Engineers interested in working on the HA side of clustering technology: replication and repair of both data AND code; being able to add resources to a slow job to make it go faster; being tolerant of volatile cloud service dropping nodes out (think: best-effort Amazon spot instances, and doing a $$$-vs-time tradeoff; instances come-and-go, how do you optimize throughput of big jobs?)

Q: Which new features can we expect in H2O this year?

 * Direct ingest of ORC files, as well as other formats.
 * Serious memory management (warnings about being short of resources, instead of Java OutOfMemory errors).  Management of tasks based on memory needs.
 * Expandable and HA H2O clusters (not promised for this year, but the work will start in earnest this year!).
 * Productionalized job execution (resource management, both CPU and Memory; user-managed job queues).
 * Operationalized machine learning: being able to spin up scalable clusters to support both high-volume predictions, as well as rapid model upgrades (continuous machine learning) - all in the cloud or in your private data center.

Q: Have you enjoyed previous FOSDEM editions?

Yes!  :-)
In particular, the beer is very very good....

