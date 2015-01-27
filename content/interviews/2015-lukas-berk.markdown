---
year: 2015
speaker: lukas_berk 
event: ubiquitous_performance_analysis_and_system_introspection
---

Q: Could you briefly introduce yourself?

Sure, I'm a software engineer on the performance tools team at Red
     Hat.  I mainly work on [SystemTap](https://sourceware.org/systemtap/) and [Performance Co-Pilot](http://pcp.io/), and am the
     office nerf gun champion.
     
Q: What will your talk be about, exactly? Why this topic?

The talk will mainly be centered on introducing and
     providing potential solutions for monitoring performance across an
     entire network (with PCP), being able to narrow down performance issues to a
     few specific components and drilling deeper into malfunctioning programs
     (with Systemtap).  With modern computer systems and networks, there is a
     huge amount of data available.  PCP and SystemTap offer a chance to
     analyze and make sense of it all, in a quick and predictable manner,
     without sacrificing contextual information.
     
Q: what are some example scenarios where Performace Co-Pilot and
  SystemTap shine?

I think PCP really shines in its extensibility and modularity.  It
     really is a full toolkit, not just a single, monolithic program.  It's
     completely open with the data it collects, and you can use as many or as
     few of the features as desired, incredibly flexible.

With SystemTap, I think one of the biggest strengths is being able
     to collect data concurrently from multiple points, system-wide.  It
     doesn't matter if it's userspace, or in the kernel.  Furthermore,
     being able to do so without stopping the programs of interest, can
     be incredibly useful.

Q: Which new features can we expect this year in PCP & SystemTap?

I think the most exciting feature for Performance Co-Pilot in this
     upcoming year is the new container functionality.  With all the
     work being done with containers, sometimes it's easy to get lost in
     all the new features.  Hopefully we'll be able to bring solid
     performance analysis to the picture as well.
     
Q: Have you enjoyed previous FOSDEM editions?

It'll be my first time attending FOSDEM, so I'm looking forward to it!
