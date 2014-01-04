---
year: 2014
person: Daniel Naber
speaker: daniel_naber
topic: "How we found a million style and grammar errors in the English Wikipedia... and how to fix them"
event: how_we_found_600000_grammar_errors 
---

Q: Could you briefly introduce yourself?

I'm a freelance software developer from Potsdam, Germany. I've been involved with open source for more than ten years. Nowadays, I spend most of my time working on [LanguageTool](http://languagetool.org) and [OpenThesaurus](http://openthesaurus.de), the German thesaurus that is also used in LibreOffice and OpenOffice.org.

Q: What will your talk be about, exactly? Why this topic?

It's about LanguageTool, an open source style and grammar checker. Compared to all those fashionable mobile apps and 3D software, a grammar checker might sound a bit boring to a lot of people, so I'll try to show that it can actually be useful on a large scale - by running it on the English Wikipedia.

Q: What do you hope to accomplish by giving this talk? What do you expect?

If you look at [the statistics at ohloh](http://www.ohloh.net/p/languagetool), you'll see we have a slow but steady growth. I don't remember any earth-shaking events in the history of LanguageTool, we've just continued working on it while some other open source grammar checkers are unmaintained now.

Q: Running LanguageTool on a random 20,000 article subset of the English Wikipedia led to a lot of false alarms. What are currently the biggest limitations of LanguageTool that result in these errors?

No one from the development team is a native English speaker, so while we have a lot of rules that detect problems in English text, we have nobody who maintains those rules - adds new rules, improves existing rules etc. While LanguageTool as a project is in very good shape, the support for some languages isn't. Maybe your native language in LanguageTool is also in need of a new maintainer? We have [a list of supported languages](http://languagetool.org/languages/) - contact us if you want to join the LanguageTool team. Note that you don't need to be a software developer for that.

Q: Can you tell us something about the LanguageTool community? How many people are working on it? And how can someone interested in the project help?

We're about ten people contributing regularly. A lot of that happens by writing new error detection rules, which are written in XML, so no programming is required for that. You don't have to be a linguist either, the basic idea of error detection is [quite easy to understand](http://wiki.languagetool.org/development-overview#toc0).

Q: Have you enjoyed previous FOSDEM editions?

Despite my long-term involvement in open source, it's actually the first time for me.
