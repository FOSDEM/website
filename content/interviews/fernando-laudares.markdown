---
year: 2019
speaker: fernando_laudares 
event: hugepages_databases
---

Q: Could you briefly introduce yourself?

I have been working with Linux and open source in general since 2004, with a primary focus on databases since I joined [Percona](https://www.percona.com/) in 2013. I work in the support team helping customers in various ways, from how to implement simple backup routines and optimize queries to overcoming operational problems.

Q: What will your talk be about, exactly? Why this topic?

My talk is about using large memory pages with databases, particularly with [MySQL](https://www.mysql.com/) and [PostgreSQL](https://www.postgresql.org/). The standard Linux memory page has 4KB but most modern processors have support for larger page sizes, such as 2M and 1G. But what is the benefit of working with large pages? Does it actually imply any performance or operational gains? The answer to that question is at the heart of my talk and I've been thinking about this for a while. 

Q: What do you hope to accomplish by giving this talk? What do you expect?

As it often happens in subjects like this, the main motivator for this talk was starting a conversation around it, or more accurately re-igniting an old discussion, which has started when the hugetlbpage patch was added to the kernel (I'm being specific to Linux here). And note this conversation is not purely about huge pages but also, or maybe mostly, on how applications and the operating system manage memory. I'm by no means an expert on the topic but I've been studying it with a focus on MySQL and PostgreSQL and I expect to pass along to the audience a summary of my findings. So if you're coming to FOSDEM and are curious about huge pages in general but don't know much about it, come see my talk. If I'm successful you shall exit with a pretty good idea about it and how its usage impacts MySQL and PostgreSQL.

Q: For which database applications can huge pages yield performance improvements? And in which circumstances is it really not worth using huge pages?

Ah, I'll be saving this for the presentation for now! But also because I can't come up with a concise answer here. Would you think there would be any other benefits in using huge pages, beyond performance gains? At first I thought there wouldn't be any but in fact huge pages are sometimes used in certain situations despite improving performance only marginally in those cases.

Q: Are transparent huge pages a viable option for applications that don't natively support huge pages? Can we expect the same performance improvements?

THP is a viable option for many applications, yes: that's why we're seeing it being enabled by default in various Linux distributions. But it is commonly understood databases aren't part of that group. When you come to think about it, what is the most common trait shared in the architecture of most databases design? I'll be touching this in my presentation.

Q: What do I need to do to configure huge pages on my Linux system? Are there some guidelines or best practices for an optimal configuration?

Enabling huge pages is not a simple matter of turning on a given setting. Providing the architecture has support for it and the kernel has been compiled with the necessary flags, in order to make use of huge pages one needs to create a pool of huge pages first, and then allow applications to use it, which is usually governed by an OS group id. Also, it's not an "all or nothing" affair: you carefully allocate as much memory in huge pages as you need, but not all of them. To give you a practical example, MySQL only has native support for large pages at the InnoDB level.

Q: Have you enjoyed previous FOSDEM editions?

I have not, this will be my first time. But it has been on my radar for several years now. I have been hearing all sorts of good things about FOSDEM, including friends telling me this is the one conference they most look forward to attend the whole year. To have a talk accepted in the main track in my first attempt, and for it to be scheduled on February 2nd, it feels like the greatest birthday present. I hope the experts in the audience will be kind to me :)
