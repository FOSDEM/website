---
year: 2015
person: Stefan Marr 
speaker: stefan_marr 
topic: "Building High-Performance Language Implementations With Low Effort"
event: building_high_performance_language_implementations 
---

Q: Could you briefly introduce yourself? 

I am a researcher working in the field of programming languages. My main interests are implementation technology and concurrent programming. The last two years or so I have been focusing on making language implementation easier, and making techniques for [metaprogramming](http://c2.com/cgi/wiki?MetaObjectProtocol) and [reflection](http://en.wikipedia.org/wiki/Reflection_(computer_programming)) faster.

Q: What will your talk be about, exactly? Why this topic? 

The talk is going to be an introduction to the idea of [self-optimizing interpreters](http://lafo.ssw.uni-linz.ac.at/papers/2012_DLS_SelfOptimizingASTInterpreters.pdf), which is a relatively recent idea from researchers of Oracle Labs and the Johannes Kepler University in Linz, Austria. I found the idea to be fascinatingly simple and yet very powerful. It gives us the ability to implement languages as simple interpreters and at the same time make them reasonably fast.

Now, interpreters alone will still be rather slow, and many applications run better when they are compiled to more efficient machine code for execution. So, in the second part of my talk, I am going to explain two interesting techniques for just-in-time compilation. The first is meta-tracing as done by [PyPy](http://pypy.org/), which is a fast Python implementation. The second one is partial evaluation, which is used by the [Truffle framework](http://www.ssw.uni-linz.ac.at/Research/Projects/JVM/Truffle.html) to implement fast self-optimizing interpreters in Java.

So, why this topic? I have the feeling there is a general curiosity when it comes to programming languages, and many people are interested in knowing how things work under the hood. Let’s just take for instance the world of JavaScript. Many people started to build other languages on top. Perhaps just to learn, or because they do not like JavaScript as a language for their daily work. Others, especially in industry, are interested to express their problems more directly and have so-called domain-specific languages (DSLs). I think that for these situations self-optimizing interpreters are interesting, because they are simple and can be fast at the same time.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

I hope to give people an idea of how self-optimizing interpreters and how the compilation technologies that make them fast work. On the one hand, I think it is interesting to know a few things about how programming languages work, especially dynamic languages. On the other hand, I would of course like to get people interested who perhaps fear that language implementation is something they can’t understand. From my own experience with for instance the PHP project I know that many open source language implementations struggle with attracting contributors, because from the outside it all looks like black magic.

Q: What are the strenghts and weaknesses of the two main approaches for building a self-optimizing interpreter you mentioned? 

To get these interpreters really fast, we have currently either meta-tracing or partial evaluation to do just-in-time compilation. In my experience, both approaches work well. Meta-tracing seems to be simpler for the language implementer, because you do not need to optimize the interpreter as much to get good performance. Partial evaluation requires more optimizations in the interpreter, but also results in very good performance.

Q: Do you have some concrete numbers about what performance enhancements you can realize with a self-optimizing interpreter, for an actual application? 

For my own research, I use a little Smalltalk, for which we don’t have ‘real’ applications. But, in our experiments, we see that it can be as fast as Java for number crunching. Other problems are roughly three times slower than Java. The JRuby folks also use those techniques in their JRuby+Truffle backend and they focus more on applications. They have really good results when it comes to [peak performance](http://www.chrisseaton.com/rubytruffle/pushing-pixels/), making JRuby on those benchmarks on average nine times faster, which includes for instance the Photoshop file parser [psd.rb](http://cosmos.layervault.com/psdrb.html) for image processing.

Q: Suppose that I'm building a DSL to solve a problem and I need my code to run fast. I heard about the notion of self-optimizing interpeters and I want to use it for my open source project. Where do I start? 

If you want to run on the JVM, I would start out with the Truffle framework. It comes with SimpleLanguage as a good example of implementing a small language. Of course there is also [TruffleSOM](http://github.com/smarr/TruffleSOM), the little SOM (Simple Object Machine) Smalltalk I use. Documentation is currently rather scarce.
[Chris Seaton](http://www.chrisseaton.com/rubytruffle/) has a couple of interesting posts on his JRuby+Truffle blog, and [Cristian Esquivias](http://cesquivias.github.io/blog/2014/10/13/writing-a-language-in-truffle-part-1-a-simple-slow-interpreter/) started exploring Truffle and documenting a little Lisp interpreter.

In case you prefer Python, the PyPy community might be the other good starting point. RPython is the meta-tracing tool chain. A good starting point is the [RPython documentation](http://rpython.readthedocs.org/). The PyPy blog had a couple of posts in the past on how to get started as well. And, there is my [RPython-based implementation of the SOM Smalltalk](http://github.com/smarr/RTruffleSOM/).

A brief write-up comparing the two a little is available on [my blog](http://stefan-marr.de/papers/ieee-soft-marr-et-al-are-we-there-yet/) as well.

Q: Have you enjoyed previous FOSDEM editions? 

Yes, I have been at FOSDEM for the last five years or so. It is was always a very interesting event. Beside all the great presentations on the main track, I also very much enjoyed for instance the JVM-related talks in the Java developer room, and from time to time I talked in the Smalltalk developer room on VM projects.
