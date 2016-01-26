---
year: 2016
speaker: holger_levsen 
event: reproducible_ecosystem
---

Q: Could you briefly introduce yourself? 

My Name is Holger Levsen, I've been a Debian user for the last 20 years and started contributing 15 years ago. In 2007 I got involved in QA work in Debian via working on [piuparts](https://wiki.debian.org/piuparts) and then [piuparts.debian.org](https://piuparts.debian.org/). This then led me to start [jenkins.debian.net](https://jenkins.debian.net/) back in 2012 and then at the end of 2013 I thought I could use this [Jenkins](https://jenkins-ci.org/) setup to run a small script to build some packages twice and compare the results… and this was how I got involved in [Reproducible Builds](https://reproducible-builds.org/)…!

Q: What will your talk be about, exactly? Why this topic?

The talk will cover the current status of "Reproducible builds" in the free software world.

Whilst anyone can inspect the source code of free software for malicious flaws, most Linux distributions provide binary (or "compiled") packages to end users.

The motivation behind "reproducible" builds is to allow  verification that no flaws have been introduced during this compilation process by promising identical binary packages are always generated from a given source.

This prevents against the installation of backdoor-introducing malware on developers' machines - an attacker would need to simultaneously infect all developers attempting to reproduce the build.

And, while this talk will be a lot about what we've learned from working on [Reproducible builds in Debian](https://wiki.debian.org/ReproducibleBuilds), I will also give summaries about the status of Arch Linux, coreboot, F-Droid, Fedora, FreeBSD, Guix, NetBSD, OpenWrt, SuSE, Qubes OS and probably a bunch of others!

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to get more people from other projects interested and involved, both from projects I've just listed but especially from projects with no work on reproducibility yet!

So, I hope to get lots of new feedback and to spark even more interest!

Q: What are the advantages of reproducible builds for end users?

Reproducible builds remove one attack vector against targetted attacks on distributions and developers, which is one way to attack users. So, users (or rather, their computers) become more secure.

Because users can easily be attacked via the developers of the software they are using. And because developers - just as users - cannot verify that the binaries they are running are the binaries they want to be running, developers and users alike benefit from reproducible builds.

If you haven't already seen it, I very much recommend watching [Moving Beyond Single Points of Failure for Software Distribution](https://events.ccc.de/congress/2014/Fahrplan/events/6240.html) from 31C3, it very well explains the motivations behind reproducible builds (and why developers as users cannot know what they are running on their own machines unless they have reproducible builds.)

But there are more benefits, e.g. Google's main motivation to introduce reproducible builds were faster builds, thus faster development cycles and better use of developer time. In other words: reproducible builds save money.

Another side effect is "extended QA": to spot reproducible issues we constantly rebuild the entire Debian archive (on very fast hardware thanks to Profitbricks.com), and as such we find and report lots of bugs, e.g. related to new libraries etc.

Q: Various distributions are working on reproducible builds. How are they collaborating?

By now very well, we just had a very productive developer meeting in Athens with participants from 16 projects in December and we plan to have more of that in the future.

We have shared mailing lists and IRC channels and we're using a shared setup to test reproducibility issues.

It's a bit awkward to say this as a team member, but in my humble and not so humble opinion the Debian Reproducible builds team really has been super awesome, very helpful, very open (also to non-Debian people and topics) and done a lot of knowledge transfers - and actually thats quite exactly as how the non-Debian reproducible folks behaved as well! 8-)

It really is a pleasure to work on this.

Q: The idea of reproducible builds is at least 15 years old, as it was mentioned on the Debian development mailing list in 2000. However, we still have no reproducible builds in our distributions. So what are currently the biggest challenges?

It's unclear how old the idea really is. In 2000 it was mentioned on the Debian development mailing list, by one person, and no one even saw the potential. (While somebody replied with the main (bogus) concern some people still voice today: "but I like my build time stamps…")

In 2007 there was a bit longer thread on the same mailing list, but the consensus was basically: this would be very nice indeed to have this, but it will be practically impossible.

But maybe someone got started there, because at the end of 2009 development on [Gitian](http://www.gitian.org) was begun and Gitian is a build tool with one goal only: to create reproducible binaries. (By building in a virtual machine.)

And then in 2012 or 2013 (or so, I'm not sure about the exact dates, feedback with more info much welcome) Gitian was for the first time used to create Reproducible builds of the Bitcoin client and Tor Browser, which is a modified Firefox.

And only then people (in numbers) started to believe it's possible to do truly reproducible builds of large codebases.

And then throughout 2015 the Debian team has shown that it's almost possible to do this for any software there is in Debian, our number at last year's FOSDEM was 17600 source packages or 81% in our test framework of that time. By now we almost have 20000 reproducible sources in Debian (and we are testing against a lot more variations than we did last year).

But that's not the full picture:

Some people worked on reproducible FreeBSD and had roughly 60% of their ports (=packages in Linux land) reproducible in 2013 - but basically no one noticed.

And by the way, some other, actually many other people and project, have (or for a long time had) a very different understanding of "Reproducible Builds", where it just means that one is able to redo a build and get a working result. It sometimes happens that I meet people who say "what, you're working on reproducible builds? thats a problem we solved many years ago" and when I ask whether they mean reproducible as in bit-by-bit-identical, they look really really surprised :-) Sometimes it then still takes a long time until they realize the difference…

And then there are (some) embedded folks, for whom it is apperantly entirely normal to have bit by bit identical builds of some small sized images (think very few kilobytes) they are building. In some countries it's even mandatory to have (bit by bit identical) reproducible builds for gambling machines^wcomputers! Though I don't think I know a legislation which demanded that for voting computers…

(BTW: I'd be curious to learn more about the state of reproducible builds for embedded (in human bodies, no less) medical devices, though I have to admit I'm a bit scared about what I might learn.)

So long story short: because it is a pretty hard problem, at least for larger projects with diverse codebases like distributions - and then it's also a problem which very few years ago many people didnt even know it exists (and less so what advantages there are in solving it).

And, to correct my short answer: it's not just one problem. There are many many causes for many many problems :-) I guess it's not needless to say that there are often several solutions for each problem too.

Q: When will we see the first distribution for which users can verify that the installation medium they’re using is reproducible from the source?

When it's ready!

Also, you might not have realized this, but "reproducible installation media" has more requirements than just "reproducible builds"…

That said, I wouldn't be surprised to see several in 2016, there's already even been an announcement of one in the FOSDEM 2016 schedule ;-)

Finally, as said, the devil is in the details: "can verify" or "can verify easily" or "can get easy verification" are similar things which can be very different in practice. And "is reproducible" can also mean several things…

I will explain this in more detail in my talk, for now I'll just say two more things: a.) I hope we will see reproducible packages on ftp.debian.org before DebConf16 in July 2016 and b.) I also hope that Debian 9, "stretch", will be partially reproducible in a meaningful way. (And if you are curious what the potential and real blockers for this are: come to my talk!)

Q: Have you enjoyed previous FOSDEM editions?

Oh yes! I've been going to FOSDEM since at least 2005 and it always has been great to see many old and new friends, and listen to people with interesting ideas!
