---
year: 2013
person: Denis Defreyne 
speaker: denis_defreyne
topic: Static site generation for the masses
event: static_site_generation_for_the_masses
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I am a software engineer working for a medium-sized company where I write software in [Smalltalk](http://www.smalltalk.org/main/). When coding for fun, I prefer [Ruby](http://www.ruby-lang.org/en/). Occasionally, I submit patches for other people’s open-source projects, but most of the time I work on my own projects such as [nanoc](http://nanoc.stoneship.org/).

Q: What will your talk be about, exactly? Why this topic?

My talk will be about static site generators (SSGs), and in particular about my experience developing my own solution called nanoc. CMSes as we know them can be overkill. SSGs are an excellent alternative in many cases, and they are not necessarily weaker or less dynamic than CMSes.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Even though there has been a surge in interest in static site generators over the past few years, they remain an option that is often overlooked or quickly dismissed. I aim to clarify the idea behind SSGs and show what SSGs are capable of to encourage web developers to give them a try.

Q: What are in your opinion the major drawbacks of CMSes and how do static site generators resolve them?

If I had to pick three major drawbacks I would say that speed, security and collaboration can be problematic in a CMS. Static site generators do not have these issues: static sites are served quickly, do not need security updates and they work together nicely with version control systems to allow collaboration.

Q: Although their popularity is rising, static site generators are still a niche. What do you consider the biggest hurdles? Why doesn't everyone throw away their CMS 
and switch to nanoc?

There is, as of yet, no static site generator that is equally featureful and user-friendly as popular CMSes like [WordPress](http://wordpress.org/) and [Drupal](http://drupal.org/). There is also a lack of a strong community where plug-ins are created and shared. By intention, nanoc is fairly bare-bones and it needs to be programmed in order to get the most out of it. I am playing with the idea of building a user-friendly GUI on top of nanoc, but so far that idea has not yet materialised.

Q: What's the history of nanoc? Why did you start with it? Was it because other static site generators were not sufficient?

Early 2007, I was looking for a Ruby-based CMS to replace the PHP ones I had been using. However, the requirements for running Ruby make it hard to run a server-side Ruby blog on a virtual server with only 96 MB of RAM. When a good friend showed me his set of scripts for managing a static web site, I decided to take that idea and improve it, and that is how nanoc was born.

Q: If you compare nanoc with other static site generators, what are its biggest advantages and disadvantages? Is there a specific type of websites that's a good match
for nanoc?

I have not really tried out other static site generators and I am not following their development activity, so I cannot go in detail for a comparison. One aspect where
nanoc differs from other SSGs, is that it is designed to be flexible so that any kind of site can be built with it. Other tools often focus on specific kinds of sites,
like blogs, and are easier to set up and use, but prove unfit for more complex web sites. While I see people switching from nanoc to [Jekyll](http://jekyllrb.com/) or [Octopress](http://octopress.org/) because they are simpler, for example, I also see people turning to nanoc when they need more power.

Q: As of the 2013 edition, FOSDEM is using nanoc for its website. What are to your knowledge the biggest websites that are using nanoc?

The first large nanoc project that I know of was ABC Studios’ Ugly Betty web site. The most well-known (and [open source!](https://github.com/github/developer.github.com)) nanoc site is probably GitHub’s API documentation site. Flattr, Spree and App.net also maintain their API documentation as a nanoc site.

Q: How big is the nanoc developer community?

The nanoc development team is pretty much just me. I do get patches from the community containing bug fixes or useful new features. Compared to other SSGs, nanoc has few forks, likely because nanoc can be extended without changing the nanoc code itself.

Q: What are your plans with nanoc in 2013? Which new features do you have in the pipeline?

I plan to finish the next feature release before FOSDEM. That release will provide functionality for automated testing, like validating HTML and CSS, and ensuring both
internal and external links are okay. There is plenty of other stuff on the to-do list for later releases, so I doubt I will be out of work anytime soon!

Q: Have you enjoyed previous FOSDEM editions?

Certainly! FOSDEM is a fixed appointment in my calendar! :)
