---
year: 2018
speaker: jon_masters 
event: closing_keynote
---

Q: Could you briefly introduce yourself?

I'm Jon Masters, a Computer Architect at Red Hat, where I lead the mitigation efforts for "Meltdown" and "Spectre". Over the past few years, I've worked with various high performance microprocessor design teams on emerging alternative server platforms and standards for them. This has given me an opportunity to learn about how modern processors behave very differently underneath from what we as programmers see.

Q: What will your talk be about, exactly? Why this topic?

The talk covers exploits against modern high performance computer microarchitectures. Or, in more media friendly terms things like the "Meltdown" and "Spectre" cache side channel attacks. But there are many more, and I would like to give some insight into emerging research work.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to get more people energized about the design of the hardware they rely upon every day, whether that is the microprocessor in their laptop, phone, car, or some other hardware device upon which they rely. Too often, these are black boxes, but they needn't be, especially with the kinds of awesome materials available. Today, someone interested in researching architecture can download a fully open source processor design and even get direct hands on experience for very little cost.

Q: Meltdown and Spectre are an entirely new class of system security vulnerabilities. Do you expect that new related vulnerabilities may still be discovered in the short term?

Oh absolutely. There will be many more. And while these are new, this class of attack against underlying hardware aren't actually entirely new. Side channel attacks have had increasing research (and now of course there will be a lot more!), while prior efforts into "Rowhammer" showed that we are just beginning to see what is possible. There are even research attacks into artificially aging silicon circuits simply by running malicious code. We are going to see some whacky stuff.

Q: Will the discovery of the Meltdown and Spectre attacks lead to fundamental changes in the way that future chips are designed?

Honest answer? Maybe. It depends upon the medium-longer term fallout from these recent revelations. Fundamentally, programmers want fast machines, but they want those machines to be fast single threaded, non-parallel machines that they can write code for in Python and JavaScript. There's nothing wrong with that, but in order to deliver the constant improvements in performance each generation, we have taken the level of optimization beyond the state of the art. These machines are beyond complex, they're insane. Insanely awesome. But also with complexity comes the potential to find novel exploits. If customers demand that security be prioritized above performance at all costs, then fundamental change will come. But I remain to be convinced. You don't need to worry about these specific exploits - it's the next ones, and what we do to handle them that will really prove what we learn.

Q: What are some possible ways to have speculative execution without the security risks?

Fundamentally, if we have heavy resource sharing, there are *always* ways to exploit the temporal component to infer things about the machine. We can do a lot to isolate workloads, partition caches, incorporate temporal aspects into future ISAs, and we can mitigate these current exploits with some relatively simple design changes, but there will *always* be side channels whenever resources are shared between fundamentally untrusted applications on a single machine. What really matters is figuring out the acceptable tradeoffs in performance and security that we are willing to accept for the world we live in.

Q: Have you enjoyed previous FOSDEM editions? 

Very much. I've been coming on and off since the early 2000s. I grew up in the UK and it was easier to come to FOSDEM when I lived a short train ride away, but I still like to visit Brussels when I can!
