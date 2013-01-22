---
year: 2013
person: Sara Golemon 
speaker: sara_golemon
topic: Scaling PHP with HipHop
event: scaling_php_with_hiphop
---

[<%= @item[:person] %>](/schedule/speaker/<%= @item[:speaker] %>) will give a talk about [<%= @item[:topic] %>](/schedule/event/<%= @item[:event] %>) at FOSDEM <%= @item[:year] %>

Q: Could you briefly introduce yourself?

Well, I'm a software developer in my mid thirties from California.  I've been with [Facebook](http://www.facebook.com/) for the past 2.5 years and [Yahoo](http://www.yahoo.com) prior to that.  I've been a contributor to the [PHP](http://php.net/) project since 2002. I authored the book "Extending and Embedding PHP", and wrote the original version of [libssh2](http://www.libssh2.org/) which has since been taken over by and integrated into the [cURL](http://curl.haxx.se/) project.  And of course recently I've become involved with [HipHop for PHP](https://github.com/facebook/hiphop-php/wiki), which is Facebook's reimplementation of the PHP language.

Q: What will your talk be about, exactly? Why this topic? And what do you hope to accomplish by giving this talk? What do you expect?

In short: It's time to start over and say hello again.

Since HipHop first debuted at FOSDEM 2010, its gone through some profound, and sometimes rocky, changes.  We went a little dark for awhile leading some to think that development on it within Facebook had stopped.  The good news is that this couldn't be further from the truth.  For the past six months or so we've been reestablishing our OSS footprint, addressing the sore points of language parity, and getting back into the rhythm of sharing our hard work in a timely manner.

Most importantly though, is that we've spent the past couple years redesigning how HipHop works from the ground up.  We heard, and felt first hand, the agony of compiling source between every minor code revision, pushing monolithic binaries, and dealing with the frustration of a development environment which sometimes behaves differently than production.  HipHop is now as easy to use for development as PHP, but with all the performance you expect from compiled code.

Yet when a PHP developer is asked if they've tried HipHop, their answer typically reveals that they're thinking of the old HipHop.  So it's time to start fresh, and that's what I hope this talk will do.  I'll spend some time describing the new design and how it fits into existing workflows, walk through setting up a new system, and go into a little bit of the theory to explain why we're able to outperform standard PHP so strongly.

Q: What's the history of the HipHop project? How did it evolve?

Necessity is the mother of invention, and when you're serving several hundred million users off of PHP scripts, necessity becomes a very tough mother.  As Facebook found its code base growing by orders of magnitude, and its active userbase surpassing 1 in 10 people on the planet, we could have responded by just building more data centers, buying more servers, and pumping in more electricity to run and cool them all.  This would have been irresponsible, especially when there's opportunity to run more with less.

I should be clear that the official PHP runtime is surprisingly efficient at what it does.  [APC](http://php.net/manual/en/book.apc.php) keeps the translation of source code into bytecode under control, and the bytecode interpreter is lean enough to run through most pages fast enough that the bottleneck is the database or the filesystem, or something outside the control of PHP.  And like anyone else facing scaling issues, that's where we started.  Eventually, however, you load up a code profiler and discover how much of your remaining time is spent running scripts.

So an engineer here began with the idea of closing the loop by translating PHP source into C++, and compiling it all the way down to native code which he called HPHPc.  The first few revisions were only modest improvements, but they opened the door to more aggressive optimizations, code analysis, and other techniques that eventually showcased an improvement of more than 2.5x compared to PHP. This makes a very real difference when it comes to capacity planning, capex/opex, and we made the decision to invest more strongly in turning HipHop into a serious platform which now provides as much as 6x performance gain over PHP for our codebase.

Realistically, invoking gcc for every little source code change is more arduous than the average PHP developer wants to deal with, and we'd already extended the language too much to rely on Apache+PHP even on our development machines, so our next step was to create HPHPi, the interactive (but slower) version of HipHop.  Our PHP developers used this on their development servers to write code which would behave similarly to production, but without the hassle of recompiling all the time.

Since then, as I mentioned earlier, we've learned from the process of pushing the PHP language to its limits, and redesigned how the engine works from the bottom up.  Over the past couple years we've developed and matured the third incarnation of HipHop: HHVM.  This version actually behaves much more like PHP, in that source code is translated to bytecode, then run by an interpreter.  Where HHVM differs, and differs strongly, is that after the interpreter has seen how the code behaves under real-world conditions for a while, it learns what paths are likely, what types are held by certain variables, and it begins to compile to native code on the fly (JIT).  At this point, HHVM is actually a bit more performant than HPHPc, making it the interpreter of choice.

Q: What are the advantages of using HipHop for a PHP website?

First: Scalability.  That's not a word I'm using lightly and it's actually a measurement I take in two dimensions: CPU Time, and Memory.

CPU Time is a fairly obvious one.  By doing careful type and branch analysis and running native machine code, the processor is going to less work.  This reduction in work aggregates quickly and you see the return at low loads and high.

HipHop, with its low-profile, multi-threaded built-in webserver, is much more memory conscious than Apache+PHP.  This is important because once a webserver is memory bound, it doesn't matter how much CPU is idly blocking on an I/O operation.  Trying to use more memory will just result in disk swap which will slow the system down further and eventually lead to a crash. It's the end result of what the kids used to call the "Slashdot Effect".

Second: Language Growth.  Our first major divergence from PHP was our introduction of Generator functions.  These have allowed us to simplify parts of our PHP code base and improve developer efficiency.  Notably, PHP has since followed suit by introducing Generators to version 5.5.  Currently we're working on a more broad initiative to introduce strong type annotation, generics, and integrating with a powerful IDE platform.

Q: What do I have to do if I want to use HipHop for my website?

That depends.  If you're running Ubuntu 12.04 or 12.10, you can install HipHop by adding a line to sources.list and running apt-get.  At the moment we're building/hosting this package ourselves, but once I get a few of the uglier bits of building HipHop worked out, I'd like to work with some distributions to find interested maintainers.

For everyone else, there's sets of building instructions on our [GitHub wiki](https://github.com/facebook/hiphop-php/wiki) about the dependent packages you'll need, but it's a fairly typical cmake package once you get them worked out.

Q: Which popular PHP functions, extensions and features aren't implemented in HipHop, and why is that? As a consequence, which popular projects don't work with HipHop instead of PHP's virtual machine?

Oh, here's the part I was dreading. :)

There are a lot of 'em.  Namespaces spring to mind as my personal pet peeve, the input filter extension, large swathes of SPL, the mysqli extension... I could go on, but the honest and simple answer is that we're not nearly to the degree of parity I'd like to see us at.  The reason for this is that since we reimplemented the language syntax from scratch, the runtime library had to be as well.  From a practical standpoint, we had to prioritize work on features we use at Facebook over features we don't.  Of course, I can list those extensions off the top of my head because I'm putting as much effort as I can spare into closing our parity gap, and part of that means identifying the scale of the problem and triaging from there.

I'm actually quite pleased to say that when we decided to setup a public install of HHVM running WordPress, it worked (nearly) out of the box.   In fact, thanks to parity fixes I've since addressed, there's only one very minor change which needs to be made to a fresh WP install.  On the other side of that coin we find: any application using namespaces.

Q: When HipHop was open sourced, PHP creator Rasmus Lerdorf remarked that speeding up PHP execution won't make that much difference for many websites, and that there's a lot of low-hanging fruit that has much more impact if you solve it, such as reducing HTTP requests and DNS lookups. Do you agree? Or are there specific types of websites where HipHop shines?

I certainly agree on the matter of low-hanging fruit.  A good DBA can make a much more profound impact on site performance at a much lower overhead. Cutting external http/dns requests will have a minor, but certainly non-zero impact as well of course.

But what do you do when you've already done that?  That's the problem which HipHop is trying to solve, and what we've found, through actual lived practice, is that it does make a real, noticeable impact on bottom-line performance. So in that respect I disagree with Rasmus.

I would say that HipHop shines best in that space.  When you've picked the low-hanging fruit, you've already optimized your source code, and your traffic volume still has you using more than a handful of servers.  That's when HipHop moves the needle even further.

As an example: [http://www.hiphop-php.com](http://www.hiphop-php.com) is a single machine backed by a fairly simple MySQL database running on a default install of Ubuntu.  Very little of its low-hanging fruit has been picked, it's just an average webserver, carrying minimal traffic, running a small WP install.  It gets about a 70% performance boost compared to Apache+PHP.

By comparison, there's Facebook's codebase.  A billion active users, more servers than I'm allowed to count, backed by a finely tuned data layer combining databases and memcache, with every other piece of low-hanging fruit already picked clean.  Here, the time spent in PHP script is a greater share and we see a performance gain of at least 500%.

That certainly makes it sound like HipHop does best on "Facebook-like codebases", and that's true, but the 70% we see on WordPress is still nothing to sneeze at.  Beyond a few front-ends, it turns into real time and money saved.

Q: Have you enjoyed previous FOSDEM editions?

This will be my first, actually!  I'm really looking forward to it!
