---
year: 2017
speaker: brandon_philips
event: kubernetes
---

Q: Could you briefly introduce yourself?

I'm Brandon Philips, CTO and co-founder of [CoreOS](https://coreos.com/). At CoreOS, we're building the open source tools and products needed to run a secure and distributed container infrastructure. Our mission is to secure the internet, and we're doing so by promoting the use of distributed systems and of automatic updates. The projects we created and maintain include [Container Linux](https://coreos.com/os/docs/latest/), [etcd](https://coreos.com/etcd/), [rkt](https://coreos.com/rkt/), [clair](https://coreos.com/clair/docs/latest/), and [dex](https://github.com/coreos/dex). We also contribute to the [Kubernetes](https://kubernetes.io/) project, and [Tectonic](https://tectonic.com/), our commercial offering, is built with pure upstream Kubernetes at its core.

Q: What will your talk be about, exactly? Why this topic?

My talk is an introduction to the Kubernetes open source project and an overview of its roadmap. We see Kubernetes as the keystone of distributed compute infrastructure: it makes large-scale containerized application deployments manageable through automation, ease of use, and wide compatibility thanks to its flexible API.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Kubernetes is the fastest growing open source project - the community is vibrant and thriving, which is great for the health of the project. This talk is to increase awareness of the project, but more importantly to provide some insight into the direction Kubernetes is heading to generate interest for use, and to encourage the community at FOSDEM to contribute.

Q: When did you at CoreOS see the potential of Kubernetes? And how
important is Kubernetes in your Tectonic platform?

We saw potential in Kubernetes as soon as it was announced. We were aware of how successful [Borg](http://blog.kubernetes.io/2015/04/borg-predecessor-to-kubernetes.html), Google's internal orchestration system, was at automating and scheduling their infrastructure. An open source version of Borg, written by Borg engineers, was a project we could not ignore. Kubernetes is now one of the largest open source software projects, and is one we've supported and contributed to from the beginning.

Kubernetes is central to our Tectonic product which builds upon pure upstream Kubernetes to deliver a production-ready container infrastructure that people can operate on AWS, bare metal, and other platforms. What we build on top of Kubernetes is a platform that automates "self-driving" updates, enterprise identity, monitoring, and much more. 

Q: GIFEE, Google Infrastructure For Everyone Else, is an interesting
mission. But using Kubernetes and related tools to do what Google does
requires a good understanding of concepts and technologies that didn't
exist a few years ago. What sort of mindset change is needed to make
GIFEE possible?

First, you must remain calm. Kubernetes and GIFEE introduce a ton of new concepts, but there are analogies to everything that has been done before. The major components of storage, network, and compute haven't fundamentally changed here. Kubernetes enables use of NFS mounts, local disks, and remote block devices. The network uses normal IPv4 L3 addressing and routing. And, containers are essentially Linux processes in a chroot. Now, the big shift that comes is thinking about how to combine these things.

The first mindshift is a separation of concerns between "cluster operations" and "application operations"; where cluster operations is concerned with providing a solid working Kubernetes cluster and application operations focuses on the lifecycle of application delivery and monitoring. It creates a cleaner set of concerns that will help organize operations, engineering, and infrastructure experts on teams into more effective areas of concern.

Second, although it is possible to take an existing legacy app, roll it into a container and pair it with a persistent volume your application won't be taking advantage of any of the new capabilities that are enabled by the GIFEE architecture: rolling zero-downtime application upgrades and easy application scaling. You need some adaptation of your applications to the architecture if you really want to take advantage of the platform to the best of its ability.

Q: Do we really all need to have access to Google-like infrastructure
technology? Is this technology general enough for deployment, scaling
and configuration in various types of organizations? There are probably
only a few organisations that (could) look like Google.

A major strength of distributed, containerized infrastructure is that it is scalable, but does not need to be run at Google scale. It can be run efficiently at any scale - and when an organization's needs change, which they often do, they can easily scale their deployments up or down, without needing to change the architecture of the applications themselves.

Google-like operation and software deployment practices are the biggest things that organizations are getting here. And to a large degree these operation and deployment practices are part of what has made Google such a dominant player in the software industry: they are extremely effective in helping teams get software shipped to production faster and, once in production, operating at peak efficiency.

Q: What are currently some domains where Kubernetes could use some
improvement? For what types of applications is it not yet suitable?

Kubernetes is a young project so there a number of areas that can be improved. A few focuses for 2017 include: improved reference documentation, more consistent deployment tooling to simplify testing, and practical guides for porting and developing applications against Kubernetes. That last point is really critical because although there are hundreds of organizations using Kubernetes in serious production settings, they are the early adopters who are able to piece the story together. To get Kubernetes really widely distributed, we need to make it clearer how to do something awesome in 10 minutes. [Minikube](https://github.com/kubernetes/minikube) is helping there but we need better stories for people who are completely uninitiated.

Today, Kubernetes can run almost any sort of workload from stateless web tier to stateful databases thanks to persistent disks, stateful sets, and a multitude of other features. However, we find that most people today are deploying their stateless web/API/caches/etc applications on Kubernetes and hosting their databases off cluster. I expect this to change over time as people gain confidence in Kubernetes and we see mature "Kubernetes native" databases emerge for Postgres, Cassandra, etc and newcomers like CockroachDB, Vitess, and etcd.

Q: What interesting new features can we expect this year in Kubernetes?

At the close of 2016, we introduced [Operators](https://coreos.com/blog/introducing-operators.html), which are tools that automate many aspects of application management, including updates and provisioning. We released operators for Prometheus and etcd, but we expect to develop and see the community develop operators for other projects that are managed by Kubernetes.

For this year, we have plans to improve the role-based access control systems, better integrate Kubernetes into cloud providers, improve the best practices around cluster upgrades, simplify and document disaster recovery scenarios, and further automate the bootstrap of highly-available clusters. Really, the overall theme of 2017 for Kubernetes is polish and operational excellence. The system is already working admirably for hundreds of organizations in production today.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first FOSDEM, I am looking forward to it!
