---
year: 2016
speaker: [adrien_beraud, guillaume_roguez]
event: universal_network 
---

Q: Could you briefly introduce yourself? 

**Adrien Béraud**: I'm a software engineer at [Savoir-faire Linux](https://www.savoirfairelinux.com/) in Montreal (Canada). I work mostly as a maintainer of the [OpenDHT](https://github.com/savoirfairelinux/opendht) library and as a developer of the [Ring](https://ring.cx/en) Android client. Free software enthusiast, I'm passionate about robotics, artifical intelligence and distributed systems such as Bittorrent, Bitcoin and distributed hash tables. Such interest prompted me to imagine a distributed system to communicate in real-time. Then OpenDHT was born.

**Guillaume Roguez**: I'm a senior free-software consultant and I lead the Ring project team. Over the past 15 years, I worked on different projects, like porting Blender and Python. There are so many things to create and improve for Ring that it's a great challenge! We are a small team and we get good results because we are all passionate. Ring is a free project for everyone on the planet. I'm proud to manage it and I'm honored to introduce it for the FOSDEM.

Q: What will your talk be about, exactly? Why this topic?

**Guillaume Roguez**: Distributed communication is the present and future of our networks. We will explain how it is possible to build a peer-to-peer network for Real-Time exchanges through the example of Ring. This is free software, without point of control. Our goal is that it will be used everywhere and everyday in professional and non-professional environments, whatever be the running connected devices.

During the main track, we will especially talk about the concept of a distributed network, the usefulness of a decentralized database like OpenDHT to pass through NAT, the security issues to protect user privacy and opportunities offered by these technologies for all developers who want to use them. Our goal is to share our difficulties and solutions with the open source community.

Q: What do you hope to accomplish by giving this talk? What do you expect?

**Guillaume Roguez**: We want to share our experience and we hope that some developers will be interested in joining the Ring adventure. It should be soon in beta version. We had to face some technical challenges and others are ahead of us. Many ideas can be introduced and Ring is a good platform to test them.

We would also be happy if this presentation provides some ideas to create a new application, especially if it's based on our work. Ring and OpenDHT are under the GPLv3 license. Their source code is therefore available.

Q: Most people know the concept of a distributed hash table from protocols like BitTorrent. How is OpenDHT different? Which unique features has it to accommodate distributed communication with Ring?

**Adrien Béraud**: The largest DHT network, the BitTorrent mainline DHT, is a distributed data store mapping torrent “magnet” to peer IPs, allowing peers to find each other. This approach is not secure or powerful enough for the distributed communication platform we envisioned. OpenDHT allows us to store arbitrary data on a light, general-purpose distributed key-value data store, including encrypted data, certificates etc.

OpenDHT has also a listening function (listen) enabling a node to be informed of changes in key values. This function is for example used in Ring to enable receiving calls or messages, even for computers behind NAT. In conjunction with the ICE technology, OpenDHT then allows the robust establishment of peer-to-peer connections.

Q: How does Ring differ from Skype in its distributed nature?

**Adrien Béraud**: Both Ring and Skype can be used to perform rich audio/video calls and conferences. However, Skype is proprietary software that requires users to trust and provide personal data to a large corporation that has de facto control over user communication. On the other hand, Ring allows to place calls by establishing direct peer-to-peer connections, without any form of registration to any entity, making use of a fundamental property of the Internet. As a free communication platform, Ring can also be used for other purposes like building private communication networks or building connected objects. 

Q: Does SIP support a peer-to-peer network or did you have to change something in the protocol? 

**Guillaume Roguez**: Not so much, SIP supports a direct connection between two peers as both ends open a SIP port that can be reached in a P2P way. But SIP doesn't handle the connection itself: how to find a peer, how to contact it. This is what OpenDHT does.

So we've not changed the protocol itself. We use our OpenDHT technology for what the SIP protocol can't do.

Q: Which new features can we expect in Ring and OpenDHT this year? 

**Guillaume Roguez**: Ring will have big new features. For example, we will add secure file transfer. We will propose a public version on the Android platform. And, for its beta version, Ring will have better visual front-ends.

**Adrien Béraud**: We also hope to add data indexation on the OpenDHT network thanks to research at the UQAM University (Montreal). That would allow us to optionally publish and search user profiles or select random relay nodes. Data persistance was recently implemented. Thus, it will soon be possible to use the DHT to store undelivered encrypted text messages.

Q: How can interested people contribute to Ring?

To join the Ring adventure, there are various public tools:

  * [General information](https://ring.cx) (find binary packages, documentation links, news, ...)
  * Discussion:
    * [Mailing List](https://lists.savoirfairelinux.net/mailman/listinfo/ring)
    * IRC : #ring on freenode.org
  * Development:
    * [Issue tracking](https://tuleap.ring.cx/projects/ring/)
    * [Patchset review and repository firewall](https://gerrit-ring.savoirfairelinux.com)
  * [Online translation](https://www.transifex.com/savoirfairelinux/ring/)

Q: Have you enjoyed previous FOSDEM editions?

**Guillaume Roguez**: I've never attended previous editions, but I know its existence by watching videos on YouTube. For us it's one of the most important open and free related technologies conference in Europe, so we're honored to be selected this year!

**Adrien Béraud**: As a free software enthusiast I followed the most important or interesting talks and announcements online. and I'm honored and very exited to attend it in person for the first time.
