---
year: 2018
speaker: stefan_behnel
event: cython
---

Q: Could you briefly introduce yourself?

I'm a senior software engineer and architect at [TrustYou](http://www.trustyou.com/), where we do lots of big data analysis and natural language processing on hotel reviews at a global scale. Most of that is done in Python and Spark. I've been using Python since the beginning of the century, and am probably best known in the community as one of the main developers of the [Cython compiler](http://cython.org/) and the [lxml XML toolkit](http://lxml.de/). I also regularly participate in discussions on core Python development topics.

Q: What will your talk be about, exactly? Why this topic?

I will mostly show code examples in my talk to visually explain how the language works. Cython is always a nice topic for me to talk about since it's such a versatile programming language. It's Python, with all its simplicity, readability, dynamic duck-typing and the huge software ecosystem, but joined with all the bare metal powers of statically typed C, including special support for fast array processing and easy [OpenMP parallelisation](http://www.openmp.org/). That unique blend opens up a large field of applicability, from Python code acceleration over high-performance data processing to the wrapping of native libraries for the Python ecosystem. Many Cython users consider it a better C, and are happy to let the compiler generate the C code that they don't have to write themselves.

Q: What do you hope to accomplish by giving this talk? What do you expect?

From a quick look through this year's FOSDEM talk schedule, Python seems a bit underrepresented at the conference, considering the huge attention that it is seeing in recent years in fields as diverse as system administration, web development, big data and machine learning. It's a unique language with a great and welcoming community that reaches all the way from an easy "get the job done" entry level for children and first time programmers over excellent web frameworks to high-performance scientific data processing.

During the talk, I'll try to show how Cython extends the applicability of Python way beyond what people would expect from a high-level language, into fields that were traditionally occupied by C, C++ or even Fortran.

Q: What's the history of the Cython compiler? When and why did you start it? How did it evolve? Has it become what you planned it to be?

Cython is an ongoing project, largely driven by community needs. Its origins date back to the early 2000s when Greg Ewing came up with the idea of designing a language (called Pyrex) that mixes Python and C to develop native extension modules for the CPython runtime, the main implementation of Python. CPython has an excellent record for being well extensible in C, but a code generator makes this another order of magnitude easier by avoiding all the nasty little pitfalls that a C-API has to offer for users of a high-level language. Thus, the project became quite successful because it satisfied a need in several different areas, which accidentally lead to various specialised forks over the years.

In 2007, Robert Bradshaw and I decided to create a new home for the diverging branches and started the Cython project as a better open source development fork of Pyrex. We received a lot of help by William Stein from the University in Seattle/USA, who steared the [SageMath](https://www.sagemath.org/) project, a math software package that made heavy use of one of the Pyrex forks.

The main goals of the Cython project now were to improve the integration of the compiler with the scientific Python ecosystem, and also to bring the somewhat C-ishly designed language closer to the Python language again. Cython has since become one of the pillars that many modern high-performance Python tools are based on. It solves two very attractive problems: getting native performance without writing C, and wrapping native libraries in nicely pythonic APIs, without sacrificing efficiency in the wrapper code.

As [Peter Wang](https://www.anaconda.com/people/peter-wang) put it: "(The Scientific Python) user base has tons of legacy code or external libraries that they need to interface, and most of the reason Python has had such a great adoption curve in that space is because [NumPy](http://www.numpy.org/) has made the data portion of that interface easy. Cython
makes the code portion quite painless, as well."

Q: What speedup factor is typically possible when you compile Python code with Cython and then manually optimize well-selected hot spots?

The potential speedups depend largely on the code at hand. Algorithmic code often benefits by 100x or more, whereas code that depends heavily on the highly optimised data structures and algorithms in Python and NumPy is already tuned natively and does not benefit that much, or not at all. Still, Alex Orlov gave [a talk about Cython at PyCon-US 2017](http://pyvideo.org/pycon-us-2017/cython-as-a-game-changer-for-efficiency.html) where he showed that simply compiling the URL routing module of the Django web framework in Cython can speed it up by 3x, even before investing any time into further manual tuning. Web frameworks are definitely not the standard target that people use Cython for, but it shows that even unexpected areas can benefit quite heavily by applying Cython in just the right places.

And this is not because "Python is slow" or anything (it's not), it's because Cython makes it easy to specialise your code at all levels, from the very high algorithm and Python language level to the bare metal C level. Specialisation is the key to all optimisation efforts. High-level languages help with specialising algorithms, low-level languages help with tuning the execution performance. Having both levels available in the same language is a very rare virtue.

Applying Cython for performance optimisation is really straight forward. Find out what the hot spots are, compile them with Cython, and then optimise and tune them into fast native code until it's fast enough for you. The cool thing about Cython is that the optimisation no longer stops at the high-level Python language boundary, but allows gradually stepping down into native code in a very fine-granular way. Whether you use the compiler to shave off the interpretation overhead, replace Python object variables by fast native C types, replace generic Python data structures by specialised C/C++ data structures, or replace whole algorithms and Python modules by external native libraries, Cython makes each of these steps easy and straight forward, and adapts the C code that it generates to whatever you use as data types in your code.

Q: What does Cython's community look like? How can interested people contribute? In which domains could Cython use some help?

Well, first of all, there *is* a learning curve.  An optimising compiler is not a trivial piece of software, and a language that mixes the semantics of two language as different as Python and C is also not something to design in a day.

But that's also what makes the Cython project so exciting to work on. Many features in Cython start off by someone realising that "the compiler should do that for me". Cython is an optionally typed language based on the dynamically typed Python language. Many language features can be triggered by statically declaring a data type here and there, and then letting the compiler respond to it by adapting and specialising the generated C/C++ code in an "obvious" way. The coolest thing about Cython is really its type system, and finding new ways to integrate Python with low-level features is an awesome playing field.

This way of coming up with new features is also why the development is generally driven by community interest. Most of Cython's users come from three areas: the scientific and big data Python community, those who wrap native libraries for Python, and those who write accelerators for Python code. The three groups are obviously overlapping, but anyway, these are the main use cases. And all of these areas lead to new ideas how to extend the language and the compiler.

Q: Which new features can we expect this year in Cython?

Although Cython is a somewhat old and mature project already, dating back to the early 2000s, we can still see many areas where we want to extend it.

Covering more C++ features would be great, for example. Personally, I already consider Cython the best way to use C++ data types, but professional C++ developers will easily find [areas](https://github.com/cython/cython/labels/C%2B%2B) where Cython requires some trickery and hacks to integrate with certain C++ features, simply because C++ is such a vast language. Closing those gaps by supporting them directly in the compiler would simplify the language integration with C++ and thus help many of our users who need to deal with C++ code.

Then, allowing more operations outside of the GIL, Python's [global interpreter lock](https://wiki.python.org/moin/GlobalInterpreterLock), is an often requested feature that we are hoping to work on during this year. The GIL is a tremendous help when it comes to writing safe native code (and it makes single-threaded code very fast), but it also limits the parallelism and concurrency inside of the Python runtime. Cython code can free the GIL around code sections that need parallelism and do not interact with the Python runtime and Python data structures, but that reduces the allowed feature set in those code sections considerably. Finding ways to emulate these Python features without requiring the GIL is a very interesting and rewarding project.

Q: Have you enjoyed previous FOSDEM editions?

I regularly go to Python conferences, but this is the first time that I attend the FOSDEM conference. I'm very excited to be part of such a large event. Especially as a speaker, thanks for allowing me in.
