---
year: 2016
speaker: carsten_agger
event: connecting_communities
---

Q: Could you briefly introduce yourself? 

I'm a software developer with a Master's degree in physics and computer science. From 1996 onwards, I became involved in social activism, and in 2005 I discovered free software. In 2010, I became involved in the creation of Aarhus' hackerspace Open Space Aarhus, from which space I used to organize FSFE local group meetings. Since 2011, I've worked as a developer of free software only - which had been my dream ever since I understood the importance of free software.

In 2014, I went to Brazil to attend the 1st International Festival of Technoshamanism, as it was called, and since then I've been collaborating with two different activist networks in Brazil: The Technoshamanist movement and the Rede Mocambos; the latter is a technological collaboration between ~200 quilombos or Afro-Brazilian communities and is where the Baobáxia project originated.

Q: What will your talk be about, exactly? Why this topic?

The talk will be about the effort to create a system which can help preserve and communicate the cultural heritage of the Brazilian quilombos in the face of the huge challenges they face - e.g., lack of infrastructure and pressure from the surrounding society.

I find the project important in its own right and also interesting as a counterweight to the complete dominance of communication platforms such as YouTube, Facebook, Twitter ... Baobáxia is a multimedia platform that originates in Afro-Brazilian communities and is designed to fit the needs of precisely these communities. One of these needs is the absolute necessity for the system to work with no Internet access, which poses some very interesting challenges. From a computer science perspective, we're talking synchronization by many different channels and between networks that are only partially connected. From a community perspective, we're talking about how to integrate the physical transportation and synchronization as well as the maintenance of each local node of the system in the communities themselves. The notion of free software as a basic tool of everyday life, which is one of the fundamental tenets of the Rede Mocambos, is important in this respect.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I *expect* to tell people a story that we hear too seldomly here in Europe, that of how free software may truly engage with activism for the benefit of local communities; I expect people to find it interesting. If somebody could feel inspired by what people do in Brazil, or venture equally inspiring stories about what they themselves or people they know are doing here in Europe, it would be even better.

What I *hope* to accomplish is to gain support for the project in the form of volunteer developers or oganizational engagement with the project.  We have many ideas for how to improve the system and too little time to implement it all!

Q: What's the history of the Baobáxia initiative? Why was it started and how did it evolve?

The idea of a comprehensive multimedia system for the preservation of the culture of the rural Afro-Brazilian communities goes back at least as far as 2007 - an important early meeting is mentioned in [this blog post](http://imaginarios.com.br/dpadua/?p=121). The idea is to create a digital communication infrastructure for the quilombos, which are characterized by often being very rural communities, with no Internet or cellular coverage and generally lacking in infrastructure - but bearers of a strong culture, which their inhabitants wish to preserve.

The main architect behind the system is the Sicilian hacker Vincenzo Tozzi, and he designed many ideas of the system as part of his dissertation. A lot of design work involving things as logos and look-and-feel was done about 2012.

The initial commit in the current git repository was in August 2012, and people started using the system last year, in 2014.

Q: What challenges did you encounter regarding offline distribution and synchronization of multimedia?

The main challenge is to understand how data will move and propagate in the network. Synchronization may be done when people travel and visit other communities; they can bring updated copies of their local nodes with them.

We're currently working with a concept of "territories", nodes which are geographically close, and "routes", which correspond to how people will typically travel between the communities.

Q: How can interested people contribute to Baobáxia?

Everybody is welcome to check out [the source code from GitHub](https://github.com/RedeMocambos/baobaxia/) and give it a spin. Please note that for the time being the system is only available in Portuguese; a localization to other languages such as English or Italian would be an obvious way to help.

But basically, check out the source code, give it a spin, contact the developers and we can set up a meeting over IRC to get you started!

Q: Have you enjoyed previous FOSDEM editions?

Yes, I attended FOSDEM in 2008 and in 2014, where I also had the pleasure of giving a lightning talk about a project we're working on in Denmark. Both times were really interesting, with a lot of good lectures and necessary discussions. The 2008 conference was my first large FOSS event abroad, so it also helped give me (hailing from a small country with an even smaller free software community) an impression of the magnitude of community-based free software in Europe - seeing so many people in one place, representing such a large number of projects.

