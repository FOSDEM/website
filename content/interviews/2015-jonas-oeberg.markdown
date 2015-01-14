---
year: 2015
person: Jonas Öberg 
speaker: jonas_oberg 
topic: "Automating Attribution: Giving credit where credit is due"
event: automating_attribution 
---

Q: Could you briefly introduce yourself? 

On my 22nd birthday in 1999, I received a phone call from Richard
Stallman to tell me the root password of the GNU project web server.
I'd been a free software volunteer for some time before this, and
continue to be to this day. In 2001, I co-founded the [Free Software
Foundation Europe](https://fsfe.org/) and served as its vice president for many years.
I've organised conferences ([FSCONS](https://fscons.org)) and worked as regional coordinator
for [Creative Commons](http://creativecommons.org/) in Europe and Central Asia. I'm a [Shuttleworth
Foundation](https://www.shuttleworthfoundation.org/) Fellow and as part of my work for the Foundation, I
launched [Commons Machinery](http://commonsmachinery.se/) to focus on metadata for creative works.

When I want to avoid technology, I like to say that I'm renovating a
house in northern Sweden. That's only partly true today; we've always
had Internet (ADSL and mobile) at that house, but we leveled up this
past summer with an installed fiber connection. We can now get gigabit
network at the summer house, and just 28 Mbit ADSL where I otherwise
live outside of Stockholm. So much for avoiding technology during
vacation!

Q: What will your talk be about, exactly? Why this topic? 

When I worked with Creative Commons, I saw at first hand the practical
problems people have attributing works accurately. Sure, one or two
images may be fine, but when you're juggling even tens of images in a
presentation, it's easy to lose track of what came from where.
Thinking about this more, I realised that not attributing accurately
is even more troublesome than just violating a CC license: it makes
images lose the context in which they originally appeared, and when we
can't see where an image comes from, or who authored it, it loses some
of its meaning, and it becomes less valuable to us.

I've come to consider attribution to be even more important than
copyright, and I believe that if we can develop the tools that we need
to attribute easily and fairly, we don't actually need copyright, and
we wouldn't need licenses. My talk is, by extension, of a post open
licensing society, but building towards that, I will talk about the
technology we've developed from Commons Machinery to figure out what
we can and cannot do automatically, and introduce a range of
libraries and tools (all on GitHub) that has come out of this work,
including (which I'm most excited about) our algorithms for comparing
images and searching a database for *similar* (not identical) hash
values.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Just two months prior to FOSDEM, we released the first useful tool to
come out of Commons Machinery: [Elog.io](http://elog.io), our catalog of digital images
and corresponding browser plugins to look up information in that
catalog. With this, we've come to a natural conclusion of the first
part of our journey and shown that what we imagined works in practice.
We're preparing ourselves to take the next steps, which involve
scaling our technology to include more images, but also turning the
catalog into a read/write storage and making it into a community
curated metadata storage.

This will be an exciting challenge, so I'm hoping that my talk at
FOSDEM will bring some valuable feedback to us in terms of our current
thoughts and directions. Is what we're doing useful? Are we going about
it in the right way? Do the challenges have other solutions which we
haven't thought of?

This talk will also be the first time we present the standalone
libraries that have come out of our project so far, so I hope that
raising awareness of them during my talk will also encourage
additional use of them.

Q: What's the history of the Commons Machinery project? Why was it started and how did it evolve? Has it become what you planned it to be? 

When I started Commons Machinery in 2013, I did so with the explicit
aim of using embedded metadata as a way to solve all the world's
problems. Since then, I've come to realise quite a lot about metadata,
including that embedding it never really works as you would expect.
From the [Embedded Metadata Manifesto](http://www.embeddedmetadata.org/) (a project by the International
Press and Telecommunications Council) we've learned that most social
media sites today strip metadata when images gets passed through their
networks. In our own work, we also discovered that the same is true
for a lot of the applications we use daily. Support for metadata is
really missing.

So Commons Machinery became an experimental factory where we, thanks
to the support from the Shuttleworth Foundation, could spend a year
and a half feeling our way forward and develop a number of throw-away
prototypes in the process. We're now coming to an end of their
support, so we've had to wrap up a lot of the activities we were
doing, and while it would be fun to keep experimenting, we believe we
have a good understanding now of what needs to be done. Now it's just
about doing it.

Q: The Elog.io browser plugin is an interesting tool to view licensing information of images on websites you visit. Do you plan to add other sources than Wikimedia Commons to the Elog.io catalog? 

We will definitely add more sources. During 2015, we're looking at
including images from [Europeana](http://www.europeana.eu/), [Safe Creative](http://www.safecreative.org/), and [Flickr](https://www.flickr.com/). We have
discussions with all of them, so I'm convinced we'll be able to add
parts from their collections. This will result in an Elog.io which is able to match more and more images that you find online, and more and more accurately.

One of the challenges there is to add these sources
quickly enough! When we did our initial harvesting of information from
Wikimedia Commons, we did so at a rate of ca 2 million images per day
(23 per second!), and even if we manage to keep up the same rate when
harvesting Flickr, it'd take us more than five months to work through
the 305 million images with a CC license.

Q: Which other new features can we expect this year in the Commons Machinery's software? 

A stretch goal for
2015 is if we can flip the read/write switch already now, but that
would likely not be until later this year if it happens in 2015 at
all.

Q: How can interested people help? 

We need code, ideas and networking. For some of the libraries we've
developed, there are some ideas on how to improve them further. For
instance, over the holidays, we got a proposal for an adaptation of
our image hashing code that would theoretically generate more unique
hashes with higher resolution. This would be excellent, but we haven't
gotten around to testing it yet, and we would need someone to branch
the code and implement the alternative algorithm and setup some tests
against our sample images. The same is true for a lot of other
libraries and utilities we have too.

And, just as with the idea on how to improve our hashing code, we
always need people who can look at what we've done and give ideas for
how they can be improved further. It doesn't need to be something you
can implement yourself; just providing your ideas for improvements is
a valuable contribution in itself. When FOSDEM rolls around the
corner, we'll also be just days away from launching a crowdfunding
campaign to ensure that we have some funding to hire people in the
coming year too. Help is always needed in spreading awareness of that
campaign, and our of work in general.

A special shout out to those who are working in organisations where
they have collections of images openly licensed or in the public
domain: we'd love to be able to include those images in the Elog.io
database too, so we'd appreciate hearing from you.

Q: Have you enjoyed previous FOSDEM editions? 

The thing I enjoy about FOSDEM is that even if I hadn't enjoyed it (I
did), I would still go. Because it's FOSDEM. You go to FOSDEM. It's as
simple as that.
But truly, FOSDEM is always a great experience. I enjoy going there
every year, and I hope to have the chance of continuing to go there
every year, even if in a few years, it'll need to be with my son
accompanying!
