---
year: 2014
person: Erik Moeller 
speaker: erik_moeller 
topic: "The Wikipedia stack: An insider's look at the free encyclopedia's code that anyone can clone, branch & commit"
event: the_wikipedia_stack 
---

Q: Could you briefly introduce yourself?

I run the tech department at [Wikimedia](http://www.wikimedia.org/), about 100 staff nowadays. Been a Wikipedian since 2001, and helped build the organization behind it in the last 6 years. Have done some development on MediaWiki as well.

Q: What will your talk be about, exactly? Why this topic? 

Walking through the whole technology stack of our projects, and the many different ways to get involved, from the operations infrastructure to the tiny scripts and bots that make Wikipedia better. Volunteers are the lifeblood of our projects, and FOSDEM is an ideal place to talk to people about ways to get involved.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

My hope is that folks will feel motivated to poke at, say, the MediaWiki Vagrant setup, or get an account in [Wikimedia Labs](http://www.mediawiki.org/wiki/Wikimedia_Labs), or just use the [MediaWiki API](http://www.mediawiki.org/wiki/API:Main_page) (including, as of recently, OAuth support) to build nice tools that interface with our projects.

Q: What made the MediaWiki developers support Lua as a scripting language for templates? Why Lua and not JavaScript, which is much more common? 

Controlling memory and stack usage was a key concern, you can see some of our [original discussions about Lua versus JavaScript](https://www.mediawiki.org/wiki/User:Sumanah/Lua_vs_Javascript).

Q: Could you give us some examples of what's possible with the MediaWiki API? 

We use our own API extensively for new features that we build. An example is [the upload wizard](https://commons.wikimedia.org/wiki/Special:UploadWizard) (you need to be logged in) which is almost entirely written in JavaScript and uses the API to manage a multi-step, multi-file upload that's temporarily stashed and completed once the user has gone through all the steps.

[Tool Labs](http://tools.wmflabs.org/) has an index of tools that are hosted inside Wikimedia Labs, free OpenStack-based infrastructure for volunteers, and many of these of course use the API. Examples include bots performing various routine maintenance edits in our wikis, or even interactive tools like [CropTool](https://tools.wmflabs.org/croptool/) which is an image cropping tool authenticated via OAuth.

Q: How can someone interested in open source software help the Wikimedia project? 

Come to my talk :-) Or of course you can read [our page about how to contribute](https://www.mediawiki.org/wiki/How_to_contribute).

Q: Which new interesting features can we expect this year in Wikipedia and the other Wikimedia projects? 

Lots of shiny things. We're still making our new [VisualEditor](http://www.mediawiki.org/wiki/VisualEditor) really awesome, and we're working on an entirely new discussion engine. We've also recently enabled mobile editing, and are looking to bring visual editing to smartphones and tablets soon. We'll put more effort into improving media contribution, including video, as well. And and and .. come to my talk :)

Q: Have you enjoyed previous FOSDEM editions? 

First one! Really excited to get the FOSDEM experience I've heard so much about.
