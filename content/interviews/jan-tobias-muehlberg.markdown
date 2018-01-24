---
year: 2018
speaker: jan_tobias_muehlberg 
event: sancus
---

Q: Could you briefly introduce yourself?

I'm a security researcher. Together with a group of colleagues at [DistriNet](https://distrinet.cs.kuleuven.be/) at Katholieke Universiteit Leuven I want to make ICT more secure. Occasionally we also break stuff.

Q: What will your talk be about, exactly? Why this topic?

We've been looking a lot into Trusted Computing, how to use it in different contexts, what the exact security guarantees and limitations are. We have been developing our own Trusted Computing architecture, [Sancus](https://distrinet.cs.kuleuven.be/software/sancus/), which aims to bring strong software security to the embedded world, the IoT and safety-critical control systems. I want to talk about why we need this kind of architectures, how to use them, and why security is often really hard to achieve and to understand. Most importantly, I want to talk about why we decided to make Sancus open source, the hardware and the support software, and why we believe that it is very important to build secure systems out of open-source components.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Secure systems, security architectures in particular, rely on peer review and public scrutiny. We have seen a range of nightmare situations affecting the security of all layers of hardware and software of virtually all computer systems out there. With the Sancus architecture we want to show that it is possible to build strong security solutions that are relatively easy to understand and to verify. We seek community support, from practitioners as well as from researchers to examine our designs, to help us to build secure processors and development tools, and to explore application scenarios.

Q: What's the history of the Sancus project? How did it evolve?

Sancus started as the PhD project of Job Noorman and was first released in 2013. From then on, development was slow but steady. I got into this in 2014 and built a first larger application, trust assessment for IoT systems. Overall, the maturity of the core and the development tools improved a lot with applications. Also the public attention grew. We've been looking into IoT applications, smart grid, and last year into automotive computing. I'm particularly interested in pushing this safety-critical line of work.

Q: What are some unique features of Sancus? For which application scenarios is it especially well-suited?

We feature security. On extremely low-power devices. Essentially, Sancus gives you the guarantee that a software module has been deployed without alterations on a specific node in, e.g., a sensor or control network. This also holds for distributed applications where "sancusified" application components mutually authenticate each other, and you can have multiple isolated application components per node, which are hard to attack and have secure means of communication built-in. So, Sancus is quite similar to what Intel SGX promises to do. Just, we do it on open-source hardware with an expected unit price around one Euro, and with a battery life of several years on an AA cell. Depending on the application, of course. If you're building distributed sensing and control systems that require strong security, Sancus is probably something you would want to consider.

Q: What are some limitations of Sancus? For which situations is it not a good choice?

Firstly, the current Sancus is based on the openMSP430. That's a 16-bit MCU. If your application components don't fit into a 16-bit address space, Sancus isn't for you. But we have been working on integrating Sancus nodes in networks with commercial Trusted Computing solutions such as ARM TrustZone or Intel SGX, where Sancus is used on light-weight nodes that control sensing and actuating.

Secondly, Sancus is still at the level of a prototype. We probably need about 12 more months of hard work to make this product-ready, to eliminate some documented design issues, to start with formal verification and to improve tool support.

Q: What does the project's community look like? How many people are working on it and how can interested developers contribute? In which domains could Sancus use some help?

That's a bit hard to tell. The core team consists of maybe seven people at DistriNet and [COSIC](https://www.esat.kuleuven.be/cosic/). We have been working together with researchers from the [University of Erlangen](https://www.informatik.uni-erlangen.de/), but we also get requests from researchers and companies around the world, who are interested in understanding our demo scenarios and the hardware design. 

It would be great to have some people on board to improve compiler support, to do some serious pen testing of our demos and to come up with scenarios in IoT, home automation or maybe even safety-critical domains.

Q: Which new features can we expect this year in Sancus?

We don't really think in terms of features. Sancus is a security architecture and our goals are to keep it simple and to get it right. Thus, most effort in the coming year will go into formally verifying some aspects of the hardware design and to improve the application development tools. We are working on support for real-time systems -- you can call this a feature if you want.

Q: Have you enjoyed previous FOSDEM editions?

Only once, although I live fairly close by for a few years already. I promise to change this.
