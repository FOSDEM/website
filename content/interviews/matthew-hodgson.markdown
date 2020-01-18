---
year: 2020
speaker: matthew_hodgson
event: matrix
---

Q: Could you briefly introduce yourself?

I'm Matthew Hodgson, and I'm the project technical lead for [Matrix.org](https://matrix.org) --- the open source project for decentralised communication.  Our mission is to provide an open protocol and global open network for secure real-time communication which is usable by mainstream users: freeing them from being held hostage by proprietary closed silos from Facebook, Google, Apple and others.  The hope is for Matrix to someday become a standard communication layer for the Web itself.

My day job is CEO/CTO of [New Vector](https://vector.im), the company we formed a few years ago to keep the Matrix core team funded to work on Matrix full-time --- and I'm also one of the five Guardians (Directors) of [The Matrix.org Foundation](https://matrix.org/foundation/), which we set up to act as a neutral custodian of the Matrix protocol.

Q: What will your talk be about, exactly? Why this topic?

The talk is called "Making and Breaking E2E Encryption in Matrix", and we'll be talking about the huge journey we've been on to enable End-to-End Encryption by default for private conversations in Matrix... and we'll attempt to demonstrate our threat model by demonstrating how you might try to compromise it and the sort of attacks we protect (and don't protect) against.

E2E encryption has been a big challenge for us since we first added it a few years ago, as the decentralised nature of Matrix poses a whole new set of usability issues.  After all, in a decentralised network, you don't even know what devices (or users!) you are actually meant to be encrypting a message for.  If there's a temporary split in the network and someone joins on a remote device, you won't know to encrypt for them... but they'll feel very upset if they can't decrypt your messages.  Similarly, E2E encryption is only any good if you have verified the keys of the person you're talking to --- and solving that with good UX in an efficient manner in a world with no central authority (i.e. by cross-signing your devices, while avoiding the clunkiness and metadata leaks of PGP) has been a huge mission.  We've also had to go and re-implement E2EE compatible versions of all sorts of features (full-text search, notifications, file indexes etc) which previously had been taken for granted.  And to avoid locking non-E2EE users out, we've built [pantalaimon](https://github.com/matrix-org/pantalaimon/) --- a local daemon which you can run which offloads all your E2EE for you.

Solving these dilemmas and many similar ones has been a genuine epic, but we believe we've got there in the end and are in the process of turning on encryption by default in time for FOSDEM (fingers crossed).  We want to explain the issues we hit, and how we fixed them!

Q: What do you hope to accomplish by giving this talk? What do you expect?

The overall goal of the talk is to try to illustrate first-hand the attacks we were trying to prevent when designing Matrix's end-to-end encryption (both at the protocol, application and UX layers), and so raise awareness of the things that E2EE can protect against (and the things it can't).  We also want to illustrate why it took us so long to turn it on by default, and demonstrate how the combination of cross-signing and key verification can create a very strong localised web-of-trust without globally leaking metadata.  Finally, we want to ensure everyone knows that pantalaimon exists and is an excellent way to interact with E2EE rooms without needing to be a cryptography expert!

In the end, we hope folks will go away feeling happy rather than frustrated that all their Matrix DMs are now encrypted.

Q: What has changed in the 6 years that Matrix has been in development? Has the original vision changed or become clearer?

We started building Matrix in May 2014 and launched in Sept 2014, so it's not /quite/ been 6 years yet ;)  But eitherway, it's been a long time to be working on a project like this, and it's fascinating to see how it's evolved.

Curiously the original vision has stayed very much the same - if you look at the [README from launch day](https://github.com/matrix-org/synapse/blob/7819a1010c8a12df71c60b5acf8ed6d28509beea/README.rst) it basically describes the same system we have today --- other than the "End-to-end encryption is currently in development" footnote finally being outdated!   Instead, the 6 years has been spent fleshing out that original skeleton --- trying to make Matrix more and more stable, polished and mainstream, building clients like [Riot](https://about.riot.im/) (which only launched in 2016), implementing E2EE, building decent bridges to other systems, formalising the spec & governance model, getting [Synapse](https://github.com/matrix-org/synapse/) out of beta, finding ways of funding the project, experimenting with next-gen servers etc.  And in all honesty, we really rushed through the original implementation back in the summer of 2014, and subsequently have burnt quite a lot of time paying off the tech debt accumulated from those early days, while juggling with the operational burden of keeping the network relatively healthy.  However, the good news is that we did exit beta at last year, and now with E2EE being enabled by default there's a real feeling of coming of age.  Once the remaining UX issues are solved on Riot and serverside performance is improved further, Matrix really should be able to take on the big guys.

Meanwhile, we're also looking ahead to making the first massive changes in Matrix's architecture since 2014 --- going fully peer-to-peer.  We actually have a separate talk on that this year, called ["The Path to Peer-to-Peer Matrix"](https://fosdem.org/2020/schedule/event/dip_p2p_matrix/) in the Decentralised Internet devroom.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS, or how did Matrix in particular benefit from FOSDEM?

FOSDEM continues to be the highlight of our year!  There is literally no other conference in the world which brings together the free & open source software community like this --- and the energy is undescribable that emanates from talking to folks working on similar projects, or building on Matrix or just using it.  One minute we can be brainstorming problems with our neighbours at XMPP, next minute we could be syncing with Purism on their plans for Matrix on the Librem5, next minute we can be hunting down some nightmare bug which a long-suffering user has brought to us in person.  FOSDEM has also been an excellent opportunity to try to explain to the wider community where the project is going, and what we've been up to, and the visibility given by the excellent talk recordings and facilities is enormously appreciated.

Q: Have you enjoyed previous FOSDEM editions?

Without exception :)
