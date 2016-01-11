---
year: 2016
speaker: frank_ch_eigler 
event: systemtap 
---

Q: Could you briefly introduce yourself? 

I'm a long-time free/open-source software programmer and part-time sysadmin, enjoying working down at the "systems" level on a variety of projects.  I've enjoyed architecting new work, extending features, and helping others do all these.  I especially enjoy trying to find small fixes in complex old software, where major rework is not practical.

Q: What will your talk be about, exactly? Why this topic?

We will introduce [systemTap](https://sourceware.org/systemtap/), which is normally thought of as a passive programmable profiler/tracing type tool for the whole Linux system. Then we will show its extra "guru mode" facilities that allow privileged users to not only read but write state on a live machine.

Next, we will review a few historical security vulnerabilities (and maybe some ordinary bugs), and show how changing only the buggy code's state (variables) can sometimes work around the problems.  We will demonstrate the steps to go from that mental pseudocode to SystemTap scripts to make those changes happen, including an overall workflow methodology.  There are a range of approaches, because bugs and exploits vary in complexity and likelihood of abuse.  SystemTap can express several of them.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope people appreciate the possibility of this unusual way of patching bugs.

Q: How does your approach of security band-aids with SystemTap compare to dynamic kernel patching infrastructures such as livepatch and kpatch?

Those live-patching methods are relative more invasive, and in their relatively infancy.  They generally don't allow gradual exploration of the vulnerability, nor enable a spectrum of responses from tracing, to notification, to defense.  They may not compose as nicely with other fixes.

Q: What information do I need to create a SystemTap band-aid for a security bug?

Source code of the vulnerable section of code; the analytic capability to understand the patch; the imagination to see what state changes can detour the program around the bug; the SystemTap language familiarity to express those changes.  We'll try to nurture those skills.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first, though several folks from our team have spoken highly of their experiences in the past.
