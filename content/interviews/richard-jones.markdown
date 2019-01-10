---
year: 2019 
speaker: richard_jones 
event: nbdkit
---

Q: Could you briefly introduce yourself?

I've been working at Red Hat for 12 years, on a whole variety of
different things, all relating to free and open source software.  Most
recently I've been concentrating on virtualization and how we inspect
and modify the disk images used by virtual machines.  I've written a
whole load of tools for this, such as [guestfish](http://libguestfs.org/guestfish.1.html), [virt-builder](http://libguestfs.org/virt-builder.1.html) and
[nbdkit](https://github.com/libguestfs/nbdkit).

Before I started at Red Hat I was involved in three start-ups,
respectively in: high-performance networking; schools & online
communities; and online marketing.

Q: What will your talk be about, exactly? Why this topic?

I think it's a very innovative take on a topic that most people will
already be familiar with.

Loop mounting in Linux is something that people often do, but it's
very inflexible: OK, so you can loop mount a disk file.  But what
about if you downloaded the disk file and it was compressed?  This is
very common -- look at how all the Linux distributions share their
cloud images these days as `*.raw.xz` files.  But loop mounting
completely fails to handle this simple case!

Using NBD for your loop mounting, particularly with our flexible
plugin-based server called nbdkit, takes boring old loop mounting to
the next level.  Mount a compressed disk image?  No problem!  Mount a
weird format like VMDK?  Sure, we've got a plugin for that.  Loop
mount a RAM disk?  Yup!

How about writing a Linux block device driver -- as a live programming
demo in front of an audience of hundreds -- in shell script?  Come to
the talk and watch me do it.

I aim to live demo all of these things from my laptop, so that gives a
fun sense of danger to the talk.

Q: What do you hope to accomplish by giving this talk? What do you expect?

While I hope to give a fun, interesting and visual talk, I also expect
that most of the people in the audience will be able to take away a
new skill that they'll be able to apply directly to their life using
or working with Linux.

Q: What's the history of the nbdkit project? What was the motivation to start it?

nbdkit was started in 2013 as a "Trojan horse".  Let me explain...

Although we have well-established formats for disk images, things like
raw and qcow2, and we have well-established tooling like qemu-img and
guestfish, we didn't have a way to "wire up" different components.

What we needed was a network protocol that lets you stream data between
these formats and components.  Rather than inventing something new, we
chose Network Block Device (NBD), which is a very old protocol (from
1996), and one which was getting a new lease of life after development
was restarted, and after a second generation of the protocol was
implemented which fixed a lot of the problems with the original
design.

Using NBD you can stream data between formats and programs.  For
example qemu can serve a snapshot of a running VM over NBD and you can
stream the snapshot into a backup:

```
$ qemu-img convert nbd:localhost:10809 backup.qcow2
```

But back to nbdkit...  We needed a way to get data out of proprietary
data sources, particularly VMware servers.  But we couldn't use the
existing qemu-based tools for this because the VMware library you have
to use has a really poisonous license that is incompatible with GPL.
I put together a small BSD-licensed server using a plugin system,
allowing us to link the server to VMware code, and with a plugin ABI
guarantee so you can distribute proprietary plugins separately.

So the original aim behind nbdkit was to be a Trojan horse to get into
proprietary systems and liberate their data, making it available to
free world tools.

Thanks to the plugin architecture it's evolved into something far
beyond what we originally intended.

Q: What's the main target audience for nbdkit? Developers, testers, even end users?

All three of those groups.

Q: What's the most impressive accomplishment you have seen using the nbdkit server?

One of the things I'm going to show in the talk is how you can use 5
nbdkit servers running side by side to simulate a RAID array.  Then
alongside those there are some graphical tools which can visualize
what's actually happening inside the disks -- you can literally see
the kernel reading and writing the disk in real time.  And then you
can ask nbdkit to inject errors into disks and you can watch as the
kernel rebuilds parts of the RAID array.  I think it's a pretty great
demo, assuming my laptop works.

Q: What does nbdkit's community look like? How can interested developers contribute? In which domains could you use some help?

In fact nbdkit is not a large program at all.  Just counting the
server and the plugins that we ship in the source tree, it's only
about 30,000 lines of code (and just the server: under 7,000 lines).
We have two core developers, and a lot of other irregular
contributors.  Anyone who can program in C can contribute to the core
server.  To write plugins, you only need to know a scripting language,
like Perl or Python, or even shell script.

Since we expect that people will start to expose nbdkit servers to the
wide open Internet (as part of hosting public PXE services), I've been
taking a long look at security, but we could always use fresh eyes in
this area.

Q: Which new features can we expect this year in nbdkit?

Development really exploded in 2018.  If you'd asked me in January
2018 what I expected, I wouldn't have expected very much.  I might
even have said that nbdkit was in maintenance mode.  But that's not
how it turned out in 2018.  We had 4 major stable releases, an entire
new concept called "filters" that you can place in front of plugins,
12 new filters, and I don't even know how many plugins -- probably
something like 10 new plugins.  Oh, and TLS support, plus a completely
new version of TLS authentication which was added to the NBD standard.

Then there were all sorts of unexpected side projects -- someone was
disappointed that nbdkit couldn't handle their use case which was
filling a 10 Gbps network connection from 1000s of clients while using
under 100 MB of RAM.  So they rewrote quite a lot of the internals
using callbacks (instead of a thread per client), and actually managed
this incredible feat.  Unfortunately the changes were so deep and
broke the plugin ABI so we couldn't integrate them back upstream.
It's free software and liberally licensed, so you can never anticipate
how people will flex the code in new ways, and that's of course one of
the great things about FOSS.

So I don't know if I can make good predictions for 2019.  I'll just be
happy if the FOSDEM talk goes to plan, and it brings in lots of new,
happy users.

Q: Have you enjoyed previous FOSDEM editions?

Yes, I've been to FOSDEM - not every year - since I think 2011.
It just gets bigger and better.
