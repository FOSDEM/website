---
year: 2013
person: Morgan Quigley 
speaker: morgan_quigley
topic: "ROS: towards open source in robotics"
event: ros_open_sourcet_sobotics
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I work at the [Open Source Robotics Foundation](http://osrfoundation.org/), a recently-formed entity whose mission is to  "to support the development, distribution, and adoption of open source software for use in robotics research, education, and product development." I recently finished a PhD at Stanford University which included early work towards the [Robot Operating System (ROS)](http://www.ros.org/wiki/), an open source suite of libraries and tools intended to simplify and accelerate the development of robotics software in both research and industry. Other current projects at the Open Source Robotics Foundation include a concerted effort to push development of [Gazebo](http://www.ros.org/wiki/gazebo), an open-source simulator intended for robot software development, as well as open source infrastructure to facilitate integration of ROS with Android devices.

Q: What will your talk be about, exactly? Why this topic?

From the abstract:

> This talk will explain what ROS is, and what it isn't. It will provide some context for the design of ROS, describe what people are doing with it, and outline some current and future directions for development. I will cover both technical design details and the community-centric features of the ROS ecosystem.

Why this topic? Because robotics is an exciting and growing field, particularly in domains involving uncertainty and challenging perception, i.e., anything outside of a tightly-controlled single-product manufacturing line. We believe that the complexity and volume of software required to create intelligent robots is far beyond the capability of any one person or organization, and that open systems such as ROS can ease the systems aspects of inter-organizational collaboration. This can allow progress to occur at a faster pace and reduce duplication of effort.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Like all other software domains, the open source robotics ecosystem always benefits from new contributors: when people bring expertise from other domains, the resulting cross-pollination is mutually beneficial and produces more robust and ever-more ambitious systems. I hope this talk will encourage those attending to check out and contribute to ROS and related projects, such as the Gazebo open-source simulator.

Q: If I want to use ROS to build robot applications, how do I start?

A vast community-curated wiki is available at [http://ros.org](http://ros.org). Tutorials are provided about how to use the internal messaging layer of ROS and how to hook into existing large blocks of functionality, such as robot navigation subsystems, computer vision modules, and so on.

Q: Which affordable robot hardware do you recommend to experiment with ROS?

The [TurtleBot](http://turtlebot.com/) platforms were designed specifically for this purpose. They use a low-cost 3D camera and mobile base, allowing one to quickly start using many subsystems of ROS and the collection of related projects. But of course, the zero-cost platforms are the simulated robots! The [Gazebo project](http://gazebosim.org) plays nicely with ROS, and is intended to be a development target for robot software by simulating robot actuators, sensors, actuators, environment physics, and offers the same ROS API as real robots. And it doesn’t run out of batteries.

Q: What is a "ROS Distribution"?

Like many large software projects, ROS is structured as a set of “packages,” which can be independently installed. Furthermore, the distributed-development philosophy of ROS encourages contributors to set up their own code repositories. In an attempt to provide a stable development target for the community, a set of commonly-used packages is periodically time-stamped and co-released as a named ROS “Distribution.” The current distribution, ROS Groovy, was released in January. Of course, people can still develop against prior distributions, such as ROS Fuerte, which was released in April 2012. And the truly ambitious can always grab the current bleeding-edge source trees.

Q: Which new features can we expect in ROS in 2013?

Current areas of interest and active development in the ROS community include multiple-robot support, easing the cross-compilation required for ARM processors, interaction with Android and other embedded devices, improving the build system, and improving simulation speed, fidelity, and content-creation tools. Due to the “asynchronous” nature of development in the ROS community, these efforts are happening in parallel and by many groups around the world.

Q: How can people contribute to ROS and which kinds of contributions are you especially looking for?

The easiest way to contribute to ROS is to find an area of robotics software that you find interesting, whether that be systems aspects or a specific application domain, and just jump in. The ros-users email lists and (especially) the ROS SIGs can help point out existing work to help reduce the amount of duplication.

Q: Have you enjoyed previous FOSDEM editions?

This is my first visit to FOSDEM, and I am really looking forward to it!
