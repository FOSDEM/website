---
person: Carlos Sanchez
year: 2012
topic: From Dev to DevOps
---
Carlos Sanchez will give a talk about ["From Dev to DevOps"](/event/from-dev-to-devops) at [FOSDEM 2012](https://fosdem.org/2012/).

Q: Could you briefly introduce yourself?

I've been working for a long time on automation and quality of software
development, QA and operations processes. I'm highly involved with open source
projects, being a member of the [Apache Software Foundation](http://www.apache.org)
and the [Eclipse Foundation](http://eclipse.org/org/) amongst other groups,
and contributing to a variety of projects over the years, including the build manager
[Apache Maven](http://maven.apache.org), the continuous integration server
[Continuum](http://continuum.apache.org), the repository management software
[Archiva](http://archiva.apache.org), the authentication and access control framework
[Spring Security](http://static.springsource.org/spring-security/site/), and more.
I currently live in Spain, and work for [MaestroDev](http://www.maestrodev.com),
a company based in Los Angeles where we develop solutions for the automation of the
development-to-production lifecycle.

Q: What will your talk be about, exactly?

I'll talk about DevOps from a developer point of view, what is it about, the
connection between the Agile and DevOps movements, and going into detail on the
infrastructure-as-code concept, with examples of [Puppet](http://puppetlabs.com)
and how that all fits in the development-to-production lifecycle.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'd like developers to be aware of the DevOps movement, understand the benefits
of extending agile processes into the operations field and how they can
collaborate with the QA and Ops teams to achieve a higher degree of automation
for all the teams involved.

Q: How did you become involved with the DevOps movement? Are you primarily a
developer, a QA or an ops person?

I consider myself a developer and have contributed for a long time to
development tools, like Apache Maven since 2004, but the existing "developer"
tools were always short at the time of moving past development or QA. The need
to move beyond that is exactly what DevOps tries to fulfill, and a natural next
step for people interested in the development process.

Q: Infrastructure-as-code looks like a key concept of a DevOps approach. How difficult is it for ops people to make this mental switch and look at their infrastructure as code that they develop, test, put in version control, and so on?

Ops teams should have realized long time ago that they need some automation,
particularly since the explosion of cloud computing and the need to manage a
lot of servers. Infrastructure-as-code is the next step of standardization,
and, as any change, it faces initial pushback. Tools like Maven that enforced
versioning, naming, and other conventions had to fight strong opposition, but
prevailed at the end.

Q: How do you guarantee a seamless process from the start of development to the end in production deployments and maintenance when each part of this process has its own separate tools?

It's clear that teams will have a number of heterogeneous tools, choosing which
one is best for each task. The key part is the automation of the handover
between them. Most popular ones have APIs that allow connecting the different
pieces, and whether you use a commercial tool, like the one we develop at
MaestroDev, or a homegrown solution, there are different levels of automation
you can achieve, from simple build-test-deploy cycles to more complex ones that
include notifications, on-the-fly environment creation, hands-free deployment
to production,...

Q: Have you enjoyed previous FOSDEM editions?

This is my first time at FOSDEM, and I'm looking forward to it!
