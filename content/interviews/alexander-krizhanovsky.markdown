---
year: 2017
speaker: alexander_krizhanovsky 
event: tempesta
---

Q: Could you briefly introduce yourself?

I have been working in high performance computing in the Linux/x86-64 environment for almost 15 years. I'm the CEO at [Tempesta Technologies, Inc.](http://tempesta-tech.com/), and is the lead developer of Tempesta FW. I'm also the founder and CEO of NatSys Lab, a company providing consultancy and custom software development in high performance network traffic processing and databases. Although  I spend most of my time working on the development of Tempesta FW, I'm also working to create the architecture and design for our custom software development projects. For example now NatSys Lab. is developing a [Flashback (system versioning) feature for MariaDB](https://github.com/natsys/mariadb_10.2) and I'm responsible for the initial design of the feature. Hopefully we'll be seeing the feature soon in MariaDB mainstream.

Q: What will your talk be about, exactly? Why this topic?

I'll focus mostly on the Tempesta FW architecture and which tasks Tempesta FW is good at solving. Also I'll cover typical use cases and how to setup and configure Tempesta FW. The project offers a new vision for fast and reliable content delivery regardless of DDoS or flash crowds. HTTP communications have become "basic" in their functionality, meaning that most computers and gadgets nowadays communicate over the Internet using HTTP. There are a lot of traffic and a lot of security issues. I believe operating systems must evolve correspondingly to these issues and Tempesta FW offers one of the ways for that evolution to happen.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to share the idea that we can process more traffic and care less about DDoS, especially application layer DDoS, if operating systems evolve correspondingly. Large conferences like FOSDEM are always bringing together many smart and experienced people, resulting in a lot of interesting technical discussions. It'd be great to learn about people's experience in content delivery, DDoS mitigation, and load balancing. I'm also looking forward to learning how Tempesta FW can help to assist in people's daily lives. Furthermore, we're very interested in discovering various collaboration opportunities.

Q: What's the history of the Tempesta FW project? Why was it started and how did it evolve?

In 2013 we worked on several custom software development projects for one relatively large hosting provider. They were interested in an advanced application layer DDoS mitigation system which is able to protect huge shared hosting against massive and complicated attacks. At the time I was working on my Ph.D. thesis in application of machine learning algorithms for DDoS mitigation, so we made several prototypes combining the machine learning module with Web accelerators. However, we quickly realized that traditional Web accelerators are designed for normal content delivery and aren't suitable for filtering massive application layer attacks. We had a look at kernel accelerators, like TUX, but it was already dead and besides didn't emphasise filtering abilities. We realized that if you need to filter massive application layer attacks, then you need a very fast HTTP parser, different network processing and fast interfaces between all network layers for efficient filtration. There were simply no open source projects which were suitable for the task.

Thus, in 2014 we started Tempesta FW as an open source platform for efficient filtration of HTTP DDoS. We builit it on top of [Synchronous Sockets API](http://natsys-lab.blogspot.ru/2013/03/whats-wrong-with-sockets-performance.html) and developed [a very fast and powerful HTTP parser from scratch](http://natsys-lab.blogspot.ru/2014/11/the-fast-finite-state-machine-for-http.html). It also uses [SIMD optimized string processing](http://natsys-lab.blogspot.ru/2016/10/http-strings-processing-using-c-sse42.html), and we also introduced a cache conscious lock-free data structure for very fast Web cache processing. All in all, we collected all the cutting edge technologies and modern research we could find to build as fast a Web accelerator as possible. We introduced the project [at IBM CASCON'14](http://dl.acm.org/citation.cfm?id=2735539).

As we moved forward in our development, Tempesta FW obtained various features, such as advanced load balancing, TLS termination, application performance monitoring, and protection against several types of Web attacks. I.e., Tempesta FW became a featureful application delivery controller. Nowadays large vendors, such as F5 or Citrix, offer proprietary and costly solutions in this area. We're very excited that the open source world now has a solution which, being installed on a common x86-64 server, can compete in performance with the proprietary hardware solutions.

Q: What's the difference between Tempesta FW and in-kernel web accelerators such as TUX and kHTTPd?

TUX and kHTTPd are both just like traditional Web servers, meaning they use threads/processes and a kernel socket API. One simple example of this: they both use the recvmsg() kernel function interface to read ingress HTTP requests. The function requires copying socket buffers' data to a buffer. Meantime, a DDoS attack has always enormous ingress traffic, so any copying efficiently kills the victim's system. Tempesta FW is very different: it's built into the Linux TCP/IP stack, so that HTTP is processed in the same way as IP and TCP. This is the most efficient way to process ingress traffic.

It's worth mentioning modern efforts to build Web servers on top of user-space TCP/IP stacks. However, since very limited TCP/IP stacks are used, you can't use the full power of Linux with these TCP/IP stacks to process ingress traffic. Tempesta FW allows you to use iptables, tc, LVS, tcpdump, and other handy tools together with Tempesta FW - basically, all the tools can work together without extra communication costs.

Q: Isn't it a security risk to have something like an application delivery controller inside the kernel?

Yes, it is. Whenever you add new functionality, you have a risk of introducing new security flaws. Right now we're focused on development of core functionality, so we mostly develop our kernel modules. However, the next version of Tempesta FW will have fast kernel/user-space transport, so we'll be able to extend it with many features implemented in user space. We do our best to keep the kernel code as small as possible. Now it's just about 30K lines of C code. Compare it with for example 120K lines of code for BtrFS, which is also very crucial to reliability.

Reliability has always been one of our main targets. From our earliest days our small team has designated full-time QA guys who develop automated tests and run various manual tests. Each committed patch must pass review from at least two developers, as well as all the automated tests. This slows down the development process, but it makes the code more reliable.

Q: Tempesta FW is a hybrid of an HTTP accelerator and a firewall. What advantages does this approach have? And does it have its downsides too?

This approach allows you to filter HTTP traffic almost on the same speed as IP traffic - Tempesta FW works on the HTTP layer, but processes traffic just like any IP layer firewall. The downsides are obvious - we have to do kernel programming which is generally more complex than programming in user space, and we have to pay extra attention to the quality of the code. This makes our development process relatively slow.

Q: How does the performance of Tempesta FW compares with that of an installation of Nginx, Fail2Ban and iptables?

Recently we've made benchmarks for pure Web requests servicing. We reached 1.8M requests per second on a cheap 4-core machine. Our best tuned Nginx on the same hardware showed results that were 3 times worse. Seastar built on top of user-space TCP/IP stacks seems to show just 1.3M RPS on 4 cores. The description of these benchmarks are available [on our Wiki](https://github.com/tempesta-tech/tempesta/wiki/Tempesta-FW-benchmark).

It's a challenge to build a testbed to emulate DDoS attack and measure performance of blocking of HTTP DDoS attack. However, we expect that Tempesta FW's filtering of HTTP traffic should be very close to the performance of filtering TCP/IP traffic using iptables since Tempesta FW and iptables use the same Linux kernel mechanisms.

Q: What does Tempesta FW's community look like? How can interested people contribute and in which domains could you use some help?

Well, our community is not large but it is persistently growing. There are already installations around the world. I hope our community will grow significantly after FOSDEM. We do open source under the GPL license. It can't be closed because we extensively use code from the Linux kernel. We're very interested in external development collaborations and we'll be happy to receive pull requests at [our GitHub repository](https://github.com/tempesta-tech/tempesta). Also we're very interested in any testing in real life scenarios and feature requests from the community.

I'd be happy to receive any letters about any collaboration opportunities. You can contact me at [ak@tempesta-tech.com](mailto:ak@tempesta-tech.com).

Q: Which new features can we expect this year in Tempesta FW?

Now we're working on advanced QoS and compression offloading - the features will be in our upcoming 0.5 version. We're also working on performance optimizations - we're able to show much better performance results than the current 1.8MPRS on 4 cores. The next version 0.6, scheduled for Q1 of 2018, will introduce Tempesta Language - a flexible JIT language for traffic processing. Using this language you will be able to write filtering rules, for example, you'll be able to block HTTP requests from a particular source IP address and containing a particular value in the URL or Referer header. Cluster support and fast kernel/user-space transport are also coming soon.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first FOSDEM and I believe I'll really enjoy it.

