---
year: 2020
speaker: vladislav_shpilevoy 
event: swim
---

Q: Could you briefly introduce yourself?

My name is Vladislav. I am interested in databases and in system programming as a whole. I graduated from Moscow State University of Lomonosov with a master degree in computer science. I worked on the open-source DBMS [Tarantool](https://www.tarantool.io/) for the last 5 years where I implemented many core features. Currently I'm working in the Ubisoft game development company on server-side networking and other deep systems of a not announced AAA game. But I still participate in Tarantool development as well.

Q: What will your talk be about, exactly? Why this topic?

My talk is about a promising, very scalable, relatively new protocol for event detection and dissemination in big clusters. The protocol is named SWIM. It is one of so called 'gossip' or 'infection-style' protocols. That protocol gives an almost free, fast, and reliable monitoring of anything happening in the cluster with guaranteed spread of that information on each node of the cluster. That 'anything' can be node failures, new node appearances, application-defined events. Almost half of the talk is about how and why SWIM was modified by many useful, even vital, amendments to make it even more powerful and totally stable, and how it has been implemented in Tarantool DBMS. There aren't many SWIM implementations so independent, isolated, and canonic like in Tarantool.

The topic of gossip protocols such as SWIM is getting more actual because clusters become bigger, business requirements become stricter, and protocols such as SWIM appeared to be a perfect fit for a range of new tasks. At least for Tarantool. Where we care about efficiency and performance in the first place.

Q: What are some notable changes in the Tarantool DBMS from the last few years?

Tarantool DBMS grows and evolves incredibly fast. Just in the last couple of years we've released such features as:

- ANSI SQL. Tarantool was a NoSQL, but now it is a NewSQL database;
- Functional indexes;
- Multikey indexes;
- JSON indexes, and other document-oriented features;
- SWIM protocol support;
- Decimal data type;
- Disk storage engine based on LSM trees with a unique write-free update algorithm;
- Significant replication changes, such as anonymous replication.
- Revolutionary sharding using virtual sharding concept, called Tarantool VShard;
- A brand-new application framework with sharding, cluster management, and a web UI on board, called Tarantool Cartridge.

One of the most notable changes is that Tarantool has been moving many of its closed-source subproducts to the open-source project. Such as Tarantool Cartridge framework. And it's truly open-source, where the community actually participates in development and roadmap planning. It is a unique product evolving like that, at least in Russia.
