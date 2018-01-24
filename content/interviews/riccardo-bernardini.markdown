---
year: 2018
speaker: riccardo_bernardini 
event: terra_bruciata
---

Q: Could you briefly introduce yourself?

I was born -- in a CS sense :-) -- in the 80's where, in my late teens, I learned programming in BASIC and Assembler on a ZX-Spectrum and in FORTRAN at school.  Almost 40 years later I teach and do research on DSPs at the University of Udine (Italy).  As I often say, programming for me is not a job, but a tool (to implement the DSP techniques I develop) and an hobby.  Since I graduated I almost exclusively used open source tools and I love it for the sense of empowerment it gives to me.

Q: What will your talk be about, exactly? Why this topic?

This talk will introduce "Terra Bruciata," an initiative aimed to improve the current status of the software.  The idea is not only to produce better software, but try to promote the idea that bugs are a serious matter to be taken seriously even in apparently innocuous contexts (such as in a small domestic appliance).  

Q: What do you hope to accomplish by giving this talk? What do you expect?

Well, the first objective is obviously to find someone interested in joining this effort.  I hope to grow at least a small "condensation core" able to attract more people and interest.

A second, maybe subtler, objective is to have people talking about software correctness.  Is it possible? Is it worthwhile? I mean, if this guy (me :-)) is doing all this effort...  Even just by talking about it I can help promoting the awareness about this matter.

Thirdly, I hope to get the attention of two side projects: [CodeStand](https://codestand.ietf.org/codestand/) and [Open-DO](https://forge.open-do.org/).

CodeStand is an initiative of IETF that aims to get more involvement of the open source community in network protocol development.  Since the initial interest area of Terra Bruciata will be protocol implementation, Terra Bruciata could be a channel between IETF and the open source community.

Open-DO is, according to the description at https://forge.open-do.org/, "an Open Source initiative that aims to create a cooperative and open framework for the development of certifiable software"

It is an interesting initiative and I think there could be some synergy with Terra Bruciata, but everything gives me the impression that it is in "sleep mode."  I will try to get in touch with the administrators to see if this can be the occasion to "awaken" it.

Q: Why did you decide to start the Terra Bruciata initiative?

Let me take a step back. A few years ago I read in an Italian computer magazine a tutorial about the Ada language.  Being curious about new tools, I decided to give it a try and I was captivated.

Ada programmers are a curious bunch (none get offended, I put myself in the bunch... :-)) as they often have a special commitment to software correctness and maintainability. I, actually, get mad when I read of security issues caused by stupid bugs.  I am also worried that with the coming of the IoT bad software can be leveraged to cause (very) serious damage. Thinking that, say, your toothbrush can be used to shutdown the power grid can sound surreal, but, alas, it is quite realistic...

I agree with late [Robert Dewar](https://en.wikipedia.org/wiki/Robert_Dewar) that we should not put up with software "glitches" and that the roots of the problems with the current state of software are [in the culture](http://www.businesscomputingworld.co.uk/software-glitches-why-we-shouldnt-put-up-with-them/). As they say, "if you want a revolution, start it by yourself", this initiative is a tentative to start a (soft) revolution in the culture of software.

Q: Not many software developers have the rigorous mentality that is needed to be able to strive for 100% software correctness. Is Terra Bruciata's goal realistic then?

Hmmm... I choose the backup question.  No backup question? :-)

Seriously, your concern is real and I am aware that it will not be easy, but giving up without trying is the best way to fail...  It must be said, however, that the quest for robustness can be exciting as the quest for efficiency, just ask any Ada programmer :-) My hope is to attract an initial core of people hotly interested in program correctness, starting producing software and making a lot of ado (but not about nothing :-)) to get more people interested.

As said before, the objective of Terra Bruciata is not only to develop robust software, but also promoting the idea that software _can_ and _must_ be correct.

Q: Is it feasible to use techniques from avionics software development, such as formal checking, to a broader range of software projects?

Well, we'll see. One of the objectives is also to try to import to an open source context development techniques that were born in more industrial contexts such as avionics.  I am currently studying DO-178 and I am quite optimistic that we can port at least the basic ideas behind it to open source.  A major challenge that I foresee is that open source development is distributed and based on volunteer work, while DO-178 was born in a more hierarchical, industrial environment.

Q: What does the Terra Bruciata initiative's community look like? How many people are working on it? And how can interested people help?

Well... the idea is quite young (less than one year) and at the moment "community" is a big word... (it is just myself). Beside the obvious help in coding, I would like to find someone with experience in DO-178 (or similar) and someone with experience in managing open source projects. Although I am enthusiastic, I must admit that I have no special experience in those fields and I could use some help there.

Q: What can we expect this year from Terra Bruciata? Which projects will you tackle first and why?

I started working on the [CoAP protocol](https://tools.ietf.org/html/rfc7252), a kind of low-cost HTTP thought for IoT , just to bootstrap the initiative and create some basic infrastructure for interested people. Why did I choose CoAP? No special reason, just we needed a something to start with. Since CoAP has been designed with IoT in mind, we thought that it could be an interesting choice.  This first project has also the objective to help us to understand the problems that can arise and to fine-tune the process.

Q: Have you enjoyed previous FOSDEM editions?

Yes, I love FOSDEM, and I mean it. After a year spent chasing buzzwords, the energy you can breathe there is like a mouthful of new oxygen. A minor thing that I love is the idea of using a kitchen timer in the lightning talks. Low tech as it can be, it is very effective: in 30 years of work I attended many conferences, but FOSDEM has been the only one perfectly on time... :-)

Oh, by the way, my first visit to FOSDEM was because of the Ada developer room... ;-)
