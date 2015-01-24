---
year: 2015
speaker: larry_wall 
event: get_ready_to_party
---

Q: Could you briefly introduce yourself, for the maybe one or two
FOSDEM visitors who have never heard of you?

Hi, I helped start the open source movement by releasing open source software
and helping other folks do the same in various ways.  Oh, and I helped
bootstrap the Web by making handy a text-processing glue language called [Perl](https://www.perl.org/).

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'd like to explain how we've succeeded when so many people expected us
(or wished for us) to fail.  And why [Perl 6](http://www.perl6.org/) may matter to you in the future.

Q: If I'm a Perl 5 programmer, what does Perl 6 have in store for me?
How is it different from Perl 5 and what are its biggest advantages?

Despite the passage of time, Perl 6 is still a direct response to 361
RFCs that were written 15 years ago to document the various areas in
which people thought Perl 5 could be improved.  By and large, most of
those issues still remain in Perl 5, because it's impossible to fix each
of those problems in isolation.  By opting for a complete redesign,
and intentionally taking the long view rather than the quick fix,
we've ended up with a new "sister" language that is more coherent, usable, robust,
and extensible, while still retaining the spirit of Perl that holds the
programmer's creativity in highest regard.  At the same time, we've made
Perl 6 much more maintainable than Perl 5.  I know that sounds like a
bunch of buzzwords, but for most people it just comes down to Perl 6
providing more fun and less pain.

Q: What's the history of the Perl 6 project? Why did it start? Has it
become what you planned it to be?

Perl 6 started in a community session at OSCON, when Jon Orwant said
we needed to do something exciting with Perl, and demonstrated this by
throwing mugs against the wall.  After about five minutes of further
excitement, I said to everyone, "It's time to think about Perl 6, and we
should plan to break backward compatibility—in fact, we should break
everything that needs breaking.  If we're gonna break it, let's break it
good and hard."

From that came the RFC process, with the results that we have today.
And I think it's largely the result we wanted, though it certainly
took longer than some of us expected, and we had to learn several ways
not to implement Perl 6 first.

However, we did know in advance that it would take us a long time, and
we also understood that we didn't really understand what we were doing yet.
We knew it would be an iterative, whirlpool-based design process.  We knew
that what we were doing was close to impossible, but that we'd try to
do it anyway, because even a "failed" Perl 6 would be much better than
anything else we have yet.

Q: What were the biggest challenges you had to face in the design and
implementation of Perl 6?

We have a saying, "Tormenting the implementor on behalf of the user."
So on the user end of that, one big problem was finding the correct set
of semantics that would both support the naïve user yet scale up as
the user became more sophisticated.  In doing so, we relied heavily on
the assumption of "a sufficiently smart optimizer can deal with this."

So, for instance, we chose to use gradual typing, so that the user can
add more type information to the program to get better performance or
behavior.  We chose to extend regular expressions into full grammars
that can write their own lexers on the fly.  Basically, we had to do
research; we had to design and implement various things that would have
earned any number of advanced degrees had we been doing them in academia.

On the implementor end, another of our sayings is "Have the appropriate
amount of fun."  This is to be construed as negative for some necessary
tasks.  So the real challenge was waiting for the right kind of stubbornly
optimistic people to volunteer for such tasks, the sort of people who
kind of enjoy being tormented on behalf of the user.

Q: With Perl 6 becoming production-ready in 2015, what's the future
of Perl 5? Will it still get new features?

Unlike certain other language communities we could name, we are not
interested in declaring the end-of-life for any earlier version of Perl.
Our policy is that as long as anyone is interested in supported something,
why should we stop them?  There are still people using Perl 4 out there.
Our official slogan is still: "There's More Than One Way To Do It."
We believe this on many different scales.

That being said, it's really much more difficult to extend Perl 5
because of all the accumulated technical debt, including the ongoing
commitment to design features that seemed like a good idea at the time
but ended up limiting the options for further evolution. Hence, Perl 6 will not support either typeglobs or tying (the ability to suddenly tie any variable at runtime to a different implementation), nor will it store functions and methods into shared global namespaces; instead Perl 6 uses lexical scopes to store functions and metaobjects to store methods.  Nowadays we try to hang every hat on the right peg.  And of course, sometimes new hats require new pegs.

Q: Have you enjoyed previous FOSDEM editions?

Indirectly, but I've always been interested in way too many things, so I
rely heavily on other people telling me about the cool bits of everything.
And certainly FOSDEM has always had cool bits.  :)

