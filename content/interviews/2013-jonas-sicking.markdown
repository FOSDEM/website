---
year: 2013
person: Jonas Sicking 
speaker: jonas_sicking
topic: Firefox OS
event: firefox_os
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

I started hacking on Mozilla because I was working on a website and wanted to use some features which at the time only worked in Internet Explorer. At the time I was in school and was able to find time to do a lot of hacking, initially mostly on the DOM and the XSLT code. This eventually gave me internships both at Netscape and at IBM and, once I had graduated, a job at the newly started [Mozilla Foundation](http://www.mozilla.org/foundation/).

Since then I've been very passionate about the web in general, and about web standards in particular. When [Firefox OS](http://www.mozilla.org/en-US/firefoxos/) and the [B2G](https://wiki.mozilla.org/B2G) project got started I was asked to help lead the [WebAPI](https://wiki.mozilla.org/WebAPI) team which we set up to add the capabilities that the web needs in order to become an application platform capable of running the applications people expect from a modern OS.

Q: What will your talk be about, exactly? Why this topic?

From the abstract:                                                                                                                                                    

> Firefox OS is the next product being developed by Mozilla. It's an open source OS based on the web and following the principals which
> have made the web a success.
> We'll demo a phone running recent builds of Firefox OS (it's *not* a
> finished product yet) and talk about the technologies and ideas behind
> Firefox OS.

We wanted to present Firefox OS because we want to show what we think is the next step in the evolution of the open and free platform that the web is. Developers shouldn't have to be locked in to proprietary platforms or be forced to go gate keepers to publish their applications.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Spread the word about what we are trying to accomplish with Firefox OS, and get interesting feedback from developers.

Q: What's the history of the Firefox OS project? When and why did it start, and did its goals evolve?

The Firefox OS project formally started about a year and a half ago. But to some extent it's an idea that we have been talking about much longer than that. The browser became an application platform a long time ago.

Q: How exactly does Firefox OS relate to Linux and Android? Which code do you share with them and how is the Firefox OS architecture different?

We share the Linux kernel that Android uses. And the hardware drivers that they use.                                                     

Other than that we don't share anything. So we don't use any of their Dalvik Java implementation. And all of the application exposed APIs are entirely different because they are all JavaScript and HTML APIs, rather than the Java and C++ APIs that Android uses.

We've also sandboxed applications much more strongly from each other as to protect user security and privacy.

Q: What are some unique selling points of Firefox OS compared to other mobile operating systems, such as Android?

Our goal with Firefox OS is really the freedom of the user and the freedom of developers. The application platform is such that anyone that has a web server can set up a web store. So there are no gate keepers to the system.                                                                                                              

We've also worked very hard on making the security model such that users don't have to make hard-to-understand security decisions. The Android experience is especially bad where users have to make a lot of security decisions that are hard to understand for almost all users. And the user has to make this decision at the time of installation, when you are most eager to just get going with your newly installed app.                                                               

Instead we have tried to make it possible to make the most wide range of applications possible to create without any security sensitive decisions having to be made. The web has traditionally been great at this. After all, there's a huge number of applications available on the web, and it's safe for anyone to run them by simply navigating to a website. This model is what we have used for the apps running in Firefox OS as well.

In some cases we need to go a little outside of that. In these cases the application will have to be reviewed and signed by a trusted store to ensure that the application doesn't do anything evil. However this is entirely transparent to the user and the user doesn't need to care which app uses sensitive APIs and which one doesn't.

And over time we hope to reduce the set of sensitive APIs by using smarter APIs which are safe to expose to any web app.

Q: If the user interface of Firefox OS and its apps is completely rendered using HTML, CSS and JavaScript, does this have a performance impact compared to 'native' code?

JavaScript is getting really fast these days. Projects like asm.js are making JavaScript in the order of 2x within the performance of C. And modern JITs are able to accelerate most JavaScript to be just a few times slower than that.

But more importantly is that most operations that applications need to do are not raw computational operations which are affected by JavaScript performance. By using hardware accelerated graphics we can make the rendering portion of an application just as fast as a "native" app. And things like IO are relatively easy to get exactly the same as "native" apps by just exposing low-level APIs.

So all in all, performance is certainly never easy to accomplish. But it's looking very good so far.

Q: Is the current Firefox OS code already usable for interested developers? Which devices are supported?

So far only the hardware that we've used during development is officially supported. And hardware is not really available in stores, as it's hardware we've chosen because it's similar to the hardware we will be launching on.

Early on we were developing against Samsung Galaxy SII and I believe people have gotten that up and running again every now and then.

Porting to new hardware is generally not that hard, as long as the hardware supports Android ICS. But so far we've needed to focus on the hardware that we will be doing the initial shipping on.

Q: When will we see the first commercial Firefox OS smartphones?

It should happen sometime in Q2.

Q: Have you enjoyed previous FOSDEM editions?

Last time I went was in 2004 or 2005 if I recall correctly. It was definitely a lot of fun. 
