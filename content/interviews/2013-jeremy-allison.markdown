---
year: 2013
person: Jeremy Allison 
speaker: jeremy_allison
topic: Samba4 
event: samba4
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I'm Jeremy Allison, co-creator of the [Samba](http://www.samba.org/) network file, print and authentication server. I work for Google in their Open Source Programs Office. Google fund my work on Samba for the benefit of the Free Software Community.

Q: What will your talk be about, exactly? Why this topic?

The talk is about the Samba 4.0 release. I'm planning to explain what is new and exciting about this release, why it's so significant, and what we're planning to do in the future. Sort of a "state of the project" talk really.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'm hoping to introduce the new features and improvements in the 4.0 release to a wider audience, and try and get people to consider moving their products to this release, and to kick start some new ideas for product that people might be able to build on top of the new code.

Q: What are the key improvements in Samba 4 compared to Samba 3.6?

The 4.0 release contains a functional Active Directory Domain Controller. This contains many new components. Also the SMB server has been revised and updated to SMB2.1 and 3.0 support, with support for some of the new SMB handle types.

Q: We have been waiting for Samba 4 for long, what were the most important hurdles?

The original Samba-4 codebase was essentially a complete rewrite, but suffered a little from second-implementation issues. It created many new technologies which were subsequently adopted by the Samba-3.x code stream which continued active development by the many OEM users who needed a stable production-ready SMB fileserver.

The biggest issue was merging these two code streams back into one project, with everyone working together. That took a while but we now no longer have Samba-3, or Samba-4, but one Samba codebase which happens to be at release level 4.0.1.

Q: With many companies now 'moving to the cloud', is Samba still relevant?

That's a really interesting question, and one on which I flip-flop about regularly. With the rise of tablet, phone and mobile devices which by default connect with web technologies, then sometimes I feel Samba is less relevant.

Then I try and stream a 1080p movie using DLNA and I remember why people have NAS servers running SMB1/2/3 and CIFS locally :-). Also SMB1/2/3 and CIFS are essential in a business environment, and will remain so until everyone is running Linux everywhere :-).

Q: How has the relationship between the Samba Team and Microsoft evolved?

It's complicated :-). One thing that has always worked well is engineering contacts. Marketing and legal have sometimes been less cordial, but the fact that Microsoft was willing to give us an official quote to promote the release of Samba 4.0 was an incredibly positive change. I still have hopes Microsoft will eventually ship Samba in one of their products someday :-).

Q: How many developers are working on Samba?

Around 10 to 15.

Q: Which new features can we expect in 2013?

Rapid movements to SMB2.x and 3.0, including the new handle types, leases and allowing us to work with the Microsoft client clustering technology.

Q: Have you enjoyed previous FOSDEM editions?

Love them. I don't get to visit often, but always have fun!
