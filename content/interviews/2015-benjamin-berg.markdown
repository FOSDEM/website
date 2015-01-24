---
year: 2015
speaker: benjamin_berg 
event: sdaps 
---

Q: Could you briefly introduce yourself? 

I am an electrical engineer but privately I have focused on developing
with and for free software with [GNOME](http://www.gnome.org/) being at the centre of my
contributions for a long time. Many of my FOSS contributions and
projects are therefore related to GNOME or use GNOME technology, whether
at university (both studies and student council work) or private
projects. I also like to work with FPGAs when not using my usual choice
of Python and C for programming.

Q: What will your talk be about, exactly? 

I would like to introduce everyone to [SDAPS](http://sdaps.org/), how to use it and how it
works. On the one hand it is important to me to show just how simple it
can be to do a small survey, on the other hand my goal is to give some
insights into how SDAPS works internally with the goal to get people
started with extending or even modifying SDAPS themselves.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

The thing about SDAPS is that it caters to a relatively small user base.
And many of the users do not have the resources or knowledge to improve
the core software (for example psychologists or sociologists). So the
main goal is to show that SDAPS is already a very useful utility and
what potential there is with regard to future developments. By doing
this I hope to build up the community around SDAPS further, which will
benefit the project and hopefully fosters an increase in contributions.

Q: What's the history of the SDAPS project? Why did you start it? How did it evolve? Is this what you planned it to be? 

Christoph Simon and I initially started the software at the Karlsruhe
Institute of Technology (University Karlsruhe) in the student council at
the faculty for electrical engineering. The reason for this was that in
late 2007 new bylaws governing the central evaluation were passed in the
university. At the faculty of electrical engineering we (the students)
decided to boycott these new bylaws and the whole evaluation because we
had some strong disagreements regarding the evaluation process and data
handling. At the same time there were some large changes in the course
of studies so, while we wanted to make a statement towards the
university, it was still important to have the data from the evaluation
for quality assurance purposes. By writing our own software we were able
to both boycott the university run evaluation on the one side and
conduct the whole evaluation ourselves alongside with the faculty.

After this we knew we could write such a software and SDAPS was born as
a complete rewrite. We wrote and used it to conduct a number of smaller
surveys in the student council and it was simply the natural thing to to
publish it under an open source license. Since then SDAPS got [LaTeX](http://www.latex-project.org/)
support (thanks to Ferdinand Schwenk) and a lot of other features over
the time. But large parts of the core are still in place.

Q: Could you give some examples of organisations that use SDAPS for surveys or examinations? 

Often it is hard to tell who is using it, but much of the adoption seems
to be in the educational sector. I know that it is used by at least one
college in the US for student surveys. Others are using it for research
projects, like at the University of Vigo (Spain). For examinations I
know of three universities that have or will use SDAPS, that is the
University of Amsterdam, University of Princeton (Dept. of Computer
Science) and also the RWTH Aachen (Physics Faculty). All of these have
different concepts on how to run and use SDAPS for the examinations,
which is quite interesting to see.
Outside of the academic sector it is used for example for patient
feedback by a UK company and by NationBuilder, a US based community
management startup. 

Q: What are some of the most interesting and unique features of SDAPS? 

I think that one of the most important features is the LaTeX (and ODT)
integration. The point is that one needs to see the task of conducting a
survey as a whole, and for that all major steps should be part of a
software utility like SDAPS. Using LaTeX means that there is a very
powerful layout engine in the background that many people are already
familiar with. This makes SDAPS itself both easier to write--it does not
need to care much about the layout engine--and more powerful, as most
features that LaTeX already has simply work.
This is not necessarily a unique feature of SDAPS, but many of the
issues in a tool like SDAPS revolve around the problem of creating the
questionnaire.

Q: Which new features can we expect in SDAPS this year? 

Definitely a new and reworked LaTeX package. There are a lot of pending
improvements that will make many people's lives easier. I also
expect that I will spend some more time thinking about examinations so
that SDAPS can be adapted more easily to this use case. And, if we are
really lucky we might even see some support for character recognition.

Q: How can interested developers contribute? And for which tasks could you use some help? 

Many parts of SDAPS are quite stable, but there are a lot of
possibilities to either improve the core or add new features (like the
ones mentioned above). I always think that it is important for people to
find something that scratches their own itch, either because it is
simply interesting to them or they need a certain feature. That said, in
addition to the development tasks already mentioned there are more ideas
in the [GitHub issue tracker](https://github.com/sdaps/sdaps/issues). I am happy to help anyone who is interested
in contributing to SDAPS or even doing some custom work based on it. So
don't hesitate to talk to me either in person or via IRC/e-mail.

Q: Have you enjoyed previous FOSDEM editions? 

FOSDEM has been an event that I love to go to since 2006. I have missed
a couple of them for various reasons, but they have always been a lot of
fun so far and it is a nice time to catch up with old friends.
