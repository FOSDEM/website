---
year: 2017
speaker: gilles_van_assche 
event: keccak
---

Q: Could you briefly introduce yourself?

I am a cryptographer working at STMicroelectronics. Together with my
colleagues of the [Keccak](http://keccak.noekeon.org/) team, I enjoy working on new cryptographic
functions with an eye towards simplicity and efficiency.

Q: What will your talk be about, exactly? Why this topic?

I would like to present a set of Keccak-based functions that covers the
full range of symmetric cryptography functionality, from hashing to
authenticated encryption. There will be different aspects.

For instance, one aspect will be to start from the concept of a
pseudo-random function (PRF) and to show how flexible it is for
achieving authentication and confidentiality. I will then show how to
instantiate these, not only with sponge and duplex constructions (as in
our CAESAR proposals Ketje and Keyak), but also with a brand new
construction called Farfalle.

Another aspect is to discuss the delicate trade-off between performance
and safety margin. In this respect, we as Keccak team have tried to
address the increasing need for parallelism in order to achieve good
performance on modern processors.

I think that these topics are relevant when building or improving
security systems. In general, cryptography is a living subject, and it
is therefore important to discuss these innovations and new trends in
general.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Symmetric cryptography relies on public scrutiny and third-party
cryptanalysis. NIST specifically addressed this by organizing an open
competition and by involving a wide community. Because of its selection
as SHA-3, one of Keccak's strengths is that it attracted a lot of
attention. With this talk, I hope to show that Keccak builds up on this
strength when its role is extended beyond hashing. Also, I hope that
people will think twice when selecting a cryptographic algorithm,
especially if it was designed behind closed doors (like DES, SHA-1 and
SHA-2).

Q: Since its selection as the SHA-3 standard (NIST's FIPS 202), Keccak has grown out of
its mere hashing functionality. What cryptographic functions are
possible with the Keccak permutation now? Did you know all those
applications when you were designing the Keccak algorithm? Or did you
only discover some of them later?

Keccak, and permutation-based cryptography in general, is still
evolving. When we designed Keccak in 2007-2008, we had not yet seen that
the sponge construction could also be used for authenticated encryption.
Recently, Bart Mennink, Reza Reyhanitabar and Damian Vizár proved that
one can securely increase the throughput with full-state absorbing. So
we decided to exploit it in our authenticated encryption scheme Keyak.

Now, we just published a new permutation-based construction called
Farfalle, which can be seen as a parallel counterpart of the sponge. In
addition to its efficiency advantages on high-end CPUs, Farfalle allows
us to easily build new kinds of (authenticated) encryption schemes,
including a wide block cipher.

Q: What's the status of your Keccak Code Package? Which functionality
is already available?

We reworked the [Keccak Code Package (KCP)](https://github.com/gvanas/KeccakCodePackage) quite extensively in 2016 to
make it as easy to use as possible and to allow different kinds of
functions to co-exist. Thanks to a clean separation between the
low-level functions (like the permutation) and high-level user-oriented
functions, it supports optimized implementations for several platforms.

At this time of writing, the KCP supports hashing (FIPS 202, Keccak and
KangarooTwelve), a pseudo-random bit generator (KeccakPRG) and
authenticated encryption (Ketje and Keyak). It also supports functions
from the draft SP 800-185 standard (cSHAKE, ParallelHash), but we
haven't found the time yet to update them to comply to the official
standard that was just released last December.

We also started implementing Kravatte, the instantiation of Farfalle
with the Keccak permutation, and we hope to be ready by FOSDEM (or soon
after).

Q: How can interested developers contribute to the Keccak Code Package?
For which tasks could you use some manpower?

If someone wishes to implement the new functions from [the SP 800-185
standard](http://keccak.noekeon.org/sp_800_185.html) that was officially
released recently, that would be welcome (and also a smooth way of
diving into it).

We would also be happy to add implementations on platforms that we don't
currently support.

Q: Where is Keccak used at the moment?

The earliest adopter of significant size is the 3rd Generation
Partnership Project (3GPP), aimed at specifying the next generation
cellular system. They defined the TUAK algorithms for mobile phone
authentication in SIM cards, based on Keccak, before the release of the
FIPS 202 standard.

Of course, Keccak is at the heart of NIST's FIPS 202 (SHA-3) standard,
and more recently, of the SP 800-185 standard. It is difficult to answer
exhaustively who is using those standards, but according to the list of
[NIST-validated
implementations](http://csrc.nist.gov/groups/STM/cavp/documents/sha3/sha3val.html),
there are some major industrial players.

Regarding open-source projects, one can find many implementations of
Keccak/SHA-3 in different languages. Also, the standard library of
Python 3.6 natively supports the FIPS 202 instances.

Q: Suppose I want to use Keccak, Ketje, Keyak or KangarooTwelve in my
software. Where do I start? Is it difficult to use the Keccak Code Package?

That is easy. From the KCP, you just type `make generic64/libkeccak.a`
and you get a library containing those functions, compiled from code
generically optimized for 64-bit processors. Of course, you can replace
`generic64` by `generic32` for 32-bit code, or by `Haswell`, `ARMv7A`,
etc., for code more aggressively optimized for those platforms.

Q: Have you enjoyed previous FOSDEM editions?

I have attended and enjoyed all FOSDEM editions since 2012. Thanks for
organizing this great open-source event!
