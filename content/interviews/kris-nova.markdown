---
year: 2020
speaker: kris_nova
event: kubernetes
---

Q: Could you briefly introduce yourself?

Hi. My name is Kris Nova. I am the Chief OSS Advocate for Sysdig, and Kubernetes expert. I have been working in open source since 2009, and have worked on Linux, FreeBSD, Go, Kubernetes, Falco, and many many more open source tools. I co-authored "Cloud Native Infrastructure", a book on understanding, managing, and building infrastructure in cloud environments. I believe in bringing open source principles into all aspects of my life.

Q: What are you currently working on? 

Recently, I have taken my many years of experience in open source, and my expertise in Kubernetes and infrastructure and began applying these lessons to security. I am lucky enough to be the lead maintainer of [Falco](https://falco.org/), an incubating CNCF-hosted runtime security project. 

I believe that both prevention and detection are important for a holistic approach to securing a cloud native system. Both of these combined create an effective runtime security solution for locking down a system.

Right now, the Falco project is focusing on our first major release 1.0.0. The new release will feature mutually authenticated gRPC endpoints for all dynamic configuration for Falco. We are actively recruiting contributors and maintainers if anyone is interested in getting involved please reach out to [kris@nivenly.com](mailto:kris@nivenly.com).

Q: What will your talk be about, exactly? Why this topic?

The talk will focus on understanding the complexity of Kubernetes, and how the Kubernetes layer interfaces with the Linux kernel. We understand the importance of tracing the kernel so we can understand and gain confidence in our ability to securely run our applications.

I chose this topic for the same reasons I chose to accept the position as the lead on Falco: I believe runtime security has yet to be solved in Kubernetes, and that is exciting for me. I love solving problems for the first time.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to follow up on my talk from last year and give folks a healthy respect for Kubernetes and the abstraction of the kernel that it effectively is. I hope folks walk away from this talk feeling educated and informed about how Kubernetes interfaces with the kernel, and how we can use the kernel to understand what Kubernetes is doing.

Q: What has changed over the last few years in Kubernetes security?

Pod Security Policies are probably the first thing that comes to mind, they are slowly being faded out, as new prevention tooling like Open Policy Agent (OPA) comes into the picture. These are excellent prevention techniques, but I believe that Kubernetes has yet to solve detection, and that is why I am here. 

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS, or how did you in particular benefit from FOSDEM?

To quote Leonardo DiDonato, one of the other Falco maintainers “FOSDEM is the biggest open source event to kick off the year.” I believe this, and I believe in open source. FOSDEM for me, is a conference representation of what a healthy open source community can do. 

Q: Have you enjoyed previous FOSDEM editions?

Yes, in 2019 my “You can’t have a clusterfuck without a cluster” talk was very successful and I think it helped a lot of people.
