---
year: 2015
speaker: [sylvestre_ledru, lukas_blakk]
event: a_new_version_of_firefox_is_available 
---

Q: Could you both briefly introduce yourself? 

I'm Lukas Blakk and I have been involved with Mozilla since 2006.  First as a student, volunteer contributor, then as an intern, a contractor, and finally a full-time employee. I started in Release Engineering working on building our automation & scaling infrastructure. I worked on our Try server and on making project branches possible (temporary branches for loan to dev teams).  I moved to Release Engineering 2.5 years ago to help out when it was just one person doing all the work and ended up sticking around.

I'm Sylvestre and I started to work at Mozilla as Release Manager a year ago. I managed a few releases: 29 (Australis), 31 (the base for the current ESR release) and 33 (including the decade release). Before that, I worked on [Scilab](http://www.scilab.org/) for more than 7 years doing many things. In parallel, I have been involved in the [Debian](http://www.debian.org/) project and the [LLVM/Clang](http://clang.llvm.org/) projects.
 
Q: What will your talk be about, exactly?

We will explain how we can provide a major release every six weeks. Each release being developed by 400 to 500 developers (paid staff or volunteers) doing 4000 to 7000 commits.
 
Q: What do you hope to accomplish by giving this talk? What do you  expect? 

<s>Free beers!</s>

More people could do software releasing with some of our processes. We believe we have a great set of steps worth imitating and improving upon. We're also doing this entirely in the open and there's not much out there about how software gets released so hopefully we can be role models for others.
 
Q: How did the six-week release cycle evolve since it was first used for Firefox 5? Has the workflow changed? Do you use other tools now than in the beginning?

The workflow continues to improve.  When we started doing a release every six weeks there were a lot of human input requirements - emails, mostly - back and forth between many teams.  QA sign off took a lot longer (they also had less automation back then).  We didn't have things like the addon hotfix (introduced in FF11) that could fix certain issues in the wild without a dot release.  We're now quite rapid and hands-off to the point that we can churn out even 3 dot releases in a cycle and barely break a sweat.
 
Q: What are the most important lessons you have learned during the four years of the rapid release cycle for Firefox development?

The workflow is the key element to make sure that the various teams are on track and that the last critical bugs are fixed for the release. The synchronization and communication between the different teams (Dev, QA, Release management, etc) is a key to success. 
 
Q: Churning out a major release of Firefox every six weeks is quite a feat. What are the biggest challenges? Are they organizational or technical?

A bit of both. One of the key challenges is to get enough user testing during the whole cycle.

With the train model, a version is in nightly for 6 weeks, aurora for 6 weeks and beta for 6 weeks. Developers are pushing their changes in nightly and most of the user testing is done when the version arrives in the beta channel. So, it introduces a delay between the development and the bug fixes.

Another technical challenge is for us to get enough data to make sure that the release is still as stable and fast as the previous releases.

Q: Do you have some specific plans or goals for Firefox release  management?

Better visibility into how we can *know* our releases are staying the course, or even better: improving over the last one.
 
Q: Have you enjoyed previous FOSDEM editions? 
 
Lukas came to FOSDEM in 2010 and enjoyed it immensely.  Looking forward to returning.

Sylvestre has attended FOSDEM for the last 6 years. I have been involved in the video team for a few years.


