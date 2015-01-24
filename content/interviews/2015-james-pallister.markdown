---
year: 2015
speaker: james_pallister 
event: superoptimization 
---

Q: Could you briefly introduce yourself?

I am a PhD student at the University of Bristol, and a research engineer
for [Embecosm](http://www.embecosm.com/) - my research focuses on compilers and optimization. In
particular, I've been looking at the energy consumption of small battery
powered devices and how we can decrease it. There is still much more
that can be achieved with new optimizations for both energy consumption
and performance.

Q: What will your talk be about, exactly? Why this topic?

Superoptimization can construct the best possible program - the most
energy efficient, the fastest, the smallest code. Generally it works by
searching every possible instruction sequence until it finds the best
one. It is exciting to see how far we can take this, how much extra
performance we can squeeze out of our code. Some superoptimizers manage
to double the performance for certain bits of code!

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want everyone to realize that superoptimization is becoming something
they can use.  It used to be a purely academic technique, because it is
extraordinarily computationally demanding to do, but with modern
computers it is becoming more practical.  I want to get people thinking
about ways we can speed it up further and make it generally available
for everyday use.

This technology is starting to become of commercial interest. This can
be seen in the fact that my research has partly been funded by Industry
and partly by the UK government's business innovation agency, InnovateUK.

Q: A superoptimizer that produces the fastest, the smallest or the most
energy efficient code sounds like magic. Is this really
just a brute force search in the space of valid instruction sequences, or
is there a smarter way?

At the core, superoptimization is a just a brute force search. The
difficult bit is pruning down the enormous search space so you can find
something in a reasonable time. Recently there have been a couple of new
approaches which look at the search in a different way, such as using
SMT (Satisfiability Modulo Theories) solvers and machine learning to direct the search.

Q: Why doesn't everyone use superoptimization? What's the downside?

Superoptimization is still computationally demanding, and only works for
certain types of code. For example, it still has some difficulty with
floating point instructions and memory accesses. However, there are a few techniques
for dealing with this, some from my own research, which I shall talk about.

Q: If I want to use superoptimization to make some key code parts in my
software optimal, where do I start? Which superoptimizer should I use?
Is it easy to integrate it in my build process?

There are many academic teams who have developed their own
superoptimizers, but by far the most widely available tool is the [GNU
Superoptimizer](https://github.com/embecosm/gnu-superopt).  This project
was started over two decades ago.  Although it has been less active in
recent years, it is still a very effective tool.  I'll be discussing how
to use the GNU Superoptimizer, and how to add new architectures and
features.

Q: What are the latest developments in superoptimization and which
improvements can we expect in the coming years?

Hopefully we will see superoptimization becoming more mainstream, and
expanding to handle more and more types of code and programs. I'll be 
talking about techniques which can speed up the brute force approach,
including machine learning and Monte Carlo methods.  I'll be looking at
completely new approaches such as theorem provers, which could be much
faster.  And I'll be looking at how superoptimization can become more
general - handling loops, memory accesses and floating point instructions.

Q: Have you enjoyed previous FOSDEM editions?

Last year was my first time at FOSDEM, helping run the energy efficiency
developer room and I enjoyed it a lot. I'm looking forward to coming back this
year.
