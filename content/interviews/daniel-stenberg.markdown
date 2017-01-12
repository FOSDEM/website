---
year: 2017
speaker: daniel_stenberg 
event: curl
---

Q: Could you briefly introduce yourself?

I'm [Daniel Stenberg](https://daniel.haxx.se/), a Swedish free software and open source hacker since well over two decades now. I am the founder and lead developer of the curl project. I am employed by Mozilla and work in the Firefox networking team. I also try to participate in the relevant HTTP oriented working groups in the IETF, so I get the pleasure of working with internet protocols on my spare time as well as my work time! Oh, and I contribute to a bunch of other projects too of course, but who doesn't?

Q: What will your talk be about, exactly? Why this topic?

I'm going to talk about [curl](https://curl.haxx.se/) and how widely used it has become, how that it was made possible and what consequences that fact has brought me personally but also how it affects the project. And how code from this little project is used in devices owned by every single person in the audience that will watch me doing this talk. A success story of enormous proportions really.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to help people realize that even a small and independent project can reach really far in this modern world of open source everywhere. But also what we as a small project do to make our users feel safe and confident in what we ship. And tell some fun stories along the way from what we've been through.

Q: What's the history of the curl project? Why did you start it and how did it evolve? Has it become what you planned it to be?

curl started out as a very tiny command line tool for doing very simple http requests and originally it was just me wanting to scratch my own itch. I wanted a little tool to download currency rates daily for a project of mine...

I never had any grand visions or goals for the project, it has just gradually been improved over time ever since its inception in the late 90s. It is still being developed intensely almost 20 years in. So yes, it did what I planned for it but it has then moved on and done and achieved so much more than I ever planned or thought it would do or become.

When I started curl, it wasn't even a library and it has really been libcurl that has been adopted everywhere.

Q: You have been working on the curl project for 19 years, 20 if you also count the time when it was still called HttpGet and urlget. How has your development model changed in those two decades?

The curl project, while having "conquered the world" to some extent, has not become a "big" project by any measures, so the development model and the way of making decisions have not changed drastically over the years. Sure, we have a lot more contributors these days, so a larger amount of my time and the time of some of the other core team members is now spent on reviewing others' code and providing feedback to fellow hackers rather than to write code of our own.

We run the project as a classic old-style small open source one. Mailing lists, discussions, suggestions, and whoever brings the code gets a lot to say.

Q: What are some unexpected places where curl is used?

The birth and the development of the curl project is pretty much aligned with the general evolution of the Internet and connecting devices to the Internet. As more things do Internet transfers, curl has found its way into such devices and use cases. I'd say that interesting areas where I never anticipated curl to grow big in but where we've seen it used several times is for example within [malware](https://daniel.haxx.se/blog/2015/11/16/the-most-popular-curl-download-by-a-malware/) and who would have expected 20 years ago that an Internet transfer client program would become really big in cars? I didn't.

I never expected curl to become the test tool of the Internet that it is now, and how it is used by people everywhere to test servers and exercise protocol implementations. Being a leader in protocol development is now a motivator in itself (to me) as with a protocol tool being on the bleeding edge of protocols, it helps the rest of the entire Internet infrastructure to grow and develop.

Q: What does the project's community look like? How can interested people contribute? In which domains could the project need some help?

We do most discussions, planning and debating on the curl-library mailing list. We use github's issue tracker and pull-requests. We don't have a lot of rules and procedures so whatever you'd like to do, you basically show up and ask. Or read the TODO or KNOWN_BUGS documents to see what existing ideas or flaws we have that could be worked on to improve the project further. We're a friendly and approachable bunch of people without any high bars for participation!

We do releases every 8 weeks and we typically have contributions from 30-40 different persons in every release - totalling at almost 1,500 named contributors through the entire project history.

Brand new in 2017, just before curl turns 19 years old, is also that we will run a physical real-world developers meeting and gather curl and libcurl developers and users at the same in a room [for two days](https://github.com/curl/curl/wiki/curl-meeting-2017)! We've never done that before and it is going to be exciting!

Q: Which new features can we expect this year in curl?

It ultimately really depends on what people are going to spend time and energy on. We're a very small project with basically not many more than a handful of regulars.

We can certainly expect there to be numerous bug fixes coming. We can expect our [TLS 1.3 support](https://daniel.haxx.se/blog/2016/11/12/curl-and-tls-1-3/) to become more polished and functional with more TLS libraries as they start to support this new protocol version. I hope we'll see the first attempts and steps to add [QUIC support](https://daniel.haxx.se/blog/2016/07/20/curl-wants-to-quic/). (I'll get into some QUIC details in my second FOSDEM talk ["So that was HTTP/2, what’s next?"](https://fosdem.org/2017/schedule/event/mozilla_http2_whats_next/))

Many features we add to curl we don't plan a year ahead so I'm convinced that when looking back at 2017 a year from now, some of those new things we added during the year are things we haven't even thought about right now!

Q: Have you enjoyed previous FOSDEM editions?

FOSDEM is one of the great conferences every year that I make a real effort not to miss. This is going to be my 8th FOSDEM in a row, and I think the 5th on which I'll talk. I've previously presented in the Embedded room, the security room and the Mozilla room. 2017 will be my first time appearing on the main track and I'm looking forward to it!
