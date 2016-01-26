---
year: 2016
speaker: michael_meeks 
event: scaling_libreoffice_online
---

Q: Could you briefly introduce yourself? 

With pleasure. I'm Michael Meeks: Christian, Hacker, Husband, and more. I work for [Collabora](https://www.collabora.com/) on our mission: To make Open Source rock (well that's the gyst anyhow). At the moment, that means striving to make [LibreOffice](http://www.libreoffice.org/) better, helping out others who want to invest in improving it, and supporting / delighting our customers in suitable ways. In the past I've enjoyed spending big chunks of my time working with other great Free Software hackers from other companies and projects - mostly around [GNOME](https://www.gnome.org/) and [openSUSE](https://www.opensuse.org/).

Q: What will your talk be about, exactly? Why this topic?

LibreOffice, in particular our Online version and the design and challenges we faced implementing it as well as its wider usefulness. I know of lots of reluctant users of alternatives who are looking for a great, Free Software solution in this space with all of its privacy and flexibility benefits. Why this topic ? I think its one of the most exciting things happening in Free Software right now.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Clearly while Collabora (in partnership with [IceWarp](https://www.icewarp.com/)) has done a huge amount of work here, and built something rather lovely, we are eager to encourage others to contribute to the code as well. We've made an easy-to-consume [development edition Virtual Machine available](https://www.collaboraoffice.com/code/) so it is easy to download and play with. That is integrated with [ownCloud](https://owncloud.org/), but there are lots of other applications and integrations that are possible, into many popular systems. Many of the key developers on those projects are at FOSDEM. I'm eager to hear their feedback on what we're doing, and help to get them involved. We'll also have some quick update on LibreOffice generally for our 5.1 FOSDEM release.

Q: The idea of an online LibreOffice version is almost as old as LibreOffice itself. Could you tell us when the first steps were made and how it evolved?

For our inaugural Paris conference I created a nice demo prototype based on Alex Larsson's gtk-broadway. That helped me to understand the benefits and problems of a VNC-like approach. That lead to the current design, which provides much improved responsiveness for reading and zooming, though there is still plenty of scope for efficiency improvement in our WebSocket protocol.

So it is an old idea, but it has taken too long to get to here. The sticking point has always been getting commercial backing for the vision. Thanks to IceWarp and Collabora that was put in-place last year, although of course we build on a huge amount of work from others, including the Android port we did, funded by The Document Foundation's donors. IceWarp currently ship LibreOffice Online embedded into their products.

Q: A unique feature of LibreOffice Online is that the documents are rendered exactly the same on the web as in the desktop version. Was this the intention from the beginning? And what were the biggest challenges in implementing this?

That's right. Clearly it is easy enough to write a cut-down office-alike thing in JavaScript. However, given the wealth of extant complex documents, and the depth of functionality in a complete Office suite, this approach was not attractive. Instead by re-using a full LibreOffice we can provide very high fidelity rendering as a side-effect of the massive code re-use that backs this approach. Re-using as much code as possible is close to the magic bullet for software development and complexity, and that was a design principle from the very start.

In terms of challenges: we had already implemented a great tiled rendering client for the LibreOffice Android app that we could re-use. This started the work of separating overlays like selections, cursors, object handles and their interactions from the core document rendering. There is of course a huge amount of detail on top of that, and still some un-solved challenges around browsers and their APIs: copy & paste, printing and more that constrict what is possible. We're hoping the browser guys can work with us to improve there.

Q: How did Collabora address scaling and security challenges to make LibreOffice Online available to a large number of concurrent users?

This is clearly the challenge, and there will always be scope for more work here but a lot has been done. We have implemented an approach similar to that of kdeinit that allows us to do all of our linking, and in the future much of our initialization before we fork LibreOfficeKit rendering workers, which saves memory. We've spent time aggregating tile renders to avoid re-doing redundant work for multiple tiles, and also fixed and improved a number of sillies in our CPU-based pixel-bashing code, lots of things. One of the nice things about the code is that it is a pure linux-base, so we can take full advantage of Linux behaviour. Come and hear more in my talk.

Q: Will we see competitors to Office 365 based on LibreOffice Online soon?

We're looking forward to having an alternative offering out there as soon as possible. Of course that will be more than LibreOffice Online. We can't do this by ourselves, and have no interest in hosting, document management and more. So this is primarily an opportunity for partnering with other FLOSS and proprietary projects to deliver functionality. Clearly the online piece is complementary to our polished PC clients, and promising Mobile work.

Q: LibreOffice 5.1 is scheduled for release right after FOSDEM 2016. What are your favourite new features, both visible and under the hood?

This sort of question is of course a tough one: so many have contributed so much. You can check out what is in 5.1 in the [release notes](https://wiki.documentfoundation.org/ReleaseNotes/5.1).

Personally I've been working hard on OpenGL acceleration, which is something we try to make hard to see. But perhaps its possible to enjoy some of the new, (interoperable) 3D slide transitions we've implemented. Eike's (Red Hat) work to improve Calc's formula engine is extremely impressive and welcome for interoperatbility. As promised, there has been a lot of UI improvement work in the 5.0 series which is all over the application, with improved menus and toolbars. Remote file access is much improved, Markus has implemented a new chart editing side-bar. We can even import Keynote 6 files and also Microsoft Write (thanks to Sean Young). But really, our features and individual contributors are sufficiently diverse that it's well worth reading through the list.

Q: Have you enjoyed previous FOSDEM editions?

I'm a huge fan of FOSDEM, it is an extraordinary conference: the best annual meeting place for the leading European Free Software developers. It is the one un-missable Free Software conference for me - and it seems to get better each year.

Meeting old friends, making new ones, and talking until extremely late into the morning is most enjoyable. It is hard to appreciate the richness and depth of the characters of those we work with via E-mail and IRC. Free Software is built out of real people with depth and character and one of the best places to meet and appreciate them each year is FOSDEM. It's also a great place for people to learn about the importance of Free Software. I love to see newbies meeting and getting plugged into the teams I care about most. Please come, learn, and find your place to be most effective, as we change the world together. See you there.
