---
year: 2014
person: Wolfram Sang 
speaker: wolfram_sang
topic: "Making the Linux Kernel better (without coding)" 
event: making_the_linux_kernel_better 
---

Q: Could you briefly introduce yourself?

My name is Wolfram Sang and I live near Berlin in Germany. I have been having fun with computers since my childhood, especially with the Commodore 64. I have been hacking the Linux kernel since 2008, mostly for embedded systems. I work as a Linux consultant freelancer and also maintain the I2C subsystem.

Q: What will your talk be about, exactly? Why this topic? How did you get the idea to talk about it?

I'd like to show that even without programming abilities, people can tinker with the kernel and create benefit for the community. Hopefully, I can give the impression that the kernel doesn't need to be a black box if you don't want it to be.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Spreading some knowledge. Raising some interest. Answering some questions. Having some fun!

Q: If I have some hardware I'd like to get to work with Linux, how do I find the information I need, such as the driver which applies to it?

The tools I use primarily are search engines, Windows drivers, and hardware databases. Details about how to use them will be covered in my talk.

Q: You can easily add hardware support to the Linux kernel if the hardware is just a branded version of already supported hardware. But how can you become sure that your device just differs by branding and it doesn't have other modifications?

Well, either the driver won't work at all or only with flaws. Don't worry, chances are close to zero that you damage your device because of a wrong driver. In case of flaws, it is then time to contact the driver authors. They probably have some hints. Following those hints will mostly require code modifications and recompiling, though. However, for enough rebranded devices, this is not the case. Not changing the hardware is simply cheaper for the manufacturer, thus no extra modifications.

Q: Let's say I have successfully added support for some hardware on my Linux machine with one of the runtime mechanisms. How do I report my findings to have this support baked in the next version of the Linux kernel?

Write a mail with your findings. A problem might be whom to send it to. I'll give guidances in my talk for that. Of course, if you are up for a little challenge, you create a patch on your own. Adding IDs is really simple. I'll give pointers for that, too.

Q: Have you enjoyed previous FOSDEM editions?

Yes, I did. I am really looking forward to this edition, the program sounds interesting already.
