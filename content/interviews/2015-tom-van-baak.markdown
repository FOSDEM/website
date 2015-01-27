---
year: 2015
speaker: tom_van_baak 
event: precise_time
---

Q: Could you briefly introduce yourself? How did you become infected with the time virus?

I'm Tom Van Baak and I live near Seattle, WA, USA. I have a long career as a kernel/software developer -- from mainframes, to Unix, to Windows NT, to PIC microcontrollers -- and I have been continuously exposed to low-level timing and performance issues. In addition, I have always had an interest in mathematics (number theory, pi, prime numbers), physics (especially hands-on experimentation and measurement), as well as digital electronics. So I guess all those factors added up to make me interested in precision and timing. Time is both a simple and a surprisingly complex and deep subject.

Q: What will your talk be about, exactly? Why is this topic important?

The talk starts with an introduction to time and the wonderful world of precise time, especially for people who are exposed to timing on a daily basis: programmers. It then surveys a wide range of practical ways we keep time: from very inaccurate to extremely accurate. The talk concludes with a first-hand account of using some atomic clocks I have at home to confirm the time dilation predictions of Einstein's general theory of relativity. Time is a wonderful and mysterious subject.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to present a clear view of the world of [time and frequency](http://www.leapsecond.com/). I also want to show how exciting this field is, if you are only curious and ask too many questions, and how well it applies to those of us involved with computers.

Q: Could you give some examples where precise time is important in the daily life of the FOSDEM visitor?

Of course, the classic examples are how satellite navigation works; it's all based on atomic clocks in space. But down to earth, everything from makefiles to 50 Hz power grids to database integrity to email threads depends on precise time and synchronization of the internet. Moreover, every mobile phone, television, and digital audio/video recording/playback depends on precise timing. It's a fascinating core technology that almost all modern devices depend on.

Q: What's the background of a typical time nut and how do they become interested in time?

Some are amateur radio operators (hams), or have a background in electronics, telecommunication, or engineering. Recently a growing number have a background in computing. That includes both high-level environments like Linux, and low-level devices like Arduino. The words nanosecond, latency, MHz and GHz were rarely spoken a generation ago, but now they are very common, all thanks to CPU and communication speeds.

Q: If I'm attending your talk at FOSDEM and your passion for time turns out to be contagious, how can I explore the time world? Do I need expensive equipment? What are some easy experiments to start my journey?

The amazing thing about Time is that everyone owns it and no one really understands it. It spans across technology, cosmology, and theology. Still, much of the basic experience of making clocks, measuring clocks, comparing clocks, adjusting clocks can be done at home for next to free. Curiosity is the only requirement. With internet (NTP), low frequency (e.g., MSF, DCF-77), and high frequency (e.g., GPS, Galileo, GLONASS) timing sources all around us, we have access to precise time only dreamed of by an earlier generation. Use GPS to time your computer. Use an Arduino to time a pendulum clock or 50 Hz mains frequency clock. Use a sound card to sample or generate precise signals.

Q: What are some interesting FOSS projects for time nuts?

NTP is always a huge target. Synchronizing computer time seems so obvious, yet it is so difficult to do precisely and reliably in practice. The [time-nuts](http://leapsecond.com/time-nuts.htm) group is always trying to create open hardware and software projects involved with precise time and measurement.

Q: Have you enjoyed previous FOSDEM editions?

This is my first FOSDEM.
