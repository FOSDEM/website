---
year: 2013
person: Kohsuke Kawaguchi 
speaker: kohsuke_kawaguchi
topic: How we made the Jenkins community 
event: keynote_vibrant_developer_community
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I'm Kohsuke Kawaguchi, the creator of a popular continuous integration server called [Jenkins](http://jenkins-ci.org/). I'm originally from Japan, and I now live in San Jose, California, and I work for [CloudBees](http://www.cloudbees.com/). I enjoy working on all kind of open-source projects.

Q: What will your talk be about, exactly? Why this topic?

The Jenkins project is unique in its structure --- it has an extensive plugin ecosystem, anyone can become a committer just by asking, and it has bootstrapped itself from my hobby project. I wanted to talk about how the project was able to come this far, and in particular several tricks/mechanisms that help us really scale the development process. I think our observations are useful to people doing other open-source projects.

Q: What do you hope to accomplish by giving this talk? What do you expect?

If some people start thinking "well, maybe I could run projects like that....", then I consider my talk a success.

Q: What is Jenkins exactly and what were your reasons to develop it?

There were several reasons. One was that I used to be a guy who breaks the builds, so at one time I thought I should have a program that catches it before my colleagues do. It was also because I used to work in a group that defines JavaEE (a server platform for Java applications), yet I've never written anything on JavaEE myself. This was also around the time when everyone had their own web framework, and I had my own idea about one. So as with the case with many open-source projects, I decided to solve these seemingly unrelated three problems in one go, and that became Jenkins.

Q: How did you manage to build Jenkins from a one-man hobby project to an open source project with hundreds of developers?

The key insight came from my earlier work on JAXB, a part of JavaEE that deals with XML data binding and schema compilation into Java code. This was one of the earlier experiments at Sun toward open-source, and I found one thing that really worked well to attract developers is to let them do what they want to do without us getting in the way. So I started pushing that to its logical conclusions, and that resulted in the plugin system, extensible web application, update center, and etc.

Q: What lessons did you learn about community development while developing Jenkins?

I was mostly really lucky that I had many great people in the community who did the community outreach. I'm more of a guy who writes code than the community building guy, so if I were alone we wouldn't have been here. That said, I think one of the key lessons for me on community development is the importance on making everything as easy as possible --- not just the program itself, but the process to bring people on board needs to be as easy as it can.

Q: Do your lessons apply to all types of open source communities or are there differences?

Yes, except a few foundations and truly major open-source projects, most of the projects we run are small, and we can't afford to turn away potential contributors. So I think the lessons would apply to many communities.

Q: Could you show some common pitfalls that inhibit developer communities?

I think the biggest thing is to "let it go". When somebody else wants to coding style, adjusting minute details, and/or asking him to do a lot more than scratching his own itch. People who don't know each other very well just can't work productively like that. Therefore the question becomes how to let others do whatever they want without intruding on what you are doing, which leads to modularization (dividing up big chunks to small independent blocks) and extensibility (allowing people to write and use stuff so long as they conforms to the base contract.)

Q: Have you enjoyed previous FOSDEM editions?

Yes, the last year the Jenkins project had a stand, and we have a number of project people from all over Europe. It was a blast! This year our presence would be even bigger, as we are being a part of the test&automation dev room, and the number of project people coming to FOSDEM this year is even larger than the last year. So I'm really excited!
