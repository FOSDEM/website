---
year: 2014
person: [Jeremy Bennett, Kerstin Eder] 
speaker: [jeremy_bennett, kerstin_eder]
topic: "Who ate my battery?: Why free and open source systems are solving the problem of excessive energy consumption."
event: who_ate_my_battery 
---

Q: Could you briefly introduce yourself?

*Jeremy*: I'm an academic computer scientist turned entrepreneur. Compilers have been my great intellectual love, while I have long been fascinated by really small computers. As a businessman I despair at the economic inefficiency of proprietary software development. So now I run my own company developing open source compilers for embedded systems.

*Kerstin*: I'm a Reader at the University of Bristol, specializing in Design Automation and Verification. I've started the Energy Aware Computing (EACO) initiative at Bristol and chair the [EACO workshop series](http://www.cs.bris.ac.uk/Research/Micro/eaco.jsp). My research is focused on specification, verification and analysis techniques which allow engineers to design a system and to verify/explore its behaviour in terms of functional correctness, performance, power dissipation and energy efficiency.

Q: What will your talk be about, exactly? Why this topic?

*Jeremy*: Power is a critical factor in modern computing at all scales, be it the size of the power station to run your data centre, the length of time your phone battery lasts, or how much computing you can achieve with an energy scavenging device. On the whole we do a stunning job at tackling the hardware side of this, and a terrible job at tackling the software side of this. We'll be explaining how you need to do both together, and build systems where both hardware and software are energy efficient.

*Kerstin*: Low-power has long been a hardware design goal. Every hardware design is a point in 2D space, where energy consumption and performance can be analysed to find the optimal balance for a target design. But energy-aware computing requires analysis beyond the hardware layer in the "system stack", including compilers, programming languages, software and algorithms. The focus of our talk is on the layers above hardware, which is where the biggest savings can be made. The software development tool chain plays a key role in energy efficient system design. We'll explain why energy consumption should be promoted to a first class software design goal, and show what we do to achieve this vision.

Q: What do you hope to accomplish by giving this talk? What do you expect?

*Jeremy*: We hope the audience will learn that 1) measuring the energy efficiency of a system is now cheap and easy - thanks to open source and 2) that by doing this they can build complete systems - hardware and software - that use much less energy. And of course we hope people will want to find out more and come to the [Energy-efficient computing devroom](https://fosdem.org/2014/schedule/track/energy_efficient_computing/) on Sunday.

*Kerstin*: I hope our talk will give "more *power* to software developers" - literally. It is important that developers become aware of the need to consider energy consumption from the outset and that they get access to tools that enable energy aware system design. With this talk and the Energy efficient computing devroom on Sunday I hope to stimulate energy efficient software design. I'm keen to run a "cool programming" competition in the near future: "What is the lowest energy code to compute X?"

Q: What's the role of open source software in making modern hardware power efficient?

*Jeremy*: From my narrow perspective as a compiler engineer, the major compilers, particularly in embedded systems are free software (GCC and LLVM), so we were always going to be a FOSS project. But more generally this is a hard problem, both technically and because of the need to evangelise software engineers to take energy seriously. We'll only crack it if we share everyone's expertise, and we'll only make a difference if we share the ideas as widely as possible. A completely open approach is therefore essential.

*Kerstin*: To enable mass uptake the tools for energy efficient software development must be FOSS. In the [ENTRA project](http://entraproject.eu/) we target LLVM IR with the development of our energy consumption analysis tools. These include tools for energy modelling and tools for resource analysis. LLVM IR is an excellent choice for community engagement and we hope that developers will find our tools useful when they start to write energy efficient software.

Q: How does optimizing for energy efficiency affect code speed and size in general?

*Jeremy*: As a first approximation, particularly for the simplest architectures, a processor burns the same amount of power whatever it is doing. Since energy = power * time, the initial approach is to run your program as fast as possible and then turn the processor off. Similarly big programs need more memory, which takes energy to run, so smaller programs are going to be more energy efficient. But to get to the next level needs a more detailed approach. There are plenty of optimizations which disproportionately impact on energy compared to speed - the Neon co-processor multiply unit on an ARM A8 is a particular example. Finding all these will give you that added 10-40% of energy efficiency.

*Kerstin*: Energy efficiency is not just a question of code optimization, though. To achieve an energy efficient solution to a problem, the algorithm needs to fit well with the target hardware. A poor fit can result in costs far exceeding the benefits of code optimization. It is therefore important that techniques are being developed that allow software engineers to gain an understanding of the energy consumption of the algorithms they use, in addition to providing them with optimizations that achieve more energy efficient code.

Q: Suppose I'm a developer of an open source project and I want to make my software more energy efficient. Where do I start? What do I have to learn, which tools should I use?

*Jeremy*: First thing is to be able to measure how much energy your system is using. We've designed a very low cost board for sampling the continuous energy usage of your system. We'll have some to give away at the devroom, we'll be putting more into production in due course, and it's a completely open design, so you can always build your own. Once you can measure, you are then in a position to optimize. The [MAGEEC project](http://www.mageec.org) has all its resources completely open. The best way to get started is to come to the Energy efficient computing devroom on FOSDEM Sunday.

*Kerstin*: The key prerequisite to energy efficient software development is energy transparency from hardware to software, in short, you must know how much energy your code consumes. This opens up the 2D space that allows you to analyse your software in terms of performance and energy consumption. Energy transparency can be achieved by measuring at runtime as Jeremy stated. Our students have developed EACOF - a simple Energy Aware COmputing Framework (EACOF) - that forms a layer of abstraction between sources of energy consumption data and the applications that use them. This eliminates platform specific instrumentation and enables developers to profile their code for energy consumption in a simple and portable manner. You can soon access EACOF at [github.com/eacof](http://github.com/eacof). The EACOF will also be presented at the Energy efficient computing devroom on Sunday.

As an alternative, you could use static analysis. This is what we are developing in the [ENTRA project](http://entraproject.eu/), where we rely on energy models that characterize the energy consumption behaviour of the hardware. Static resource analysis techniques are then applied during compilation to characterize the energy consumption of the program, based on the energy models of the target hardware platform, returning energy consumption formulae parametrised by properties of the input data. Watch the ENTRA project for new tools to be released shortly, and come to the Energy efficient computing devroom on Sunday to get an early birds demo.

Q: The MAGEEC project aims to build a compiler framework that optimizes for energy efficiency. Will the result be easy to use for developers? For instance, will using it be as simple as adding an optimization flag -Oenergy or something like that?

*Jeremy*: This is the ultimate goal, but one of the key things is that for energy the options are going to be different for each program. So -Oenergy will not be a pre-set group of optimizations, but access to a database, which has been trained to know which optimizations will be best for a particular program. Ultimately the approach is completely generic, so we would hope to see better versions of -Os, -O1, -O2 and -O3 as well from the work.

Q: Have you enjoyed previous FOSDEM editions?

*Jeremy*: Most certainly, and looking forward to 2014!

*Kerstin*: This is my first FOSDEM and it is promising to be a great event.
