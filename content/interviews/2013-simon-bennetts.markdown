---
year: 2013
person: Simon Bennetts 
topic: Practical Security for developers, using OWASP ZAP
---

Q: Could you briefly introduce yourself?

My name is Simon Bennetts, and I'm the OWASP ZAP project lead. Although I'm now part of the Mozilla security team, my background is in software development - I've been designing and building web applications since 1987, and worked on operating systems before that. 

Q: What will your talk be about, exactly? Why this topic?

My talk is all about how developers can use ZAP to find vulnerabilities in their web applications. Vulnerabilities in web apps are a huge problem, and there is no easy solution. However I believe that helping developers find issues as early as possible is one of the things that will make the biggest impact.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope developers will see how easy it is to find vulnerabilities with ZAP, and start using it on their own applications. Ideally I'd like them to include ZAP in their continuous development process :)

Q: Could you explain what OWASP is and what activities it does?

OWASP is a not-for-profit organisation dedicated to improving the security of software. We produce a whole range of guides and tools, all of which are completely free. There are also hundreds of local chapters and many security conferences all around the world. To learn more have a look online, or pop over to the OWASP stand at FOSDEM and have a chat with us :) 

Q: What are in your opinion the key differences between OWASP ZAP and other web security testing tools?

It's completely free (no pro version), open source and very actively maintained.                                                                                       

It's also a community project - we want as many people to get involved as possible, and are very supportive of people who want to learn about security by working on ZAP.                                                                                                                                            

And it's one of the few security tools that is aimed at developers - lots of security people use ZAP as well, but developers are always going to be a priority for me.  

Q: What's the history of the project? How did it evolve?

It's a fork of the old (and no longer maintained) Paros Proxy. I started playing with Paros to help learn about security. I liked it, but there were a few things that annoyed me, so being a Java developer I just got stuck in and changed them. 

As I learnt more about security I started giving talks to other developers and functional testers, and one of the first questions I was always asked was what tools they should use. So I had a look around for easy to use, free, open source, cross platform tools and couldn't find anything that I thought was really suitable.           

I realised that the version of Paros I'd been messing around with could become that tool, so I took the plunge - forking Paros and submitting it as an OWASP project.

Q: Let's say I'm a developer of an open source web application. What do I have to do to use OWASP ZAP for testing my application's security?

The best thing to do would be to come along to my talk at FOSDEM - thats what I'll be explaining (and demoing) :)    

Q: You're not only OWASP ZAP Project Lead, but also Mozilla Security Automation Engineer. How are you using OWASP ZAP at Mozilla, and could you give some examples of vulnerabilities you have found with it? 

We use ZAP in the security team for manual penetration tests (along with other tools of course). We test both apps written by both Mozilla people and 3rd party apps that we want to make use of. And we've found pretty much everything on the OWASP Top Ten (and more) using ZAP on 3rd party apps!                                         

We're also introducing it into our QA process. So all of our web app QA tests (which are controlled by Jenkins) will be proxied through ZAP and then we're using the ZAP REST API to actively scan the apps for vulnerabilities.                                                                                                              

Automated scanning won't find all vulnerabilities, but it does find a whole load of issues which frees us up to concentrate on the ones automated scanning can't find, like logical problems. 

Q: How big is the OWASP ZAP developer community?

We have about half a dozen people in the 'core' team, and loads more people who have made smaller (but still very important) contributions. But we're always on the look out for more contributors! 

Q: Which new features can we expect in 2013?

Hopefully by FOSDEM we will have released 2.0.0 - which is going to be a very significant release for us. It will include a completely rewritten spider, a new Ajax spider and the most comprehensive support for WebSockets that I'm aware of. There are also a whole load of other features which I'll mention in my talk - there are too many to go through here. And all of these features have been implemented - we have lots more features that are either being worked on or are in the planning stage for 2013. 

Q: Have you enjoyed previous FOSDEM editions?

I must admit I've never been to FOSDEM before :( But I'm really looking forward to it, and although I'll need to spend some time on the OWASP stand I'll do my best to get to as many of the other talks as I can.     
