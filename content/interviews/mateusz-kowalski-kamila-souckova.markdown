---
year: 2020
speaker: [mateusz_kowalski, kamila_souckova] 
event: scion
---

Q: Could you briefly introduce yourself?

**Mateusz:** I’m Mateusz and currently for a living I’m between ETH Zurich and Anapaya Systems, its spin-off, as Site Reliability Engineer. Since around 2012 I have been working with cloud and container technologies, only recently having moved into the SDN and networking area. I used to work for various business and government organizations, but one of the projects I’m mainly proud of was running the CERN Private Cloud (one of the biggest OpenStack deployments) providing resources for the Large Hadron Collider. I’m always looking for positions where I can both develop and run open source software, following the pattern of eating your own dog food. Everything having “Open\*” or “Kubernetes” in the name makes me excited to work with.

**Kamila:** I’m a “little bit of everything” person: I have too many hobbies, from playing random wind instruments to flying small airplanes (none of which I do often enough). This is also the case with my tech interests: I’ve gone from web front-ends to writing my own operating system from scratch, from Haskell to FPGAs, from purely dev to purely ops and so on. I was introduced to the concept of SRE at internships at Google, and found out that in an SRE role being “a little bit of everything” can be super useful. Then I started a Master’s in Computer Science at ETH Zurich, while also building and running the infrastructure of the prototype of [datacenterlight.ch](https://datacenterlight.ch). I somehow managed to complete a thesis in the Network Security department despite that, which is how I found myself doing [SCION](https://www.scion-architecture.net/). I’ve been working on SCION since then, i.e. for the last half a year.

Q: What will your talk be about, exactly? Why this topic?

We want to present SCION, a clean-slate internet architecture meant to overcome the limitations of the IP-based world. Back when the Internet was created, the world was very different --- and nowadays we have the opportunity to explore other approaches with more up-to-date security and scalability properties.

Designing SCION from scratch gives us the opportunity to make it work a lot better --- from the perspectives of security as well as availability & performance. We are aware that a complete revolution is not something easy to perform, that’s why SCION is designed with focus on incremental deployment and backwards-compatibility.

The project has left the phase of being only “an academic wish” some years ago. Nowadays it is already being considered by industry and governments. Thus, we feel that now is the perfect moment to reach out to people at FOSDEM in order to share the system and confront it with more real-world use cases.

Q: What do you hope to accomplish by giving this talk? What do you expect?

**Mateusz:** I want to make the audience familiar with the problems of the current Internet and the ongoing work to make it better (namely, by completely redesigning it). By spending a few years of my life working with scientists I feel a personal responsibility to bring the science closer to the general audience --- I tend to tell people “if you cannot explain your research in an easy way, it’s worth nothing”.

**Kamila:** The current Internet has aged surprisingly well, given how different the world is today. However, nowadays we face new challenges in terms of security, scalability, and availability; and we also have new ways of approaching them. I think it is valuable to test out different approaches, such as SCION; and the real world and real developers are the ultimate test.

Q: What are some fundamental changes over the last 20 years for the current internet and how does SCION fit into this story?

**Mateusz:** Over the course of the past few years we can see people becoming more and more aware of security and privacy issues. In lots of these cases providing people with a more secure medium (i.e. a redesigned Internet) could help mitigate these problems. We cannot expect people to fully understand every technology they use, but we should be aiming to provide them with the best solutions, even if sometimes it goes in a more revolutionary rather than evolutionary way. In the age of Facebook, Instagram and Snapchat we should try to make at least some layers of networking more secure and resilient than they are now.

**Kamila:** Unlike in the past, today virtually everyone has their data online, and the Internet is quickly becoming critical infrastructure. With IoT and automation, this trend will further accelerate in the future. Thus, we need much better ways for controlling our data, and much stronger guarantees for availability and attack resilience than in the past.

SCION is a network architecture designed to address some of these
problems. As a network protocol, it cannot solve all of them: you still
need to choose whom you trust with your data, and use things like end-to-end
encryption and other mechanisms if you want privacy. However, by making
some security-related choices more explicit, and by providing higher
resilience to failure as well as some malicious attacks, SCION might be
a useful item to have in the toolbox for fixing the Internet.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS?

**Mateusz:** I like the idea of attending a technical conference without all the marketing and sales people trying to offer me the next product I will never use. Apart from this, the idea of gathering so many various open source projects in one place at the same time sounds super cool to me.

**Kamila:** Though I haven't been to FOSDEM myself before, a lot of my friends whom I've met through FOSS have been long-time attendees and sometimes also organisers. I think bringing FOSS enthusiasts together to share ideas, learn about interesting projects, and find inspiration has a huge impact. I myself have started contributing to several open-source projects after talking to people at similar conferences, so I'm pretty sure that a lot of FOSS work can be somehow linked to FOSDEM. 

Q: Have you enjoyed previous FOSDEM editions?

**Mateusz:** I have already attended FOSDEM and I’m very happily coming back this year. Everything that has been said in the previous question applies also here. Last but not least, the event taking place in Brussels --- i.e. having the best beers in the world at hand --- does not make it difficult at all to make the decision to come.

**Kamila:** This will be my first FOSDEM, so I am very much looking forward to the experience.
