---
year: 2017
speaker: matthew_hodgson
event: encrypting_matrix
---

Q: Could you briefly introduce yourself?

I'm Matthew Hodgson, technical co-founder of [Matrix.org](http://matrix.org/). I started the Matrix project with the rest of the team back in May 2014 in order to create a new open ecosystem for decentralised and interoperable communication on the net.

Q: What will your talk be about, exactly? Why this topic?

I'll be describing the process we've gone through in adding end-to-end encryption to the core of the Matrix, by writing [Olm](https://matrix.org/docs/spec/olm.html) - a new Apache-licensed implementation of our own version of the [Double Ratchet Algorithm](https://whispersystems.org/docs/specifications/doubleratchet/), and then extending it to [Megolm](https://matrix.org/docs/spec/megolm.html), a new ratchet optimised for group chats with persistent history as is typical in Matrix.  We'll be explaining the public audit that we went through for libolm with [NCC Group](https://www.nccgroup.trust/), and some of the interesting bugs that we've hit along the way.

This topic is critical as Matrix is decentralised, and so dependent on end-to-end encryption to protect the privacy of rooms from any of the admins or intermediaries who might have access to the servers participating in a node.  Also, end-to-end encryption communication has also never been so topical for the world in general as it is today.

Q: What do you hope to accomplish by giving this talk? What do you expect?

We hope the talk will explain Matrix's encryption capabilities, inspire FOSDEM attendees to experiment with Matrix for encrypted open communication, and encourage folks to use the Olm and Megolm cryptographic ratchets in their own projects!

Q: What's the history of the Matrix project? Why did you start it and how did it evolve? Is this what you planned it to be?

Matrix began in 2014 as an overambitious project to create an entirely new open ecosystem for decentralised communication - effectively a real-time decentralised pubsub layer for the Web which could be used for exchanging instant messaging, group chat, VoIP signalling, IoT data, email, forum posts etc without any single point of control or failure.  We started this because we were fed up with how fragmented communication had become - that proprietary closed silos were eclipsing open interoperable communications, and the end-user is suffering - trapped in a given proprietary silo or forced to install multiple communication apps to talk to different contacts, having entirely lost control of how they communicate.  As a team, we'd spent 10 years building proprietary apps like these for telcos and similar and had contributed to the problem first hand.

So we decided to take our experience and create Matrix to try to fix the situation: to provide an open neutral fabric that can connect together the different communication islands (IRC, Slack, Gitter, Telegram, XMPP etc) out there, and act as a platform for a whole new wave of interoperable communication apps on the web.  Matrix has evolved quite rapidly considering the scope of the project, with large numbers of clients, bridges, bots, servers, etc contributed both by the community and the core team.  Growth is currently exponential, with over 1200 active servers, over 750K accounts on Matrix.org alone, and busy nodes like Matrix.org itself pushing over 1000 messages/second.

There's still a long way to go - Matrix is still technically in beta, as is our E2E encryption, and there are some significant missing pieces of functionality: threading, editable messages, reactions, upvote/downvote, etc.  We also have more work to do on server performance and scalability, VoIP conferencing, and client UX.  Whilst we wish we could go faster, we're still relatively happy with the progress so far.

Q: Where is the Matrix communication protocol used? What are some interesting applications we should know?

Matrix is used in lots of different places!  Some people use it as a native communication protocol as a FOSS alternative to Slack or WhatsApp - using a client like [Riot](https://riot.im).  Many others use it as a way to connect to other networks and protocols - effectively as a great big decentralised IRC, Slack or Gitter bouncer, running client apps like [WeeChat](https://weechat.org/) or Riot.  Other people use it as a global decentralised IRC network, using projects like [matrix-ircd](https://github.com/matrix-org/matrix-ircd) to connect via their favourite IRC client.  Then you have various companies like [Ericsson building commercial solutions on top](https://matrix.org/blog/2016/11/23/when-ericsson-discovered-matrix/).

Some of the most fun examples of Matrix have been using it as a communication protocol for arbitrary data - e.g. routing MIDI over Matrix, 3D animated avatars and virtual worlds, VR telepresence, Parrot drone telemetry/control/videofeeds, or Adafruit LED strip lighting, etc.  As time goes on we're hoping to add arbitrary datastructure synchronisation to Matrix as well as today's timeline & key-value primitives, making some of these more exotic use cases a bit more practical!

Q: With libolm you have implemented the Double Ratchet Algorithm as used in Signal, WhatsApp, Facebook Messenger and Google Allo for end-to-end encryption. Does this also mean users of a Matrix client could communicate with users of those applications?

Not directly. For direct interoperability with Signal, WA, FB, Allo etc you'd need to talk precisely the same bitwise line protocol with precisely the same key management semantics.  In effect, you'd have to write a multi-head messenger that spoke all the different dialects, which rapidly becomes unwieldy.  However, if you ran Matrix bridges to these protocols on a trusted device (e.g. your client device, or a trusted server), then it could decrypt the network-specific traffic and re-encrypt it into Matrix E2E for interoperability with the rest of Matrix, which may be an adequate solution.  For instance, I'm running an iMessage bridge on my laptop which currently decrypts/encrypts iMessages and recrypts them to liberate them into Matrix.

Q: How difficult is it so set up your own homeserver to join the federated network of Matrix servers?

It's very similar to setting up a webserver.  You need to expose an HTTPS listener (traditionally port 8448, because if you arrange the numbers 8448 in a 2x2 grid it looks like a diagonalized matrix ;), and ideally you should set up a DNS SRV record.  But as long as your host can run Python and [Twisted](https://twistedmatrix.com/trac/), it should be pretty straightforward.

Q: How can interested people contribute? In which domains could you use some help?

We accept contributions across the board - to the servers, client SDKs, clients, bridges, bots and the spec itself.  Good starter issues are tagged in github as 'easy'.  We really could do with particular help in writing more bridges to more platforms, especially finishing off the matrix-appservice-purple bridge that connects anything that libpurple can connect to into Matrix.  We could also do with help in improving performance and features in matrix-react-sdk; the main client SDK for web-based Matrix clients.

Q: Which new features can we expect this year in Matrix?

E2E encryption will be exiting beta; we'll be adding support for extensible profile data; Group ACLs and definitions (e.g. "invite a group to a room!", and "show that a user is a member of a given group"; threading support; reactions; upvote/downvote and other self-moderation and anti-spam/abuse features; support for phone numbers as 3rd party identifiers; and hopefully making progress towards decentralised identity & reputation infrastructure.

We'll also see the arrival of [Dendrite](https://github.com/matrix-org/dendrite) - a new homeserver from the core team, written in Golang and optimised for high scalability and availability.  In an ideal world we'll also make progress towards decentralising accounts as well as communication data, but that might be a stretch at this point!

Q: Have you enjoyed previous FOSDEM editions?

Honestly, FOSDEM is one of the most enjoyable conferences we've been to.  It's like walking into all your favourite newsgroup, LWN and HN discussions but in real life (and with unlimited Chimay bleu!).  We can't wait for the weekend!

