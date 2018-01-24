---
year: 2018
speaker: james_bottomley 
event: tpm 
---

Q: Could you briefly introduce yourself?

Sure, I'm James Bottomley, I've been a long time Linux kernel developer (in the realm of SCSI and PA-RISC with occasional forays into file systems and memory management) and I'm a Distinguished Engineer at IBM Research mostly looking at container topics. However, I'm also a bit of an incorrigible drive by coder in pieces of the ecosystem that I think should work better (or, in the case of the TPM, just should actually work).

Q: What will your talk be about, exactly? Why this topic?

With the increasing concern about internet security, kernel developers are being strongly encouraged to use hardware protection mechanisms for things like the keys we use to push to kernel.org and sign our commits. I still have a [YubiKey](https://www.yubico.com/) the Linux Foundation provided.  However, these dongles only work for a single key and when everyone wants the key you use to communicate with them to be hardware protected, the dongles proliferate.  Since one of the many functions of the TPM chip that's present in every laptop is an infinitely expandable key store, I started to wonder how to use it better (or at least how to use it to get rid of all the dongles).  The talk is about my quest to do that, how it's working out for me and how it could be used by others.  Why? ... because the dongles must die (or at least stop annoying me).

Q: What do you hope to accomplish by giving this talk? What do you expect?

If there was ever a technology that was hamstrung by bad documentation and lack of follow through, it's the TPM.  What I hope to achieve is a simple explanation of what the TPM is and how you can use part of it for cryptography plus a clear vision for how this can be done by integrating with existing crypto systems instead of constructing new "TPM only" tools on the side.  If everywhere I now use a private key I can say easily convert this to a TPM representation and use the TPM for authentication and crypto operations from now on something that was impossible to use suddenly becomes simple and seamless.  Plus I've enhanced my own security to the level of a hardware device because my keys can no-longer be stolen.  Without access to the TPM on my laptop, the TPM representation of my private keys cannot be used.

I suppose there's a meta accomplishment as well in that this conference is about Free and Open Source Software Development (it's in the name, after all) and nothing is more fundamental to that than the ability to take something you think doesn't work and fix it because you have the code and the ability. So it's a celebration of our ability to change software because we can.

Q: What are the biggest differences between TPM 1.2 and TPM 2.0?

The algorithms: TPM 1.2 is decades old technology and is irrevocably fixed on SHA1 as the hash and RSA2048 as the public key cryptography.  SHA1 is already compromised, so this means TPM 1.2 is now fast approaching obsolescence.  TPM 2.0 has what's called "algorithm agility" which means the API has been expanded to cope with newer hashes (like sha256) and newer cryptosystems (like elliptic curve) hopefully providing more future proofing of the technology (well until someone finally produces the long sought after quantum computer).

Q: What software stacks do we have on Linux for TPM 2.0? What are their strenghts and weaknesses?

A TPM requires what's called a Trusted Secure Stack (TSS for short). For TPM 1.2 there was a much maligned Linux one called trousers.  It reproduced the Trusted Computing Group (TCG) mandates for the TSS to the letter and was pretty much unusable in consequence.

For TPM 2.0 we have two different TSSs: [the IBM one](http://ibmswtpm.sourceforge.net/ibmtss2.html) and [the Intel one](https://github.com/intel/tpm2-tss).

The former is full featured, easy to use and supports cryptographic communication with the TPM (like HMAC encoding authorization and parameter encryption) which is why I used it.  The latter follows exactly the TCG mandates but the TCG hasn't actually got around to writing the programming layer of the stack they call ESAPI, so the Intel one doesn't contain the necessary easy primitives for secure use. From this you can see that the disadvantage of the IBM stack is it doesn't follow the standards (because they mostly haven't been written yet).

Q: What work is still needed to allow using TPM resident keys with tools such as OpenSSH, GNOME Keyring, GPG, OpenSSL, and GnuTLS?

OpenSSL has what's called Engine support, which can be used to enable a variety of hardware crypto technologies including the TPM.  There already exist engines for [TPM 1.2](https://sourceforge.net/p/trousers/openssl_tpm_engine) and [TPM 2.0](https://git.kernel.org/pub/scm/linux/kernel/git/jejb/openssl_tpm2_engine.git/) so if you understand how to use OpenSSL, you can certainly use a TPM.

Gnutls actually does support TPM 1.2.  The jury is out on whether it will integrate TPM 2.0 or come up with an engine route like OpenSSL.

OpenSSH has switchable crypto, but the version compiled by most distributions is based on OpenSSL.  This makes it easy to support the TPM via OpenSSL engines.  The one drawback is that the ssh-agent makes assumptions about how it can handle the keys which are broken by the engine code but once this is fixed, TPM support becomes easy.

GPG uses its own crypto system called libgcrypt, so it needs hand crafted support for a TPM.  I did talk to Werner Koch about this at Kernel Recipes and I'm in the middle of trying to implement TPM 2.0 support for GPG based on a modification of the way OpenPGP dongles are supported.

Gnome keyring is a bit of a quandry:  For some reason it emulates a ssh-agent, meaning that simply adding TPM support to openSSH doesn't make it work with GNOME keyring.  It means that several other features of openSSH (like pkcs11 token support) also don't work.  I think the way to fix gnome-keyring is to get it out of the business of emulating the agent and instead concentrate on TPM enabling the crypto system that protects your user passwords (meaning the keystores would become useless if removed from your laptop).

Q: Have you enjoyed previous FOSDEM editions?

Yes, very much: I was actually at the 2016 edition doing a talk on Unprivileged Containers in the main track and one on the Developer Certificate of Origin in the Legal Dev room.  Unfortunately, living on the West Coast of the USA means that Brussels is a lot further than a short train ride away, so I don't get to come that often, so thanks for giving me the opportunity with this talk.
