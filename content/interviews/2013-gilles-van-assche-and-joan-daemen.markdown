---
year: 2013
person: Gilles Van Assche 
speaker: gilles_van_assche
person2: Joan Daemen
speaker2: joan_daemen
topic: Keccak, More Than Just SHA3SUM
event: security_keccak
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) and [<%= @item[:person2] %>](/schedule/speaker/<%= @item[:speaker2] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

We, Guido, Joan, Michaël and Gilles (a.k.a. the [Keccak Team](http://keccak.noekeon.org/team.html)), are cryptographers working at [STMicroelectronics](http://www.st.com) (Guido, Joan, Gilles) and [NXP](http://www.nxp.com/) (Michaël). During the last few years we have joined forces, concentrating on permutation-based cryptography with a focus on actual usability. This has lead among other things to the new sponge and duplex constructions, with their unique combination of simplicity and flexibility. Based on them, we designed the primitive [Keccak](http://keccak.noekeon.org/) and submitted it to the [NIST SHA-3 competition](http://csrc.nist.gov/groups/ST/hash/sha-3/index.html).

Q: What will your talk be about, exactly? Why this topic?

Recently, the American National Institute of Standards and Technology (NIST) [announced](http://csrc.nist.gov/groups/ST/hash/sha-3/winner_sha-3.html) the selection of Keccak as the winner of the SHA-3 Cryptographic Hash Algorithm Competition. This concluded an open competition that was remarkable both for its magnitude and the involvement of the cryptographic community. Public review is of paramount importance to increase the confidence in the new standard and to favor its quick adoption. The SHA-3 competition explicitly took this into account by giving open access to the candidate algorithms and everyone in the cryptographic community could try to break them, compare their performance, or simply give comments.

In this talk we will introduce and highlight the strengths of our cryptographic primitive and explain how it can benefit the FOSS community. This talk will also focus on the different aspects that make the design of Keccak open, from the open source implementations on various platforms to initiatives to keep encouraging third-party cryptanalysis, such as the [KeccakTools](http://keccak.noekeon.org/KeccakTools-doc/index.html) cryptanalysis software and the [Crunchy Crypto Collision and Pre-image Contest](http://keccak.noekeon.org/crunchy_contest.html).

Q: What do you hope to accomplish by giving this talk? What do you expect?

Although Keccak, as the SHA-3 standard, will coexist with the current standard SHA-2 hash function family, we hope to convince that it is much more than just another "SHAxSUM" algorithm. Keccak relies at its core on a new construction, called the _sponge_ construction, which allows for simpler and more flexible modes of use. The talk will illustrate this by giving various examples on how current software designs can benefit from this greater flexibility, e.g., for all the flavors of hashing, stream encryption, authentication, authenticated encryption and pseudo-random bit generation.

Q: NIST's AES competition in the late nineties was the first big open process to develop a cryptographic standard. Were there any differences then with the approach of the SHA-3 Cryptographic Hash Algorithm Competition?

In the approach, SHA-3 was very similar to AES. The main difference with the AES competition is the increased effort in the area of performance measurement. With SHA-3, there were numerous benchmarking projects: [eBASH](http://bench.cr.yp.to/ebash.html) for software in general, XBX for embedded platforms and all the hardware (FPGA and ASIC, compact or fast) implementation comparisons.
          
Aside from the similar approach, there were differences due to the circumstances and to the different target of the competition. There were many more SHA-3 candidates, although NIST quickly narrowed it down to 14, a number comparable to that of the AES competition. Also, hash functions are usually divided into a mode of operation (e.g., Merkle-Damgård, sponge) and a primitive (e.g., block cipher, permutation); the AES competition was focusing solely on the primitive. 

Q: What's the history of the Keccak algorithm? How did it evolve? What were the key insights leading to the final design?

We started to collaborate on hash function designs with [RadioGatún](http://radiogatun.noekeon.org/) as an attempt to fix the vulnerabilities of Panama, an earlier design by Joan together with Craig Clapp. After publishing RadioGatún, we started developing the concept of sponge functions, and we were soon convinced by its added value so we decided to adopt it for our upcoming SHA-3 candidate. Another aspect was the stream vs block-oriented approaches. Like Panama, RadioGatún continuously iterates a simple (weak if taken separately) round function for every few input words; this is the stream-oriented approach. Based on third-party and our own cryptanalysis, we realized the benefits of switching to a block-oriented approach, where larger input blocks are interleaved with a strong permutation; this is the strategy we followed for Keccak. More details can be found in our paper ["The Road from Panama to Keccak via RadioGatún"](http://gva.noekeon.org/papers/2009-Dagstuhl-09031-1958.pdf).

Q: One of the reasons why Keccak won the SHA-3 competition is that it's designed very differently from SHA-2, using the so-called sponge construction, and thus probably not vulnerable to the same attacks. Does this also mean that Keccak offers some new possibilities that weren't available with the SHA-2 hash algorithm? 

The differences between Keccak and SHA-2 are on two levels.

First, at the macroscopic level, Keccak is permutation-based whereas all established symmetric cryptographic standards are up to now block cipher-based. This is obviously the case for the AES block cipher and the block cipher modes, but it is also the case in the inner workings of MD5, SHA-1 and SHA-2 as their compression function uses a dedicated block cipher. The advantage of being permutation-based is that it is more efficient for equal security margins and it also allows for simpler and more flexible modes of use, as mentioned earlier.

Then, at the microscopic level, the round function in the Keccak-f permutation uses very simple bit-oriented operations. In contrast, the MD5/SHA-1/SHA-2 family uses the combination of modular additions, rotations and exclusive "or"s (ARX), and the AES and AES-like primitives use aligned non-linearity and maximum distance separable (MDS) matrices. Our choice of operations yields combined advantages of software efficiency close to that of ARX and of the clarity of AES-like operations. It also gives excellent performance in hardware. Finally, a unique advantage of these operations is their suitability for affordable protections against side-channel attacks such as differential power analysis (DPA).

Q: SHA-3 is not meant to replace SHA-2, which will surely confuse many developers. Could you give some guidelines about the circumstances in which they would better use Keccak and when they should prefer SHA-2?

Coming from SHA-2, there nevertheless may be attractive features of SHA-3 that are still worth the switch. Coming from MD5 or SHA-1, we simply see no reason to move to SHA-2 once the SHA-3 standard is out. We are of course being subjective and we hope our talk will give convincing answers. :-) At least, if not completely objective, it is generally acknowledged in the crypto community that the safety margin of Keccak (as well as the other SHA-3 finalists) is more comfortable than that of SHA-2. Furthermore, SHA-2 (unlike Keccak and SHA-3 finalists) suffers from the length-extension weakness, which must be compensated by costly constructions such as HMAC (hash-based message authentication code). Hence, SHA-3 offers an immediate benefit over SHA-2 for the purpose of authentication.

Q: If open source developers want to use Keccak in their software, what's currently the best way to do it? Can they just use your reference implementation?

We advise to take a look at our "Reference and optimized code in C" package available on [the Keccak web page](http://keccak.noekeon.org/). It contains open-source (public domain) optimized implementations for many platforms, most of them in plain C but also some in assembly (x86_64 and ARM). The range of implementation flavors covers compact 8-bit platforms, processors with either 32-bit or 64-bit cyclic shifts, SIMD instructions, etc. More details can be found in the ["Keccak implementation overview"](http://keccak.noekeon.org/Keccak-implementation-3.2.pdf) document.

Q: Have you enjoyed previous FOSDEM editions?

One of us (Gilles) attended FOSDEM last year and he really enjoyed it! Note that we make our presentations using XeLaTeX and are in general happy Linux users. :-)
