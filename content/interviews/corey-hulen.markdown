---
year: 2019
speaker: corey_hulen 
event: mattermost_layered_extensibility 
---

Q: Could you briefly introduce yourself?

My name is Corey Hulen and I am the CTO & Co-founder of [Mattermost](https://www.mattermost.com/), an enterprise-grade messaging solution for the world’s leading organizations on a [vibrant open source platform](https://www.mattermost.org/).

Q: What will your talk be about, exactly? Why this topic?

My talk will be about how Mattermost approaches extensibility in open source through our developer toolkit.  Although an open source application can be extended in just about any way, we find it easier to offer different layers with skill sets geared towards different audiences.  You pick the level you are comfortable at to make your integration successful.

Q: What do you hope to accomplish by giving this talk? What do you expect?

My hope is to encourage more people to contribute awesome integrations for Mattermost using our developer toolkit.  A secondary goal would be to encourage more people to contribute to Mattermost in general, especially beyond developers.

Q: The history of the Mattermost project is quite interesting: originally you were a game company, but after being locked in by a proprietary messaging service, you decided to build your own and then make it open source. How did it evolve? And has it become what you planned it to be when you started developing Mattermost?

We started Mattermost when our frustration boiled over when we tried to export our data and migrate away from an existing proprietary messaging service.  We felt it’s our data, we own it and it was nearly impossible to get at it.  First and foremost at Mattermost we believe in open data, in that it’s your data you own it and you should be able to do whatever you want with it.  This also governed our database choice of plain old SQL since it’s a ubiquitous platform with great tools that allow for easy access and understanding of the data model.

Q: Mattermost was built as an open source platform with an open and accessible data model, supporting a variety of extensions. What were the biggest challenges in developing this extensible architecture?

We provide both frontend and backend extensions.  There is really 3 separate plugin systems, web, mobile, and server, that need to be built and maintained.  It's also a system that’s undergoing a lot of change so we have to balance breaking changes with adding fantastic new functionality in our plugin system.

Q: Suppose I want to develop an integration for Mattermost. Where do I begin? What do I need to do? Are there some best practices?

The best place to get started developing integrations for Mattermost is on our [Getting started page for integrations](https://developers.mattermost.com/integrate/getting-started/). That will walk you through all the different integration points and help you pick the best ones for your needs.

If you're looking to do some serious and deep integration, take a look at [plugins](https://developers.mattermost.com/extend/plugins/). They give you the power to hook into and customize the Mattermost server and clients in ways your standard integration points cannot. The best starting point for plugins after the documentation would be the [demo plugin](https://github.com/mattermost/mattermost-plugin-demo) that showcases some of what plugins can do and can act as a good starting point for your plugin.

Q: What does the Mattermost project's community look like? How can interested people contribute? In which domains could you use some help?

The Mattermost project is a thriving community of contributors around the world who love to work in Go on the backend and React/React Native on the front end.  If you’re looking to contribute please see our [Getting started page for contributions](https://developers.mattermost.com/contribute/getting-started/).  We are looking for all disciplines.  Although we attract a lot of developers, I would love Mattermost to get better at attracting more designers, product managers, quality assurance and localizers.

Q: Which new features can we expect this year in Mattermost?

We’re currently working on bot accounts for Mattermost that will ship in a few months.  This should really help with our extensibility story as it will allow for the creation of accounts that do not require an email/password login and are not tied to an existing user.  The bot account will be able to post to any channel in the system, whether it’s a private team, private channel or a direct message channel.  We are also starting some larger initiatives around the Mattermost end user experience and upgrading the UI/UX of all our frontend clients.

Q: Have you enjoyed previous FOSDEM editions?

I have not attended a previous FOSDEM, but I’m looking forward to new editions going forward.  Our EU contributors and team members are the ones who turned me onto all things FOSDEM.  I’m excited to be a part of the community and make the journey from the United States for the conference.
