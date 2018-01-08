---
year: 2018
speaker: robert_foss 
event: android_graphics
---

Q: Could you briefly introduce yourself?

I'm Robert Foss and I'm an open source enthusiast, currently working in the Linux graphics field but doing privacy software, electronics design and software based art for fun.

Q: What will your talk be about, exactly? Why this topic?

I'll be presenting [drm_hwcomposer](https://www.x.org/wiki/Projects/drm_hwcomposer/), which is a little known but potentially impactful piece of the Android graphics stack.

A hardware composer deals with managing graphical buffers from applications and making sure that the display output hardware is provided buffers that are ideal for its needs.

Drm_hwcomposer is interesting because it enabled Android to run on top of the normal Linux graphics stack, it is also important since it provides the ARM GPU vendors with a viable path forward for adding open source components to their drivers (if not open sourcing the whole driver).

Q: What do you hope to accomplish by giving this talk? What do you expect?

I would like to spread some knowledge about the Android and Linux graphics stack, as well as continue to push GPU vendors towards adopting open source drivers for Linux.

Q: On which platforms can we run Android using the mainline graphics stack? Which challenges did you need to overcome to make this possible?

Vivante GPUs are well supported, so are Adreno GPUs. The VC4/VC5 drivers are still lacking, and there are currently no viable Mali drivers.

In order to support drm_hwcomposer the Atomic display framework needs to be implemented, and additionally the driver needs to support explicit fencing (which is a new feature since v4.13).

Q: Which other platforms can we expect to run Android using the mainline graphics stack this year?

Seeing this work on VC4 seems quite likely, I don't think a lot of code is missing. Most of the work would likely be bringing Android up on the device.

Q: What are still some important obstacles on the road to Android being compatible with the mainline Linux kernel?

It mostly is, the two parts that are typically lacking are GPU drivers, and missing support for peripherals. Adding support for peripherals is typically a matter of fixing device tree files and is a normal part of bringup of any platform on a device. However missing GPU support can be harder to fix, if it doesn't already exist for the GPU used by the device.

Q: Have you enjoyed previous FOSDEM editions? 

I have never attended previously, but I have enjoyed the recorded talks immensely. 
