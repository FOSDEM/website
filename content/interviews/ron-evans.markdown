---
year: 2019
speaker: ron_evans 
event: go_on_microcontrollers
---

Q: Could you briefly introduce yourself?

My name is Ron Evans aka [@deadprogram](https://twitter.com/deadprogram), and I have been an open source software and hardware contributor to many projects over the years. I am also the creator of [Gobot](https://gobot.io), which is hardware control middleware written in Go, and [GoCV](https://gocv.io), which lets you use OpenCV from the Go programming language. I gave a talk about GoCV at last year's FOSDEM.

Q: What will your talk be about, exactly? Why this topic?

This talk is an introduction to [TinyGo](https://tinygo.org), which is a new compiler for the Go language targeting lightweight processors and a small memory footprint. TinyGo lets you run Go code on devices such as the Arduino Uno and BBC:Microbit, among others.

Go is a great general purpose language for developing software, and we're part of the movement to bring Go to embedded systems and other constrained environments.

Q: What do you hope to accomplish by giving this talk? What do you expect?

The goal of this talk is to show people that TinyGo can be a great way for developing embedded software, and of course convince them to start using it and joining in.

During the talk there will be live demonstrations of hardware devices, so it should be spectacular one way or another. I don't want to spoil the surprises...

There will also be the ever popular "Choose Your Own Hardware Adventure" part of this talk, so you should for sure be there in person.

Q: What's the history of the TinyGo project? And how did you get involved?

TinyGo is the creation of [Ayke van Laëthem](https://aykevl.nl/), an open source programmer from the Netherlands. Ayke has contributed to other interesting software in the embedded world such as MicroPython. Actually, TinyGo is his second attempt at bringing Go to microcontrollers.

I discovered the project via other people in the Go programming community who know my interests, and immediately got very excited, as TinyGo was already able to do some things that I had been thinking about for several years. I jumped in as a contributor and cheerleader, and now I am one of the core members, focusing mainly on the hardware integration code.

Q: The Go language wasn’t designed to run on microcontrollers. What were the biggest challenges in writing TinyGo?

Really it is more about the Go compiler than the the Go language itself. The main Go implementation has a compiler that prioritizes minimizing build time, not file size. It also is intended to run on multi-core machines, so some aspects of the runtime are optimized for that.

However, since the entire Go compiler toolchain is written in Go itself, it is possible to use the Go language parser and other parts of the core, and then connect them to use the [LLVM](https://llvm.org/) compiler to generate code for the target processor. This requires a lot of knowledge of both Go and LLVM, but the result is extremely small and efficient code.

Q: How instrumental was the LLVM compiler toolchain in creating TinyGo?

LLVM is really an amazing project, and without LLVM there is no way that TinyGo could exist. LLVM is a state-of-the-art optimizer and compiler backend, in library form. I'm not aware of any project even near LLVM in quality that can be used as a library.

We're hoping to hang out and collaborate with LLVM team members and contributors that will be at FOSDEM. Hit us up!

Q: If I'm a Go developer and I want to run my Go program on a microcontroller using TinyGo, what do I have to do? Which Go language constructs aren't supported in TinyGo? Are there some guidelines to help convert my Go code to TinyGo?

At the moment, the best source of examples are those in the TinyGo repo itself, but we're working on adding and organizing them to make them easier to find. We have a Docker image already that lets you run the entire toolchain on various operating systems like macOS and Windows, for those people who do not run Linux on their desktop.

One of the best resources on the differences between TinyGo and the main Go implementation is an [automated import report](https://github.com/trashhalo/tinygo-import-report) that was put together by [Stephen Solka](https://github.com/trashhalo), another of the TinyGo contributors. It runs a test suite using TinyGo against the Go standard library packages and produces a partial report of what is working, and what is not.

Q: What does TinyGo's community look like? How can interested developers contribute? In which domains could you use some help?

The community has been growing quickly, thanks both to the level of interest in the Go programming language itself, as well as the interest in writing software for highly constrained environments. There are a bunch of people mostly interested in using TinyGo to target [WebAssembly](https://webassembly.org/), which could easily be another whole talk.

We have people [on Slack](https://gophers.slack.com/messages/CDJD3SUP6/) from all around the globe, eager to help out anyone getting started. We're actively working on making it easier for new developers to install and use TinyGo, and creating a roadmap so contributors can help.

Q: Which new features can we expect this year in TinyGo? And which new architectures, chips or microcontroller boards will be supported?

We have a lot of plans for TinyGo, both in terms of hardware support, as well as new environments that can be targeted for compilation.

We're also having a [TinyGo BoF session](https://fosdem.org/2019/schedule/event/bof_tinygo/) on Sunday at 13:00 after the talk, so come hang out with us and help guide the project direction.

Q: Have you enjoyed previous FOSDEM editions?

This is my third year as a speaker at FOSDEM, and it will be really awesome to be the first speaker to ever present a talk about Go on one of the main stages. FOSDEM is a great experience and really embodies the spirit of open source collaboration. Thank you to the volunteers who make it possible every year!
