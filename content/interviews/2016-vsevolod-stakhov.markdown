---
year: 2016
speaker: vsevolod_stakhov 
event: rspamd 
---

Q: Could you briefly introduce yourself? 

I've been interested in open source software since the early 2000s and in particular I was a big fan of BSD related systems, namely NetBSD and then FreeBSD. I received my commit bit in the FreeBSD project in 2005 and still return to this OS from time to time. For example, I have rewritten the solver and some other dark parts of the FreeBSD package management system called 'pkg'. I started work on [rmilter](https://github.com/vstakhov/rmilter) and [rspamd](https://rspamd.com/) whilst I was working at the Russian company called 'Rambler' (the letter 'r' initially came from this name). I was responsible for the internal architecture of a mail system that processed hundreds of millions of messages per day and had more than 30 million active users. Now, I'm in the finishing year of my PhD studies (which are not directly related to rspamd) at the University of Cambridge and have been invited to join a company named 'Mimecast' to support their transition to rspamd.

Q: What will your talk be about, exactly? Why this topic?

I'm going to talk about my favourite project 'rspamd' and about other issues related to spam filtering --- for example, why it is impossible to kill all spam with merely technical means. On the other hand, I would like to demonstrate how rspamd can efficiently filter the vast majority of spam in environments processing high volumes of mail.

Q: What do you hope to accomplish by giving this talk? What do you expect?

My major desire is to make more people aware of rspamd. I suppose that a large user base is an essential thing for a successful open source project.

Q: What's the history of the rspamd project? What was your motivation to start it and how did it evolve? Has it become what you planned it to be?

Rspamd was created as a prototype to replace some of the most frequent rules in our [SpamAssassin](http://spamassassin.apache.org/) installation. After we compared the two solutions, we decided that rspamd should replace SpamAssassin completely in our setup because of performance considerations (it was about 10 times faster in those days). Of course, the number of rules and features supported was initially quite low, however, the project has evolved over the years and now contains a lot of plugins, rules and statistical modules. Rspamd can now even read SpamAssassin rules and use them directly to simplify transition from SpamAssassin. Moreover, rspamd is now used by many companies and in many countries all over the world and there are several very active contributors in the project. In the previous year rspamd participated in the Google Summer of Code which brought us the opportunity to interact with students and introduce some interesting features, for example, use of machine learning algorithms to improve the filtering quality.

Q: Given that SpamAssassin has been the dominant open source spam filtering program for at least a decade and that many FOSDEM visitors have experience with it, could you describe the main differences between SpamAssassin and rspamd for a mail server administrator?

Well, rspamd is fast, so you don't need to bother about spam filtering performance in most cases. Rspamd has a built-in GUI to perform configuration and monitoring tasks. Rules and plugins are written in the Lua programming language, unlike SpamAssassin where Perl is used for everything. One of the most frequent questions about rspamd is the question of autolearning and automatic rules updating. To tell the truth, I have no evidence that autolearning is really useful and I'm quite cautious about false positives that might be caused by autolearning. However, in the upcoming release I plan to include an optional autolearning feature that might be useful for some personal mail systems. Rule updating is not hard to implement but, again, I consider this feature as very dangerous for production mail systems (unless you have your own QA department that controls the quality of new rules and replies to users' feedback immediately).

Q: Which optimizations turned out to give rspamd the biggest performance boost?

That depends on rules mainly. Event driven systems are very useful to optimize DNS and other network related rules. Regular expressions optimizations are useful for processing text with static rules. Hence, I could say that merely the conjunction of local and global optimizations with constant monitoring of the bottlenecks could grant the real performance boost. For example, certain parts of rspamd are written in highly optimized assembly (e.g. using avx/avx2 instructions) to avoid bottlenecks for at least compatible CPU models.

Q: How can interested people contribute to rspamd? In which domains could you use some help?

Well, I'm interested in testing of rspamd by users, in creation of new rules, in packaging (and especially a Debian maintainer). Development tasks might be tricky, however, there are other contributors in rspamd in both C and Lua parts. So these types of contributions are also welcome. I have even created a [Contribution](https://rspamd.com/contribution.html) page on the rspamd website where I push some ideas from time to time.

Q: Which new features can we expect this year in rspamd?

In the upcoming rspamd release, I plan to add hyperscan support for regular expressions rules optimization, a [Redis](http://redis.io/) statistical backend and other improvements to the plugins. I also carried some experiments with neural networks (using the [fann](http://leenissen.dk/fann/wp/) library) and I'm quite enthusiastic about applying this technology to spam filtering. In the upcoming year, I plan to work more on documentation (for example, the 'rspamadm confighelp' command), on rules and on the stability of rspamd.

Q: Have you enjoyed previous FOSDEM editions?

Yes, in fact, FOSDEM is my favourite conference so I've really enjoyed when I was attending it in the previous years. I'd like to thank you for what you are doing for the open source world!
