---
year: 2013
person: Dimitri Merejkowsky 
speaker: dimitri_merejkowsky
topic: Aldebaran Robotics and Open Source
event: aldebaran_robotics
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

After three years in an engineering school in France, I arrived at [Aldebaran Robotics](http://www.aldebaran-robotics.com/en/) for my final internship. During three months, I worked with Python and C++ to implement an emerging walk algorithm with genetic algorithms and neural networks. At the end, I was hired, and since then moved from A.I. to lower level tools.

I'm now in charge of the continuous integration, and the releases of the various SDKs (C++, Python, Java) produced by Aldebaran. Basically I'm in charge of making sure everyone can write code for the robot in any way they want.

Q: What do you hope to accomplish by giving this talk? What do you expect?

First we hope to raise awareness around [NAO](http://www.aldebaran-robotics.com/en/Discover-NAO/Key-Features/hardware-platform.html#) as a development platform for developers. There will be a possibility to distribute applications on our [NAO store](https://store.aldebaran-robotics.com/) in the future. We are also sharing parts of our source code, and we would like to engage developers on it.

Q: What's the history of the NAO robot? How did it evolve?

First prototypes appeared in 2005. In 2008, NAO replaced Sony's Aibo robot as the "standard platform" in the Robocup. At this time it was a bit fragile and could only be used by hard-core geeks in the RoboCup.

The last hardware version came out in 2011. Now it's much more robust (it can fall more than 1000 times), and it is used by a very diverse group of people: developers, teachers , students, psychologists, children, ... It was seen at the Vendée globe and recently at the South Pole !

Q: Could you give some examples of cool projects that developers have done with the NAO robot?

One example is an application that turns NAO into a fitness coach: he's doing push-ups and then watch you exercise. A funny one is an alarm clock: the music starts to play, and then the robot walks away so that you have to get out of the bed to turn it off.

Q: Which open source projects is Aldebaran Robotics contributing to as part of the development for NAO?

We have a developer actively contributing to [ConnMan](http://connman.net/), a network manager targeted to embedded support. We've occasionally submitted patches for the open source tools we use every day: [CMake](http://www.cmake.org/), [QtCreator](http://qt.digia.com/Product/Developer-Tools/), the [Linux](http://kernel.org/) kernel, [lttng](https://lttng.org/), and even a bug fix in [Python](http://www.python.org/) 3.3.

Q: Have you enjoyed previous FOSDEM editions?

That's a first for me, but probably won't be the last ;-)
