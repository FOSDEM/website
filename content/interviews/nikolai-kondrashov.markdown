---
year: 2017
speaker: nikolai_kondrashov 
event: session_recording
---

Q: Could you briefly introduce yourself?

I'm a self-taught software engineer. Born in Saint-Petersburg, Russia, I
relocated to Finland in 2011. My career started 20 years ago, and
included working on GIS, POS terminals, websites, Linux-based routers, the Linux
input stack, OpenGL ES drivers, and a spell of system administration.

Since my school days, I'm also constantly experimenting with programming and
computer hardware in my free time. Eight years ago I founded (and I am still
maintaining) the [DIGImend](https://digimend.github.io/) project, which tries to improve Linux support for
graphics tablets, but lately I'm mostly occupied with teaching myself embedded
programming and electrical engineering.

Currently I work at the Red Hat Identity Management group. We work on [FreeIPA](https://www.freeipa.org/page/Main_Page),
[SSSD](https://fedorahosted.org/sssd/), and [389 Directory Server](http://directory.fedoraproject.org/), among others. While session recording is my
main project, I also maintain [FreeRADIUS](http://freeradius.org/) packages in Fedora and RHEL, and
contribute to SSSD.

Q: What will your talk be about, exactly? Why this topic?

I'm going to talk about our effort to build a solution for recording user
sessions, which would satisfy enterprises, as well as smaller businesses.

Companies in government, financial, medical and other sectors are sometimes
required by law to record everything users do on their critical systems,
including what they type, see on the screen, commands and applications they
execute, hosts they access, etc. Businesses in general also often want to keep
a closer watch over what happens on their servers. There are plenty of
commercial solutions, but no good, well-integrated open source ones. That is
the niche we're trying to fill.

It's the project I've been mainly working on for the past year and a half at
Red Hat.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to raise awareness of our effort, to gather feedback and to invite
cooperation. I would like people to ask questions, chime in during the
presentation, come talk to me afterwards, and hit [our GitHub page](https://github.com/scribery/)!

To help us do the right thing, we need all the opinions and advice the
community can give. We need people to try and use what we built already, to
tell us what we did right and what we did wrong, to evaluate our plans and
help us shape them. And of course, we need help writing the code!

Q: What's the history of the Scribery project? Why did you start it and how did it evolve? Has it become what you planned it to be?

In the beginning of 2015 the best manager I ever had, Dmitri Pal, offered me
an opportunity to create a tool to record text terminal sessions in a certain
way. This tool would then be integrated with our identity management solution,
he said.

That sounded interesting to me and I took it up. However, the vision of the
project has quickly broadened into an ambitious task, including recording all
sorts of data about user sessions, storage paradigm and playback interface. On
all of which I'm working right now, to various extents. I came up with the
working name "Scribery" in the beginning of 2016 and so far it stuck. Let's
see if it works out, or if we'll need to change it.

While already fulfilling some of the original objectives, the project grew
past what I initially imagined. There's now a lot more work to do! This makes
it all the more exciting to me, and I hope that will also interest the FOSDEM
visitors.

Q: User session recording seems like a pretty important task. Yet, Scribery seems to be the first project that tackles this task with an approach that meets enterprise needs. Why is that in your opinion?

First of all, it's not exactly the first project. There's plenty of
commercial, proprietary offerings, and very good ones too. Enterprises are not
generally shy with money, and they prefer to have an actual supplier company
to complain to if something breaks, so they were served adequately.

However, once businesses got a taste of the flexibility and affordability of
open source software, combined with reliable support offered by Red Hat and
similar companies, they started converting more and more of their
infrastructure to use them. After recently the open source identity management
solutions picked up steam and more companies started using them, they noticed
one part that was still stuck with proprietary code and sometimes quite
expensive licensing. That was session recording.

There were always smaller-scale recording solutions, such as [script(1)](http://man7.org/linux/man-pages/man1/script.1.html) and
[sudo(8)](https://www.sudo.ws/man/1.8.19/sudo.man.html) I/O logging, combined with audit logging and stitched together with
scripts. However, due to the way enterprises work, those were generally
unacceptable to them. Now when there are finally good enterprise-ready
open source identity management solutions, it became possible to tackle
session recording, which relies on and could be integrated with them.

Q: What challenges did you encounter while implementing session recording?

For me, encoding two streams of data coming from the terminal in discrete and
size-limited JSON messages to be logged, was a difficult and interesting task.

Another hairy problem, which is still unravelling, was converting audit logs
to JSON in a manner which is convenient, makes sense to existing users, and
balances between preserving audit event structure and suitability for
[Elasticsearch](https://www.elastic.co/) indexing.

Q: What can we do with the current Scribery implementation? And which new features can we expect this year in Scribery?

You can already record what specific users type and/or see on the terminal,
log it to ElasticSearch, search it, and do basic playback using a command-line
tool.

You can also send audit logs to Elasticsearch in a structured way, which would
allow you to do fine-grained, structured searches.

This year we will be working on a session player implemented as a WebUI
component. We'll be also finishing support for controlling session recording
via SSSD, and will be developing existing components further, of course.

Q: Have you enjoyed previous FOSDEM editions?

Unfortunately, I haven't had the chance to visit FOSDEM yet, but I'm looking
forward to it, and I'm excited at the opportunity to speak there!
