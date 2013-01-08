---
year: 2013
person: Simo Sorce
topic: How to build an Identity Management System on Linux
---

Q: Could you briefly introduce yourself?

My name is Simo Sorce, and I work for Red Hat, Inc. I currently live in New York City, but I am originally from Italy. I have been involved with Free Software for a long time now, I started in the nineties and I have been a Samba Team member since 2001. When I was still in Europe I was also a Free Software Activist, both at the local and the EU level.

Q: What will your talk be about, exactly? Why this topic?

I will talk about Identity Management in Linux, particularly my experience in building the FreeIPA project. I think this topic deserves more exposure as IdM in the Linux world is still underdeveloped, and needs more attention from the community.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to provide a wider understanding of the issues related to Identity Management, why it is important, what can be done on the Linux platform, how to improve it and how to integrate it with other developers' applications, so that the whole experience for users and administrators improves.

Q: What are the biggest challenges in building a comprehensive identity management system?

The Integration of all the needed components and interfaces with applications is the main challenge that faces any administrator that needs to manage identities across many machines on a private/public or hybrid network. This talk will try to show a way to address these challenges in a consistent way.

Q: What's the history of the FreeIPA project? How did it evolve?

FreeIPA was born from the need to provide a solution that did not require experts just to install and run an IdM system on a daily basis. The drive has always been to make it easier and more affordable for casual users to use an advanced IdM solution retaining all the powerful features more experienced system administrators need. All based on Open and proven Standards, maintaining as high a level of security as practically allowed. 

Q: Which components are in the FreeIPA architecture and why were these chosen?

The three fundamental components are the LDAP server, the KDC and the management framework that integrates them. However, there are many other components that are used: a PKI server, DNS integration, an advanced client and others. The talk will explain why you may want to use each of these components, which ones are optional and which ones are not and why. 

Q: Which client components do users need for identity management with FreeIPA?

FreeIPA is a fully RFC2307bis compliant directory mated to a Kerberos KDC at its core, so any standard LDAP/Krb client can be used, and we also have a NIS compatible mode. However the best and more feature-rich client we recommend is SSSD which is a spin-off of the FreeIPA project itself and is available in most distributions now.

Q: The IPA in FreeIPA stands for "Identity, Policy and Audit", but the project seems to focus on the identity and policy components. Why was the audit component deferred?

Each of these 3 areas is in some way fundamental for a complete Identity Management system, each area is also a huge complex one on its own right. We Started with the 'I' of IPA, and only later we added some components of the 'P', the policy related features. Audit, the 'A', is something we really want to look at soon, but it is an area that is quite complex and peculiar. Because lack of integrated auditing features do not prevent an IdM system from working we decided to defer work on it just out of necessity. Auditing can be done through external log aggregation and analyzers, which is what is currently already done with Linux systems, so we felt working on this area was not as urgent as getting a decent I and P. 

Q: Which new features can we expect in FreeIPA in 2013?

We just released version 3.0 and 3.1 in rapid succession before the end of 2012, these releases brought in Active Directory integration and updates for integration with the newer 389ds and dogtag versions these projects just released. In the first part of 2013 we plan on polishing all the new features we just introduced, later on we will probably work on integrating additional components like DHCP, additional DNS integration features and better integration of third party applications.

Q: Have you enjoyed previous FOSDEM editions?

Yes, I've attended FOSDEM before and I am quite happy to return this year.
