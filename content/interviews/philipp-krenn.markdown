---
year: 2018
speaker: philipp_krenn 
event: elasticsearch 
---

Q: Could you briefly introduce yourself?

Hi! I’m Philipp and I work as a developer advocate at Elastic, the company behind [Elasticsearch](https://www.elastic.co/products/elasticsearch), Kibana, Beats, and Logstash. I live in Vienna, but most of the time I’m traveling around Europe for conferences, meetups, and trainings.

Q: What will your talk be about, exactly? Why this topic?

My talk is called "Elasticsearch (R)Evolution — You Know, for Search…”. The idea is that the Elasticsearch revolution happened and it is now the modest widely used full-text search engine, so now is the time for evolution. We will dive into smaller and larger changes as Elasticsearch is maturing and broadening its use-cases.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The goal is to highlight some design decisions and show clever technical solutions, which are applicable much more broadly than just in Elasticsearch.

For example strictness: In the beginning of a project you want to be easy to use to get adopted, so you want to keep starting hurdles and error messages to a minimum. As you mature over time and production use-cases become more important, you want to get stricter; rather fail early than run into potential issues in production. This is a learning process you can see in a lot of projects and we are no exception — I can even demo that very easily.

Q:  What's the history of the Elasticsearch project? How did it evolve?

That is actually part of the talk, so I don’t want to tell too much. Once there was a man who wanted to help his wife, but he slightly overengineered it. The third iteration of this helper has become the most widely used full-text search engine, but the wife is still waiting for her tool...

Q: How did you implement an efficient search across clusters? What were the biggest challenges you encountered?

This is another great story: The original feature was written on a flight from San Francisco to Amsterdam. It worked, but the colleagues maintaining it the following years would always say that you could tell under what conditions it was created.

Once something is out and used in production, especially by some of the really large users, it gets very hard to fix design problems. In the end a complete redesign and reimplementation was needed. But only having the initial solution in place allowed for that iteration, so despite its shortcomings the first implementation was vital.

Q: Support for types will be removed gradually in Elasticsearch. How did you decide on the roadmap for this big change and what are you doing to avoid upgrade pains for people that still use types?

The problem with types is that they were always a lie — Apache Lucene on which Elasticsearch is built simply doesn’t have that concept. Initially it helped mapping the mental model of relational databases better to Elasticsearch (another point where we wanted to make the initial adoption as easy as possible). However, since it was always an artificial concept it added some gotchas that would bite people later on. We’ve advocated for sticking to a single type per index for a long time and now is the time to finally enforce that.

Slightly simplified the plan looks like this: In the first phase any newly created index can only have a single type. In the major version after that the type becomes optional in the API (since there can only be a single one) and people can gradually remove the type usage in their application. And only in the following major version after that the type will be finally gone for good. It is a multi-year and multi-version effort, but we want to avoid breaking changes as much as possible and allow for a smooth migration instead.

Q: Which new features can we expect this year in Elasticsearch?

A feature we have just released is an API to split shards — basically breaking them up into smaller pieces. This has been requested for a long time, but it’s a very heavy process and we said that we wouldn’t do that for a long time. Now we have added this little precondition, which made the implementation much simpler and cheaper: We are synthetically creating shards in smaller chunks, say one shard consists of 6 pieces even though you don’t see that from the outside. Now when you want to split the shard, you can divide those pieces into 6, 3, or 2 shards pretty easily. I find that one of the many fascinating examples where a relatively small tradeoff allows for the creation of features, which were otherwise hard to impossible to implement.

Q: Have you enjoyed previous FOSDEM editions? 

No, this is actually the first time I’m joining, so I’m already very excited about that!
And don’t be shy — if you have any Elasticsearch or Elastic Stack questions just find me (or ping me [on Twitter](https://twitter.com/xeraa)) for a discussion. Also if you just want to have some swag; I’ll be bringing plenty of stickers ;-)
