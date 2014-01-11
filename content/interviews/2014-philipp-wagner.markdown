---
year: 2014
person: Philipp Wagner 
speaker: philipp_wagner
topic: "OpTiMSoC: Build Your Own System-on-Chip!" 
event: optimisoc 
---

Q: Could you briefly introduce yourself?

To start with the basics: I'm Philipp and I live in Munich, Germany. I have been involved with the FOSS community for many years now, and my studies of Electrical Engineering brought me closer to the hardware side. Right now I'm working towards my Ph.D. at TUM (Technische Universität München), mostly in the field of debugging support for System-on-Chips.

Q: What will your talk be about, exactly? Why this topic? 

The talk will introduce the "Open Tiled Manycore System-on-Chip", aka [OpTiMSoC](http://www.optimsoc.org/). It is a set of building blocks to create a custom System-on-Chip (SoC), which can then be simulated on a PC or run on FPGA hardware. I'll start with a quick introduction on how SoCs look these days, present some components and show how these components can be used by you to build your own SoC.

Q: What do you hope to accomplish by giving this talk? What do you expect? 

In this talk I want to show people how easy it is to build a SoC, what components are needed for it, and how OpTiMSoC helps with all of it. It certainly helps if people attending the talk have already heard of hardware description languages like VHDL or Verilog before, or how a hardware design flow works, but I'll try to do my best to introduce the basics to newcomers. Just attend if you're interested, and ask questions if you didn't understand something!

Q: What's the history of the OpTiMSoC project? And how did you get involved?

OpTiMSoC started in the mind of Stefan, the project founder, around four years ago. Then, two years ago Stefan started to put all components together. Half a year later I got involved, first by adding trace debugging support.

Q: Could you give some examples of where OpTiMSoC is useful? 

Writing a software application can be really easy these days. You can use existing frameworks, libraries, and much more to build a system. The same is not true for hardware designs, unfortunately (at least not in the FOSS world). With OpTiMSoC, we provide this framework to realize your own ideas, which obviously can vary widely.

We here at TUM use it for research on cache architectures, network-on-chip solutions, or debugging architectures. Others use it to evaluate hardware crypto accelerators, or to try out different thermal chip management strategies. So, the field is large, and it's mainly up to your imagination what you would do with OpTiMSoC. The good thing is, you don't need to start from scratch when realizing your ideas.

And if you just want to dive deep into an existing SoC to understand how it works, you can use one of the existing example designs and look at all internal signals in a waveform viewer.

Q: OpTiMSoC is developed at the Technische Universität München. Is the project's community still largely academic? And how can interested people help?

It's true, right now the community is rather academic. But it does not have to be that way, and that's the main reason why we're putting a lot of effort into cleaning up and documenting many parts of the system. We are trying to be fully open, and welcome every contribution, be it bug reports, code in any form or ideas how to improve.

Q: Which new features can we expect this year?

We have a lot of features written by students around, which are unfortunately mostly proof-of-concepts, and not really publication-ready. But we try hard to clean up and integrate most of those features into OpTiMSoC, so expect support for standalone systems (booting from SD card), maybe simple Ethernet support and support for the [ZedBoard](http://www.zedboard.org/). And, the year just started, let's see what else we will come up with.

Q: Have you enjoyed previous FOSDEM editions? 

Absolutely, FOSDEM is one of my favourite conferences every year. Every time I meet new awesome people, and come home with new ideas. Also, if a conference starts with such an awesome beer event, nothing can go wrong, can it?
