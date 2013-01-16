---
year: 2013
person: Vincent Untz 
speaker: vincent_untz
topic: Has the GNOME community turned crazy?
event: challenges_gnome
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

Sure. I've been involved in free software since around 2002, which is when I started playing with [GNOME](http://www.gnome.org/). I have contributed to the project in tons of different ways: bug triage, translation, code, release management, marketing, etc. I've been the maintainer of several core modules in the past, the release manager for 4-5 years, a member of the [GNOME Foundation](http://www.gnome.org/foundation/) Board for 4 years, and so on. I was also part of the small group who pushed for GNOME 3 before we knew what we wanted to achieve with it, and releasing this new milestone became my goal for the following years.

Since 2008, I'm also involved in [openSUSE](http://www.opensuse.org/en/), where I helped shape the GNOME team and attract new contributors to this community. I'm currently the chairman of the [openSUSE Board](http://en.opensuse.org/openSUSE:Board).

On my work time, I'm having fun with cloud technologies (such as [OpenStack](http://www.openstack.org/) and Crowbar), at [SUSE](https://www.suse.com/).

And I'm French :-)

Q: What will your talk be about, exactly? Why this topic?

In this talk, I will openly discuss several of the hot topics related to GNOME that people keep mentioning here and there (some of your next questions are good examples ;-)).                                 
                                                                       
I've been willing to talk about this since a few months ago, when I realized that GNOME was making the headlines of some websites at least once a week: this made me realize that people care about what the GNOME project is doing, and that the GNOME community needs to care about explaining what we are doing.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to clarify the directions the GNOME project is taking, and to explain the rationale for various decisions. My end goal is to make people understand the project better, and trust it again.

One important challenge for GNOME today is that some people are unhappy about it and blaming it for different woes. Sometimes, when reading comments, I feel that the person believes the GNOME community just wants to destroy the world. It's also relatively easy to find misinformed comments... Of course, GNOME is not perfect and there are certainly valid reasons to complain about it. But there are also many happy users! I've discussed with people switching back to a free software desktop thanks to GNOME 3, for instance.                                                                                                                                       
                                                                   
If I manage to debunk some myths about GNOME and to have people get a clearer vision about what GNOME is doing, then the talk will have been useful.

Q: GNOME 3.8 will drop the fallback mode, but GNOME developers are working on improving GNOME when running with software rendering. So what will the alternative to the fallback mode offer and what will the minimal system requirements for running GNOME 3 become?

The fallback mode was being used for two reasons: computers that didn't have 3D acceleration, and people that wanted to keep a user experience similar to GNOME 2. However, the original goal of the fallback mode was really just the first case, and not the second one.

After two years in GNOME 3, it became clear that the fallback mode wouldn't have the quality and integration we expect from GNOME software anymore. Moreover, the progress on [llvmpipe](http://www.mesa3d.org/llvmpipe.html) made software rendering a solid option to run GNOME 3 -- something which has been the plan since the beginning, actually. Hence, we decided it was a good time to stop shipping the fallback mode (note that some people might still work on it, and do releases; help is welcome there).

We do not want to abandon users that were using the fallback mode because they preferred that user experience. We intend to offer a set of extensions (most likely a taskbar, a classic alt-tab, a main menu, etc.) for this audience. I'm pretty much aware that some people feel we should have done that since day one, but it was a matter of priorities, and back then, extensions were more of an experiment. Thanks to many great extensions out there, it was proven to be a successful experiment, which is why the project is embracing them to offer an alternative to the old fallback mode.

In terms of system requirements, obviously, having 3D acceleration is recommended; since free hardware drivers are in a good shape nowadays, this shouldn't be too much of an issue. But we're also working on a mode using reduced resources (with fewer animations, for instance) to mitigate potential performance issues under llvmpipe.

Q: Some time ago, there was some talk about a "GNOME OS", but it was quite confusing. Could you clear things up for us? GNOME isn't becoming an operating system, right?

I'll give more details about this in the talk, but the short answer is that GNOME is not becoming an operating system and "GNOME OS" is merely an internal code name for some of our efforts, which include better integration with the whole OS and a good consistent user experience at all levels of the OS. This is actually nothing new. Desktop people have been pushing technologies to improve the desktop for years: I remember how people were wow'ing the first time they saw gnome-volume-manager doing magic thanks to hal; this is pretty banal nowadays (and both gnome-volume-manager and hal are long deprecated now).

This name has been one great communication failure on our side, and has caused misunderstandings after misunderstandings (even inside our community), and I personally wish we would stop using it.

Q: Are you also targeting mobile environments such as tablets, smartphones and smart TVs?

No, this is not the target of GNOME at the moment. GNOME is still made for the "good old" computers, but is also being designed with touch-enabled laptops in mind. But those are still laptops, not a different set of devices.

That being said, bits of the GNOME platform can be found in devices like the ones you mentioned, and that's something the GNOME community wants to keep possible.

Q: Is systemd a hard dependency now or is GNOME 3 still portable to non-Linux operating systems?

No, systemd is not a hard dependency of GNOME 3.                        
                                                                      
There are dependencies on some dbus interfaces that systemd provides, but that are implementable without systemd (and I think some distros have done that), and for some specific features that are optional, there is a dependency on systemd. But GNOME is still able to run on other OS.

Q: One of the critical comments against GNOME 3 I hear a lot is that GNOME developers aren't listening enough to what their users want and need. Do you find this criticism valid or do you think it exaggerates your project's position?

Obviously, a radical change like the user experience change between GNOME 2 and GNOME 3 leads to more negative feedback than usual. It's often a feedback that is "emotional": it's not pointing out specific issues, or it's about issues that were fixed a while ago. But we also get a lot of positive feedback! More and more, you can see people stepping up to say how much they like GNOME 3.

When it cames to negative but still constructive feedback, I feel that the GNOME community does listen, and takes into consideration this feedback to further improve the design of the desktop. Sometimes, it means a decision is simply reverted; or that the new design works in a different way that is compatible both with the original intent and the negative feedback from the first implementation.

It also happens that we have temporary regressions on the path towards a specific feature or design, and that creates issues for our users. For instance, we might lose a feature that we want to replace, but we don't provide the replacement at the same time. Personally, I'd prefer to avoid such development methods, but GNOME is a huge community with different ways of working :-)

Btw, one thing that I find highly interesting when looking at the feedback is that the fact that we get so much of it: it means that people still care a lot about the desktop!

Q: You have been involved in the GNOME project for more than ten years now. Looking back at all those years, what is the most notable evolution in GNOME that you see?

I've been so close to the project that it's hard to tell... Ten years ago, we were about to release GNOME 2.2. I think what radically changed is the overall quality of our desktop.

This stems from our six-months development cycles. This development method was a game-changer for us, as we manage to keep a steady flow of improvements landing. People doubting this should really go back and compare GNOME 2.32 to GNOME 2.0. And GNOME 3.8 will already be so much better than 3.0!

Funnily, I was positively surprised by what we managed to release a GNOME 3.0 because it didn't really fit those six-months cycles. So we knew it would not be perfect, but it was actually much more solid than what I had anticipated, and the user experience was already great.

What didn't change, though, is our values: we care about freedom and we want to produce software that is usable by most, which leads us to care about, among others, accessibility, documentation, internationalization, usability and user experience. Not just code.

Q: Have you enjoyed previous FOSDEM editions?

Of course! I'm not totally sure when was my first FOSDEM (2006?), but I think I've been to all of them since then. It's the perfect excuse to go eat French fries and waffles :-) 
