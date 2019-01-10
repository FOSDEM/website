---
year: 2019 
speaker: daniel_stenberg 
event: dns_over_http
---

Q: Could you briefly introduce yourself?

Hello! I'm Daniel. Possibly most known to some people as the founder and lead developer of the [curl](https://curl.haxx.se/) project. I've been working on and with internet protocols for well over twenty years - for fun and profit. I recently left my job at Mozilla where I worked on network programming on Firefox for five years. I'm also the maintainer of [c-ares](https://c-ares.haxx.se/), the DNS asynch library.

Q: What will your talk be about, exactly? Why this topic?

A short description would only say "DNS over HTTPS". I decided to propose this topic because it has been a much debated topic in my circles through-out the last year or so. It is a relatively new way to secure DNS resolves but it is also an approach that has caused people to react and object to its use.

I intend to present the technology, explain why I think it is needed and also address some of the concerns and how this is not the end of anything. We need secure name resolves to protect users.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope some people will better understand the purpose and reasoning behind the push for increased user security and privacy also for name resolves. I hope to help reduce some of the most common misconceptions around DNS-over-HTTPS and I want to further the discussion on DNS security and privacy.

Q: What's the history of the DNS over HTTPS protocol? What were the motivations to develop it?

DNS (in general) is one of the last fundamental pieces of our daily internet protocols that are still today in 2019 primarily sent in clear text and are still trusting the network in ways we know we shouldn't. DoH is one way to push the development further. For better security and privacy.

Q: DNS over HTTPS uses HTTPS and HTTP/2 to create a secure connection, while DNS over TLS uses TLS directly. It seems to me that the former is easier for end users, while the latter is easier for network administrators. What is your opinion on this? And what are some other consequences of both approaches?

These two concepts are indeed similar but with enough differences that are enough to motivate their separate needs. In my presentation I intend to explain some of the reasons why DNS over TLS (DoT) was not enough and why DoH was added to the huge pile of existing internet protocols.

Q: What are some downsides of DNS over HTTPS? And what threats does a malicious DoH provider pose?

It is hard to imagine a newly developed technology today, and in particular an internet technology, that doesn't also come with one or more downsides. Everything is a question of balancing the good vs the less good and of course we can think of and see some less ideal properties with DNS over HTTPS and perhaps in particular in the way it is or can be deployed on the Internet. Who are we protecting against what, what do we gain and what do we loose?

I'll get into details around this question as well, but a malicious DNS server is really bad no matter which protocol you use.

A more interesting question to me is how we can do safe and secure DNS resolves in the presense of malicious DNS servers, DHCP servers and eavesdroppers all around you...

Q: As part of the DNS over HTTPS support in Firefox, Mozilla has partnered with Cloudflare to use Cloudflare's DNS resolver in Firefox. Isn't moving DNS to a large central third party against Mozilla's vision of the decentralized web? Not only from the point of view of privacy, but also because this creates a single point of failure for Firefox users?

There's a lot to said about this and I hope to get to most of it in my presentation. But a quick summary could be that...

I don't work for Mozilla (anymore) and I certainly will not and have never spoken for Mozilla.

DNS over HTTPS is not Cloudflare. Cloudflare runs a DoH service but so do many others and it is in fact very easy to run your own. I think it would be better in general if we would pay more attention to who we send our name resolves to.

Centralizing services certainly doesn't help the web at large, but DoH didn't start nor particularly drive this development. Many users have gradually already switched to 8.8.8.8, 9.9.9.9 etc for DNS.

Mozilla has not shipped any Firefox release pointing users to Cloudflare by default to my knowledge.

... and before getting alarmed about what could *possibly* happen in a future using DoH, how do you protect your current DNS name resolves and prevent them from being manipulated with, snooped on or tracked by your current providers and network operators?

A lot of European friends say "GDPR" as an answer to a lot of those questions but I much rather rely on strong encryption than EU regulations that may or may not protect me down the line. Plus of course the fact that bad guys won't follow EU regulations.

Separate plug: I'll also participate in the DNS Privacy panel discussion in the DNS room on the Sunday where I'm sure parts of this will be brought up.

Q: What does a user have to do to enable DNS over HTTPS on his or her machines?

I'll show and discuss some simple ways in my presentation.

Q: Have you enjoyed previous FOSDEM editions?

This is going to become my 10th straight FOSDEM, my second talk in Janson (I talked about curl there in 2017) and in total my 8th presentation at FOSDEM. So far! 
