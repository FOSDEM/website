---
year: 2019 
speaker: will_the_chill_braswell 
event: perl11
---

Q: Could you briefly introduce yourself?

I'm Will the Chill, a circus juggler, Scout leader, and Star Trek enthusiast.

I have been programming in Perl since 1999, and I am currently the President of the Austin Perl Mongers.

In 2012 I hosted the inaugural Perl 11 Summit in Austin, Texas, along with Reini Urban and Ingy döt Net.

I am also the creator of the [RPerl](http://rperl.org/) compiler as well as the [CloudForFree.org](http://cloudforfree.org/) platform, and I am the CEO of APTech, Inc.

Q: What will your talk be about, exactly? Why this topic?

I will cover the basic tenets of the [Perl 11](http://perl11.org/) philosophy, along with an introduction to the most important Perl 11 software projects.

I chose this topic because the future direction of Perl development is unclear and not widely understood.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope the attendees will gain an understanding of the current state of several Perl 11 software development projects.

I expect a majority of attendees will not be familiar with Perl 11, and many of the concepts may elicit technical or organizational questions.

Q: What was your motivation to formulate the Perl 11 philosophy together with Ingy döt Net and Reini Urban? And did the ideas behind it evolve since you formulated them?

My first (and still primary) motivation for creating Perl 11 was speed, pure and simple.

As a scientist, I need Perl to achieve an extremely high runtime performance, which was not possible before I built the RPerl compiler.

Reini shared this same goal, and we both agreed with Ingy that we needed "pluggability" for Perl 5 and Perl 6 to eventually be reunified.

Since the creation of the Perl 11 philosophy in 2012, several new projects have been added under the Perl 11 umbrella, including [cperl](http://perl11.org/cperl/) and [WebPerl](https://webperl.zero-g.net/) and CloudForFree.org.

However, the fundamental ideas behind the Perl 11 philosophy have not changed: pluggability, performance, and reunification.

Q: What are the practical consequences of the Perl 11 vision? What are the advantages for Perl programmers?

The practical consequences of Perl 11 are the development and availability of several new cutting-edge Perl platforms.

Perl 11 is not (yet) an actual version of Perl, although this may eventually change after reunification is achieved.

The most mature Perl 11 projects are RPerl, cperl, [Perlito](https://github.com/fglock/Perlito), WebPerl, and CloudForFree.

The main advantages of RPerl include ultra-high runtime performance and best practices for Perl 5.

For cperl, advantages include stability, security, and a moderate performance increase for Perl 5.

For WebPerl, the advantages are web-based convenience for both Perl 5 and Perl 6.

For Perlito, advantages include web-based convenience and translation to JavaScript for both Perl 5 and Perl 6.

The CloudForFree.org platform includes web-based convenience, an IDE, and parallel computing resources for RPerl.

Q: Why is RPerl so important in reaching the vision of Perl 11?

RPerl is the flagship product of the Perl 11 development group, and was the first project started after the Perl 11 Summit in 2012.

RPerl is a re-implementation of the Perl 5 language, using a compiler design methodology in place of the original Perl 5 interpreter design.

RPerl generates ultra-high-speed binaries via C++ intermediate code, and can be upgraded to target any back-end such as Java or JavaScript or WebAssembly, etc.

Eventually, RPerl will support all existing Perl 5 code, at which point we can begin adding support for Perl 6 as well.

Ultimately, RPerl will support all of Perl 5 and Perl 6 within one (re)unified runtime environment.

When this occurs, we can consider replacing the two separate languages with RPerl only, and drop the 'R' to become just Perl, version 11.

So, RPerl may someday become the real Perl 11.

Q: Given that Perl 5 and Perl 6 are quite different, what are the biggest hurdles in trying to unify them in the Perl 11 vision?

As you said, Perl 5 and Perl 6 are actually two different languages, they are not two versions of the same language as the numbers 5 and 6 seem to indicate.

Although they are generally incompatible, there are many similarities between Perl 5 and Perl 6, which we can exploit for reunification.

For example, RPerl adds real data types to Perl 5, and Perl 6 also has its own type system, so we can create a type map between the two.

On the other hand, Perl 5 and 6 have very different semantic behaviors in many cases, so we'll still need the `use v5;` and `use v6;` pragma directives to manually switch between languages.

The biggest hurdle to full reunification are the "deep magic" components of both languages, those parts which are difficult for even experts to understand, and which can only be determined based on very complex rules during runtime.

Perl is over 30 years old, and Perl 6 has been under development for about 15 years, so we can expect full reunification may take quite a while.

Q: What does the Perl 11 community look like? How can people interested in the Perl 11 vision contribute?

The Perl 11 community is mostly centered around the #perl11 IRC channel on irc.perl.org, along with the [perl11.org](http://perl11.org/) website.

You can find us in person at most Perl conferences, and even a few general computing conferences like FOSDEM!

We also regularly post RPerl updates on the [rperl.org](http://rperl.org) website, [on Facebook](https://facebook.com/rperlcompiler), and [on Twitter](https://twitter.com/rperlcompiler).

Interested parties can join us on IRC (my handle is "willthechill"), or directly contact the leaders of one or more Perl 11 projects.

Q: Which new developments can we expect this year on the way to the Perl 11 vision?

My predictions for Perl 11 in 2019 are...

  * At least one Perl 11 book published
  * Upgraded [Moose](https://moose.iinteractive.com/) support in RPerl
  * Integration between WebPerl and CloudForFree
  * Easier RPerl installation via CPAN, DEB and RPM
  * Enhanced support for mixing interpreted and compiled code

Q: Have you enjoyed previous FOSDEM editions? 

Yes, I was a speaker in the very full Perl developer room at FOSDEM 2016, it was great!

There were so many people interested in Perl that most of them couldn't find a sitting spot, and people were overflowing into the hallway track.

I made many connections in Brussels during that conference, and I was also able to serve as an ambassador at the official Perl booth.

I look forward to giving many more Perl presentations at FOSDEM in the future!
