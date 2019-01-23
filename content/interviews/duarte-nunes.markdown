---
year: 2019
speaker: duarte_nunes 
event: raft_in_scylla
---

Q: Could you briefly introduce yourself?

I'm a software developer working on core components of the [Scylla](https://www.scylladb.com/) database. My background is in concurrent programming, distributed systems and low latency software. I'm based in sunny Lisbon, Portugal, where I've recently taken up surfing. When not dealing with cranky compilers or inscrutable race conditions, I enjoy good literature and landscape photography.
 
Q: What will your talk be about, exactly? Why this topic?

My talk will be about the trade-offs involved in implementing a distributed consensus algorithm in Scylla, and also about the possibilities such infrastructure unlocks. I chose this topic because it's what I'm currently working on.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I mainly want to share what I consider to be a very interesting topic. Hopefully, people will also realize what a fun project Scylla is and apply to help us continue building it :)
 
Q: What are Lightweight Transactions (LWT) and what are some examples where they are useful?

LWT is a feature of [Apache Cassandra](https://cassandra.apache.org/) that we're currently implementing in Scylla. It is essentially a distributed compare-and-swap: an update to a set of replicas conditional on some set of constraints, which provides linearizable consistency. LWT is useful for both internal and external use-cases which require strong consistency, such as enforcing uniqueness (e.g., e-mail addresses must be unique), check-then-act access patterns (e.g., money can only be withdrawn if there are sufficient funds in an account).

Q: Why was the Raft algorithm chosen to implement asynchronous consensus in Scylla? What were the requirements for the algorithm and which trade-offs did you have to make?

Consensus algorithms don't differ that much. The most important trade-off is between the presence of a strong leader, like Raft has, which can hurt availability, versus the number of round-trips necessary for replicas to decide on a value. However, Raft has other advantages: it's widely used, the protocol itself is very understandable and descriptive, even for issues like dynamic membership, handling of read-only requests, and log compaction. This was particularly important, since we needed to make adjustments to the protocol motivated by Scylla's shared-nothing architecture.

Q: What does Scylla's community look like? How can interested developers contribute? In which domains could you use some help?

The Scylla community is still in its infancy, but it's growing steadily. Our [Slack channel](http://slack.scylladb.com/) sees a lot of activity! [Seastar](http://seastar.io/), the framework underlying Scylla, also has a very active community, especially in terms of outside contributions. Developers can contribute to these projects by sending patches to the respective mailing list, Seastar being more beginner-friendly. In our bug trackers, we tag [issues that can be tackled by new developers](https://github.com/scylladb/scylla/issues?q=is%3Aopen+is%3Aissue+label%3An00b). You'll see that they cross many of Scylla's subsystems. 

Q: Which new features can we expect this year in Scylla?

Aside from LWT, we'll have row-level repair, a rewrite of our repair implementation, which greatly improves its performance and cost. We'll also be working on a streaming interface on top of Scylla, performance enhancements, and on other minor features present in Apache Cassandra but missing from Scylla.
 
Q: Have you enjoyed previous FOSDEM editions? 

I have! In 2016 I even gave a talk on distributed, virtual software-defined networking. 
