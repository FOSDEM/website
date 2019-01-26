---
year: 2019
speaker: allan_jude 
event: zfs_caching
---

Q: Could you briefly introduce yourself?

I'm 34 and from Hamilton, Ontario, Canada (Near Toronto). My first introduction to Unix and open source was when I got a [FreeBSD](https://www.freebsd.org/) shell account in 2000 to host my own IRC server, I've been a FreeBSD user ever since. Things really changed for me when in 2012 I attended my first conference, BSDCan. After getting to meet so many people with interests similar to my own, I was hooked. Later that year I gave my first talk at EuroBSDCon 2012 in Poland. I've since attended over 40 conferences and presented at conferences in more than a dozen different countries. In 2014 I was invited to join the FreeBSD project, and in 2016 and 2018 I was elected to 2 year terms on the FreeBSD Core Team. I am also an [OpenZFS](http://open-zfs.org) developer. I co-authored two books with Michael W. Lucas: "FreeBSD Mastery: ZFS" and "FreeBSD Mastery: Advanced ZFS"

Q: What will your talk be about, exactly? Why this topic?

My talk will be about the Adaptive Replacement Cache (ARC) feature of OpenZFS. I chose this topic because the details of how it works are technically interesting, but surprisingly simple and elegant. Understanding how it works allows an administrator to make better decisions when configuring the ARC. A basic understanding of how it works should also put to rest the rumours that ZFS requires immense amounts of memory.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope those that attend the talk will come away with a basic understanding of how one of the most important aspects of ZFS works. ZFS contains so many elegant solutions to complex problems, and I like sharing them with people. I hope people who may have previously dismissed ZFS because of the FUD (Fear, Uncertainty, and Doubt) they have heard, will see my presentation and reconsider.

Q: What makes the Adaptive Replacement Cache in ZFS different than other caching algorithms? And what's adaptive about it?

Unlike a typical cache, which is usually implemented as LRU (Least Recently Used), the ARC is actually 4 separate caches. The adaptive part is how it adjusts the size of each of those caches within the fixed overall size of the cache for best performance as your workload changes.

Q: How does the compressed ARC work and how does it compare to DragonFly BSD's swapcache?

Most memory compression schemes work by detecting when a system is low on memory, and compressing some lesser used memory to free up memory. However, compression requires memory to operate, and memory pressure is a sensitive time in the kernel. The Compressed ARC feature of ZFS takes a different approach. ZFS already supports transparent compression, where blocks are compressed before they are written to disk, to save storage space. With the Compressed ARC feature, when blocks are read from disk into the cache, they remain compressed as they were on disk, so they consume less RAM in the cache. The blocks are decompressed and delivered to the consumer, at no extra cost (they were going to need to be decompressed anyway). When the blocks are needed again, if they are still resident in the cache, they need to be decompressed an additional time. This is a cost, but the LZ4 compression algorithm used by ZFS is extremely fast, many gigabytes per second per core, so the CPU time cost and the latency are much less than having to read the data from disk, even if that disk is an SSD.

So Compressed ARC works by keeping your most frequently used data compressed in memory by deferring decompression (inexpensive) until each time the data is read from the cache. Swapcache and similar mechanisms work by compressing (expensive) your least frequently used data to conserve memory.

Q: How can the ZFS ARC be tuned for typical workloads, such as a file server, a database, a hypervisor, ...?

The most basic parameters of the ARC are the minimum and maximum size.

  * For a file server, almost all system memory is used to provide the greatest performance. There are few other consumers on a filesystem.
  * With a database, it depends on the workload. You can choose to reduce the size of the ARC, or restrict it to caching only metadata, and rely on the database engine's buffer cache, or, use a small buffer cache and rely on the ARC. If your data is very compressible, the advantages of the compressed ARC may win out.
  * For a hypervisor machine, you will want to restrict the maximum size of the ARC to reserve memory for the VMs, but use as much remaining memory as possible to accelerate disk I/O via caching.

Q: Five years ago the OpenZFS project was founded by members of the Linux, FreeBSD, Mac OS X, and illumos communities to share ZFS code between these platforms. But the original goal of a single operating system agnostic repository of OpenZFS code never happened. Why is that?

The concept of a single repo is still desired across the various consumers of OpenZFS, but the manpower cost of upstreaming features to a 'agnostic' repo that no one actually uses, is too high, and would likely be too slow (new features would take a long time to arrive in other operating systems). However, recent developments may result in something similar to the original dream. With recent shifts that have seen the greatest amount of development effort happening in the [ZFS on Linux](https://zfsonlinux.org/) (ZoL) repo, the FreeBSD project has decided to shift its upstream to ZoL to easy the effort of importing new features. The ZoL project has graciously agreed to accept a set of changes that will split the platform dependent parts of the repo into per-platform directories. This will allow ZFS-on-FreeBSD and ZFS-on-Linux to coexist in the same repo, and benefit from the same regression and code coverage tests. So, we might end up with something close to what we orignally imagined.

Q: What was the rationale behind this switch? What are the challenges for FreeBSD developers? And which new ZFS features will FreeBSD end users get as a result?

I guess I answered part of this above, but the main rationale is to get new features more quickly. Over the latter half of 2018 FreeBSD developers worked to import features like the ZFS native encryption feature to FreeBSD, but ran into great difficulty doing the merges. ZoL added features in different orders than IllumOS and FreeBSD, and some of its features were developed over time, and exist in forms from before and after the merge of other features. So, FreeBSD has decided to rebase on the most active repo, to ease the merging burden. In the end, all of it is still OpenZFS, this will just ease the burden and lessen the chance for merge mistakes.

FreeBSD end users can expect to receive: ZFS native encryption, Allocation Classes (put metadata and small blocks on a dedicated device, like an SSD), MMP (Multi-Modifier Protection) for safer failover, and many more. With the difference in release cycles, it is possible that new features from ZFS, even those developed on Linux, may be available in a FreeBSD release before they are released for general availability on Linux.

Q: Have you enjoyed previous FOSDEM editions? 

This will be my 4th FOSDEM, I've attended each once since 2016.
