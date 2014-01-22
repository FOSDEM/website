---
year: 2014
person: Timo Sirainen 
speaker: timo_sirainen 
topic: "Dovecot's way of scaling to millions of users"
event: dovecots_way_of_scaling_to_millions_of_users 
---

Q: Could you briefly introduce yourself?

I'm Timo Sirainen, the main author of the [Dovecot](http://www.dovecot.org/) IMAP server. Earlier in my life I also wrote most of the [Irssi](http://www.irssi.org/) IRC client, which is still surprisingly widely used.

Q: What will your talk be about, exactly? Why this topic?

The talk will be about how Dovecot was designed to be scalable to installations with tens of millions of users. This was pretty much the only developer-related topic I thought of that would be interesting and I could talk about for an hour :)

Q: What do you hope to accomplish by giving this talk? What do you expect? 

It would be interesting to hear if the audience will have some comments or ideas for further improvements. Maybe my talk will inspire some new developers to write some new awesome scalable software. Perhaps some will even be interested in choosing Dovecot as the platform to do it, since it's easily possible to add completely new servers as external projects on top of the Dovecot core.

Q: What are the key architectural decisions you made to make it possible to run Dovecot in installations varying from one user to tens of millions of users? 

My initial design only thought about single server installations. Later on I started wondering about how to make it work well in clusters. Eventually the main thing I figured out was that, at least for Dovecot, the best choice is to simply (automatically and temporarily) assign users to specific servers and proxy the connections when necessary. Usually there is very little, if any, global state between users, so this brings the best performance with the least amount of trouble.

Q: What are the most important challenges you face when you want to support millions of users on a Dovecot server? 

In typical large installations there aren't all that many problems that are different from smaller clustered installations. There are simply more servers to handle the traffic. Some installations want to do more complex things that require more global states and then things could get somewhat more complex as a single writable SQL server won't be fast enough.

Q: What is the biggest Dovecot installation you know of (in terms of the number of users)? 

That's Deutsche Telekom with 26 million users.

Q: Which new Dovecot features are you working on currently? 

Currently I've been annoyingly busy with many non-coding tasks, and also some customer-specific coding tasks. There are some interesting features planned for the near future though:

 * The ability to save/restore IMAP connection state. This would allow getting rid of most of the long running memory-hungry idling IMAP processes by keeping the connections in a small number of IMAP-idle processes where they wait for something to happen. This also allows moving IMAP connections between servers. This could also improve performance of some webmail systems by having the webmail server remember the state as a string and then be able to quickly restore it with another IMAP command.

 * An easy way to handle shared mailboxes in clusters.

 * A lot of reliability improvements to Dovecot. Adding more unit tests and some larger testing. Adding checksums to index files to catch corruption easier.

 * An HTTP server/proxy, which could be used to easily implement many new HTTP-based protocols, like perhaps in the future WebDAV/CalDAV/CardDAV or even simply just a regular HTTP server. Initially it will be used to provide a REST API for the doveadm protocol. We also have some thoughts about an HTTP-based email access protocol.

Q: You recently wrote on your blog about the idea to develop a [Dovecot MTA](http://blog.dovecot.org/2013/11/dovecot-mta.html). Could you summarise your main reasons to do this? And where would this MTA make a difference? 

It started with the thought of Dovecot providing an SMTP submission server, since that can be useful for various things, especially when implementing the LEMONADE SMTP extensions. Later on I started thinking that it wouldn't actually be that much extra work to implement the rest of the SMTP server either, assuming it was implemented in a way that allows the administrator to mainly code how it needs to work instead of implementing a ton of specific configuration options. There are a few reasons why I thought it could be worth the trouble to implement it:

 * Postfix and Exim need to be backwards compatible with existing installations. It would be difficult for them to change the default configuration/behavior. I'd instead want Dovecot MTA to enforce using all the important new SMTP security features like TLS, DANE, DKIM and perhaps others. These are of course possible to set up with the existing MTAs, but every single new admin will need to read a lot of documentation to figure out how to enable them. So most admins won't since the system works fine without them as well. Dovecot MTA would make configuring them easy and maybe even refuse to run unless they're working correctly.

 * Some of my company's larger customers require quite a complicated MTA configuration. There are already some commercial MTAs using a scripting language for their configuration. It would be good to have one such open source server as well.

 * Also owning the full code base would make it easier to keep adding the features that we (or our customers) need, rather than trying to convince the upstream MTA developers to accept them (or to keep our own fork updated). Especially because several of our plans would require major changes to the existing MTAs. I also think Dovecot's libraries will make it much easier to implement such features and I doubt any existing MTA developer would be happy to have dependencies to Dovecot libraries in their project.

Q: Have you enjoyed previous FOSDEM editions? 

Yes, I've been to FOSDEM twice earlier and they've been interesting!
