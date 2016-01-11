---
year: 2016
speaker: yoshinori_matsunobu 
event: facebook
---

Q: Could you briefly introduce yourself? 

I'm a Production Database Engineer at Facebook, mainly working on MySQL performance, efficiency and reliability improvements. I'm also leading the MyRocks project -- integrating [RocksDB](http://rocksdb.org/) (an embedded LSM database) as a MySQL storage engine. I joined Facebook in March 2012. Before joining Facebook, I was a MySQL consultant at MySQL AB from 2006 to 2010, and after that I worked for a Japanese social/mobile gaming company DeNA, and I created a [MHA -- MySQL master failover tool](https://github.com/yoshinorim/mha4mysql-manager) there.

Q: What will your talk be about, exactly? Why this topic?

I will talk about RocksDB, MyRocks, and how we are going to use MyRocks at Facebook. Since late 2014, we started researching integrating RocksDB into MySQL, and we have built a pretty solid product so far. Since we heavily use flash storage on our database servers, reducing space and write volume is very important for us. RocksDB has a clear advantage over InnoDB here. Since many people use flash storage on database servers, I think it's worth sharing our story.

Q: What do you hope to accomplish by giving this talk? What do you expect?

If you are interested in an LSM database speaking SQL, or if you are running InnoDB on flash and want to save space, my talk will be interesting.

Q: What's the history of the RocksDB project? Why did Facebook start it?

My colleague Dhruba started it a few years ago. Here is a Facebook Engineering post describing [its background](https://fb.facebook.com/notes/facebook-engineering/under-the-hood-building-and-open-sourcing-rocksdb/10151822347683920).

Q: Two years ago Facebook open-sourced RocksDB. Could you name some projects or companies that have embraced RocksDB in the mean time?

At Facebook, we use RocksDB for many internal and open source projects. Osquery is an example of an open source project of us [using RocksDB](https://code.facebook.com/posts/1411870269134471/how-rocksdb-is-used-in-osquery).

Outside of Facebook, many large services like LinkedIn, Yahoo, Airbnb and Pinterest are using RocksDB. Microsoft recently added support on Windows.

Q: What are the typical workloads in which RocksDB performs better than InnoDB? And in which circumstances would it be better to not use RocksDB?

RocksDB is an LSM database. Compared to B+Tree (InnoDB), LSM compresses data very well, so both space and write volume can be reduced. RocksDB has some optimizsations to save space even more, such as prefix key encoding and zero-filling metadata. On the other hand, LSM has more read penalty than a B+Tree database, especially range scan. If your database size is small enough but serves lots of read requests, InnoDB fits better than RocksDB. We started writing a wiki [on the Facebook MySQL GitHub page](https://github.com/facebook/mysql-5.6/wiki). This will help understand the differences between RocksDB and InnoDB.

The use cases of RocksDB and InnoDB are different. Please do not think we are going to replace InnoDB with RocksDB everywhere. This is not what we are going to do.

Q: Have you enjoyed previous FOSDEM editions?

Actually, this year is the first time for me to attend FOSDEM. I know there are many friends from the MySQL community joining the event, so I'm very excited to meet them. Also, this is the first time for me to visit Brussels, Belgium. I'll try to find some time to go sightseeing:)
