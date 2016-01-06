---
year: 2016
speaker: stef_walter 
event: cockpit
---

Q: Could you briefly introduce yourself?

Well let's see ... I'm an avid open source hacker, over the years contributing to about a hundred different projects. It's great that I can work on this stuff as my day job, previously at Collabora and now Red Hat.

Deep inside I hate how technology is so complex, broken and insecure. Making Linux usable is my way of fighting that trend.

I'm a skier, windsurfer and mountain biker ... and recently I drag my kids along on those adventures too.

Q: What will your talk be about, exactly? Why this topic?

[Cockpit](http://cockpit-project.org/) makes Linux servers discoverable and usable, and thus broadens the audience for Linux.

But if that was it, I wouldn't be so excited. Cockpit is actually an alternative Linux session ... along side X11, SSH and others. The logged in browser along with its code and apps can interact directly with the system as part of that session.

You can interact directly with APIs like DBus (and others) from JavaScript and that makes it easy and fast to build an interactive responsive UI for admin tasks.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Well the main goal is to find others who are as excited about this as I am. I want folks to experience a new way to drive Linux, as well as hack on an interactive Linux admin UI that's fun, easy and powerful.

Contributors are the heroes of open source. I love seeing a new contributor make their first contribution, whether fixing bugs, adding features, documentation, packaging or whatever.

Q: What are the main differences between Cockpit and other Linux web-based system administration panels such as cPanel or Ubuntu's Landscape?

Cockpit is meant to be the face of your Linux machine. Admins should feel they are logged into and interacting with the underlying Linux instance, not interacting with Cockpit. If you look at Fedora Server, which has Cockpit out of the box, you'll notice it doesn't even say "Cockpit".

It starts a real user session, and includes the browser tab in that session. Cockpit has identical access to the system as the logged in user. Cockpit reacts instantly to the state of the server.

Cockpit is not a configuration management system. It's a pure interactive UI, which drives the server directly; a different use case than things like Satellite, Landscape or Foreman.

The idea is that you're not locked into using Cockpit. It works well alongside command line access, scripts, and configuration systems. It's zero footprint, starts on demand, exits when not in use, and is tiny on disk.

We've really worked hard to remove all the excuses for having it in the default install of a Linux server distro.

Q: What's the history of the Cockpit project? Why was it started and how did it evolve?

A limited Cockpit prototype was incubated at Red Hat. Once I understood how it worked, how the browser was interacting directly with DBus, I was hooked and started contributing to it.

Together with Marius, Andreas, and others we fixed it up and released the prototype as Cockpit version 0.1. Early on we had some [solid goals](http://stef.thewalter.net/ideals-of-cockpit.html) on what we wanted Cockpit to be.

Over time we made the architecture a reality, while implementing features at the same time. I remember being amazed at how easy it was to put the parts of the UI together when the APIs (like systemd's DBus API) on the system were right.

We've had to contribute to tons of the lower level system fixing bugs, adding missing parts. But that just makes Linux better for everyone, UI or not.

Looking back it seems insane how much testing we've done. But Cockpit touches so many parts of the system, and the project would just collapse without testing. On busy days our CI systems start up around ten thousand virtual machines booting various distros, testing out contributions, commits or releases.

Q: How can interested people contribute to Cockpit? In which domains could you use some help?

There are many ways to contribute, whether you want to code, package or translate. Cockpit releases weekly into bleeding edge distros. You'll see your contribution out there right away.

Some ideas:

 * Prototype a feature as a plugin, it's fun and easy.
 * There's a list of starter issues for people to contribute to.
 * Embed Cockpit for interactive tasks in another web UI.
 * Package Cockpit for a distro, add branding for a distro.
 * Translate Cockpit and mark up translatable strings.

You can find some helpful [links for getting started here](https://github.com/cockpit-project/cockpit/wiki/Hackfest).

Q: Which new features can we expect this year in Cockpit?

Well you can now use SSH keys to access Cockpit, and accessing multiple machines has become really simple and powerful. This will get even better.

I'd like to see a big focus on troubleshooting. Cockpit does interactive configuration pretty well, but part of making a Linux server discoverable is quickly identifying what's gone bump in the night. I think an SELinux troubleshooting feature will land first in that area.

Cockpit on Debian is another one. Debian packages are into our testing and release process, but we want to see the releases flow into Debian repos. We're on the lookout for a Debian maintainer to join us.

There'll obviously be more container work too. Further work on running Cockpit as a container, and also more container and image user interfaces.

... and obviously lots more than would fit here.

Q: Have you enjoyed previous FOSDEM editions?

My first FOSDEM was in 2011. It was amazing and crazy at the same time. I had never seen so many hackers together at once. Glad to be here again.
