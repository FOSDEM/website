---
year: 2015
speaker: till_tantau 
event: algorithmic_graph_drawing_in_tikz 
---

Q: Could you briefly introduce yourself? 

Hi, I'm Till (a German name, I know it sounds funny in English...). I started programming way back (in the 80s) as a kid via the path of Basic, Assembler, Pascal, C++, Objective-C (in that order) and also lots of other languages. I then studied computer science, got a PhD, and have been a professor of Theoretical Computer Science for ten years now. During my undergraduate years I started fooling around with [TeX](http://tug.org/), which led to the development of the [beamer](https://bitbucket.org/rivanvx/beamer/wiki/Home) LaTeX package. For the graphics in my PhD thesis I wrote [TikZ](http://sourceforge.net/projects/pgf/), another TeX package. My research interest lies in ultra-space-efficient computational models and formal logic.

Q: What will your talk be about, exactly?

It is about how to draw a graph nicely. Sounds easy? It is not. 

Believe it or not, for more than 20 years there has been a conference where each year about 50 papers are presented concerning this single question. Since many people use my TikZ graphics language to draw graphs (especially myself), it was a natural thing to add graph drawing algorithms to TikZ. However, it turns out this is a bit challenging, resulting in some interesting code and interesting ideas – and I would like to share these with the audience.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Mainly, to give an insight into what graph drawing is, why one needs a framework for it, and why it would be fun *and* useful if other people use the framework that I am going to present.

Q: What's the history of your new framework for simplifying the implementation of graph drawing algorithms? Why did you start it? How did it evolve? Has it become what you planned it to be? 

I had envisioned graph drawing capabilities for TikZ for a long time, it became a reality some five years back: In a student's project, five students of mine implemented a prototype over one year. Next, during several bachelor and master theses this first version grew a bit and I also partly rewrote the core. For a year now, a stable version of the framework is part of [TeX Live](http://www.tug.org/texlive/). 

Q: What were your reasons for implementing your framework in the Lua programming language? 

Programming in TeX is an art practiced only by a few devote disciples, mere mortals are forbidden to even attempt it. Even worse, doing computation-intensive calculation in TeX is simply impossible. So, implementing any nontrivial graph drawing algorithm directly in TeX was always out of the question. 

Things changed in 2008, when [LuaTeX](http://www.luatex.org/) was released. It is something like TeX+Lua, that is, TeX with a single new command \directlua that allows one to execute [Lua](http://www.lua.org/) code in TeX. Now, in Lua, it is certainly possible to implement graph drawing algorithms. Thus, Lua was the first and only choice for the implementation.

Besides, Lua is a really, really cool language.

Q: Where do I start if I want to implement a graph drawing algorithm in your framework? 

RTFM... That is, read the chapters in [pgfmanual.pdf](http://texdoc.net/pkg/tikz) (version 3.0.0 or higher) on graph drawing in TikZ. You will find a tutorial and everything you need in there.

It might also be a good idea to have some graph drawing algorithm in mind...

Q: Is the functionality of your framework comparable to the well-known Graphviz toolkit or are there some algorithms missing? 

Essentially yes. Indeed, implementing the same algorithms as in [Graphviz](http://www.graphviz.org/) was a major objective. 

Q: Is your framework meant to be used in TeX documents or does it also support other systems? 

Currently, it is only part of TikZ. However, I painfully made sure that the Lua code is actually independent of TeX. It would be a few days work to turn this framework into a completely standalone framework – or a nice bachelor thesis... I just did not have the energy to do it myself. 

Q: Have you enjoyed previous FOSDEM editions? 

This is my first FOSDEM, which I am really looking forward to!

See you in Brussels.
