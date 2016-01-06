---
year: 2016
speaker: alexander_bokovoy
event: freeipa_gnome 
---

Q: Could you briefly introduce yourself? 

I'm principal software engineer at Red Hat, responsible for identity management software, which involves making sure your infrastructure is working right. People tend to joke we are visible only if their printers are not printing or Samba doesn't work. I'm Samba Team member for the past 13 years -- mostly involved in virtual file systems, idenitities, documentation, and a build system. Before Red Hat I worked at Nokia on a number of Linux devices (the N900 and N9 to name a few) where my team was making camera and media processing software, and before that I hacked on Samba for IBM Linux Technology Center. I'm working from my home in Finland and many of my colleagues are also scattered around the world and work from home or small offices.

Q: What will your talk be about, exactly? Why this topic?

Since 2007 Red Hat is working to make sure Linux systems can be centrally managed with ease. The [FreeIPA](https://www.freeipa.org/) project produces server side components to make it happen, while its sister project, SSSD, is providing a client side of the solution. It took at least five years before we've got our base feature set sorted out for corporate server environments with LDAP, Kerberos, certificates and access policies, but since the last couple of years we are also focusing on things like user certificates and two-factor authentication tokens, which means a lot of work on desktops where users enter their passwords and use their tokens or smart cards.

Traditionally 'enterprise desktop' meant mostly being able to migrate from Windows environments including use of the same or very similar workflows and applications. It was rarely about being able to integrate such desktops well into a corporate environment similarly to how Active Directory is used by many companies with single sign-on to all services. We wanted to change this by making sure the Linux desktop can be usable and secure at the same time.

My talk is going to show where we are now with the GNOME desktop. I chose GNOME because we needed to start somewhere; once most problems are solved, the same approach could be used to extend and integrate with other desktop environments.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to show what is already possible with ready-made tools in Fedora and CentOS. There is a certain mythology around setting up 'enterprise' tools like LDAP servers or Kerberos infrastructure, and many flawed recipes on the net aren't making it easy. With FreeIPA one can set up their 'corporate environment' in less than 10 minutes, and that also changes the perspective for free software application developers. Previously one might simply ignore 'corporate environment' because access to a real life setup wasn't really easy. Now that you can spawn virtual machines in a matter of minutes, the complexity is greatly reduced and there is really no barrier to integrate.

Q: Why should the typical home user be interested in FreeIPA, which is an 'enterprise' product?

One of the greater benefits from using FreeIPA is higher security defaults. FreeIPA doesn't only provide management interfaces for otherwise available server components; we work directly with MIT Kerberos upstream, Samba Team, 389-ds directory server developers and others to make sure the defaults are secure and reasonable, and where needed, we improve those directly with upstream as well.

If your home environment is less secure than your corporate environment, it might be an attack vector now. And vice-versa, given that people often work from home, your home environment gets its own share of possibilities to be attacked by those who break your office environment. Increasingly often we are working from home and our home environment blends with a corporate environment -- often you are only one VPN hop away from it, and if companies are moving their services to public cloud providers sometimes you don't even need to be on a VPN to use those services.

With FreeIPA a typical home user can create his own environment where all machines are centrally authenticated and managed, both internally and with something hosted in a cloud. Some of our users reported successfully running FreeIPA on their Raspberry Pi devices (albeit a bit slower than we wanted). For large families it is also important to stay in touch while living in different countries. Having control of your own certificates, secure email, video, audio, and file exchange becomes
reasonable not only for offices.

You can find a lot of recipes how to integrate FreeIPA with server software on [our documentation page](http://www.freeipa.org/page/HowTos).

Q: What are the biggest challenges in making GNOME an enterprise-friendly desktop?

Perhaps the biggest challenge is to be able to talk and share ideas. Once we get past a common understanding of the problem landscape, it is easier to schedule and work on eliminating issues one by one. Again, being able to easily set up a 'corporate environment' in virtual machines makes it easier to test applications against it. There are some key bugs still open to be fixed but now we are confident they can be finally fixed, some after six or more years waiting in bugzillas.

Some of the protocols involved, like Kerberos, are sometimes hard to grasp to those who never worked with them, so it takes time to work it out together to make sure implementations are correct and secure.

Q: How can interested people contribute to the integration of FreeIPA with GNOME? Are there some specific domains in which you could use some help?

There is a lot that can be done to improve usability. I'll show some of the areas which are still waiting for attention during my talk. Stay tuned!

Q: Have you enjoyed previous FOSDEM editions?

Immensely. My first FOSDEM was actually OSDEM 2001 where I gave a talk about Midgard together with Ami Ganguli and ran an internationalization (I18N) workshop. Since then I've attended FOSDEM a couple of times as a visitor. It is always a highlight of the winter, especially for the dark winters we have here in Finland.
