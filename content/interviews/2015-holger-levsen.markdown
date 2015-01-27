---
year: 2015
speaker: holger_levsen 
event: stretching_out_for_trustworthy_reproducible_builds 
---

Q: Could you briefly introduce yourself?

My name is Holger Levsen and I'm part of the teams maintaining 
[video.debian.net](http://video.debian.net), [piuparts.debian.org](http://piuparts.debian.org), [jenkins.debian.net](http://jenkins.debian.net) and now 
[reproducible.debian.net](http://reproducible.debian.net).

Obviously I do other stuff as well, both in and out Debian, but the above is 
probably my current focus.

Q: What will your talk be about, exactly? Why is this topic important? 

Reproducible builds, the subject of the talk, is about re-creating identical 
binaries from a given source in a defined environment. With reproducible 
builds one can be sure that *these* sources were used to build *that* binary.

I actually consider this to be an essential part of the “old” promise of free 
software, ie. that we know and control the software we are running. It is 
somewhat peculiar that it was only recently that this has started to be 
considered achievable.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

I have been quite surprised by the amount of progress we made for such a young 
project. I want to share this excitement and also tell the world that 
reproducible builds are doable, even for a huge software collection like 
Debian. I think it would be great if developers of many other free software 
projects — especially other distros — would become enthusiastic about this 
idea as well so that reproducible builds become the norm one day. I certainly 
think there are many aspects and lessons we have learned which can be applied 
elsewhere.

Within the Debian community this project has attracted a *lot* of unforeseen 
support already even though it's currently just an experiment to prove that 
it's even possible. We hope the talk will help to shape the goals for Debian 
"stretch" — aka Debian 9—the release after the upcoming Debian 8 "jessie" 
release.

So, this is not at all only about Debian — it's about reliability in all 
software development and deployment!

Q: What's the history of the Debian Reproducible Builds project? Why was it started and how did it evolve? 

The idea of reproducible builds is far from new. It was first mentioned on the 
Debian development mailing list in 2000 and then again in 2007 and more 
recently it was picked up again and successfully realised for the Bitcoin 
client and the Tor Browser. These successes inspired the current work within 
Debian which only started just over a year ago. The first presentation 
happened at the previous FOSDEM.

This is a very short version of the history which omits many important points, 
especially how this would not be possible if Debian could not be rebuilt so 
easily. We are standing on the shoulders of giants!

Q: What infrastructure is the Debian Reproducible Builds project using? 

[jenkins.debian.net](http://jenkins.debian.net) has been used since 2012 for continuous QA testing of 
several parts of Debian. In autumn 2014 I extended it to attempt a 
reproducible build for every package in the development branch of Debian and 
to output some very simple web pages as a result. Today, we have a rather more 
sophisticated website - for example, we track progress for large package sets, 
include notes about investigated packages and many other aspects. We have also 
introduced variations of time, file ordering, user, group, hostname, locale, 
etc. into the rebuild process.

In other words, we are not currently using any official Debian infrastructure 
for our experiment. Hopefully after the release of Jessie our changes will be 
included in the normal toolchain so that then all regular Debian builds will 
support this.

Once the infrastructure supports it we would like build reproducibility to 
become mandatory for Debian packages. Personally, I have high hopes for 2015 
already, but others in the team would like me to be more modest ;)

Q: What are the biggest challenges in making all Debian packages reproducible? 

Debian is *huge*. It currently contains more than 21,000 source packages and 
more than a thousand people are actively maintaining them. Testing, 
understanding, and patching so many different pieces of software is a big 
challenge. Working with so many different developers, different people, 
different worlds is another..

Q: Looking at the [common issues for reproducibility](https://reproducible.debian.net/index_issues.html), it's clear that timestamps, e.g. generated in documentation files, are the biggest source of issues. What's the general approach to fix this? 

Don't use build timestamps. Either drop timestamps completely or somehow use 
some last modification date of the source which will stay the same on 
rebuilds.

Q: When will it be possible for users to be sure that the complete Debian GNU/Linux installation medium they're using is reproducible from the source? 

My crystal ball is a bit blurry at the moment. The first step is to ensure 
every binary package we ship can be reproducibly built and we are tracking 
specific sets of packages in order to better target our efforts here.  Then, 
installation media needs to be reproducible, which might be another challenge 
altogether. Finally, to make "live" systems reproducible we will encounter yet 
another challenge: the installation itself should be reproducible.

I certainly hope that most packages that will make up Debian 9 can be rebuilt 
reproducibly by individuals. Of course, I'd like that percentage to be 100% 
but whether that remains a dream depends on the efforts of many people.

Q: How can interested people contribute to the Debian Reproducible Builds project? 

First, I'd suggest they read through 
[our wiki](https://wiki.debian.org/ReproducibleBuilds) which will provide a good overview 
about the current status of the project. Maintainers of Debian packages can 
easily check whether their packages can be built reproducibly today by going 
to https://reproducible.debian.net/$pkg. And for anybody interested in giving 
a hand, we have a nice [“how to help”](https://wiki.debian.org/ReproducibleBuilds/Contribute) section as well!

Q: Have you enjoyed previous FOSDEM editions? 

Yes, a lot! The reception of the Lunar's initial talk about reproducible 
builds in 2014 has helped the project tremendously to gain momentum which we 
have managed to keep going until today. Let's hope it's going to be even 
better this year!
