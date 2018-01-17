---
year: 2018
speaker: peter_zaitsev 
event: mysql_scaling
---

Q: Could you briefly introduce yourself?

My name is Peter Zaitsev, I’m Co-Founder and CEO of Percona. We provide truly vendor neutral, (free from lock-in) free software and solutions for open source databases such as [MySQL](https://www.mysql.com/), [MongoDB](https://www.mongodb.com/) and [MariaDB](https://mariadb.org/). 

Q: What will your talk be about, exactly? Why this topic?

I’ve been involved in the MySQL ecosystem since 1999 and I’ve seen a great amount of different MySQL architectures and an evolution of MySQL technology, as well as approaches to running MySQL at scale, and I’m very passionate about this topic. In my talk, I will discuss that - what worked well running MySQL at scale and what did not.  

Q: What do you hope to accomplish by giving this talk? What do you expect?

I expect a room full of people, finding this topic fascinating and coming out with new thoughts and ideas. While this talk is MySQL-focused, I think people using other open source databases in production or just running open source infrastructure will likely find it interesting as well. For members of the MySQL community, I hope to help you make better decisions when running MySQL at scale and avoid some of the well-known mistakes. 

Q: What are the main technical challenges in scaling MySQL and making it highly available? Are these challenges different from those a decade ago?

MySQL now is much better and more robust than it was a decade ago. We have much better replication - there are clustering technologies available, such as Percona XtraDB Cluster, Galera or MySQL Group Replication. MySQL now scales much better on “big iron” and the hardware itself is much more capable. We also now have cloud-based DBaaS which makes it very easy to build scalable and reliable applications with MySQL without being an expert. With all of these you can build much larger applications using mostly standard and simple MySQL architecture. 

At the same time, some problems are still unresolved in MySQL - for example, we still do not have parallel query execution abilities (even for the server, I’m not even speaking about massively parallel execution on the cluster) and MySQL sharding still has to be done manually - where other technologies such as Cassandra or MongoDB have standard  out-of-the-box solutions for this problem.

The great thing about the MySQL community, though, is that most of us are not zealots and we recognize the limitations of MySQL, so we’re using other technologies for places where MySQL is not particularly strong. For example, Memcache and Redis have been used for caching for more than a decade; Elastic is commonly used to build a better full text search; Hadoop and more recently, ClickHouse, to offload analytical workloads. 

Q: How do you see the world of open source databases evolving?

In the early 2000s, there were a few open source databases, especially non-academic, popular ones. While PostgreSQL was there, MySQL was still controlling probably 80+% of the open source database market. The majority of Web 2.0 companies such as Facebook or Twitter were using MySQL. Now we have many more databases. While MySQL remains by far the most popular open source database, we have more choices, and not just with relational databases - we see innovation and experimentation with different concepts such as Document Stores, Graph Databases, Time Series Databases, and others, which is absolutely great.

This means now there are a lot more choices for developers to be able to use open source database technology that is particularly well designed for the task at hand. This also sparks innovation in open source relational databases. For example, MySQL, PostgreSQL and SQLite all now have powerful JSON extensions which came from NoSQL database ideas.

Q: Have you enjoyed previous FOSDEM editions?

This will be the first FOSDEM I am attending. I have heard great things about the conference for years, but until recently I was a Russian citizen living in the United States, and it was quite a process for me to get a visa, and I just could not fit it in my calendar. 

At the same time FOSDEM is one of the most loved shows by Percona staff and we have a lot of people attending each year. I also very much admire the FOSDEM team for being able to run an event with such great quality content and speakers which is FREE to attend.  We’ve been running our own Percona Live conference series for years and I know first-hand how much money and effort is needed to put together even smaller events! Thank you, FOSDEM team, for your commitment to support the open source community!


