---
year: 2015
speaker: pepijn_noltes 
event: apache_celix 
---

Q: Could you briefly introduce yourself? 

My name is Pepijn Noltes and I joined the [Apache Celix](https://celix.apache.org/) project in 2012
while it was still in incubation. When Apache Celix was graduated to
top level project I became a member of the project management
committee.

I'm working as a software architect at Thales Netherlands on
large distributed embedded real time applications. Day by day I
see the challenges of developing, maintaining and extending complex
and big software applications in a technologically heterogeneous
environment with increasingly less time and budget.

This led me to believe that in order to tackle these challenges we
need a solution to divide complex software applications in
maintainable modules. And this solution should also transcend
programming languages, but still have enough innate software
engineering methodologies to be easy to understand and adopt.

In my opinion [OSGi](http://www.osgi.org/Main/HomePage), a set of specifications for a service-oriented
programming framework in Java, delivers this solution. Well ... almost.
It is still too focused on a single programming language (Java) and
that is were Apache Celix comes in to play.

Q: What will your talk be about, exactly?

My talk will be about Apache Celix: what it is, how it works and
what it offers.

In short, Apache Celix is a framework for service-oriented programming
in C. With Apache Celix it is easier to develop small modules that
only disclose chosen functionally in (abstract) services, which makes
it (near) impossible to unintentionally “leak” implementation details.
This will result in cleaner code with clear boundaries.

In this talk I will explain the importance of modularizing your
software applications (the "itch"). And how Apache Celix can help you,
for small or large projects, to get a better control over your (C-based)
software applications.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to convince more people of the benefits – and dare I say
importance – of modularization in software engineering and how Apache
Celix can help with that.

I will specifically focus on the concept of service-oriented
programming and why it is a very strong programming paradigm, well
suited for today's challenges.

Q: What's the history of the Apache Celix project? Why did it start and
how did it evolve? How did you get involved?

Apache Celix was founded by the collaborated effort of two companies
(Thales Netherlands and Luminis) and donated to the [Apache Software
Foundation](http://www.apache.org/) in 2010. In 2014 Apache Celix has been promoted from
[incubator project](http://incubator.apache.org/) to [top-level project](https://projects.apache.org/) of the Apache Software
Foundation.

I started working with and for Apache Celix in 2012 for my research
work at Thales. After earning some karma I was invited to join Apache
Celix as committer.

Q: Several key aspects of the OSGi specification rely on Java
functionality such as interfaces, packages and JAR files, so it looks
like adapting the specification to C was a nontrivial task. What were
the most difficult challenges?

The most difficult challenge was to decide how services should work
in Apache Celix. For Java, services are represented by Java interfaces
which are an integral part of the language and can be shared through
dynamic class loading. The playing field of C is very different. We
wanted to keep the core concept of services intact without overcomplicating
the needed implementation requirements and keep close to
programming “plain old C”. In the end the chosen solution is, in my
opinion, simple and elegant. But you can judge that for yourself by
attending my presentation :)

Q: Is there still some cross-pollination between Apache Celix and
Apache Felix, the open source Java implementation of OSGi that Celix
is heavily based on?

Yes. Significant parts of Apache Celix are “ported” directly from
Apache Felix. Because Apache Felix already exists for several years
and has a significant number of users and committers, a lot of
bugs/pitfalls have already been solved/addressed. By choosing Apache
Felix as starting point of the development of Apache Celix, a lot of
bugs/pitfalls have been avoided.

Q: Could you give some examples of projects using Apache Celix?

One example is the [INAETICS research project](http://www.inaetics.org). The
goal of this project is to create a reference architecture for
dynamically scaleable time-critical distributed systems. It is built
on top of cloud(-like) technologies (think [CoreOS](https://coreos.com/), [Docker](https://www.docker.com/), [Kubernetes](http://kubernetes.io/),
and so on) and leverages the concept of service-oriented programming to
create a development environment where one programming paradigm can be
used to combine a broad range of technologies. In INAETICS Apache
Celix is used as one of the OSGi frameworks to dynamically deploy
software modules and disclosing (remote) services programmed in C.

Generally speaking Apache Celix is not (yet) heavily used in the rest
of the world. In my opinion one of the reasons is that although OSGi
booked successes on the enterprise level, on a more embedded level the
idea of developing software based around services still feels
alien. That is of course one of the things I like to remedy by
speaking about Apache Celix at FOSDEM.

Q: Which new features can we expect this year in Apache Celix?

The current version of Apache Celix is very usable, but to lower the
threshold to get started with Apache Celix one of the features we are
working on is a more declarative way of creating service-oriented
components. The benefits would be that less boilerplate code is needed
to create components, which speeds up the development of your modules.

Another features. which I personally hope to move forward, is our
remote services implementation. Remote Service should make it
possible to create "polyglot" applications composed of services from
different environments/languages. We do have a working version of
Remote Service between C-based and Java-based services, but this still requires some
manual coding for creating the necessary stubs.

On of the goals is to make transparent communication between Java and
C OSGi components easy to use and easy to setup.

The major missing element currently is what IDL (Interface Definition
Language) we should use to describe services in a language-agnostic way
and how to generate code from the IDL in an intuitive manner.

Q: Have you enjoyed previous FOSDEM editions?

Yes. Last year was the first time I visited FOSDEM. I enjoyed it very
much, although for the first time the number of events is a bit
overwhelming. So many interesting choices, not enough clones :)
