---
year: 2014
person: Michael Meeks 
speaker: michael_meeks 
topic: "Calc: GPU enabling a spreadsheet"
event: calc_gpu_enabling_a_spreadsheet 
---

Q: Could you briefly introduce yourself?

I'm Michael Meeks: Christian, Hacker, Husband, and more. I work for [Collabora](http://www.collabora.com/) on our mission: To make open source rock (well that's the gist anyhow). At the moment, that means striving to make [LibreOffice](http://www.libreoffice.org/) better, helping out others who want to invest in improving it, and supporting / delighting our customers in suitable ways. Part of the LibreOffice team was kindly spun out of SUSE recently allowing us to grow and invest more in LibreOffice. In the past I've enjoyed big chunks of my time working with great free software hackers from other companies and projects - mostly around [GNOME](http://www.gnome.org/) and [openSUSE](http://www.opensuse.org).

Q: What will your talk be about, exactly? Why this topic?

Well - I'd like to lift the lid on the data structures and algorithms that were underneath [LibreOffice Calc](http://www.libreoffice.org/features/calc/). Then I'd like to show you how we've improved them, and the sort of wins we get by moving work to the GPU and threading. Some of that should be quite reusable in other projects. I'm also excited by the potential for Heterogeneous System Architectures (HSA) that's arriving on APUs (Accelerated Processing Units), and how it can make using the GPU compute units easier.

Why this topic ? Well parallelism allows us to use a ton of otherwise idle silicon to make things go faster, in some interesting ways: probably other people want to do that too. Indeed, I was most encouraged to see Behdad's [Glyphy](http://code.google.com/p/glyphy/) recently also using the GPU in interesting new ways.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Ah, well - there are some fun new things we've done here: say you hate XML because it's slow to parse - we've a solution for that that utilises all those wasted CPU compute cores. Hopefully people will learn a bit about [OpenCL](http://www.khronos.org/opencl/), and a bit about spreadsheets as well; and if not - it's somewhere to sit down, rest and sleep during a hectic FOSDEM. You might even hear about the latest features in LibreOffice 4.2 - though there are too many to cover really.

Q: The GPU acceleration in LibreOffice Calc was announced when AMD joined The Document Foundation. But as you're using OpenCL, I suspect that it will also work on GPUs from other vendors, is that correct?

Absolutely, the work we do has a significant performance impact for all users regardless of CPU vendor, GPU make etc. Of course it really helps to have a really good APU / GPU and a reasonably bug-free OpenCL implementation - you also need full double precision support - we're not compromising there. Unfortunately, after extensive testing, we found that it was not possible to retro-fit all legacy PCs with FirePro graphics cards (at least from inside the software). Some wetware co-operation is required to get the very best scores on big data analytics.

Q: You have been working for years on a cleanup/refactoring of the LibreOffice code. Was the Calc code already cleaned up enough to add the significant optimisation that OpenCL is? 

Calc has improved a lot, that is true. However, getting Calc's data structures into a good shape for legacy (pre-HSA) OpenCL took a good amount of heavy lifting. Kohei Yoshida has been laying the groundwork for some months here. He's really put in an incredible amount of effort on the team here. [MultiCoreWare](http://www.multicorewareinc.com/) also worked alongside Collabora to do the Formula to OpenCL compiler, but ... come and hear the details.

Q: In many spreadsheets, cells are calculated depending on other cells, which depend on other cells and so on. So the question arises: aren't the calculations in a typical spreadsheet with these sequential dependencies difficult to parallelize?

Sure - there are lots of spreadsheets where we will get no win at all, small ones, those with highly branching dependency structures, and banal ones: shopping lists for example. Our team handed the problem of optimising your shopping route to Dijkstra (still calculating). Also, the problem of working out how to rank conference papers or budget items in a spreadsheet is a twisty one.

Having said that, if you're processing a lot of data and want to crunch that, chart it, and suck the analytical juice from it: then we can do that, and quicker too. Often I see people build their analytics inside the limits of the tooling. By building sharper tools that go further we hope we can contribute to better, quicker business decisions in some cases.

Q: When will we see the first Calc release with OpenCL support?

By some happy co-incidence, LibreOffice releases around FOSDEM time each year, so - come and celebrate with us, meet us at the booth, get the software on-line, and see how it grabs you; then please do contribute fixes and improvements to improve the software for everyone: you could even join the UX hack-fest kindly hosted by the Beta-Co-working guys for the two days after FOSDEM. LibreOffice 4.2 with OpenCL support is having the final release candidates now, so testing and bug filing appreciated - including to your OpenCL driver provider.

Q: Have you enjoyed previous FOSDEM editions?

I'm a huge fan of FOSDEM, it is an incredible conference - and the best annual meeting place for the best European free software developers. It is the one unmissable free software conference for me - and it seems to get better each year.

Meeting old friends, making new ones, and talking until extremely late into the night / morning is most enjoyable. It is hard to appreciate the richness and depth of the characters we work with via e-mail. Free software is built out of people and one of the best places to meet and enjoy them each year is FOSDEM. It's also a great place for people to learn about the importance of free software.  I love to see newbies meeting and getting plugged into the teams I care about most: LibreOffice, GNOME, [RepRap](http://reprap.org/), openSUSE, whatever takes your fancy - please come, learn, and find your place to be most effective, as we change the world together. See you there.
