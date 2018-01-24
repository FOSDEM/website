---
year: 2018
speaker: markus_feilner
event: security_theatre
---

Q: Could you briefly introduce yourself?

I'm a seasoned Linux journalist, author, trainer, consultant and manager from Regensburg, Germany. As the former deputy-editor-in-chief at Linux-Magazin Germany, I have been working professionally with Linux since 1994 and I'm running my own company almost as long. Currently I'm managing a global team of experienced documentation experts at SUSE, Europe's largest Linux distributor, the creator of Enterprise Linux. I love traveling the world and I'm regularly giving keynotes, workshops, presentations and speeches at conferences in Europe and the USA. 

Q: What will your talk be about, exactly? Why this topic?

Since a few years, I have been diving into the problem that we (Humanity, politics, IT experts, OSS nerds and Security people of any kind) often are prone to undertake measures under the flag of improving security that do not help. 

I will give several examples for Security Theater (a term coined after the 911 events) and show why they don't work and how people strive to provide a feeling of security that is fake. Even worse: In politics this seems to have become a valid measure, many laws or actions taken seem to focus on the feelings rather than true security. 

But this is not only a topic of politicians or lawmakers. I have written several articles on wrong assumptions people make when it comes to IT security: From the hacking of the German parliament and the #blameware (a term I invented) to stupid password policies and the wrong assumption of anonymity in the darknet, there's security theater everywhere, from TSA locks to bike helmets, public CCTV and so much more ... 

Q: What do you hope to accomplish by giving this talk? What do you expect?

I have some suggestions that would help in arguments many of us regularly have to fight through. I am preparing this talk with members of the European parliament, maybe even video statements for this talk. Both politicians, lawmakers but also IT nerds, admins and infosec experts must understand that there are valuable and stupid measures we can undertake in security, but some are total theater. What's the sense in using specially hardened machines or a special compiler for your tools while your web application has PHP bugs big as barn doors or the proprietary software you're required to use can't prove to be backdoor-free? 

  * Open Source is no guarantee for secure software, but there's definitely no security without Open Source. 
  * Certifications are important, we need more of them - especially for areas where security is relevant - maybe even for hardware. 
  * Open Source and Hardware specs are relevant for certifications. 
  * "Public money public code" needs to be extended to hardware.
  * How about software and hardware liability - can we impose that on everybody whose products are meant for secure environments and are not OSS?
  * Revision: Every rule/law/legal action in terms of security MUST be validated after a year or so. Every rule/law/action must be time-limited and scientific proof must be found to extend it. Similar strategies can help in companies. 

Q: Do you remember when you first got the feeling that "OSI layer 8" is the source of the biggest security risks? In which situation did you have this insight? 

2015/16, During my investigations of the Hack of the German Bundestag. There were horrible, ugly things that users and admins did and nobody took the blame or the responsibility. It seemed like everybody just tried to outsource the blame. 

Q: What are some of the bigger myths about security risks?

Here's some: 

  * Regularly changing your password is a good thing.
  * A password manager is a safe place. (no, there is no software that's really safe)
  * The darknet is an anonymous place and police won't get you there.
  * Antivirus software helps. 
  * There is security in/with closed-source software. (Of course not. There's nothing but trust.) 
  * A smartphone is a secure two-factor-auth tool. No, it's not even a second factor.
  * Most home banking TAN mechanisms are safe. (No they are not!)
  * We can trust hardware and software from the US. (No we can't.)
  * Security by obscurity.
  * I have a strong password nobody ever will crack, thus I am using it everywhere. (NOOOO! Password reuse is the worst.)
  * A good password is one that you can remember.
  * ... to be continued ...

Oh, one more important thing: There's always another side in passwords. How do you know the bank/shop/website/* that you are creating an account and a password at have safe mechanisms for storing them? 

Q: How does the practice of responsible disclosure fit in?

Usually, responsible disclosure is meant to give the "creator of a bug/backdoor" time to fix the problem before it becomes world-readably known. But at the same time that means keeping the backdoor open for months or so. That seems to be more like "security by obscurity" than really helpful. [Google](https://security.googleblog.com/2010/07/rebooting-responsible-disclosure-focus.html) has a different view on this than e.g. [Microsoft](https://www.schneier.com/crypto-gram/archives/2001/1115.html) ("information anarchy").

Furthermore I recommend [this publication](https://www.ceps.eu/publications/software-vulnerabilities-disclosure-european-landscape):

> "The debate on how to handle the disclosure of insecurities pre-dates software security. It can be traced back to the locksmiths and lock-picking in England in the 1850s. In his book The Rudimentary Treatise on the Construction of Locks, locksmith Alfred Hobbes argued that _“it is to the interest of honest persons to know about [insecurities], because the dishonest are tolerably certain to be the first to apply the knowledge practically”_. And for decades now, this issue has been the subject of broad debate in the information security arena."

Q: You coined the term "blameware". What does it mean?

:-) Blameware is software that an organisation buys in order to outsource the blame if something goes wrong. In Germany we have a saying "You won't get fired if you buy stuff from the big players." - because if there's a security breach, everybody has the same problem, and you only did like the swarm did. It's the opposite of responsible behaviour. 

Q: Have you enjoyed previous FOSDEM editions?

Oh hell, yes, this is my sixth or seventh FOSDEM - maybe even more. With some breaks I've been a regular guest since 2007, and I love it. Most important OSS event on this planet. And I have been enjoying visiting and talking to the 
European parliament's members - which is great for me as a journalist. :-)
