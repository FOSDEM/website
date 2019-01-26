---
year: 2019
speaker: [guido_trotter, dylan_reid] 
event: crostini
---

Q: Could you briefly introduce yourself?

**Guido:** I’m Guido, and I come from Italy. I love cooking, traveling, and open source software.

I’ve presented at FOSDEM for many years, and I’m excited to be back, for the second time on the big stage.

**Dylan:** I’m Dylan. I work at Google in California. I work on Chrome OS maintaining the audio, Android, and Linux subsystems. This is my first time attending FOSDEM. I’m looking forward to meeting everyone.

Q: What will your talk be about, exactly? Why this topic?

I recently joined the Google ChromeOS Enterprise team, and wanted to go back to talk at my favorite conference. So I invited my colleague Dylan, the Linux on ChromeOS (Crostini) Lead, to make a two-people talk about this feature, an exciting platform for the Linux desktop, targeted at developers.

Q: What do you hope to accomplish by giving this talk? What do you expect?

In this talk we hope to spread knowledge about the running Linux containers on ChromeOS, the technical details of the [Crostini](https://chromium.googlesource.com/chromiumos/docs/+/master/containers_and_vms.md) platform, interest free and open source software developers to try it, maybe use it in some environments where it would be appropriate, and perhaps even contribute to it.

Q: What's the history of the Crostini project? What was the motivation to start it? How did it evolve?

The possibility to securely and easily run a full Linux environment on ChromeOS is a new feature, still in Beta. It was created to enable developers to use their favorite tools and familiar commands with the speed, simplicity and security of Chrome OS.

Q: Which configuration possibilities do users have for their Linux containers in Crostini?

While there is a standard container, which is based on Debian, users can both modify that one at will, or install a different distribution to their liking. The only restriction is that, for security reasons, the containers all run on the same monolithic kernel, so what is included there is decided centrally. We are working towards enabling some very requested features like FUSE filesystems. 

Q: Which types of interaction are possible between the Chrome OS system and Crostini containers? Can the network, storage and clipboard be shared?

In general, we want Linux apps to have access to all the resources that other apps on ChromeOS can access. To do this while maintaining Chrome OS's security and privacy, we restrict access by default but give the user ways to share resources with the container.

Crostini containers are by default granted an outgoing network connection, natted via their host VM and ChromeOS. Resources that can be shared are files (by copying them inside the container filesystem), entire ChromeOS or Google Drive folders, and clipboard content. We are working on enabling more and more resources to be shareable with the container.

Q: What are currently the most important limitations of the Crostini approach?

The impossibility to change the kernel, that I mentioned above, is probably the most important one, that is unlikely to change. Other limitations are being addressed in future versions, and include audio and GPU support.

Q: How does Crostini compare to Crouton?

Crostini is inspired by Crouton, and enables Linux containers without putting the device in dev mode. This can be important in enterprise deployments and to target a wider variety of users, at the expense of some flexibility, for example on the kernel level.

Q: Which new features can we expect this year in Crostini?

As mentioned above, we’ll be focusing on addressing the most important integration features (audio, GPU, FUSE) and on enabling developers to make a turn-key use of the platform. 

Q: Have you enjoyed previous FOSDEM editions? 

FOSDEM is one of my favorite conferences, and I always try to come to it. I look forward to this edition, and to meet new people and talk with long time friends and colleagues.
