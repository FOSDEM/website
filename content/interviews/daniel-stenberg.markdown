---
year: 2020
speaker: daniel_stenberg 
event: http3
---

Q: Could you briefly introduce yourself?

Hello! I'm [Daniel Stenberg](https://daniel.haxx.se), a Swedish open source developer perhaps primarily known as the founder and lead developer of [curl](https://curl.haxx.se). I work for [wolfSSL](https://wolfssl.com). I've worked on client-side HTTP implementations for over twenty years and I've also been involved in the IETF side of these things for almost a dozen years by now. I sometimes refer to myself as "an Internet protocol geek". I enjoy toying with them for fun and profit.

Q: What will your talk be about, exactly? Why this topic?

My talk is named "HTTP/3 for everyone" and will be an introduction to and explanation of the new version of HTTP that is in the works --- and what the current status of it and the existing implemenations are.

HTTP is such a prevalent protocol these days and is used by such a vast amount of users in far more situations than just browsers, that changes to this key protocol of our everyday networks is going be of interest to many.

HTTP/3 in particular will also change the Internet infrastructure going forward since this is the first protocol done that is based on the new transport protocol called QUIC. I will of course explain the significance of that and why it matters in my talk.

If you wish to read up and study the subject deeper before my talk, try the current draft specs at [quicwg.org](https://quicwg.org/) or read my free online document called [HTTP/3 explained](https://daniel.haxx.se/http3-explained/).

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want more users and people to be aware of the coming changes. Things are changing once again in the HTTP land and therefore on the web. FOSDEM attendees are often on the technological forefront and this is it.

I've done several talks in the past at FOSDEM on various HTTP protocol developments and they've always been well attended. This has proven to me that there's a general interest. I actually talked about HTTP/3 already at FOSDEM 2019 in the Mozilla devroom but there were literally hundreds of people who didn't manage to get a seat then so I hope I can reach a little wider this time!

Q: HTTP is almost 30 years old, but didn't change for almost two decades between HTTP 1.1 and HTTP/2. And only a few years later HTTP/3 is an even bigger revision. Why didn't the foundational protocol for the web change for so long and why are these revisions needed now?

That's a rather big question but I think the HTTP development progressed like this due to several different but cooperating reasons.

One part of the explanation is that there was no real "HTTP group" remaining in the IETF after HTTP/1.1 shipped until 2007 when 'httpbis' was created and was tasked to refresh the HTTP/1.1 spec --- a really daunting work that had piled up a serious backlog of issues. That work took seven years and resulted in the RFC 7230 series that shipped in 2014. While that work was ongoing, HTTP stack authors and experts joined the team and created a really skilled and focused HTTP work group.

The growth and development of the web continued of course in the mean time with an ever increasing amount of objects per page and people created more and more work-arounds for various short-comings in HTTP/1, mostly in order to reduce latency and "trick" browsers into using more concurrent connections per site. This trend escalated post 2010 and contributed to the HTTPbis working group to decide in 2012 that a HTTP revision could be wise, at around the same time as Google experiemtented with and proved SPDY to be an interesting foundation to build upon.

When the HTTP/2 spec shipped in 2015, it was with the full knowledge and awareness that the next protocol version would probably happen much sooner than it had taken for version 2 to follow version 1. It laid the foundation for doing protocol revisions faster in the future, and we see some of the fruits of that now when HTTP/3 is already targeted to ship soon.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS, or how did you in particular benefit from FOSDEM?

I think FOSDEM serves as an important hub for European FOSS developers and projects. It certainly does so for me personally and many of my friends. FOSDEM is the primary annual cross-project meetup where we get to learn where FOSS is right now and where we're going next. For me, FOSDEM is primarily a social event where I meet up with friends from all over Europe and sometimes even the outside world, in ways that no other event does for me, while at the same time it features some of the most technical and in-depth presentations you can find.

Q: Have you enjoyed previous FOSDEM editions?

Very much so!

This will become my 11th FOSDEM, and incidently this my HTTP/3 presentation will also become my 11th presentation held at FOSDEM. The third one I do on the main track in Janson.
