---
year: 2015
person: Simon Cozens
speaker: simon_cozens
topic: "Introducing SILE: A New Typesetting System"
event: introducing_sile
---

Q: Could you briefly introduce yourself?

I've been programming since as long as I remember. At university I
studied Japanese but I also discovered Perl, and got very involved in
the Perl community. I wrote a couple of books about Perl programming and
over a hundred CPAN modules. I worked for a few years as a programmer
but in 2005 I left my job and came to work as a Christian missionary in
Japan.

I've still been programming since then; I do a bit of Ruby on Rails
contracting, and I've also had a lot of fun programming as a volunteer
for a project which is translating the Bible into Japanese Sign
Language. That has involved automating a lot of their video production
work, and also writing some PhoneGap applications to play the JSL Bible
videos and to help translators take notes on video draft translations.

Q: What's the history of the SILE project? Why did you start it? How did it evolve? Is this what you planned it to be? 

[SILE](http://www.sile-typesetter.org/) is actually the third typesetting system that I have written. I
wrote the first two pretty much by accident - I'll explain what I mean
by that in the talk! - but last year I went for coffee with someone I
had come across on a various mailing lists. He's actually from the same
organisation which provides technical support to the sign language Bible
translators. He was telling me about some of the very complex
typesetting situations he has to deal with in his work; he produces
Bibles, dictionaries, bilingual and parallel texts, and so on, and he
was telling me how some of the features of those books were incredibly
difficult in [TeX](http://tug.org/).

I decided that there was a need for a typesetting system which was
completely customizable and which could solve these problems in a much
more straightforward way, and that's how SILE got started. Since then
it's evolved according to the needs of users; as people have requested
features for their projects, I've added them.

I also started with a very simple architecture, using [Pango](http://www.pango.org/) and [Cairo](http://cairographics.org/)
for creating the PDFs, but while that was very useful for prototyping,
I've had to get my hands dirty with proper text shaping and PDF creation
libraries.

Q: What are the most important drawbacks of TeX that SILE solves? And what are currently still SILE's weak points? 

I guess there are two ways to answer this.

The first is this: for most people, if TeX works for them they should
stick with TeX. TeX has the advantage of a huge community and a great
repository of packages (the [Comprehensive TeX Archive Network (CTAN)](http://www.ctan.org/)) which means that right now, most
documents are going to be much easier to typeset in TeX. I don't see
SILE as being a replacement for TeX, and it isn't aiming to replace TeX
for most users.

But SILE was created for people who are hitting the limits of what they
can get TeX to do. So for example, if you want to do more of a
magazine-style layout, SILE allows you to very easily create multiple
content frames on the page. It's much easier to change the way that the
typesetter operates, so there are packages which allow you to balance
the bottoms of columns in a two-column document, which is something you
need if you're producing a two column Bible for example. And whereas TeX
was designed with authoring in mind, SILE assumes you'll have data in a
standard format that you want to typeset; so if you want to produce a
dictionary and you have your material in LIFT, an XML file format, you
just load up SILE's LIFT class and feed it your XML file directly.

The second way to answer is that TeX has seen gradual improvements over
its history to support things like Truetype fonts, Unicode, PDF and so
on, but they're all hacks on a thirty year old design. SILE starts again
with what we know now about fonts, about complex non-Western scripts,
about input formats and embedded programming languages, with modern
technology and a cleaner design.

Q: What will your talk be about, exactly?

I'll be introducing SILE and how it got started, look at some of the
fundamentals of typesetting with computers and some of the difficult
problems it involves - especially once you start getting into
non-Western scripts. I'll then be demonstrating some of the things that
SILE can do easily that are difficult with other typesetting systems,
and I'll also be talking about some of my design goals and choices and
the things I've learnt from the project.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

Well, first of all I'm hoping that people will enjoy it! I imagine most
people don't think of computer typesetting as an entertaining topic but
I'll try and keep things light. But I'm also hoping that this talk will
broaden people's perspectives about how to go from data to print.
Obviously, I'm also hoping to recruit new class and package writers as well!

Q: As SILE is written in Lua, what advantages does it offer compared to LuaTeX? 

[LuaTeX](http://www.luatex.org/) gives you an impressive range of hooks into TeX's typesetting
process, but it's still fundamentally constrained by the way TeX
operates. Because SILE is written in an interpreted language, you can
replace any component of the system.

The obvious example is typesetting on a grid, which is something that is
needed when typesetting Bibles on really thin paper. Grid typesetting is
a difficult problem in TeX, even in LuaTeX, but it's super easy in SILE;
you just replace the routine which adds white space to the page to
ensure that the space is quantized. It takes about ten lines of code.

Similarly, when you're typesetting a parallel edition, you might want to
read in multiple content files - one for each language - typesetting one
language on left-hand pages or columns and the other on the right-hand
side, and keeping the two languages aligned. Again that's a hard problem
in TeX, but in SILE, you can create two separate typesetter objects,
reading from different file streams, and run them in parallel.

Q: Which new features can we expect in SILE this year? And what kind of functionality would you like to have in SILE in the far future? 

One thing I'm working on at the moment is an enhanced page breaking
system. At the moment SILE uses TeX's algorithm, but that was designed
to work in an environment where memory is tight. TeX doesn't store more
than a page of content at a time. But if you look over the whole
document before breaking it into pages, you can find even nicer page
breaks. I'd like to get some advanced PDF features working soon, such as
PDF document outlines, links and so on.

Tables are a hard problem in any typesetting system. SILE has a very
basic table class, but it needs a full table implementation soon.

In the far future, I'd love it if someone ported the [MathJax](http://www.mathjax.org/) math
typesetting algorithms from Javascript to Lua so they could be used in
SILE. Math typesetting isn't a priority for SILE, where the target
market is more in the humanities sector, but if someone sent me a pull
request I'd definitely merge it!

Q: Have you enjoyed previous FOSDEM editions? 

This will be my first experience of FOSDEM, so I'm very much looking
forward to it!
