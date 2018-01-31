---
year: 2018
speaker: victor_stinner 
event: python3
---

Q: Could you briefly introduce yourself?

I'm working on Python for Red Hat and I have been a CPython core developer since 8 years. I'm spending a lot of time on maintaining Python: fix all bugs introduced by others and fix the CI which generates new bugs randomly. I am now trying to mentor contributors to train them to maybe later become core developers. I also review Python pull requests from time to time.

I have always been programming. I tried a wide range of programming languages from the lowest level Intel x86 assembler to high level languages like JavaScript and BASIC. Even if I now really enjoy writing C code for best performances, Python fits better my requirements for my daily job. Since it’s easy to write Python code, and I am not annoyed by memory management or analyzing crashes, I use the “free” time to write more unit tests, take care of the coding style, and all tiny things which make software “good software”.

After 10 years of professional programming, I can now say that I spend more time on debugging and maintaining old code, than on writing new code. Having an extensible test suite makes me more cool. Having to work under pressure without straps is likely to lead to burnout, or more simply to quit a job.

Q: What will your talk be about, exactly? Why this topic?

Python 3 was a disruptive Python version to fix many mistakes of its childhood. The Python developers underestimated the Python popularity and the growth of this popularity. During many years, Python 3 was a "troll" by itself for good and bad reasons. Python 3 supporters had good reasons to promote porting Python 2 code to Python 3, while Python 2 supporters had good reasons to leave their code unchanged which was running on production.

Tooling and documentation were enhanced, while Python 3 was getting more and more cool features, like asyncio.

Q: What do you hope to accomplish by giving this talk? What do you expect?

While it's easy nowadays to judge how bad the Python 3 migration was at the beginning, it's interesting to see how we came to where we are today, and analyze how we took decisions. Python 3 migration issues were understood, Python 2 and Python 3 evolved to simplify this transition.

Q: Python 3.0 was released 10 years ago. What are the biggest advantages of Python 3 over Python 2? And what progress has been made in those 10 years from Python 3.0 to the current Python 3.6?

Python 3 is now faster than Python 2. Core design issues were fixed in the language to make it simpler, and fixed in the implementation to make your application more stable. The Python 3 language is now easier to learn than Python 2, the language is more regular.

Python 3 got many new modules extending Python "batteries included". My favorite one is asyncio which allows to write asynchronous code with a syntax which looks like the code is running sequentially, and so makes asynchronous programming simpler than the "callback hell".

Before Python 3.3, Python 3 needed multiple years of stabilization to adjust the language and to fix bugs. Since Python 3.3, each release comes with a big bag of new shiny features. Stay tuned for the future Python 3.7 ;-) 

Q: Has the transition of the worldwide existing codebase from Python 2 to Python 3 happened like you expected? Or were you surprised about the timeframe or some specific issues?

The expected transition was dead simple: "next week, everybody converts all Python 2 code base in this world, at once, be ready". You may know that it did not go as expected. Believe me or not, some people decided to do nothing and wait to see who will move first, to see how the transition goes. Then started a very slow migration done one by one, of most popular modules on PyPI, before even starting to think of migrating a whole application.

We were all disappointed and surprised by the migration. One key factor is that we underestimated the Python popularity.

Q: What are the biggest challenges that developers encounter when they want to port their Python 2 code to Python 3?

The biggest challenge is to explain to your manager that you will spend between 1 day and 1 month on working on a change that doesn't add any feature and is likely to introduce regressions, even if your code continues to run on Python 2.

The blocker issue is that many projects chose to keep Python 2 support, and so had to use the common denominator which means no new cool syntax nor new features from Python 3. So what's the point then of spending time on adding Python 3 support?

Technical debt is hard to "sell". IMHO the technical part wasn't the real blocker issue.

Q: Will there be a new decade-long transition path from Python 3 to Python 4 soon? Or will this be handled differently?

The good news is that we learnt from our mistake and Python 4 will follow the same deprecation policy than any 3.x release. No major backward-incompatible changes will happen without a slow transition period, helped with documentation and tooling.

Q: Have you enjoyed previous FOSDEM editions?

The first time I came to FOSDEM, 10 years ago maybe?, I was unable to follow the talks in English, but I was already impressed by the diversity of communities, the very high technical skills, and I really enjoyed the mood. I'm trying to come back every year to discover new things from other communities, meet friends and for waffles obviously!
