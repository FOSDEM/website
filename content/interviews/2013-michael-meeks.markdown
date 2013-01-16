---
year: 2013
person: Michael Meeks 
speaker: michael_meeks
topic: "LibreOffice: cleaning and re-factoring a giant code-base"
event: challenges_libreoffice
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I'm Michael Meeks: Christian, Hacker, Husband, Irritation, and more. I work for [SUSE](https://www.suse.com/) who pay me to make Free Software on the desktop even better for our customers. At the moment, that means working on [LibreOffice](http://www.libreoffice.org/) most of my time, though I've enjoyed working with some great hackers on other projects over the years, mainly [GNOME](http://www.gnome.org/) and [openSUSE](http://www.opensuse.org/en/).

Q: What will your talk be about, exactly? Why this topic?

It's really about the story of a small team taking on the challenges of a huge, very old, and problematic code-base and our attempts to pay down the extreme technical debt we inherited from the previous government. Perhaps it is a hopeful microcosm of the real world economic situation we find ourselves in. How is it possible to create beauty from disorder and mess? Maintainable code from something unreadable? And to have fun doing it?

Q: What do you hope to accomplish by giving this talk? What do you expect?

Some of the progress here was quite surprising to me - the passion people have for cleaning up dirty old code, and the amount of work that can be done there - without significantly impacting quality is (to me) amazing. What happens when you unleash hundreds of developers of mixed experience, new to the code-base and with few-to-no constraints on what they can do? We have some pictures to show the result. Is it sane to re-factor and cleanup existing, working code? Or should we be scared because we might break it? Come and see what the metrics say.

One of my secret goals here is to encourage people to tackle large, incremental re-factoring rather than attempt complete re-writing. Inexperienced programmers often spend much of their life re-inventing wheels that others have created already - rather than working together with others, doing less writing, and more reading to improve the state of the art. If we can encourage this attitude, we'd have fewer duplicate from-scratch re-writes and healthier communities behind our projects.

Q: Can you give some examples how LibreOffice development is held back by its existing code-base and build infrastructure?

Sure - there are lots of them. Historically much of the code-base was created before C++ was standardised. We've now fully re-worked that early pre-template code into clean STL use - which makes the code far more readable while reducing the learning curve. The same could be said of translating tens of thousands of lines of German comments to English - widening our international reach. Another example might be switching away from a strange, bespoke build tool to GNU Make. Adding unit tests - initially there were nearly zero - allows us to accelerate changes to our import and export filters with a good degree of confidence.

Fixing and improving these allows us to get more people involved, more quickly into the project, to be more confident that patches are correct with less review. We still have plenty of distance to travel though - if you speak German and can read this: please do get involved in translating the last 20k lines of code comment - before it's too late.

We recently added another enabling feature: upgrading our internal widget library VCL to add automatic layout. With that we can import and render glade files - so suddenly (for the first time) we have a featureful UI design tool that can be used to tweak and polish the dialogs we've migrated. This should let non-developers in user experience start to improve our many UI issues over the lifetime of 4.x.  

Q: Which steps were made to tackle the code and build issues and where do you want to move to? 

There is of course plenty more that needs doing. There are whole areas that need cleanup and love: we still have a pernicious cult of mutex-taking all across the code - despite being essentially a single-threaded application. We have significant scalability issues in the core data structures of our spreadsheet (Calc) that should be very fun to fix. Much of our re-working so far has been to the low-level infrastructure, and there is more to do there, but the whole code base needs significant incremental renewal work - there is something for everyone.

Beyond that we're starting to use [Clang](http://clang.llvm.org/) to build patches to automatically upgrade and re-factor the code which allows us to do some long-overdue improvements with significantly less work.

Q: Last year you talked at FOSDEM about the LibreOffice Online prototype and the mobile app. What's the status of these projects, when will they be ready for the general public ?

Good questions - the on-line prototype continues to struggle to attract investment, so not much happened there - beyond the various fixes that are integral to the ongoing GTK3 porting work. The Android version though looks better - Android x86 and ARM have tinderboxes that build packages from snapshots of master for developers [to play with](http://dev-builds.libreoffice.org/daily/master/Android-ARM@24-Bytemark-Hosting/current/). We have a viewer that handles our diverse set of document types, but we're always on the look out for people to help out with development there. If you want to learn a lot about native code development on Android - mail me.

Another Android app we have at that URL is the presenter console that we're launching with LibreOffice 4.0 - that allows you to remote-control your laptop's presentation via Bluetooth from your smartphone.

Q: LibreOffice 4.0 is scheduled for release right after FOSDEM 2013. What are your favourite new features, both visible and under the hood?

Wow - well, I like the Android smartphone remote; but there is so much great work from so many people in 4.0. With all the infrastructural improvement we've discussed, I like to think of 4.0 as a new Free Software Office suite base-line. We've got so much improved now that we can continue to build on. Interoperability for example is much improved vs. 3.x in many areas particularly with the common Microsoft Office formats, we also significantly improved Visio import and added a Microsoft Publisher filter. In Calc we have improved conditional formatting, and performance wins in each filter. We've had Unity menu integration, and a fun 'personas' feature allowing some degree of personalisation to further improve the UI. 

Q: Have you enjoyed previous FOSDEM editions?

Yes ! FOSDEM is an incredible conference - and better an important meeting place for the best European Free Software developers. It is the one un-missable Free Software conference in the year for me - and it seems to get better each year.

I go to enjoy meeting old friends, making new ones, and talking until extremely late into the night / morning. It is hard to appreciating the richness and depth of the characters we work with via e-mail. Free Software is built out of people and one of the best places to meet them each year is FOSDEM. It's also a great place for people to get involved for the first time with Free Software, I'd love newbies to come and meet up with the teams I care about most: LibreOffice, openSUSE, GNOME, RepRap, whatever takes your fancy - please come, learn, and find your place to be most effective, as we change the world together. 
