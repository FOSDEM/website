---
year: 2018
speaker: stef_walter 
event: cyborg 
---

Q: Could you briefly introduce yourself?

I've been working on open source for a long time. Interested in integrating things and making Linux just work out of the box. Over the years this I've contributed to over a hundred different projects.

Recently this interest in integrating Linux, caused me to work on [Cockpit](http://cockpit-project.org/), an admin console, and doing deep automated testing of the system to make sure that integration is working.

Q: What will your talk be about, exactly? Why this topic?

What I'm going to talk about is a Cyborg Team. A team that's part human and part machine. I believe that many of us use machines as tools to do our own jobs, rather than assigning mundane repetitive maintenance jobs to machines, thereby freeing us humans up to do actual interesting open source development.

This is not hyperbole or sci-fi, but I want to show an example of a team that pulled this off: Built a Cyborg team, and used that to pull off an otherwise impossible project: Cockpit.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I believe that so many projects in open source have problems growing because we're stuck on maintenance tasks, fixing regressions and bugs.

So many teams have reached maintenance stagnation. The effort of a purely human team does not scale past a certain point.

By bringing machines into our projects as real team members, and giving them actual responsibilities for mundane repetitive tasks, we can pull off things that would otherwise be impossible.

Q: What made you start training machines to be contributors to the Cockpit project? How did this evolve? Have these automated team members become what you planned them to be?

Cockpit as a project would have been impossible to implement without aggressive testing. We'll talk about this in the talk. The combinatorial explosion of Linux APIs that Cockpit interacts with forced us to use machines as team members during development.

We didn't imagine how far this would go. But we have various rules that we found which allowed this change to be organic and successful.

Q: Which tasks are your automated team members doing?

Mostly mundane tasks. Deep integration testing booting millions of operating systems per months, but also looking for security issues, pulling in dependencies, pulling in translations, releasing Cockpit into distributions and so on.

These are the tasks that would otherwise take up the team's time. As developers, we all spend a significant portion of our time on mundane tasks that prevent us from building . That's what we're after here.

Q: Machines can be much more productive than humans. This has a good and a bad side. How do you make sure these bots don't go awry and really mess up your code in a short time?

That's a great question. We solve this by making sure the machines communicate with the team in the same way that the humans do: via pull requests, via commits, code review, issues, and so on.

The same concepts of code review, testing, branches and forks that prevent humans from going awry are used with and by the bots.

Q: If other projects want to have such a system with automated team members, how should they start?

With the tests. Tests are the soul of a bot. They help machines know "good from evil". The tests are a way of explaining to a machine what the team thinks is progress in the right direction.

These tests should be approachable, changeable and reproducible by humans on the team. Results from the tests need to feed back into the team's workflow in the places where the team communicates: like pull requests, mailing lists, or IRC.

Once a body of tests in in place, then more advanced bots can start performing further tasks in the project.

Q: Have you enjoyed previous FOSDEM editions? 

FOSDEM has always been an amazing experience. It's hard to imagine any other conference with the breadth of the people that you meet, the devrooms and of course the beer  :-)
