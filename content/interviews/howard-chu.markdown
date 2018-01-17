---
year: 2018
speaker: howard_chu 
event: monero 
---

Q: Could you briefly introduce yourself?

Sure, I've been writing free/open source software since the 1980s, working on everything from kernels, filesystems, compilers and other dev tools to user apps like Mozilla Suite. I founded Symas Corp. (with 5 partners) in 1999 to focus on development of [OpenLDAP](https://www.openldap.org/) and have been that project's Chief Architect since 2007.

Q: What will your talk be about, exactly? Why this topic?

I'm introducing people to the [Monero](https://getmonero.org/) cryptocurrency (CC). CCs have become quite a hot topic and there's literally thousands of them out there today but very few people understand anything about what they are or what they're good for. The majority are scams, and in my opinion it's vital to educate as many people as possible about how things work.

Q: What do you hope to accomplish by giving this talk? What do you expect?

This talk gives a very brief intro to blockchains and their important properties. My aim is to teach people about what makes them actually useful, as opposed to just vehicles for hype.

Q: How does the chief architect of OpenLDAP become involved in a privacy-focused cryptocurrency? What attracted you to Monero?

To be honest, I never had any interest in cryptocurrencies. When the [Bitcoin whitepaper](https://bitcoin.org/bitcoin.pdf) was published in 2008 I dismissed the tech as garbage - "you'd have to be an idiot to try to develop a global distributed database on top of an inherently unscalable data structure like this linear 'blockchain'." In 2014 the Monero Project reached out to me, because they wanted to use our [LMDB](https://symas.com/lmdb/) embedded database engine as their blockchain data store. So for me this has always been a distributed database project, something that I have deep interest in, and not really an economic/financial project.

Q: There are a few cryptocurrencies that promise privacy. How can we evaluate their promises?

A good litmus test for a so-called "privacy-focused" cryptocoin is: does it have a richlist? I.e., is it possible to see the amounts stored in all of a coin's wallet addresses, and compile a list of the wealthiest holders?

E.g.:

  * [DASH](https://bitinfocharts.com/top-100-richest-dash-addresses.html)
  * [Verge](https://verge-blockchain.info/richlist)

Thus far, Monero is the only coin for which it is impossible to compile a richlist. 

Q: What is the meaning of the economic term fungibility, and why is it important for users that Monero is truly fungible?

This gets to the heart of my talk. Quite simply, fungibility means that any token in a currency is always worth its face value and is completely interchangeable with any other token of the same face value. This property is a fundamental requirement of a working currency. It means when someone pays you with X amount, you know it's actually worth X amount and you can go on spending that X amount elsewhere without any risk of obtaining less than the stated value X.

Q: What does Monero's community look like? How can interested developers contribute? In which domains could the project use some help?

It's a pretty open, decentralized project. There's a 7-member core team who act as stewards for the project, and a larger number of actual developers. (GitHub shows that the core codebase has had 139 contributors. There's a variety of other peripheral projects such as the GUI as well.) There's also the [Monero Research Lab](https://lab.getmonero.org/) that has a couple of PhD researchers tasked with investigating new technologies to make Monero more scalable, even more secure, etc.

Unlike the majority of cryptocurrencies, which are derived from the Bitcoin codebase that appeared in 2009, Monero's codebase began in 2014 so it doesn't have the same ease of adoption as other coins, which can simply reuse the Bitcoin APIs. This aspect has improved greatly over the past year, but I think integration with 3rd party platforms is probably still one of the weakest points.

Interested developers should join us on freenode IRC, in #monero and/or #monero-dev to talk about project ideas. Or just browse the issues on [GitHub](https://github.com/monero-project) and see what catches your eye.

Q: Which new features can we expect this year in Monero?

Every year brings a number of exciting new developments; off the top of my head, this year we'll see the release of support for multi-signature transactions, multi-address wallets, massively reduced transaction sizes, and a few other goodies.

Q: Have you enjoyed previous FOSDEM editions?

Indeed, I've spoken at a number of previous editions, presenting talks on OpenLDAP and LMDB. FOSDEM is a brilliant conference, unique in not only the FOSS world but in the computing industry in general. I'm very pleased to be returning this year.
