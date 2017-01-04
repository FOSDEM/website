---
year: 2017
speaker: benjamin_kampmann 
event: safe_internet
---

Q: Could you briefly introduce yourself?

I'm Benjamin Kampmann, FLOSS freelance software developer and educator currently residing in Berlin. My expertise is with the social web, building front end and back end systems for over a decade now. I care about good design on both sides: to the user but also in the back end infrastructure and architecture. But more than that I care about people: I mentor and coach, write and facilitate the writing of learning materials and organise community events and organisations - like [OpenTechSchool](http://www.opentechschool.org/), [Hackership](http://www.hackership.org/) or [OpenSourceBash](http://www.opensourcebash.org/).

Q: What will your talk be about, exactly? Why this topic?

I'd like to introduce you to the [SAFE Network](https://safenetwork.org/) - a fully privacy-first peer-to-peer storage and communication network for application development. In essence the aim of this network is to remove the "server" from the equation, give data ownership back to the users and protect everyone from privacy invasion. It sounds like a big task, almost impossible to tackle, but important nonetheless. Considering how vulnerable the server-centric model is to data leaks (like passwords or credit card information), how our personal data is exploited from the endpoints and most importantly how easy mass surveillance of everyone and their activity in our entire current infrastructure is, we must admit that we need to rethink this from the ground up. That is what the SAFE Network aims to do by combining existing technologies (like strong encryption and Distributed Hash Tables) into novel ways that protect everyone's privacy and shift the way we think about building decentralised applications.

Q: What do you hope to accomplish by giving this talk? What do you expect?

First and foremost, I hope people realise how problematic our current infrastructure is and that we must do something about it. Secondly, through presenting what we are doing at SAFE, I intend to expose that there are ways of fixing this: but those won't come from the big players, it will require us, the FLOSS community, to build these. Therefore my last hope is to get more people interested in SAFE and decentralization technologies, check them out and analyse them and finally join the movement - even if it just by building their next application in a decentralised and privacy-first manner.

Q: What's the history of the SAFE Network? Why was it started and how did it evolve?

The main idea is actually quite old: the founder of [MaidSafe](https://maidsafe.net/) (the main contributor of the source code and driving force behind this) had this idea already back in 2006 - realising exactly those problems centralised infrastructures pose today. With a small set of people he set out to build a first prototype in Python, later replaced with a proof of concept in C++ and the current version - soon to be production - is written in Rust.

Early in 2016 the project released its first Alpha Network, which has been successfully run every since. Meanwhile the development went ahead to provide better data types and a more developer-friendly API to build our own applications on it. At this moment we are in a big refactoring to allow for mobile apps to run and connect to the network too.

Q: What are currently the biggest challenges for SAFE Network?

While the project has a lot of really skilled network engineers, who've been doing great work under the hood, the higher levels, especially how to build decentralised applications using the SAFE Network and what it means if everything is encrypted, are largely unexplored. Although we've built a lot of tooling and features right into the infrastructure - like the built-in public key infrastructure - to make the lives of developers easier, whether you can actually build decent applications with it is still an open question.

Q: What does the project's community look like? How can interested people help?

One of the best ways to contribute to the project is by actually trying out the APIs in building an application with it and giving feedback about what is working, what is needed and how things can be improved. We do have a large community of privacy enthusiast, who are happy to provide feedback and discuss application structures or simply provide ideas what to do. Another great way to help is to read and comment on the RFCs - all bigger changes the project does to the code base goes through a public specification process asking the community to chime in and provide feedback. Or contribute to the core - through the RFCs process - directly. If you ever wanted to use Rust for an actual real-live project, this is your chance!

Q: Which new features can we expect this year in SAFE Network?

First and foremost, we will see mobile support and a new key-value store-like data type that should make development much easier. Furthermore with these changes comes a new standalone library to connect to the network autonomously and improved tooling for development. Aside from that the backlog is very long, including features like a native cryptocurrency and remote computation, and we'll probably decide which ones to tackle next based on the feedback given and needs expressed by application developers.

Q: Have you enjoyed previous FOSDEM editions?

Yes, I've been there all the way back in 2010 and I loved it. I am so happy to come back and even give a talk, too!
