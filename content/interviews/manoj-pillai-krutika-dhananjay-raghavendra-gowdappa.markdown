---
year: 2018
speaker: [manoj_pillai, krutika_dhananjay, raghavendra_gowdappa]
event: optimizing_sds 
---

Q: Could you briefly introduce yourself?

Krutika and Raghavendra are developers for [GlusterFS](https://www.gluster.org/) at Red Hat. Krutika has a strong interest in performance analysis and improvement, and Raghavendra is the maintainer of the performance translators for GlusterFS. Manoj is part of the Red Hat performance engineering team for GlusterFS. So the performance track is a good place for us to be.

Q: What will your talk be about, exactly? Why this topic?

Our talk is on some of the challenges that fast flash-based storage pose for distributed software defined storage solutions from a performance perspective. While analyzing different workloads on GlusterFS and integrated solutions, we realized that GlusterFS needed improvements in order to be able to fully exploit the potential of fast flash-based storage. In particular, GlusterFS was not performing very well for IOPS-centric workloads, with small random I/O access patterns; incidentally, this is the access pattern where flash storage excels. We have made good progress in identifying and fixing some of the bottlenecks holding GlusterFS back, and wanted to share our experiences and also hear from others who were working on similar problems.

Q: With high-performance flash storage like NVMe SSDs, inefficiencies in software-defined storage stacks that were previously acceptable start to become problematic. What were the biggest performance issues in Gluster you encountered on these fast storage devices?

One of the biggest problems was single-thread bottlenecks in the software stack. There is typically some functionality that is single-threaded in otherwise multi-threaded systems. In many scenarios, these single threads are able to handle their share of the work without problems. However, when trying to fully exploit NVMe SSDs for small random I/O workloads, we realized that GlusterFS would have to support such a high request rate that single-threads would not scale. Another big bottleneck was GlusterFS’ RPC layer: it simply wasn’t fast enough, in terms of RPC operations per second it could support, to keep up with the IOPS that NVMe SSDs could deliver.

Q: Which open source tools do you recommend to troubleshoot performance issues in storage?

The sysstat utilities are obviously very useful in any performance work, particularly iostat for storage performance analysis. The thread-level CPU usage that top and pidstat provide are very useful for identifying single-thread bottlenecks. The lock-contention information given by mutrace looked very promising, but our initial analysis with it was not conclusive because of how it shifted some of the bottlenecks in our case; having fixed some of those bottlenecks, we are looking forward to using mutrace again going forward.

Q: Apart from tools, is there some 'bag of tricks' you would recommend to troubleshoot storage performance issues?

Our approach depended a lot on the relation between latency, throughput and number of concurrent requests. Given that latencies tend to be high in distributed storage solutions, you need to have sufficient number of concurrent requests in order to get good throughput, and also detect throughput-related bottlenecks. The instrumentation that was built into glusterFS was very useful in analyzing where latency was increasing, and therefore in identifying the bottlenecks.

Q: Have you enjoyed previous FOSDEM editions? 

We are actually first-timers at FOSDEM. The Software Defined Storage devroom at FOSDEM was added not too long ago, if we recall correctly. That made the conference even more relevant for us, and we have been wanting to attend and share.
