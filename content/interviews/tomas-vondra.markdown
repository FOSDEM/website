---
year: 2019
speaker: tomas_vondra
event: postgresql_fsync
---

Q: Could you briefly introduce yourself?

Hello, I'm Tomas. I'm a long-term [PostgreSQL](https://www.postgresql.org/) user and contributor, and now also a committer. I live in Prague, and I work for [2ndQuadrant](https://www.2ndquadrant.com/), one of the companies contributing to PostgreSQL and providing various kinds of related services.

Q: What will your talk be about, exactly? Why this topic?

My talk is about an fsync-related issue discovered in PostgreSQL about a year ago. That's an important topic because fsync is crucial for safety, something the PostgreSQL community cares about a lot.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I don't have one clear goal with this talk, it's more a mix of goals.

Firstly, in my experience most of the conference talks are about success, when things work more or less the way you expected them to. This talk is meant to be different - it's an analysis of a failure.

Secondly, I'd like to explain the roots of the issue - why we use fsync the way we do, why we haven't noticed the issue for such a long time and so on.

And of course, I'll talk a bit about what the community is doing to address those issues --- both in the short and long term.

Q: The fact that the wrong use of fsync in PostgreSQL went unnoticed for 20 years must mean that the possibly disastrous consequences don't happen that much. So which specific circumstances could result in data loss?

I'm afraid I don't have a very good answer to that, but in short any failure during fsync may result in data loss. The behavior also depends on the filesystem, multipath, etc. to some degree. Thankfully such issues are extremely rare, although it seems to be getting worse due to thin provisioning, NFS, and similar features.

Q: Considering that PostgreSQL cares a lot about data durability and consistency and yet has been misunderstanding how fsync works for 20 years, we can wonder how many applications actually use it correctly. Which other (database or other) applications have been shown to be impacted by this issue?

Yes, those are good questions. I'm not in a position to judge what other databases/applications are doing, but it's difficult to imagine anything but simple applications using fsync correctly, especially applications that use multiple processes / file descriptors etc.

One reason is that while the actual fsync() behavior makes sense from the point of view of the kernel, it's not really explained anywhere. So the developers may end up with the wrong assumptions.

The other reason is that the exact behavior was repeatedly broken in the kernel, so even if the application does everything right it may not get notified about the issue.

And of course, all of this happens only very rarely, and is quite difficult to simulate and test (we now have an "error" DM target, which makes it much easier).

Q: What are the short-term and long-term solutions to the fsync issue?

The short-term solution is ensuring that we detect fsync errors reliably at least on sufficiently recent kernels (since 4.13). On older kernels we can't do much better, unfortunately.

The long-term solution is still being discussed in the community, but it's hard to say how we could keep relying on buffered I/O in the future. So we may end up with direct I/O, but that's a pretty significant change and is likely going to be a multi-year project.

Q: Have you enjoyed previous FOSDEM editions?

Yes, that's why I keep coming back ;-) Apparently I'm not the only one, which means it's harder and harder to get into some of the talks. 
