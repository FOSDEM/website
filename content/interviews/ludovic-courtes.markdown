---
year: 2020
speaker: ludovic_courtes 
event: guix
---

Q: Could you briefly introduce yourself?

Hi!  I’m Ludovic, a passionate free software hacker.  These days, most
of my hacking is in Scheme, a functional programming language of the
Lisp family, specifically with
[GNU Guile](https://www.gnu.org/software/guile), which is to me a
never-ending source of delight.  I work on
[GNU Guix](https://guix.gnu.org), which I co-maintain together with a
group of great people.

Q: What will your talk be about, exactly? Why this topic?

I will introduce Guix to give a feel of what it’s like to be using it
and what it has to offer, because I think the general “functional
deployment” approach, which was pioneered by
[Nix](https://nixos.org/nix/), is still too little known.

Now, my talk is in the “Containers and Security” track, which I think is
a great opportunity to reflect on containers, distributions, and the
whole issue of software deployment.  The [first talk in the track](page:/schedule/event/riek_kubernetes/) sets out
to demonstrate that the “Linux distribution as we know it is coming to
an end”; I’d like to challenge that assertion, or rather to re-frame the
discussion in the more general context of software deployment.

I’ll show how Guix has been trying to connect aspects of software
deployment often regarded as separate from one another: we have
container tools, package managers, configuration management tools…  What
if we designed a unified tool set to address all these use cases?  What
programming language techniques can we use to improve reach that goal?
These are the questions I’ll try to answer.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Guix is often categorized as a “package manager” or as a distro.  That’s
OK as rough categorization, but I hope to lead the audience to take a
step back and think about what container tools, distros, provisioning
tools and the like have in common --- because depending on how you look at
it, Guix fits in pretty much all these categories!

Last year I gave a talk in the “Distributions” developer room.  My
message to distro hackers was that we should pay attention to the tools
built around distros --- and that actually often _work around_ distros --- and
draw some lessons as to use cases that distros have been neglecting,
sparking development of these tools.  In a sense, part of this year’s
talk is the dual of last year’s: discussing the shortcomings of
“containers” in a broad sense, how that impacts security, and what can
be learned from distros.

Q: With Nix and later Guix, you have been working on reproducible software deployment for more than ten years now. What has changed in all those years?

Ten years ago, Docker didn’t even exist!  The advent of containers has
led many to think that software deployment is a solved problem.  Only
recently did people start expressing concerns about the shortcomings of
containers, which often boil down to their opacity and
non-reproducibility.  Containers spread very quickly, probably because
they are an “easy” way to solve deployment issues, but that comes at the
cost of increased complexity --- [it’s “easy” but it’s not “simple”](https://www.infoq.com/presentations/Simple-Made-Easy/).

But also: ten years ago, Guix didn’t exist and Nix wasn’t as popular as
it is today, both of which are great outcomes!  The [Reproducible Builds](https://reproducible-builds.org/) and
[Bootstrappable](https://bootstrappable.org/) efforts were born during
that period and have already been very fruitful --- for example, think of
the [impressive achievements around bootstrapping with Mes](https://guix.gnu.org/blog/2019/guix-reduces-bootstrap-seed-by-50/).

Another crucial project that saw the light during that period is
[Software Heritage](https://www.softwareheritage.org/) --- source code
availability is a prerequisite for all our work on reproducibility as it
was at risk ten years ago.

Q: 2020 marks the 20th anniversary of (F)OSDEM. What contributions has FOSDEM made to the advancement of FOSS, or how did Guix in particular benefit from FOSDEM?

For the projects I’ve contributed to, FOSDEM has always been a great
boost: meeting with other contributors and contributors-to-be, and
leaving Brussels full of ideas and energy.  FOSDEM has pretty much been
Guix’ annual meeting from the start, and it has certainly contributed a
lot to its growth and to turning a team of hackers into a bunch of
friends.  I’ve also always enjoyed how FOSDEM encourages chance
encounters with people from different backgrounds --- this is always
inspiring!

Q: Have you enjoyed previous FOSDEM editions? 

Yup, been to about ten of them!

