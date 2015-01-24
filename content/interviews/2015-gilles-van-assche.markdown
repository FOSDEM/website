---
year: 2015
speaker: [gilles_van_assche, joan_daemen, michael_peeters] 
event: keccak_and_sha3 
---

Q: Could you briefly introduce yourself? 

We, Guido, Joan, Michaël, Ronny and Gilles, are cryptographers working at
STMicroelectronics (Guido, Joan, Ronny, Gilles) and NXP (Michaël). During
the last few years we have joined forces, concentrating on
permutation-based cryptography with a focus on actual usability. We
designed the primitive [Keccak](http://keccak.noekeon.org/), which we
submitted to the NIST SHA-3 competition, and more recently Ronny joined us
for the design of Ketje and Keyak, submitted to the CAESAR competition.

Q: What will your talk be about, exactly?

It will be a follow-up of [our talk at FOSDEM 2013](https://archive.fosdem.org/2013/interviews/2013-gilles-van-assche-and-joan-daemen/), although it will be
self-contained as we don't expect people to remember it or to have
attended it at all.

After a recap of what Keccak is and what it is useful for, a first
important point will be to summarize the current developments around
Keccak and the FIPS 202 standard. We will talk about the status of the
[FIPS 202
draft](http://csrc.nist.gov/groups/ST/hash/sha-3/sha-3_standard_fips202.html),
the SHAKE extendable-output functions (XOFs), NIST's plans to exploit
Keccak's abilities for other purposes than just hashing, and our own
developments with [Ketje](http://ketje.noekeon.org) and
[Keyak](http://keyak.noekeon.org), two authenticated encryption schemes
based on Keccak that we submitted to the [CAESAR
competition](http://competitions.cr.yp.to/caesar-submissions.html).

A second important point will be to present the ongoing effort to gather
and structure Keccak implementations and applications (among others, SHA-3
hash functions and SHAKE XOFs) in the [Keccak Code
Package](https://github.com/gvanas/KeccakCodePackage). These open source
implementations are organized in a way that aims to satisfy both the
developer of optimized Keccak code and the protocol or application
developer. Central to this organization is a specific internal interface
that allows interchangeable optimized codes and a user-friendly set of
external services.

Q: What's an extendable-output function (XOF) and what is it good for? How
does it compare to a hash function?

An extendable-output function (XOF) can be seen as a generalization of
hash functions where the output length is not limited to a specific number
of bits but is potentially infinite. The phrase "extendable output" points
out that the user does not need to know in advance how many bits (s)he
will need but can ask for more output bits at any moment. Concretely, XOFs
can be used to take over complex constructions involving hash functions
and counters. With RSA, this is of immediate benefit to full domain
hashing, to RSA OAEP (Optimal Asymmetric Encryption Padding) and to RSA PSS (Probabilistic Signature Scheme). Other use cases are key derivation
functions and stream ciphers.

Another important conceptual difference is that a XOF's security strength
can be chosen (e.g., through Keccak's capacity value) and is not bound to
its output length, as it is unfortunately traditionally the case with hash
functions. This flexibility allows for better security-performance
trade-offs. For instance, with a key derivation function, the length of
the derived key material can greatly vary from one application to another,
in a way that is in general not related to the required security strength.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Our primary purpose is to give the community a view of what is going on
with Keccak. We also wish to highlight its ease of use and the
transparency of its design. Finally, we also want to draw attention to the
Keccak Code Package and its internal structure.

Q: Already since the selection of Keccak as the winner of the SHA-3
cryptographic open competition in 2012, NIST mentioned that it "may
consider standardizing additional constructions based on the Keccak
permutation, such as an authenticated-encryption mode, in the future."
What's the status of this plan to use Keccak for other purposes than just
hashing?

At the [SHA-3 2014
Workshop](http://csrc.nist.gov/groups/ST/hash/sha-3/Aug2014/index.html) in
August, NIST presented more details on their plans. FIPS 202 will approve
the SHA-3 hash functions and SHAKE XOFs, but it will also specify all the
necessary ingredients to minimize the effort of defining other use cases.
These other use cases would then be standardized by way of special
publications referring to FIPS 202.

The topics NIST presented at that conference are:

 * [parallelizable hashing](http://csrc.nist.gov/groups/ST/hash/sha-3/Aug2014/documents/kelsey_sha3_2014_panel.pdf),
 * [message authentication codes (MACs) and key derivation functions](http://csrc.nist.gov/groups/ST/hash/sha-3/Aug2014/documents/perlner_kmac.pdf]),
 * [authenticated encryption](http://csrc.nist.gov/groups/ST/hash/sha-3/Aug2014/documents/sonmez-turan_sha3_2014_workshop.pdf]),
 * [generic domain separation mechanisms on top of these](http://csrc.nist.gov/groups/ST/hash/sha-3/Aug2014/documents/dworkin_domain_ext.pdf]).

Q: One of the reasons why Keccak won the SHA-3 competition is that it’s
designed very differently from SHA-2, using the so-called sponge
construction. Did this sponge construction have applications you didn't
expect?

The duplex construction, a close variant of sponge, together with its
application to authenticated encryption, came to us as a surprise. We
discovered it during the SHA-3 competition, when the focus was on hashing
and keyed applications such as MACing. Today, this idea has grown beyond
Keccak, given the numerous sponge-based authenticated encryption schemes
that were submitted to the CAESAR contest.

Q: What's the status of your Keccak Code Package? Which functionality is
already available?

The [Keccak Code Package](https://github.com/gvanas/KeccakCodePackage)
(KCP) currently contains open-source implementations of Keccak instances
(including these defined in the FIPS 202 draft), optimized for several
platforms. The implementations are tested and ready to be used.

What is available in the KCP can be described along two axes: the modes of
use and the optimized permutation. From the point of view of applications,
the currently available modes of use are hash functions, XOFs (including
SHAKE128 and SHAKE256) and authenticated encryption (Ketje and Keyak). The
sponge and duplex constructions are also directly accessible, so many
other modes of use can simply be written as wrappers around them. As for
optimized permutations, the KCP includes at least a reference
implementation of all Keccak-f/p permutations with width 200 and more. For
widths 800 and 1600 (the most efficient ones on 32-bit CPUs or higher), we
have several optimized implementations in C as well as some in assembly.

The KCP also focuses on the parallelized implementation of multiple
instances targeting SIMD units, for which Keccak shows to be quite fast.
In that area, we are done with 128-bit SIMD implementations and are busy
with larger SIMD implementations.

Note that the goal is that the KCP does not remain entirely "ours". For
instance, we recently integrated Vladimir Sedach's AVX2 implementation
(single instance) into the KCP.

Q: How can interested developers contribute to the Keccak Code Package?
For which tasks could you use some manpower?

It is clear that we welcome contributions to the KCP, as we simply don't
have enough bandwidth alone to be able to progress as fast as we wish on
this project.

The most direct way a developer can contribute is by adding (or improving)
an implementation of one of the permutations, targeting a given processor
or optimizing a specific cost function (e.g., code size, RAM usage). It
can be immediately integrated to the KCP if it follows the ["SnP"](https://github.com/gvanas/KeccakCodePackage/blob/master/SnP/SnP.h)
interface. We are also interested in optimized implementations of parallel
applications of the Keccak-f\[1600\] permutation on SIMD units. In this
case, the relevant interface is called ["PlSnP"](https://github.com/gvanas/KeccakCodePackage/blob/master/PlSnP/PlSnP.h).

As of today, the selection of the optimized permutation is done
compile-time. While this still allows the flexibility to use all
applications on top of that permutation, it prevents the creation of a
library where the selection would be done run-time. It is another area
where discussions and contributions would be welcome.

Q: Have you enjoyed previous FOSDEM editions?

One of us (Gilles) has attended FOSDEM since 2012. Two others (Joan and
Michaël) attended FOSDEM 2013. So far, we have really enjoyed this event!
