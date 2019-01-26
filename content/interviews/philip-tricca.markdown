---
year: 2019
speaker: philip_tricca 
event: tpm2
---

Q: Could you briefly introduce yourself?

Hello, I'm Phil. I do stuff with software. Typically involving 'security' in some way.

Q: What will your talk be about, exactly? Why this topic?

I've spent the last ~2 years turning a prototype implementation of the TCG standard TSS2 APIs into [a healthy open source project](https://github.com/tpm2-software). My talk will cover details about the implementation, the small but growing community that's formed around it and our current efforts to improve the security of upstream OSS projects through its use.

In some of my past work I had to use the previous generation of TPM devices and the APIs for interacting with them and this experience was pretty bad. I saw working on the TSS2 (the next generation of this technology) as a way to improve the experience for developers and to improve the security posture of software systems in general.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'm hoping this talk will help developers get familiar with our work and get started using the TPM2 devices to improve the security properties of their software projects.

Q: What's the history of the tpm2-software project? How did it evolve?

This project started as a prototype at Intel. When it was first released on GitHub the source code was in pretty bad shape and the team that created it was disbanded soon after its release. Over the last 2 years myself and a number of other developers collaborating on the OSS code have revived the project, cleaning up the implementation, expanding our support to the full set of APIs, and established the basic project infrastructure. Since then the project has grown to include maintainers from 3 separate organizations and a small but vibrant base of developers and users.

Q: Let's say I want to add TPM support to my FOSS project. Where do I start? What do I have to do?

This is one of the biggest gaps in the project currently: the "learning curve" is very steep and it's something I'm working to improve this year. That said the first thing every developer who wants to use the TPM in their project needs to ask themselves is "why?" TPM devices are useful for protecting sensitive cryptographic keys and operations using these keys and so it's only useful to a relatively narrow set of applications.

After this I'd recommend you start by experimenting with the [tpm-js](https://google.github.io/tpm-js) project from Google. This is an exceptional environment for introducing new users to the security concepts and capabilities of TPM2 devices and for experimenting with a simulated TPM2 device.

Q: What does the tpm2-software project's community look like? How can interested developers contribute?

Our project currently has maintainers from Intel, Fraunhofer and Red Hat. We've also had consistent contributions from Infineon and a few other companies as well as students / academics.

Q: Which new features can we expect this year in the TPM2 software stack?

The last few years we've been focused on getting the core components of the TSS2 in place and setting up the projects infrastructure. Moving forward we're still working to improve the APIs and the project in general through increasing test coverage and new types of testing (API fuzzing) and increased automation. Personally, in 2019 I'll be working to improve the materials available to help new users get started and to enable use of the TSS2 APIs by existing OSS projects.

Q: Have you enjoyed previous FOSDEM editions? 

This will be my first trip to FOSDEM and I'm very excited for the conference.
