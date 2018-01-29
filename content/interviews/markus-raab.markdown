---
year: 2018
speaker: markus_raab 
event: elektra
---

Q: Could you briefly introduce yourself?

I am employed at the technical university of Vienna (TU Wien) in the [compilers and languages group](http://www.complang.tuwien.ac.at/raab/).

I enjoy hacking, programming, and researching.

In my spare time I love running, cycling, and hiking.

Q: What will your talk be about, exactly?

Currently, every FLOSS system has its own configuration access. Such FLOSS systems can be KDE and GNOME but also individual applications. Configuration access usually involves parsing and serializing configuration files but also includes default values and validation. The per-FLOSS-system separation has the advantage of excellent modularity but the disadvantage that the configuration access cannot be shared.

In the talk I'll present a revolutionary approach, called [Elektra](https://www.libelektra.org/), which is a global shared configuration access that does not impair modularity.

We will also demonstrate some of Elektra's features, such as validation and introspection, thanks to Thomas Waser.

Q: Why this topic?

The uniqueness of configuration accesses is that it is not only needed by applications (via programming interfaces) but also by system administrators (via configuration management tools) and end users (via graphical and web user interfaces). I am fascinated about this combination of programming and user (non-programmer) interfaces.

Configuration access is a seemingly trivial problem (as suggested by the many configuration file parsers invented all the time) but it turns out to be a hard and very interesting problem if you consider usability, misconfiguration, and introspection.

Q: What do you hope to accomplish by giving this talk?

I want to raise awareness that there is a way out of the current troublesome situation without giving up diversity and modularity we love so much about FLOSS. With Elektra we do not have to agree on any standard (configuration registries like Windows registry or macOS plists) and still can get all benefits such a standard provides.

An abstraction that delivers this promise will be the main message of my talk, which is a key-value-based configuration specification language. It is an external, declarative specification of configuration access. For example, it describes validation rules, default values, and which configuration files in which format to use.

Furthermore, I want to summarize essential aspects of (mis)configuration research, which are hardly known in the FLOSS community.

Q: What's the history of the Elektra Initiative?

Thank you for the question because I'll need to skip the historical perspective in the talk.

Elektra started in 2004, initially with the naïve assumption we could use the concepts of a configuration registry as used in proprietary software and apply it nearly-as-is to FLOSS. This assumption luckily was dropped quickly and one redesign after the other was needed to fulfill the requirements of FLOSS. In that process Elektra changed drastically over the years.

2005: The first step forward was to have a global selection of which backend (like filesys or berkleydb) should be used.

2008 (version 0.7): The next step was to have a virtual-file-system-like abstraction. It allows us to mount application-specific configuration files into a global hierarchy.

2012 (version 0.8): To cope with modularity on system-level (dynamic linker dependences as printed with ldd), we introduced a plugin system. For example, this allowed us to use XML, YAML, or JSON parsers without adding any dependency to the core.

Since 2014 (version 0.8.*): To keep modularity between applications and to introduce introspection, we introduced the declarative configuration specification language, which also unifies all earlier abstractions.

In 2014 Elektra restarted with a new team and many new ideas were implemented. In the talk I'll only talk about the recent versions of Elektra (0.8.*).

For a more detailed discussion of the historical perspective, please see [Elektra's book](https://book.libelektra.org) on page 8. For the more recent history, read the [news](https://www.libelektra.org/news).

Q: What is so important about good configuration defaults and how is Elektra addressing this?

Defaults are essential because they decide about the first impression of your application. Two aspects (next to knowing your users) are fundamental for what we consider as good defaults, both can be improved by Elektra's configuration specification language.

First, we want defaults to adapt themselves to the system they are running on. If we have one graphics card, we usually want the X-Server to start up using this graphic card, if we have a specific number of cores we usually want Firefox to distribute the load on all these cores.

Second, we want defaults to be consistent with decisions we have already taken before. We are currently lacking configuration settings respected by all applications, for example, a configuration setting to change all shortcuts to quit an application from Ctrl+Q to Alt+F4.

Elektra's idea is to add a simple language which allows us to connect configuration settings, calculate defaults from other configuration settings or to do arbitrary computations on configuration settings using plugins. Because of the key-value based syntax, also the specification language can be written using configuration tools (commandline-tools, web-UIs, GUIs, ...).

Q: Can Elektra be used together with existing configuration management tools, such as Puppet, Chef, and CFengine?

Yes, Elektra is designed to be used with configuration management tools.

This is an excellent question because the difference between Elektra and configuration management tools easily causes confusion.

Simply put, Elektra is in the layer below configuration management tools, only responsible for local configuration access.

So Elektra is not a configuration management tool by itself. But it provides many building blocks to help configuration management tools to better do their work.

We already demonstrated that Elektra works well together with Puppet, with an implementation called [puppet-libelektra](https://puppet.libelektra.org).

I'll give an additional talk about this topic in the Config Management DevRoom: [Breaking with conventional configuration file editing](https://fosdem.org/2018/schedule/event/puppet_key_value/).

Q: What does the project's community look like? How many developers are working on it?

To get and keep a healthy community was one of the main challenges during the long history of Elektra.

A large part of the development team are now students from my university (TU Wien) but we also have contributors from all over the world. We have about 14 regular contributors and many more sporadic contributors.

For some time I was the only contributor but this changed completely. In the last months I was writing a [book](https://book.libelektra.org) and the development was hardly affected by it: My contributions are now only a small part of many contributions. This is for me an indicator that the community is now healthy. The development does not solely depend on me anymore as it had been the case before.

Q: How can interested developers contribute? In which domains could Elektra use some help?

Luckily the technical debt of Elektra's code base is quite low. We have good code quality with plenty of documentation; we continuously build the whole source on many architectures, operating systems, and compilers; we have exhaustive tests; and Valgrind tells us that no memory leak is possible within these tests.

Elektra is already successful and there are already more systems that would like to use Elektra than we are able to write patches for.

What Elektra is mainly missing are FLOSS systems that want to use Elektra and are also willing to contribute non-trivial parts, like writing application-specific bindings and plugins. Such bindings and plugins are often reusable between applications, e.g., a configuration parser for Elektra can be used by any application using Elektra.

Details about getting started are [documented here](https://www.libelektra.org/devgettingstarted/ideas).

Q: Which new features can we expect this year in Elektra?

There are many interesting features in the pipeline, I will pick four.

One larger goal are optimizations so that Elektra can better handle very large configuration settings. One technique will be an Order Preserving Minimal Perfect Hash Map (OPMPHM) to speed up lookups without making ordered iteration slower. The implementation of the randomized Las Vegas hash map algorithm is in a final stage and the heuristic functions ensuring time and space optimality are backed up by benchmarks. Thanks to Kurt Micheli for his work.

Secondly, we want to make our notification system more flexible and avoid any blocking operations. That allows applications to be instantly aware of configuration changes. It will support different I/O management libraries like libuv or glib. Thanks to Thomas Wahringer for his work.

Another important topic is adding good support for more configuration file formats. We are currently investigating different parser techniques to ease such implementations. Thanks to René Schwaiger for his work.

Then we are also extending our website to enable us to report, track and comment on misconfigurations additionally to the configuration snippet service we already have. Thanks to Vanessa Kos for her work.

Q: Have you enjoyed previous FOSDEM editions? 

Yes, I am a huge fan of FOSDEM and have already visited FOSDEM in 2009. In the last years I could not attend FOSDEM (mainly due to Elektra-related activites) but I enjoyed selected FOSDEM talks via video streams.


