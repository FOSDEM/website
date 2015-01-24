---
year: 2015
speaker: dana_jacobsen 
event: design_and_implementation_of_a_perl_number_theory_module 
---

Q: Could you briefly introduce yourself?

My name is Dana Jacobsen, I've been writing code of various quality for over 30 years.  My first job out of college was writing open source image processing software, and after that I ended up spending two years writing an open source bibliography package.  I wrote printer firmware for quite a while, and now work for Rentrak in Portland, OR working on media measurement.

A few years ago I decided to get back into Perl and open source, and started writing some CPAN modules on topics that interested me.  This led to other interests, and now my main concentration is on number theory and cryptography.

Q: What will your talk be about, exactly? Why this topic?

For the sake of time, certainly not everything I'd like to discuss :).  This talk won't be a "here's how to use it" but instead a lot about the algorithm choices, their implementation and performance.  Design issues such as how the pieces (Perl, XS, GMP) fit together and why it is done that way, bigint decisions, memory use, threading support, and input validation.  I will include quite a few performance benchmarks, both vs. other software as well as showing [ntheory](https://metacpan.org/pod/ntheory) algorithm differences and tradeoffs of different certainties (e.g. speed of probable prime testing vs. primality proofs).

Why this topic?  It interests me, I've spent a lot of time on this module, and would like people to know about it.  Feedback is welcome as well.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Advocacy for this module and Perl, and education about the topics.  I hope to introduce people to some of the things this module can do, especially those areas where it excels.  There is a lot of good software in this area, so hope to mention some of those as well, especially where *they* excel.  For some of my favorite areas I hope to give some computational information and benchmarks.  These are things that show up fairly often on places like Stack Overflow.

Q: What's the history of the Perl ntheory module? Why did you start it? How did it evolve? Is this what you planned it to be?

I wrote a module for variable length codes in 2011, and in early 2012 I added Goldbach codes, which are interesting albeit not terribly practical.  Generating the primes for this was taking quite a bit of time, so I started looking at both the existing Perl modules as well as some methods for generating them myself.  I ended up submitting patches to the existing modules as well as trying my hand at some methods.  It was interesting enough that I decided to write my own module.  It did primes, simple factoring, and a few functions like next\_prime, prev\_prime, is\_prime, nth\_prime and prime\_count.  No big integer support, and much slower than the current system.

It evolved by comparisons to other modules, both in features and performance, in response to features that seemed useful (e.g. random primes), in annoyance with performance (e.g. writing ECPP because BLS75 proof methods don't scale past ~80 digits), in comparisons with other software (e.g. [Pari/GP](http://pari.math.u-bordeaux.fr/)), and in solving tasks ([Project Euler](https://projecteuler.net/), [Rosetta Code](http://rosettacode.org/wiki/Rosetta_Code), [The On-Line Encyclopedia of Integer Sequences (OEIS)](https://oeis.org/), examples from other modules or software).  A lot got done because of directed procrastination (I could clean the house or write a new factoring routine, hmmm....).

It has certainly grown beyond what I expected.  I've learned a great deal along the way -- while I have a degree in math, I did not study number theory.  Things like the Lehmer and LMO prime count methods were not known to me at all when I started.  Primality testing and proving is a surprisingly deep area, and I never expected to do as much work as I've done for them.

One thing I didn't expect was how many interactions with other programmers this would have, both in and out of the Perl community.  This has been one of the most rewarding parts -- exchanging questions, answers, accomplishments, and friendship with people in places like Luxembourg, Poland, the Netherlands, New York, Salt Lake City, and Portland.

Q: Which tradeoffs did you have to make to create a portable library of ntheory?

Quite a few for portability, sadly.  My goal has been to have it work everywhere, even if the libraries required for the best performance (e.g. [GMP](https://gmplib.org/) and [MPFR](http://www.mpfr.org/)) aren't available.  I want it to work with core Pure Perl, which can be quite slow for some things.  I also want it portable back to the very old Perl 5.6, which was the first 64-bit Perl.  There are a lot of workarounds for that, as well as workarounds for bugs in various libraries.  Testing is complicated by the various combinations (pure Perl, C, C+GMP, MPFR, Calc/Pari/GMP Math::BigInt backends) -- I really like Travis CI for immediate feedback after a commit.  Even so, there are many more combinations, including 32-bit and 64-bit Perl, old versions of Perl, old library versions, different operating systems, etc.  I've used the gcc compiler farm to test on various platforms before a release, and rely on the [CPAN Testers](http://cpantesters.org/) framework for quick feedback as well.  Another good resource has been the Debian groups build logs.

Q: Could you give some examples of Perl applications that use the ntheory module?

There are over 20 examples on [Rosetta Code](http://rosettacode.org) using it.  Two applications are included with the module:  factors.pl which factors integers, and primes.pl which prints primes (including 21 restrictions, e.g. twin, safe, lucky, circular).  The Seis module emulates Perl6 and uses this module for the "is-prime" functionality.  Some crypt modules, including Crypt::DSA::GMP and Alt::Crypt::RSA::BigInt, use the random prime and primality features.

While not directly using Perl, [factordb.com](http://factordb.com) uses the ECPP (elliptic curve primality proof) certificate verifier.  The ECPP prover is available as a standalone C program, as is the LMO prime count and factoring code.  I wrote simple Perl programs to find large prime gaps, and currently they have found [about 47% of the first known occurrence gaps](http://www.trnicely.net/#TPG).  I also use a simple Perl script to get the prime gaps from the web pages and run the endpoints through the ECPP prover.  This has certified thousands of gaps.  Other scripts have been used to produce OEIS sequences.

Q: Which new developments can we expect in the Perl ntheory module in 2015? New functionality or performance improvements?

Performance enhancements and new functionality, definitely.  I don't know exactly what will show up, but I suspect:
  - enhancements for random prime generation (performance and better uniformity for arbitrary ranges)
  - ECPP generation of Primo-type certificates
  - ECPP speedups
  - Enhancements or rewrite of Quadratic Sieve factoring
  - 128-bit prime count

Q: Have you enjoyed previous FOSDEM editions?

This is my first time at FOSDEM, so I don't really know what to expect.  I've heard great things, with a lot of people recommending I go.
