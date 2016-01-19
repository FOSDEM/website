---
year: 2016
speaker: lennart_poettering 
event: systemd
---

Q: Could you briefly introduce yourself?

I am Lennart Poettering, and I work on the [systemd](http://www.freedesktop.org/wiki/Software/systemd/) project. Before that I worked on [PulseAudio](http://www.freedesktop.org/wiki/Software/PulseAudio/) and [Avahi](http://www.avahi.org/). I am employed by Red Hat as part of the Server Experience group.

Q: What will your talk be about, exactly? Why this topic?

systemd is one of the core components of most of today's Linux distributions. In my presentation I'll be talking about what we worked on in 2015, and what we'll be working on in 2016. Please attend if you are interested in what's going to show up in your (systemd-based) Linux distribution of choice soon.

Some of the topics I'll cover are DNS/DNSSEC support in systemd, networking, containers and control groups.

Q: What do you hope to accomplish by giving this talk? What do you expect?

My intention is to keep the broader community updated on what's going on with one of the core components of their OS, and the reasoning behind it.

Q: With systemd almost 6 years old now, how do you look back at its evolution? Has it become what you planned it to be?

I like to believe that systemd is quite a success, after all it's now the default in pretty much all big distros. As most people are aware the way towards that was pretty nasty sometimes. To a certain level we expected this, but it ultimately was still pretty bad having to deal with it.

Of course, systemd covers more ground than we originally intended, but I am mostly pretty happy with where we stand now.

While for most of the evolution of the project we were the ones who still had to succeed, and win key people over, we can say we have succeeded now. This of course, is quite a change for us, as we now have to switch from a maybe more visionary, progressive mode into a mode that focusses on stability and maintainance. This will be our challenge for the next future.

Q: You started systemd as an improved init system, but over time the focus shifted to an implementation of a basic set of tools to build a Linux distribution. A naturally arising question is: where does this end? In other words, what do you consider the domain of systemd and which tasks are better left for distributions to implement?

That's a very good question. The are many factors which play into that, and lines are blurry. Basically, if something is a reasonably low-level userspace component, highly generically useful, required in most applications of the OS, would benefit from tighter integration in the OS layer, and has a clear future in tomorrow's technology, then it might be a job for systemd. What also plays a role is whether there's already a convincing implementation around, and last but not least whether we actually have the manpower to provide a solution we can be content with ourselves.

At the moment, I don't expect any bigger additions to systemd anytime soon, we might fill in a few smaller gaps however, or even split out some more auxiliary components we maintain.

Q: During our 2013 interview, Ubuntu was still holding onto Upstart, while in the mean time it switched to systemd, and even Debian has enabled systemd by default now. So now that systemd is an important part of all major Linux distributions, what are some of your plans to further unify the Linux landscape?

Well, that's a good question. I'd really like to see distributions to focus more on stateless systems, and standardize things there a bit better. i.e. schemes that allow boot-up with empty /etc or /var, where the necessary initializion of these directories is done automatically at boot (for example, automatic registration of system users at boot, so that /etc/passwd is properly populated). Some distributions have ad-hoc solutions to support this, and we'd like to unify behaviour a bit more.

Q: Which new features can we expect this year in systemd?

The DNS/DNSSEC support should be be completed. If all goes well, Linux can be one of the first OSes that enables an end-to-end validating DNSSEC DNS resolver by default.

Another expected feature is that networkd is likely to get a full bus API soon. Also, the next version of systemd will have support for Linux ambient capabilities.

If you want to know about more new features to come, please attend the talk!

Q: Have you enjoyed previous FOSDEM editions?

Absolutely! FOSDEM is a conference like no other, and it's the only conference I have been attending without exception since the first time I attended it, which must have been around 2008 or so. (And that even though I am actually not that much of a fan of Belgian beer, but very much prefer the Franconian or Czech varieties!)
