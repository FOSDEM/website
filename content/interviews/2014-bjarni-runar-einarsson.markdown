---
year: 2014
person: Bjarni Rúnar Einarsson 
speaker: bjarni_runar_einarsson 
topic: Mailpile 
event: mailpile 
---

Q: Could you briefly introduce yourself?

My name is Bjarni Rúnar Einarsson, and I am an Icelandic free software developer.

I have been working in tech as a sysadmin and software developer for over 20 years now, mainly on things related to the internet, the web and e-mail. For most of my career I have been working in Iceland, although I did spend three years working in Ireland for Google as a Site Reliability Engineer. Since leaving Google I have been working exclusively on free software development, first developing [PageKite](https://pagekite.net/) and now [Mailpile](https://www.mailpile.is/).

Q: What will your talk be about, exactly? Why this topic?

This talk will be the first talk we give after our alpha release, so I will spend a few minutes on a launch announcement - there will be a brief introduction to what Mailpile is, what the goals of the project are and how we are doing so far working towards those goals.

As I expect the audience to be relatively technical, I will then discuss the structure of the application, how the built-in search engine works, how we handle spam, how we plan to integrate with [GnuPG](http://www.gnupg.org/) and [Tor](https://www.torproject.org/), and what it means to develop a desktop e-mail client that uses web technology for its user interface.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to raise awareness about the project, attract both users and developers and hopefully answer questions people may have about what we are doing.

Q: What's the history of the project? When did you first think of developing something like Mailpile and what was the motivation?

This is actually the third time I sat down and decided to write a webmail application, but the others never went very far. Mailpile itself dates back to 2011, when I wrote an experimental search engine for e-mail. Initially the motivation was just to have fun writing a search engine and fool around. Over time however I grew more and more frustrated with the state of e-mail centralization, surveillance and encryption. One thing led to another and last winter I decided to assemble a team and try to raise money to work on it full time. I recruited both Smári McCarthy and Brennan Novak at a cozy pub in downtown Reykjavík, and we started hacking and working on a fund raising campaign.

Our timing couldn't have been better. As we all know, in May the documents leaked by Edward Snowden began to hit the mainstream media and suddenly everyone was interested in privacy and encryption. As a result, over 3600 people flocked to IndieGoGo to back our project. The [fundraising campaign](http://www.indiegogo.com/projects/mailpile-taking-e-mail-back) was a success and since September 2013, Brennan, Smári and I have been able to work full time on Mailpile.

Q: What's traditionally wrong with the user interfaces of email encryption? Where do current implementations fall short?

The most fundamental problem with e-mail encryption today is that the user has to manually enable it. For most users this means they have to first understand their e-mail is insecure, then they have to learn about crypto, then they have to find the right combination of operating systems, software and plug-ins and get all three configured correctly. Finally, the user has to make all sorts of choices about which keys to use, when and whether to sign or encrypt an e-mail. Even for techies this is relatively complicated and often unpleasant (not everybody wants to use Thunderbird), but for the average Joe it is almost insurmountable.

There are many smaller details about the user interface itself, but I consider the "disabled by default" problem to be by far the biggest and that is one thing we will definitely change with Mailpile.

Q: Mailpile aims to be accessible for everyone and at the same time tweakable for power users. However, usability and security are often mutually exclusive. How do you solve this challenge?

Usability and security are only mutually exclusive when you think of security in terms of access controls and restrictions.

When you think of security in terms of understanding what your computer is doing and how, understanding how trustworthy an e-mail is or understanding how not to accidentally forward confidential information over an insecure channel, to name just a few examples, then it becomes obvious that usability is an absolute requirement for building secure e-mail.

Software that is cryptic and confusing is hard to use correctly. So from that point of view, the more usable the software, the more secure it is. We don't see a conflict here, but getting the user interface right is definitely one of our biggest and most important challenges.

Q: Which features can we expect in the first alpha version?

The alpha will be able to read and write encrypted e-mail (and normal e-mail). It will also have a powerful search engine with the ability to organize mail using tags,

Q: Have you enjoyed previous FOSDEM editions?

I have only been to FOSDEM once before and I was honestly a bit overwhelmed by the size and energy of the event! I am very excited to visit again and get to know people.
