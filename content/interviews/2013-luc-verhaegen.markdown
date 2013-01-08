---
year: 2013
person: Luc Verhaegen 
topic: Open ARM GPU drivers 
---

Q: Could you briefly introduce yourself?

I am a 33 years old Belgian, who has been working on graphics drivers for almost a decade. I was the first to create structure in modesetting, and to use this structure to remove BIOS dependencies from display drivers. I moved to Nuernberg, Germany, in 2007 to join SuSE, and the first thing we did was create a free driver for ATI R500 and up, in cooperation with AMD, called RadeonHD. This was not to the liking of ATI or Red Hat or a few others, and what should have been a free software dream quickly turned into a political nightmare. In 2010 I joined the Meego Graphics Adaptation Team at Nokia and worked on the PowerVR kernel driver for the Nokia N9. After some further consulting work, I am now taking a bit of a breather to finally get my Lima project somewhere.

Q: What will your talk be about, exactly? Why this topic?

Originally, I had hoped to have half a day of only ARM GPU talks in the Xorg devroom, but this year the Xorg devroom is limited to just one day, and I had to condense the ARM GPU talks to a minimum to allow for other topics.                                                                                                              

This talk will be a relatively high level description of the current situation with open source 3D/GPU drivers for the ARM ecosystem. It will not only show how far the Lima driver has come in a years time, it will also cover the other ARM GPU projects and the persons driving those. It will end with a demo of the current lima driver work, and then I'll try to drag as many people as possible over to the X.org devroom where the other ARM GPU developers can go into more detail and demo their stuff.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Speaking as a developer, this is mostly about exposure for the free ARM GPU driver projects, and the people behind them. As the organizer of the Xorg devroom, given the massive crowd that visited my Lima talk last year, I think there will be a sizable portion of FOSDEM visitors who are dying for an update on free ARM GPU drivers. And who knows, maybe it will also inspire some in the audience to contribute to what is a very labour intensive but very rewarding task.

Q: Before you showed the Lima driver at last year's FOSDEM, the open source graphics driver world ignored the ARM market. Given that ARM devices have been quite popular for some years now, it's remarkable that they didn't attract developer attention sooner. What were the technological barriers or other reasons for this?

Like with my modesetting work before, the time was just right for a project like this, and it just needed someone to show the way.                                                                                                         
After the nastiness surrounding the RadeonHD driver, it was clear to me that three x86 graphics vendors each had their corner of the market and stuck to their respective positions with respect to open source software support. The ARM space was still uncharted terrain where nothing had been decided yet, and everything was still open.

Android devices had become ubiquitous in 2010, although still very much locked down, and the SoCs in them became pretty powerful with a lot of silicon devoted to the GPU. With more and more vendors abiding to the GPL, it became possible to create android distributions like CyanogenMod, and even to install proper GNU/Linux distributions. The availability of only binary userspace drivers then became a big problem.                                                                                      

In 2011, when I started doing the initial work on the Mali, there were only few technological barriers left to start reverse engineering on Android devices. One major one was the lack of LD_PRELOAD in the android libc linker (bionic), but this got resolved with Android 2.3. After that, it just was all a bit abstruse and cumbersome, and it just needed a trailblazer, someone to prove the feasibility of such an endeavour.                                                                               

In the meantime, we have some reasonably open SoCs which can happily run a proper linux distribution, sometimes with even some limited binary driver support. The situation for the Allwinner A1x family is particularly favourable (sadly not due to vendor policy), with a vibrant community working on the different subsystems of this family of SoCs. There are even some open source hardware boards available commercially.                                                                                   

ARM GPU driver development now has become mainstream. The vendors are still pretty apprehensive, but that will change when we actually have drivers out and our userbases become impossible to ignore.

Q: Which popular ARM GPUs have an open source graphics driver now and in which state?

Come to the talk and find out :)                                                                                                                                       
                                                                                                                                                                       
Honestly though, I am in very direct contact with Rob Clark (freedreno) and Erik Faye-Lund (who is working on the Tegra), Wladimir J Van Der Laan (working on vivante) as we all hang around in the lima irc channel on freenode, but I am not 100% knowledgable yet about the current status on all projects. I still have a few weeks to do the research ;)

Q: Which new developments can we expect in open ARM graphics drivers in 2013?

We should finally leave the research stages and get some semblances of working, useful, drivers out this year. Freedreno is rapidly becoming a useful driver already, and even though I had hoped to achieve that with Lima in 2012 still, work conspired against it :)

Q: Have you enjoyed previous FOSDEM editions?

I haven't missed a single FOSDEM since my first visit in 2004, and only something severe could keep me away. There is simply no event like it :)
