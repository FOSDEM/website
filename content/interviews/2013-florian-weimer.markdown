---
year: 2013
person: Florian Weimer 
speaker: florian_weimer
topic: Trends in Open Source Security
event: trends_in_open_source_security
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I'm Florian Weimer.  I'm a mathematician by training, and I work on Red Hat's Product Security Team.  In my spare time, I volunteer for the Debian security team.

Q: What will your talk be about, exactly? Why this topic?

The unifying theme security at whole-distribution scale, and I am going to cover three aspects: vulnerability tracking, low-level (toolchain-based) hardening, and tool support for audits.  The reason for these choices is very subjective: I spend quite a lot of time thinking about them.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to identify areas where we can increase security in the medium term, and hopefully start a discussion about what other steps are practical.

Q: What are the biggest security challenges Linux distributions are facing now and how do you solve them? Were these challenges different in the past?

Every Linux distribution faces slightly different challenges.  For example, some provide security support for all packages in their distribution, others concentrate on a core set of packages.  The former tends to run into scalability issues, and with the latter, users might install packages without realizing that they are not covered by security support.

There is one theme that comes up regularly, and affects all distributions in the same way: upstream projects with a closed development model, that is, without a public version control repository showing individual changesets, and a public bug tracker. Without access to such sources, backporting security fixes can be difficult because it is difficult to separate them from unrelated changes which made for other reasons (and might even reduce stability).  Closed development of open source projects has been around forever, but over time, more and more projects have switched to an open model, which means that the remaining projects stand out and thus receive more attention.

Q: Do Linux distributions have to face different security challenges than proprietary operating systems?

Most upstream projects are shipped by multiple Linux distributions, and additional coordination is required when addressing a security vulnerability.  As a result, releasing a security fix is a bit more complicated, but on the flip side, we are well-prepared to handle vulnerabilities where coordination is absolutely required.       

Apart from that, I do not think there are fundamental differences arising from the software licensing model, as long as you actually ship code to users for them to run.  The differences we see mainly result from very different choices of base technology and deployment patterns.                                                        

In any case, the biggest challenge, finding and hiring the right people, is quite similar for everyone.

Q: How can the collaboration between Linux distributions and upstream projects be improved to reach better security?

I plan to cover some aspects in my talk.  One area where collaboration seems natural is sharing vulnerability metadata among distributions, but there are some technical obstacles.

Q: Have you enjoyed previous FOSDEM editions?

This will the first time that I attend FOSDEM.
