---
year: 2019
speaker: matthew_hodgson 
event: matrix_french_state
---

Q: Could you briefly introduce yourself?

I'm Matthew Hodgson, the project lead for [Matrix.org](https://matrix.org/) --- the open source project that develops the Matrix protocol and network for decentralised, end-to-end encrypted, open communication.  I split my time between working on the Matrix spec, governance and reference implementations, working with the wider Matrix community, and running New Vector: the startup we formed in 2017 to fund the core Matrix dev team and provide consulting and hosting services around Matrix.

Q: What will your talk be about, exactly? Why this topic?

We'll be talking about how Matrix has finally come of age during 2018 --- thanks in no small part to the adoption of Matrix by the French Government as the official communications platform throughout their public sector.  We'll go through how they've deployed Matrix at scale, and how they've made the most of decentralisation (with each ministry running its own operationally independent deployment), as well as administrating the deployments at scale via [Ansible](https://www.ansible.com/) and [Grafana](https://grafana.com/)/[Prometheus](https://prometheus.io/). We'll give a demo of the official (FOSS!) client that they've developed, and detail all the features and refinements which their deployment helped drive.

We'll also be explaining all the good stuff which is landing in Matrix 1.0 --- as we finally exit beta!!  This includes a guide to all the end-to-end encryption refinements needed to enable it by default (as required by France) --- and the federation bugfixes that were required to exit beta (and the upcoming 'hard fork' as we prepare to upgrade all the rooms to the new room federation protocol).

Finally, we'll show off the release candidate for the imminent radical redesign of [Riot](https://about.riot.im/), Matrix's flagship client app --- and hopefully prove to everyone watching that it's possible to have a truly FOSS and decentralised communications client which looks and feels better than either Discord or Slack :D

Q: What do you hope to accomplish by giving this talk? What do you expect?

We're giving this talk primarily to draw attention to the amazing way in which major governments are now embracing open source in areas which are traditionally very proprietary and closed.  We are lucky to live in a world where France would support Matrix and help us exit beta rather than blindly using Slack or something similar.  Hopefully this will inspire other FOSS projects to collaborate with clueful government agencies, as well as reassure organisations of all sizes that open communication technologies like Matrix are finally ready for primetime.

Q: Two years ago you gave a main track talk at FOSDEM about end-to-end encryption in Matrix. What's the status now?

So back in 2017 we had just introduced our first official cut of E2E Encryption in Matrix via the Olm and Megolm cryptographic ratchets.  The actual cryptography was audited and robust, but the UX around it had a lot of issues which we've been working through since.  Particular highlights include:

  * How do you backup your E2E keys to recover your history if you lose your device?  (Assuming that users never do manual backups...)
  * Why should you have to compare key fingerprints for each device you talk to?  Shouldn't it be good enough to just compare the user's fingerprint?
  * Aren't there better verification mechanisms than comparing fingerprints? (comparing short authentication strings, scanning QR codes, etc.)?
  * If there's a network partition or race, how do you even know what devices are in the room, and who you should be encrypting for?
  * How do you encrypt messages for users who aren't yet in the room (so you don't know what devices they have?)
  * How do you search E2E-encrypted messages?
  * How do you provide keyword notifications for E2E-encrypted content?
  * ...and much much more.

The good news is that we've cracked almost all of these now, and they should be landing in the Matrix 1.0 spec and Riot redesign.  So, it's full circle to be back in Janson to tell everyone that we finally completed the "what's next?" todo list from 2017, and that E2E is pretty much ready to be turned on by default.

Q: So last year the French government deployed a massive federation of Matrix servers with millions of users. What were the biggest challenges for Matrix to work at this scale and what changes were needed?

Luckily scaling isn't one of the challenges which we've faced in the French deployment, mainly due to the somewhat unorthodox approach we've taken of dogfooding the default Matrix.org homeserver as a really really big deployment (3.5M accounts; 1.5M rooms; 1.1M monthly visitors), with the intention of forcing us to architect Synapse to scale at that sort of level.  The situation is made easier by France currently being a private federation, so there are no high-membership public or bridged chatrooms (yet) chewing up resources, which accounts for most of the dramas the rest of us face on the public Matrix network!

The key things which have let Matrix scale well here are: deploying separate deployments for every ministry, so naturally using decentralisation to split up the whole deployment over ~60 operationally independent clusters --- and ensuring each deployment can run in a scalable worker configuration (i.e. offloading as much processing as possible to worker processes to provide some level of horizontal scalability).  This, plus the general performance work which has gone into Synapse this year (migrating to Python 3 by default and constant profiling and eliminating hotspots) means that perf is looking cautiously positive.

Q: Do you have some suggestions or best practices for other governments that want to follow the example of France?

All the server-side work for France has ended up back in the main [Synapse repositories on GitHub](https://github.com/matrix-org/synapse), so any other interested governments should try spinning up a simple Synapse and seeing how it feels!  This is how things began with France: in our first meeting with them we assumed we'd be explaining how Matrix worked... but instead they explained to us how they'd been experimenting already with their own FUSE-based antivirus-capable Matrix media repository(!).

Needless to say, the mission of the Matrix.org Foundation (the non-profit entity we've set up to safeguard the evolution and governance of the protocol) is to nurture Matrix uptake throughout the ecosystem. Governments reading this should feel free to reach out to us with any questions.

Q: What does the Matrix community look like? How can interested people contribute? In which domains could you use some help?

The community spans those who work on the core project (i.e. the [matrix.org](https://github.com/matrix-org) repositories on GitHub) and those who are building projects on top of the protocol.  Right now we have several hundred active FOSS projects building on the Matrix protocol (as well as an unknown amount of proprietary antics).  Much of the core project work is still done by the original team, but GitHub tells me that there are at least 200 other folks contributing PRs from the outside to Synapse and Riot. Contributions tend to be skewed understandably towards clients, which are easy to write and well specified - whereas servers have historically been badly specified as well as inevitably challenging to develop.  This should now be fixed with Matrix 1.0 on the horizon, where we will release the first stable spec for the server<->server API.

In terms of particular domains where we could do with help:

  * [Dendrite](https://github.com/matrix-org/dendrite) is our next-generation server written in Go and [Kafka](https://kafka.apache.org/) with a beautiful horizontally scalable architecture... which currently resembles a 75%-assembled sports car sitting lonelily in a garage.  This is because we needed to iterate on Matrix a lot for 1.0, and opted to do this on the current Synapse codebase rather than splitting the effort between Synapse and Dendrite.  However, we do make sure that anyone wanting to contribute to Dendrite is well supported --- and once Matrix 1.0 is out the door we'll be heading back to work on it ourselves. However, contributions are still *really welcome*.  Search for "good first issue" in GitHub to get going.
  * There are *lots* of low-hanging fruit in Riot still which could benefit from contributions.  Found a bit of unintuitive UX?  Check with us in #riot-dev:matrix.org and then PR a fix!
  * There are many amazing desktop Matrix clients in development, including Fractal, Quaternion, Seaglass, Nheko-Reborn, Spectral, Gomuks etc.  All of them are genuinely fun to hack on with super-supporting communities that would love contributions!
  * Moar bridges!
  * We always need more translators and translations. Our [Riot GitHub repository](https://github.com/vector-im/riot-web) tells you how to get up and going.

Q: Which new features can we expect this year in Matrix?

Well, first of all we have to land the 1.0 release of the spec, shortly followed afterwards by 1.0 of Synapse (once everyone has upgraded to use the new room federation algorithm specified in 1.0).

Then, we have a large menu of post-1.0 features to look at. Particularly interesting options include:

  * Landing all the resource utilisation improvements which have been blocked behind 1.0 on Synapse.
  * Adding configurable message retention.
  * Adding resource usage visualisation and management APIs.
  * Reworking and improving Communities/Groups.
  * Reactions.
  * Finishing E2E-encrypted Search and Notifications.
  * Filtering (empowering users to filter out rooms and content they’re not interested in).
  * Extensible events.
  * Editable messages.
  * Extensible Profiles (we’ve actually been experimenting with this already).
  * Threading.
  * Scaling Synapse via sharding the master process.
  * Bridge UI for discovery of users/rooms and bridge status.
  * Finishing the Riot/Android rewrite in Kotlin (currently called RiotX).
  * Considering whether to do a similar overhaul of Riot/iOS.
  * Bandwidth-efficient transports.
  * Bandwidth-efficient routing.
  * Getting Dendrite to production.
  * Inline widgets (polls etc).
  * Improving VoIP over Matrix.
  * Adding more bridges, and improving the current ones.
  * Account portability.
  * Replacing MXIDs with public keys.

I can't guarantee we're going to get to all of that this year, but it gives you an idea of the sort of things being weighed up.

Q: Have you enjoyed previous FOSDEM editions?

Enormously :-) FOSDEM continues to be my favourite conference bar none --- my only complaint is that it's over too soon and I end up stuck at the Matrix stand in the Real Time Lounge and miss out on everyone else's talks!
