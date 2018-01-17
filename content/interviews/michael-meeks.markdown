---
year: 2018
speaker: michael_meeks 
event: libreoffice
---

Q: Could you briefly introduce yourself?

With pleasure. I'm Michael Meeks: Christian, Hacker, Husband, and more. I work for Collabora on our ten+ year old mission: to make open source ubiquitous (well that's the gist anyhow). That means striving to make [LibreOffice](https://www.libreoffice.org/) better, helping out others who want to invest in improving it, and supporting / delighting our customers in suitable ways. In recent years, much of that work has been around creating and architecting [Collabora Online](https://www.collaboraoffice.com/collabora-online/) based on LibreOffice. In the past I've enjoyed spending big chunks of my time working with other great Free Software hackers from other companies and projects - mostly around GNOME, and openSUSE.

Q: What will your talk be about, exactly?

Primarily about how we're adapting and moulding this giant code-base with so many opportunities for improvement to new challenges such as how to efficiently use modern threaded hardware to how to build online and mobile versions.

I'll also talk about some of the interesting work in Online on scalability, and integrating with lots of other Open Source projects, as well as doing deeper integration with native Linux desktop toolkits.

Then of course, people want to get involved - so, giving some pointers to help people have fun contributing as well as seeing the latest feature work in LibreOffice 6.0 and beyond.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'd like to encourage people to get involved and work on LibreOffice. We have a huge and growing user-base and still truck-loads of low-hanging fruit to fix in the UI, in file-filters, and the core.  I'm also convinced that once people have fought and overcome the LibreOffice codebase they can hack on ~anything. I wrote up some of the [tools and techniques](https://people.gnome.org/~michael/data/2016-04-29-solving-problems.pdf) for doing that to try to encourage new people to skip the distraction rat-race and focus on doing something substantial and deeply valuable alongside us in their spare-time.

Also - many of the key developers on LibreOffice and associated projects will be at FOSDEM, I like them to understand where we're at so I can get their feedback on what we're doing and where to go next.

Q: Ever since the moment LibreOffice forked from OpenOffice.org, a big part of the development resources went into a constant cleanup/refactoring of the code, which is of course not as exciting as developing new features. Has this work 'under the hood' paid off? And which parts of the code still need some cleanup?

Great questions, I spend some time each year trying to document a subset of the work done here, and yes there is a really substantial cumulative impact.

Of course, the work to translate German comments (now complete) makes the code more accessible and easy to understand, but so does (for example) using new C++ constructs - standard containers, and modern iterators.

The improved reference counting work has substantially reduced deep coupling problems across the code and made changing things safer, our big set of clang plugins regularly catches coding mistakes before they get into master.

The very heavy investment from Red Hat and Google in oss-fuzz as well as coverity-scan has hugely improved our reliability and code quality. Perhaps one of the biggest wins people don't see was Markus Mohrhard's work on the crash reporter, which lets us catch and kill the biggest, baddest regressions most quickly where previously we would not be sure which to target.

Did I mention unit tests? The drive to create these and encourage people to implement them may slow down our CI builds, but very substantially increases the quality of the daily builds. Some of the most encouraging contributions I see are from people running those builds and reporting bugs quickly as we develop.

When you look at the cumulative effect of seven years of aggressively paying back a national-debt sized technical debt, we are in an amazingly better place - it makes me cringe mentally to consider working on or even reading the old code; yet still there is plenty more to do.

In terms of further cleanup there are some obvious pet peeves: we still have a largeish amount of rather un-reliable, hard-to-debug Java integration tests that we are slowly porting to C++ and Python. Our toolkit and rendering code needs significant cleanup work - improving lifecycle, killing manual linked-list implementations, finally removing the separate-alpha implementation we use for all bitmaps to name just a few. Then there is the UX - hackers interested in tweaking and improving the UI wil have plenty to work on.

Q: LibreOffice 6.0 is scheduled for release around FOSDEM 2018. What are your favourite new features or improvements in this major release, both visible and under the hood?

Wow; so - there is really a lot there I can't possibly do justice to the hard work from everyone; the many improvements to EMF+ rendering are great. EMF+ is used for the previews of lots of embedded objects in documents and is (at root) a pretty raw dump of the GDI+ API.

There are lots of OOXML interoperability improvements, and an outbreak of new digital signing everywhere: from TSCP signing of paragraphs, to CIB's work on signature status blocks and GPG integration.

There has been a chunk of work to extend our threaded XML parsing, and a lot of heavy lifting in Calc to thread the computation engine which is fun. Of course, Online has come on in leaps and bounds: scalability, UI improvements and more.

But that's really just a selection - lots more from an awesome team (and with proper credits) in my talk and on-line in the [release notes](https://wiki.documentfoundation.org/ReleaseNotes/6.0).

Q: In which areas could LibreOffice use some help? How can interested people contribute?

At the easy end - just using the latest nightly builds, reporting regressions and testing new features fast is valuable. Then getting stuck into QA to triage and prioritize incoming bugs is easy. Picking an easy-hack to do, before reading around the code or bugzilla of an issue to fix or feature you want is fun. It is easy to become the world's expert on a small problem area in the code in just a few days - and send a patch. I'd love to see our built-in Python3 exposed to users and used more interactively in the UI too; there really is a lot to do, checkout our page about [getting involved](https://www.libreoffice.org/community/get-involved/) for some starting points.

Q: Have you enjoyed previous FOSDEM editions?

I'm a huge fan of FOSDEM, it is an extraordinary conference: the best annual meeting place for the leading European Free Software developers to meet and freely discuss everything and anything. It is the one un-missable Free Software conference for me - and it seems to get better each year.

Meeting old friends, making new ones, and talking until rather late in the morning is most enjoyable. It is hard to appreciate the richness and depth of the characters of those we work with via e-mail and IRC. Free Software is built out of real people and one of the best places to meet and appreciate them, as well as discussing the latest ideas is FOSDEM. It's also a great place for people to learn about the importance of Free Software. I love to see newbies meeting and getting plugged into the teams I care about most.  Please come, learn, and find your place to be most effective, as we change the world together. See you there.

