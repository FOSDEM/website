---
year: 2020
speaker: free_ekanayaka 
event: dqlite
---

Q: Could you briefly introduce yourself?

I'm an employee at Canonical, the company behind Ubuntu, and I'm
currently working in the LXD team. I started to appreciate and love the
FOSS community and model in the late 90s at university, and never
stopped since then! I started by contributing to Debian as package
maintainer, and progressively became more involved in broader software
development in Python, then in Go and lately in C.

Q: What will your talk be about, exactly? Why this topic?

The talk will present [Dqlite](https://dqlite.io/), an embeddable and fault tolerant SQL
engine. Dqlite combines [SQLite](https://www.sqlite.org) and the [Raft consensus algorithm](https://raft.github.io/)
to make it easy to build highly-available multi-node applications that
don't depend on any external service to store and replicate their SQL
relational data.

I'm the main developer of Dqlite, and now that the project has reached
its 1.0 version I think it's a great time for people to try it out.

Q: What has changed over the last 20 years for SQLite and other FOSS databases?

SQLite has arguably grown to become the [most widely deployed and used database in the world](https://www.sqlite.org/mostdeployed.html): an extremely reliable, fast and lean library
that powers a huge variety of applications written in a number of
different languages. Dqlite sits on the shoulders of this giant and
extends it to play nicely with distributed multi-node applications,
which are becoming increasingly common.

Q: Have you enjoyed previous FOSDEM editions?

I absolutely loved the 2019 edition, which was the first one I had the
oportunity to attend: the content, audience and atmosphere really feel
close to the FOSS way of doing things, a great chance to bring the
community together.


