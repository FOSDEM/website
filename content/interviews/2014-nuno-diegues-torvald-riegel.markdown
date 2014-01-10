---
year: 2014
person: [Nuno Diegues, Torvald Riegel] 
speaker: [nuno_diegues, torvald_riegel]
topic: "Concurrent Programming Made Simple: The (r)evolution of Transactional Memory"
event: concurrent_programming_made_simple 
---

Q: Could you briefly introduce yourself?

Nuno Diegues has completed an MsC in Computer Science at Instituto Superior Técnico (IST), in Portugal, where he is now pursuing a PhD in the area of Transactional Memory, from multi-core to distributed cloud platforms.  He has also worked on the first system to ever use Transactional Memory in production while serving thousands of users.

Torvald Riegel is a member of Red Hat's toolchain team and works on various things related to parallelism and concurrency.  He maintains [GCC's Transactional Memory runtime library](http://gcc.gnu.org/wiki/TransactionalMemory), and represents Red Hat in the ISO C++ Study Groups 1 (parallelism and concurrency) and 5 (Transactional Memory).  He holds a PhD from Technische Universitaet Dresden.

Q: What will your talk be about, exactly? Why this topic?

We will present Transactional Memory as an abstraction for concurrent programming. The main concept is that of transactions, which avoid the difficulties of fine-grained locking, but have the potential to achieve similar performance. TM allows programmers to declare which regions of code are transactions and should execute atomically, instead of having to choose a particular implementation such as using locks.

Interestingly, this paradigm can be applied both in shared memory (multi-core processors) as well as in distributed environments (such as in cloud computing).

This topic has become increasingly important as the availability of multi-core processors and cloud computing became wider. In both cases programmers are faced with a similar problem: if they want to scale out their applications, then they need to tackle the issue of how to synchronize access to data in face of ever growing concurrency levels. Traditionally, programmers resorted to lock-based approaches in their systems. As a matter of fact, popular knowledge considers locking approaches simple to understand, but difficult to master. To help cover the ground here, we shall also present the results achieved by two recent European funded projects in the area, namely [Velox](http://www.velox-project.eu/) and [Cloud-TM](http://www.cloudtm.eu/), which focused respectively on implementing TM-stacks for multi-cores and cloud platforms.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The main objective is to make the audience aware to the paradigm of Transactional Memory (TM). This is usually the key element that is missing for its adoption, since it is very recent and we still need to work on its dissemination. Besides that, of course, we will present the transactional language constructs for C++ that are currently being specified in ISO C++ Study Group 5. For that, we will give an overview of GCC's support for these constructs, of libitm, and GCC's TM runtime library. Finally, we will present two other open-source tools, namely [Fénix Framework](http://fenix-framework.github.io/) and [Infinispan](http://infinispan.org/). We will show how to use them to develop transactional applications in the cloud with a similar abstraction level to that of TM in shared memory. To do so, we will illustrate, with the help of code snippets, how developers can fully exploit the computation capabilities of large-scale distributed systems in a simple and powerful, yet efficient way.

Q: How can Transactional Memory help developers?

With Transactional Memory (TM) support, programmers only have to identify transactions in their code --- in order words, the main part is to wrap code blocks in an "atomic { }" construct. The synchronization and coordination details are left to the underlying TM mechanisms, much in the same way that classic databases also hide the lock management from the user. By requiring programmers to only identify which code portions need to be executed atomically, and not how atomicity needs to be enforced (as with traditional locking), TM simplifies the development of synchronization in parallel and distributed applications.

At runtime these atomic blocks perform calls to the TM system that guarantees the correctness of the transactions by verifying that a concurrent execution is equivalent to a serial one. This greatly simplifies dealing with concurrency, and it is the semantics that programmers often expect --- that is usually the case when locks are used for mutual exclusion.

Q:  If I'm an open source developer interested in using Transactional Memory in my project, how should I proceed? What do I have to learn and which tools should I use?

First of all you can attend our talk! :)

To use TM in C/C++, you only need GCC 4.7 (or later).  When you use the transactional language constructs, GCC will generate code to invoke a TM runtime system, which is is provided by GCC (i.e., libitm) or for which you can supply your own library.

Many alternatives exist as open-source libraries in Java (JVSTM) and Scala (ScalaTM) as well as embedded in the language (Clojure). If you wish to go distributed, then the most complete open-source implementation of the TM abstraction is that of the Cloud-TM framework written in Java (and hence interoperable with JVM languages such as JRuby). In our presentation we will talk about TM in C++ for multi-core machines and the Fénix Framework for distributed environments.

Q: Have you enjoyed previous FOSDEM editions?

Nuno: I will be joining the folks at FOSDEM for the first time, so I hope to be able to answer this question next year instead :)

Torvald: It's just my second FOSDEM so far, but last time was nice.
