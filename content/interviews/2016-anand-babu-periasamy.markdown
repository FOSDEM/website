---
year: 2016
speaker: anand_babu_ab_periasamy 
event: linux_petascale_storage
---

Q: Could you briefly introduce yourself?

I am a free software contributor, entrepreneur and an angel investor. I co-founded [Minio](https://www.minio.io/), an object storage system written in Golang and licensed under Apache License v2. Previously I co-founded [Gluster](https://www.gluster.org/) (acquired by Red Hat), a distributed filesystem inspired by GNU Hurd. Two of my older projects include [GNU FreeIPMI](http://www.gnu.org/software/freeipmi/) and [GNU Freetalk](https://gnufreetalk.github.io/).

Q: What will your talk be about, exactly? Why this topic?

Focus of this talk is to spend a little time on user-space myths and more time on new user-space design for Petascale file, block and object storage implementations.

Historically, OS architects believed that system software must be written in low level languages like C and particularly filesystems should be implemented inside the kernel. This may be true for root filesystems, but I wouldn't generalize. Most of the peta-scale storage implementations today are in user-space and written in Python, Java and Go languages. The Gluster project faced a lot of criticism early on for attempting a user-space approach. Sharing my experience may help the community move forward.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I would love to see the Linux kernel grow into a distributed operating system collective. This requires some major steps forward, including the user-space initiatives.

Q: There is still a lot of resistance against user-space implementations of filesystems. What are the biggest misconceptions?

  * The most popular one is "user-space is slow and kernel-space is fast".
  * There are also some technical reasons related to memory management, security enforcement and limited access to VFS APIs.
  * User-pace filesystems are toys ;).

Q: How would end users benefit if Linux kernel developers would embrace user-space filesystems?

It helps both the developers and users. It is easier to maintain, add new features and port to new architectures. We will see a new class of filesystems emerge that would otherwise not exist in the kernel space.

Q: Are there other parts of the kernel that could benefit from a migration to userspace?

Intel's [DPDK](http://dpdk.org/) shows that a latency-sensitive "high-speed packet processing framework" is better done in user-space. Benchmarks show up to 80 million packets per second processed on a single Xeon CPU in user-space.

Similarly, I was able to implement GNU FreeIPMI including the device drivers in user-space as compared to the kernel's OpenIPMI.

The Linux kernel has 60+ filesystems. Most of them are legacy and they exist purely for compatibility reasons. It is OK to move them above the FUSE layer.

There are a number of parts that can be pushed to user-space. I am not suggesting that we turn the Linux kernel into a microkernel. Instead we should embrace and standardize both the in-kernel and user-space I/O interfaces. Let the developer community pick and choose.
