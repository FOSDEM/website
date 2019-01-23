---
year: 2019
speaker: jonathan_looney 
event: netflix_freebsd
---

Q: Could you briefly introduce yourself?

My name is Jonathan Looney. I'm a [FreeBSD](https://www.freebsd.org/) developer. I also manage an engineering team at Netflix. My team develops and maintains the operating system Netflix uses to run the content caches in its content delivery network (CDN), called [Open Connect](https://openconnect.netflix.com).

I've been tinkering with computers for years, since I got my first desktop computer. (To date myself slightly, my first computer had a whole 1MB of memory, which was a big deal back then.)

Q: What will your talk be about, exactly? Why this topic?

I'm going to talk about the way that Netflix uses open source to deliver streaming video. Netflix is very open to using open-source code. Additionally, Netflix has a great attitude about it, fully embracing the collaborative nature of open-source projects. So, we don't just use open source projects, but also try to contribute back our enhancements.

I think it is great for the open source community to celebrate when there are successful partnerships which benefit the user community. I also think other organizations could potentially benefit from learning about how we interact with the open source community and the benefits (and challenges) of our collaboration model.

Q: When did Netflix start using FreeBSD? And what were the biggest factors in the decision to choose FreeBSD over other operating systems?

We started using FreeBSD when we first created our own content delivery network (CDN) called Open Connect. The biggest factor at the time was licensing restrictions. At this point, we are very happy with the performance we've been able to achieve with FreeBSD. 

Q: What's the rationale behind using the FreeBSD development branch code for the Netflix Open Connect Appliances? Why not use the stable branch?

That's a great question, which I'll address this in more detail during my talk. In summary, it lets us be forward looking and focused on innovation, rather than backwards looking and primarily focused on maintaining existing functionality.

Q: Which safeguards do you have in place to produce a robust operating system based on "development code"?

That's another great question, which I also plan to address in more detail during my talk. But, suffice to say that we do need to be concerned about inheriting regressions from our upstream code. We have multiple levels of testing to try to catch regressions as early as possible.

On the other hand, we would have similar concerns if we were tracking "stable" code and would need to do similar testing. On the whole, we think the risks and the overall cost of testing are the same or less with tracking the "development" branch as tracking a "stable" branch.

Q: Could you give some examples of bugs that Netflix found in the FreeBSD development branch and the impact this quick validation of the code had on the upstream FreeBSD project?

We've found a number of bugs, both big and small. Some examples that quickly come to mind are: a memory leak in TCP; a TCP retransmission regression; a kernel panic due to a race condition in the console code; and, a bug in the x86 page mapping code which impacted super pages.

In some of these cases, we've found the problems quickly enough that we were able to work with the upstream community to fix the bugs quickly enough that only a small number of users were impacted. In many cases, the FreeBSD community is at least able to fix them well before the code reaches an official FreeBSD release.

Q: Are you looking forward to your first FOSDEM? 

Yes! I've heard great things about this conference. I'm looking forward to experiencing it for myself.
