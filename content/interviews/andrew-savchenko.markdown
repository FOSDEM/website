---
year: 2017
speaker: andrew_savchenko
event: quantum
---

Q: Could you briefly introduce yourself?

My name is Andrew Savchenko. I have been a Linux user for about 15 years,
I have been contributing to various free software projects for 13 years and I have been
a Gentoo developer since 2014. My long-standing interest in
cryptography combined with some background in particle physics
resulted in curiosity about quantum computing and how it affects
cryptography.

Q: What will your talk be about, exactly? Why this topic?

My talk will be an overview of quantum computing basics: what is
it, how does it work, what are its pros and cons, where can it be used.
I also want to discuss how it affects widely used cryptography and
what can be done to deal with new threats.

I chose this topic because quantum computers are fundamentally
different from what we are used to in both physics at their core
and programming approaches they require. I find this subject fun
and intriguing.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to raise awareness about quantum computing. I hope to feed
curiosity about the subject.

With regard to quantum computing, cryptography faces many challenges.
All problems are solvable, but many require considerable effort and
changes, especially in the free software world where human
resources are usually limited. The more people will be involved,
the better :)

Q: Given that currently there are no practical quantum computers, why should we care about a threat that still seems to lie very far in the future?

A practical quantum computer will be an obliteration weapon against
asymmetric cryptography widely used these days. My guess is that
nobody will announce "Hey, we created a practical quantum machine, go
change your protocols quickly!". It is likely that the sheer fact of
such a machine's existence will be kept as a top secret as long as
possible. So it is better to be prepared.

Furthermore, changes required to deploy a post-quantum crypto
environment are not trivial and will require a lot of time and
effort. It is very hard to develop new secure protocols and
implement them properly. So it is better to start preparations
early.

Q: What post-quantum cryptography projects are available for free software users and developers? And is it difficult to migrate from classical cryptography to post-quantum cryptography?

One great project is [codecrypt](http://e-x-a.org/codecrypt/). It provides a tool
similar in its interface to GnuPG to sign, encrypt, verify and
decrypt data using post-quantum crypto.

For people interested in quantum computing itself [QCL](http://tph.tuwien.ac.at/~oemer/qcl.html) — a
quantum computing language and a simulator of a quantum computer —
is available. And just several weeks ago [D-Wave Systems](http://www.dwavesys.com/) opened code for
their [QUBO solver](https://github.com/dwavesystems/qbsolv).

Q: What would you suggest to users and developers that don't want to go through the hassle of using post-quantum cryptography? What algorithms should we stop using? What key lengths are still secure against quantum computers?

One should distinguish here symmetric and asymmetric cryptography.

Symmetric cryptography is generally safe. The best known quantum algorithm allows to halve the key length, so double your key sizes and you will be fine.

Pre-quantum asymmetric cryptography, on the other hand, is seriously vulnerable. The
best protection here is again the key length: the longer the key,
the later a machine capable of breaking it will be created. Elliptic
curves are no better than RSA with the same key length. Since practical
implementations of elliptic-curve-based algorithms use much
shorter keys than RSA, one should avoid such algorithms and use
long RSA keys if quantum computing is a concern and switching to
post-quantum algorithms is not possible.

Q: At the end of 2015, NIST announced a standardization project for quantum-resistant public-key cryptographic algorithms. Do you think that such a 'standard post-quantum encryption algorithm' will speed the adoption of post-quantum crypto?

I have mixed feelings about this. Indeed standardization will facilitate the industry to adopt and deploy post-quantum algorithms and protocols, so this is a good undertaking.

But NIST has a stained record of credibility to their standards. As
was shown by Snowden's documents there was an attempt to backdoor
Dual_EC_DRBG ([source 1](https://www.theguardian.com/world/2013/sep/05/nsa-gchq-encryption-codes-security), [source 2](https://bits.blogs.nytimes.com/2013/09/10/government-announces-steps-to-restore-confidence-on-encryption-standards/?_r=0)). Also, consider the fact that Bruce Schneier claimed he [doesn't trust these constants any longer](https://www.schneier.com/blog/archives/2013/09/the_nsa_is_brea.html#c1675929). So the community must be extremely cautious
with what NIST will propose: everything in the standard must be
completely transparent including why and how constants were
obtained.

Q: Have you enjoyed previous FOSDEM editions?

No, this is my first visit.
