---
year: 2018
speaker: milan_broz
event: cryptsetup
---

Q: Could you briefly introduce yourself?

I am a maintainer of the [cryptsetup/LUKS](https://gitlab.com/cryptsetup/cryptsetup) project, a software engineer at Red Hat and Ph.D. candidate at the Faculty of Informatics, Masaryk University in Brno. All these roles are connected by the effort to try to make encrypted storage more secure and, hopefully, more usable.

Q: What will your talk be about, exactly? Why this topic?

My topic covers data integrity protection as a new feature in the cryptsetup project. By that, I mean data integrity protected devices and authenticated encryption for dm-crypt full disk encryption.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I think that integrity protection of data is an important topic for the storage world and many people think that it is already solved.

While it is maybe true for proprietary enterprise storage systems, for COTS (Commercial Off-The-Shelf) devices, we are often limited by integrity protection on higher layers like a filesystem. And this is something that could be solved better, at least in Linux.

And it is even worse for the integrity protection in combination with disk encryption. The common view of the problem is that disk encryption can provide only confidentiality protection and ignores data integrity protection because there is no space for any integrity protection metadata (in other words a plaintext device has the same size as the encrypted one).

There are some exceptions (like GELI in FreeBSD), but in Linux, we did not have authenticated encryption on the block layer.

Unfortunately, there are not even many filesystems that focus on authenticated encryption and provide cryptographic data integrity protection. 

I would like to explain why we should care more about data integrity protection in the future. The implementation with dm-integrity, dm-crypt and cryptsetup tools is just our attempt to show that it is possible in reality.

Also, the idea of easy deployment of new concepts in disk encryption, like authenticated encryption or memory-hard key derivation functions, led to the new LUKS2 metadata on-disk format that I would like to mention as well.

Q: What's the history of the dm-integrity project? When did you start it and why?

LUKS and dm-crypt have become widely used in the Linux world. And I had been waiting for a stable filesystem in Linux with implemented authenticated encryption for years. Because nothing usable appeared, we decided to try to implement something ourselves on the block layer. It has many trade-offs, but it is here now. If it just motivates people to provide something better in upper layers, I would be more than happy.

It started as part of my Ph.D. research when we discussed an idea of block-layer authenticated encryption that is algorithm-agnostic and ready for the new, state-of-the-art algorithms (like those from the [CAESAR](https://competitions.cr.yp.to/caesar.html) cryptographic competition).

I did not want to write another academic paper and code that is often just printed and forgotten. So we discussed options and implemented a modular system that consists of dm-integrity (that in fact emulates per-sector metadata field for the block layer), authenticated encryption for dm-crypt and LUKS2 format, that can be easily adapted to new features without breaking on-disk format. Starting with the idea in early 2015 we have now basic blocks in the mainline kernel and userspace. But it is just the beginning of a long way forward. Whether it is going to be successful depends on our users.

Q: Is it easy for end users to have authenticated encryption for their devices using dm-integrity and dm-crypt?

In principle, it should be the same as using a normal LUKS device. Internally it is more complicated, but for a user, it just means formatting and then unlocking the device the same way he is used today.

But some situations are new. For example, the whole concept of data integrity protection on the block layer means that now you can get integrity errors for a disk sector that has not yet been written. "Do not read what you did not write." But guess what udev is doing as the first thing when a device appears - it scans for known signatures of every filesystem that was invented in the last 40 years or so and can generate a pile of integrity errors. So some things will need to be tuned up.

Q: How can interested developers contribute? In which domains could you use some help?

I am happy to see that cryptsetup2 is just entering distributions, and because disk encryption is part of the initial boot process, such a change causes some new problems. So integrating it into existing storage management systems and reporting all problems along the way is crucial for us to keep the project going. And I would like to thank all people for comments and reports they are already sending - seems that the community can provide far better critical feedback than I got from academic storage people.

Q: Which new features can we expect this year in cryptsetup and particularly dm-integrity?

As said above, it is just the beginning of our way to improve storage security. There are several trade-offs, one of the major ones is the performance cost. But it can be improved, and that is probably what we will focus on next year. For the authenticated encryption I also hope that the CAESAR competition will announce its winners and these appear in the kernel crypto API (and we have some nice tests already).

Q: Have you enjoyed previous FOSDEM editions? 

This will be my first FOSDEM.
