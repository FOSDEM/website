---
year: 2014
person: Tom Tromey 
speaker: tom_tromey
topic: "Your application versus GDB" 
event: your_application_versus_gdb 
---

Q: Could you briefly introduce yourself?

My name is Tom Tromey.  Currently I'm the technical lead of the debug group at Red Hat, but I've worked in the free software world for a long time, on many projects.  I work at home in Boulder, Colorado.

Q: What will your talk be about, exactly? Why this topic?

My talk is titled "GDB Versus Your Application".  Relatively recently -- in gdb terms -- we added Python scripting capabilities to gdb, and specifically we've done so with the goal of making it easier to adapt gdb to your specific debugging needs.  In my talk I'll discuss some of the larger features that you can use and some planned future features. I'll show some cool demos.  I may cover some other new developments in gdb as well.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to get out the word about gdb's new features a bit more and inspire some people to write some debugging code for their applications.

Also, ideally I would like this talk to open some lines of communication between gdb and other development communities. Gdb has this funny quality that it is very good at debugging itself, so long-term gdb developers often forget what the pain points were.  I'd like different FLOSS development communities to know we have an open door, we're interested in helping solve their debug problems.

FWIW the entire Red Hat debug team will be at FOSDEM this year.  Several of us are giving talks on topics related to debugging.  So, if you want to brainstorm or complain-storm, you'll have plenty of chances :)

Q: GDB has undergone a renaissance in the last few years. What or who where the main drivers behind this modernisation?

It's definitely been a group effort to modernize gdb.  I think the addition of Python scripting has been a significant help here, because it's given us some new idioms to solve long-standing user problems -- by letting users solve the problems for themselves.  The scripting, as cool as it is, though, is only one part of gdb's renaissance.  For a long time gdb's code had a reputation as being irredeemably ugly, but I think we've collectively realized that we can fix the problems, and that gdb's architecture is a lot more flexible than anybody thought.  There's been a lot of effort to clean things up, and also roll out many new features and "distro-level" enhancements in gdb.

Q: Could you give some examples of some recent lesser-known possibilities of GDB?

One small thing we've done is add debugging probes to various system libraries to make the debugging experience better.  For example, we added probes to the exception unwinder and to longjmp, so that stepping over these works as you'd expect.

This is a minor thing, but I think it is cool because it is the result of collaboration with other groups to make the Linux platform better.

Now, that is a built-in behavior -- but the underlying probe technology is also very cool and is easily available for your program.  That is, you can add these very cheap probes to your application, and then easily see the probes from gdb, set breakpoints on them, and script them using Python.

There are many more features that developers will find interesting... but I want to save some things for the talk.

Q: Which new features can we expect in GDB in 2014? 

It's always hard to predict exactly what will land at what time, but we're hard at work on a number of cool things -- new Python scripting features, local/remote parity, extending the existing multiple-process debugging to multiple remote targets as well.

Q: I've attended FOSDEM a few times and I think it is the premiere free software conference.  I rave about it to my friends.
