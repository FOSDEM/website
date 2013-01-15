---
year: 2013
person: Bill Hoffman 
speaker: bill_hoffman
topic: Open Science, Open Software, and Reproducible Code
event: open_science
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

Sure, I am Bill Hoffman.  I am co-founder of a scientific computing company called [Kitware](http://www.kitware.com/). In the open source world I am most known for starting the [CMake](http://www.cmake.org/) build system project. This project was created as part of a scientific software project funded by the US governmental agency National Institutes of Health.  I have worked in R&D since 1990, first at GE Corporate Research and starting in 1999 with Kitware.

Q: What will your talk be about, exactly? Why this topic?

My talk is about the importance of open source software as it relates to open science.  This topic is an important one, and I want to make the link between scientific research and open source clear to the open source community.  There is a symbiotic relationship between the two communities that is often overlooked by developers.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I would hope to raise awareness, and inspire open source developers to seek work in the scientific computing areas.

Q: Your audience at FOSDEM already knows the advantages of open source, so they are probably easy to convince about the advantages of open science. But how do you explain to the general public that open science is a sensible thing to do?

I think it is an easy sales job, especially when public funds are involved. Scientific research at its very core was open, with reproducibility or mathematical proofs being required before new research would be accepted. Now that computers are used to do an increasing amount of the science, mathematics is being displaced as the common language of science and the community needs to make some adjustments to ensure the code used in scientific research is open, subject to peer review and can be extended just as mathematical equations always have been.

Q: Last year there was an article in Nature with the conclusion that more than 90% of all papers published in science journals describing "landmark" breakthroughs in preclinical cancer research were not reproducible. Do you see roughly the same percentage in all scientific domains or are specific domains "better students" than others?

Yes, I think this was an eye-opening study that I hope will further make the case for open science and the use of truly reproducible research and software. Software has taken a key role in science, and if that software is not open and accessible to other researchers then the goal of reproducibility is not possible. I do think this is likely to be seen across the board.

Q: Which governments are starting to see the benefits of open science and ask openness in return for their public money?

Many of the US funding agencies, including the NIH and NSF, are asking for openness in return for publicly funded research. The UK government is currently making large changes to research, asking for both research papers and data resulting from public funding to be open and use permissive licenses such as [CC-BY](http://creativecommons.org/licenses/by/2.0/). There was also some news recently from the Australian government about making similar moves, and many in the scientific community are realizing that research outputs don’t just need to be available gratis, but also under licenses which allow for reuse and modification by others after the initial research was done.

Q: A counterargument to open science that I regularly hear says that you have to be an expert in the specific research topic to be able to interpret the data and tweak the software (often tailor-made) with the right parameters to be able to reproduce the research in the right way. As a consequence, releasing all the software and data will result in many people drawing the wrong conclusions because they don't have the right expertise. How do you counter this argument?

The data, software and parameters should all be released together. Kitware has even created a web based platform to do this, the [Insight Journal](http://www.insight-journal.org/). Scientists need to be more willing to engage with the general public, and have their publicly funded research be subject to scrutiny. We can develop tools to make this easier, but we as scientists should not be given carte blanche to spend public funds with no opportunity for public review or dissemination.

Q: Suppose that I'm a scientist and I'm convinced by your talk that open science is the way to go, and that I have to make it easy to reproduce my research. Where do I begin? Do I have to radically change the way I'm doing science?

It should mean taking extra care that your work is reproducible and providing the data and software to allow someone else to repeat what you have done. To make an analogy to software development, you have to create a release of the research.  You can not stop once you get it to work once.  You have to take the extra step to package it up and provide a way for other people to replicate the same results that you completed. You should be prepared to explain why you removed outliers for example, or why you used one analysis technique over another in your code. Research then becomes more of a dialog, with the opportunity for others to build on your research and hopefully spend less time reinventing the wheel while citing your contributions.
