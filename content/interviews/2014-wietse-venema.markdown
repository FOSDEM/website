---
year: 2014
person: Wietse Venema 
speaker: wietse_venema
topic: "Postfix open source mail server - lessons learned and recent developments"
event: postfix_lessons_learned_and_recent_developments 
---

Q: Could you briefly introduce yourself?

I'm Wietse Venema, originally from the Netherlands but working for IBM Research in southern New York state for the past 17 years. I've been releasing open source software for more than 25 years, for almost as long as I have been using UNIX systems.

Q: What will your talk be about, exactly? Why this topic?

I will present some historical and recent developments with the open source [Postfix](http://www.postfix.org/) mail server, including some new features in this year's release. In the 15 years since the first Postfix release, the Internet has continued to evolve. This evolution brings many things that Postfix has to deal with, and it presents a constant opportunity to learn from experience.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to bring across some higher-level points that also apply to other systems.  Postfix is not a huge system, but with 220 thousand lines of code and with 15 years of Internet evolution, there are lessons that I can share. Come to my presentation for details.

Q: What do you consider the highlights in the history of Postfix? How did it evolve? Has the project become what you planned it to be?

Among the highlights are receiving a Sendmail innovation award (note that Postfix was originally written to replace Sendmail), and finding out that Postfix was chosen as the mail system for Mac OS X.

It is really hard to make plans or predictions 15 years into the future. My initial expectation was that it would take a few years to make Postfix "complete". This took eight years because the definition of "complete" had to be updated as the Internet evolved, so you can see how all my early expectations went out the window.

Q: What do you consider the most important lessons you learned in the 15 years you have been working on Postfix?

The main lesson is don't optimize for the common case. Instead, optimize for both the worst case and the common case. On the Internet, the worst case will eventually become the common case.

Q: How does the project's community look like? How many developers are working on it?

There are great people who provide support on the postfix-users mailing list. Some have contributed features or documentation, and some have written books about Postfix.  These books are an excellent introduction for people who have no prior experience with running a mail server. The books do a much better job than I could ever do.

All the Postfix source code was ultimately written by a small number of people.  I don't want to sound arrogant, but very few people can write software that I trust. And one major reason people use Postfix is that they trust it to deliver mail reliably without causing problems.  Many people have donated code to Postfix, and for that I am grateful.  However, there are only two developers including myself who maintain Postfix.

Q: Which new features can we expect in Postfix in 2014?

This year's release, expected end of January 2014, introduces support for a new protocol "DANE" that uses secure DNS to authenticate a mail server's TLS server certificate.  This avoids a major weakness in the traditional PKI (public-key infrastructure) where literally hundreds of certificate authorities (CAs) world-wide can create a certificate in anyone's name.  Some of these CAs make mistakes or certificate in anyone's name.  Some of these CAs make mistakes or get hacked. Some are owned by their government, or have strong relations with their government.  With secure DNS you only have to trust the people who control the email receiver's Internet domain and those who control its parent domains. You don't have to trust hundreds of CAs world-wide.

There is also new support for a database called LMDB that aims to give better performance and reliability, and that comes with a less restrictive license than the latest versions of Berkeley DB.   This development required a lot of persistence, taking five iterations. I think that the result is worth the effort.

Finally, the new release continues to make Postfix configurations easier to manage with other programs.  A Postfix system does not live in a universe by itself: it needs to work as a building block in a larger system.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first FOSDEM conference, and I expect that I will enjoy it. However, this is not the first time that I visit Brussels. I used to come there several times each year when I lived in the Netherlands.
