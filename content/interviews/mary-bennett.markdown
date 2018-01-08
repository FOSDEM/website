---
year: 2018
speaker: mary_bennett 
event: edsac 
---

Q: Could you briefly introduce yourself?

My name is Mary and I am electronic and electrical engineering undergraduate spending my professional training year at [Embecosm](http://www.embecosm.com/) as a UKESF scholar. The UKESF is the [United Kingdom Electronics Skills Foundation](http://www.ukesf.org/). It offers paid scholarships to the top English students who are studying electronic engineering.

You may have met me dressed up as Link at Comic Con and other events. Cosplay and watching anime are two of my biggest hobbies. I also practice Jiu Jitsu, Aikido, and Iaido which helps to keep me in character.

Q: What will your talk be about, exactly? Why this topic?

In 1948, EDSAC was one of the first valve based general purpose computers. I’ll be telling the story of reimagining EDSAC using entirely open source software, hardware and discrete electronics.

In a world of iPhones and Xboxs, it is important for a new generation of engineers to understand where their technology came from. This project has been explicitly designed to be both accessible and affordable for school students.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope that my audience will feel inspired to either build one themselves or take it into their children's school to build it with them. And then contribute back to the overall project.

Q: What's so special about the EDSAC? Why did you decide to reimagine this historic computer and not another one?

EDSAC was one of a small number of general purpose computers, built at the same time. It was unique because it was the first such computer designed to inform a service to other disciplines such as maths, engineers and natural sciences rather than being created as a research project of its own right.

An early example of research using EDSAC was solving differential equations relating to gene frequencies. Nerve action potentials were also calculated using EDSAC and its successor, EDSAC 2. In 1952, one of the first programmed games of tic-tac-toe was written and played.

Q: When you recreated the EDSAC computer, what program did you run on it to test it?

We have run a program to calculate square numbers, similar to one of EDSAC’s earliest programs, on the processor. This is still a working progress, we have individually tested the physical components but not fully run a programme with all the bits together. This talk will show what stage we have achieved so far.

I had support from an international open source team to help me put together and test the reimagined EDSAC. This team includes Bill Purvis and Hatim Kanchwala who wrote Verilog implementations of EDSAC’s CPU and test programs ([Bill Purvis' implementation](http://www.billp.org/ccs/Edsac/), [Hatim Kanchwala’s version](https://github.com/librecores/gsoc-museum-edsac)). The FPGAs that ran the Verilog implementation were [MyStorm boards](https://mystorm.uk/) designed by Ken Boak and Alan Wood.

Q: What was the most interesting thing you learned about the inner workings of the EDSAC?

I found the delay line the most interesting because of how different they are to currently used memory storage especially in terms of size and memory capacity. I particularly enjoyed exploring the acoustic side of things and during my talk I will be explaining mercury delay lines and demonstrating the air delay line that we created. I will also be showing our attempts at creating a gin, as recommended by Sir Alan Turing, and beer delay line.

Q: Have you enjoyed previous FOSDEM editions?

This is my first FOSDEM. However the Embecosm team who are long term participants have been hyping it up all year, so I’m really looking forward to it.
