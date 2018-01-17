---
year: 2018
speaker: tarek_ziade 
event: molotov 
---

Q: Could you briefly introduce yourself?

I am Tarek Ziadé, a developer working for Mozilla. I've been quite active in the past promoting the Python language, by founding the French Python user group (Afpy), contributing to Python itself, and writing a few books about Python. My latest book just came out, it's about building microservices using Python.

Q: What will your talk be about, exactly? Why this topic?

Load testing is often neglected when building and deploying web services, and at Mozilla QA we wanted to make it as simple as possible for developers to add load tests in their projects. In an ideal world, load tests should be part of the development cycle like unit tests or functional tests. It's useful even for small projects because the issues you'll find are often hiding problems that can appear even on smaller loads.

My talk will be about [Molotov](https://molotov.readthedocs.io/en/stable/), a load testing framework in Python we've been building at Mozilla with that philosophy in mind: a simple way to add load tests in projects. The presentation will focus on what kind of applications Mozilla deploys in the cloud and how we detect and fix bottlenecks in them with Molotov.

Q: What do you hope to accomplish by giving this talk? What do you expect?

This talk has two goals:

 1. make developers aware that writing load tests within their development cycles like they often do with unit tests is a great idea to raise the quality of their projects;

 2. promote the usage of Molotov, because unlike most other load testing tools, it was created with 1. in mind.

Q: What's the history of the Molotov load testing tool? What was the motivation of the Mozilla QA team to create it?

A few years ago, when the QA team was asked to load test a project, we used whatever tool or script the project developers were providing, or whatever tool the QA engineer liked. Adding a load test to a project was often an ad-hoc task.

The Molotov tool was created to try to standardize that process across projects and to lower the bar of writing load tests. A simple common standard, very close to plain Python. Today, if a project comes with a Molotov test, it also makes it simpler for us to add some extra automation for free, like running smoke tests in Jenkins.

Q: Which are some common bottlenecks that you have been able to solve thanks to Molotov?

Web services are usually very easy to break in their first iteration. Things usually go south when the application interacts with other systems.

Off the top of my head:

  * a bad (or a total lack of) socket management when the application interacts with other apps. timeouts, disconnects, etc;
  * socket pools that get exhausted or no connection reuse/recycle;
  * long SQL queries that just hang everything after a while;
  * resource leaks (memory, disk full, fds, etc);
  * lack of resilience (the app gets in a bad state after a high load).

Q: For which use cases is Molotov a good tool? And for which situations is it not a good fit? 

Molotov is perfect to load test web services where you can script everything with its HTTP client. If you need to interact with a browser on the client side so you can run some JavaScript, it's not the best tool - we're working on some webdriver extensions so Molotov can drive browsers, but it's an edge case for us.

Q: Which new features can we expect this year in Molotov?

The tool is quite mature at this point and we're mostly fixing bugs. I think the next steps will be to make its integration easier with continuous integration tools. For instance, a contributor added Molotov support in Taurus.

Since Molotov has a plugin system, I would also love to have more plugins builtin.

Q: Have you enjoyed previous FOSDEM editions? 

I've been to the FOSDEM almost every year for a while but not lately because I was quite busy with work and the kids. So I am very happy to come this year. FOSDEM is one of my favorite conferences for its unique vibes. I love it.
