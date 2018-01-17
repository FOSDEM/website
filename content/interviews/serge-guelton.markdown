---
year: 2018
speaker: serge_guelton_serge_sans_paille 
event: pythran
---

Q: Could you briefly introduce yourself?

Basically a research enginneer in compilers as a job, working daily on [LLVM](https://llvm.org/) and playing with Python compilation on his free time :-)

Q: What will your talk be about, exactly? Why this topic?

The [Pythran](https://pythran.readthedocs.io/en/latest/) compiler, both from the technical view (compiling Python code) and the social view (driving a small yet ambitious project on your own)

Q: What do you hope to accomplish by giving this talk? What do you expect?

Gather interest on static analysis of Python-like program, and share experience on OSS. And after a glance at the other Python talks, speak with smart people!

Q: What's the history of the Pythran project? Why did you start it? Has it become what you planned it to be?

Pythran began some 6 years ago, starting from the idea that the C++ template system shares a lot with Python's duck typing. So the idea was to build a tool based on that, and my former employer (HPCProject) was OK to fund that. And the ball kept rolling afterward, because it was a great way to polish my C++ skills and learn more about Python. It turns out it became a very good way to meet interesting people!

Q: What's the difference in target applications of Pythran compared to Cython and Numba?

Unlike Cython and Numba, Pythran tries hard to optimize high level code (no explicit loops etc). It also supports most of OpenMP3 for Python. And its inputs remain 100% backward compatible with Python. It does not aim to make the bridge with exisiting C/C++ code as Cython does, nor to target GPUs as Numba does.

Q: Which challenges did the switch to Python 3 present for the Pythran code? Did you encounter some unexpected issues?

Moving to Python 3 was a real pain, because changing the supported language also changed the DSL Pythran was embedded in! Most of the issues were solved by a thin portability layer called gast, that proved to be useful for a few other projects too! And the remaining one will be solved by dropping Python 2 support  ;-)

Q: What does Pythran's community look like? How can interested developers contribute? In which domains could the project use some help?

Pythran community = me as developer + several French guys being active in France to make the project live + regular users that submit issues + a potential silent base (?).

Submitting issues is actually very nice because it proves there are some users, and it boosts the motivation, so please find bugs! Even performance bugs :-)

Q: Which new features can we expect this year in Pythran?

Faster and broader support for numpy code thanks to the integration of xtensor. And there's a secret side project too, but well, it's a secret.

Q: Have you enjoyed previous FOSDEM editions?

That's my first time :-)
