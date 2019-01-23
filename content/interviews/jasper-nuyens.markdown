---
year: 2019
speaker: jasper_nuyens 
event: tesla_hacking
---

Q: Could you briefly introduce yourself?

I am Jasper Nuyens, Managing Director of [Linux Belgium](http://www.linuxbe.com). We provide Linux consultancy, training and support for companies using Linux professionally in the context of servers and embedded Linux. We have been doing this for 20 years, and keep on following the original philosophy which got everything started. It's very exciting and ever changing!

I bought my Tesla Model X, merely from the selling of free software services. Amazing how far our 'Linux industry' has evolved over the years. I never 'worked' on a car before the Tesla, but designed some as a kid.

Q: What will your talk be about, exactly? Why this topic?

One of the last used tools that remained mostly 'analog', are cars. This is changing. Cars are entering our digital realm. One we control. They are constantly online, controlled by computers. To many people, cars are a symbol of freedom. Yet it isn't guaranteed that the future of our electric cars will be free. The opportunity to ensure our future cars will be and remain 'free', is now.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to show that people like me --- 'Tesla Hackers' --- can contribute to the functionality of their car. Make it more fun and able to do more. In this way, I hope to be able to convince car manufacturers and possible collaborators to join this project to improve our cars from the software side.

The goal is to make it easy for people to contribute opensource software to this project, available for everybody to improve and enjoy. I hope to find like-minded people who want to work together to accelerate the transition to freedom guaranteeing electric cars :)

Q: What was your motivation to start hacking your Tesla car?

The massive Linux-based touchscreen and other embedded Linux-based hardware called at me in the night: 'We want you to be root'. I had to obey my natural instincts ;) One can argue that rooting an Android phone brings limited extra possibilities, others will say it's worth it. But think about what you can do if you have root on your own car. The sensors, the actuators, the infotainment system, real-time positioning, privacy concerns,... The possibilities are without limit!

We use an Ubuntu root filesystem, making it super easy to extend the functionality in a cross-platform manner.

Q: What were the biggest hurdles you had to overcome?

The hardest part was getting root access to my own car. Sadly but understandably, Tesla didn't want to provide that to me at the time. Luckily, some people from the TMC forum helped me. Psychologically, it was also a big step for me to break open the dashboard of my brand new Model X to be able to gain access to one of the systems.

I also had the problem that the USB port lost power --- [FreedomEV](http://www.freedomev.com/) runs almost everything from an USB stick. And it can deal with losing power, but it's not very practical for late night development sessions to lose your root filesystem suddenly when power saving gets activated. Recently I got a tip by 'VeryGreen' which helped me to overcome that hassle.

Some people are afraid of the FreedomEV project because they don't realise the Tesla can still drive perfectly safe, even when the computers are rebooting. My wife is already used to the fact that I'm hacking away while she drives the car. 

Q: What can you do currently with FreedomEV?

There are some very nice features we will announce on Februari 3rd, Sunday morning at 10:00. One of the first features which I implemented last August was 'Romance Mode'. I made it for my wife; it speaks through the speakers: 'Kissy, kissy' and displays on the center console: 'I love you baby'. A few months later, Tesla introduced their own take on 'Romance Mode' which turns the large center display into a fireplace. I am honoured by the fact that they did this, and I will not introduce 'Enhanced Romance Mode' just yet ;-)

One of the features we are still working on to introduce is 'Privacy Mode'; a special driving mode in which your car will be prevented from logging your location, or leaking your location information through Wi-Fi or 4G, or any other way we find out. A fundamental part of the 'Freedom' in FreedomEV seems that you should be able to drive somewhere without giving up too much of your privacy.
 
The other very cool features we're working on will be announced then; I'm sure a lot of Tesla owners are waiting for those capabilities and it will surely create a lot of buzz when we announce it. 

Q: How can interested owners of electric vehicles contribute? In which domains could you use some help?

We can use help in all aspects, as we're just starting out with this project. The configuration of the system, improving the already built in functionality, communication with the media, graphics, advocacy,... 

Tesla owners with root access will be able to test out FreedomEV 1.0 and can add whatever functionality they see fit to it, and contribute it back. We require contributions to be in source form and in a FLOSS compatible license so we can guarantee the freedom part and know what we run on our cars. Our own created parts will be GPLv3 and AGPL licensed. I don't want to run software which is not from the vendor on my car if I cannot trust and verify the source code. 

We also see interest in this project by people who are still waiting or saving for their first electric car. We can improve the tools for those people to build things while they wait for their cars to be made or delivered.

Q: What can we expect this year from the FreedomEV project? And what is your goal in the long term?

The long term goal is to guarantee freedom and control of our own cars. With the focus to maximise the functionality, privacy, control and fun for the end user. That is our main motivation. 

It would help if we are able to convince car manufacturers to collaborate with us, possibly sponsor us. If we create cool stuff, make these cars even more enjoyable and fun in a secure and responsible manner, why not? They will sell more cars. 

Many people will like to add very different features, and with the core of FreedomEV running on an Ubuntu rootfs, it's easy to build additions based upon existing opensource tools: specify the dependent packages, which service to run or command to launch and possibly overlay some files from the original filesystem.

We want to provide the mechanism and become the [repository](https://github.com/jnuyens/freedomev) for cool electric vehicle add-ons with a focus on end-user rights (with respect for the business models of manufacturers and service providers). 

Q: Have you enjoyed previous FOSDEM editions? 

Absolutely, I have enjoyed FOSDEM so many times and was lucky to see it grow from something relatively small to --- at least for me --- the main software event in the world. It's fantastic that the original spirit of Free and Open Source Software has remained intact and that the organisers and all the volunteers take it upon themselves each year to welcome us. I am honoured to be able to present the launch of the FreedomEV project at FOSDEM for all these participants whom I owe so much.
