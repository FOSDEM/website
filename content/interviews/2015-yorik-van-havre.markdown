---
year: 2015
speaker: yorik_van_havre
event: freecad 
---

Q: Could you briefly introduce yourself? 

I'm [an architect](http://www.uncreated.net) (the kind that builds houses, not information), I live in Brazil but I am Belgian, and I am also one of the main developers of [FreeCAD](http://www.freecadweb.org). I joined the project around 2008 because, like many others, I felt hostage to the few commercial software solutions for architects available and came to the conclusion that if what you need doesn't exist, the best way is to do it yourself. FreeCAD seemed, and proved to be, an incredible platform to develop architecture-oriented tools, which is the largest part of what I've been doing with it since then.
 
Q: What will your talk be about, exactly?

Mainly about the particular technological mix that is FreeCAD today, how it became a "Python beast" where almost 100% of the internals are exposed and available to any user with a minimal knowledge of the Python language, which gives him basically the same powers as the full C++ developer, and how this contributed to create the particular technical/social ecosystem that formed around FreeCAD, that now orients or changes the meaning of many design decisions, and turned FreeCAD into a true community project, with no more strict separation between users and developers.

I will also show FreeCAD's very unique pedagogic way to gently introduce the user to Python scripting, and help him to climb the steep unavoidable learning curve that is the learning of a complex technical application. Finally I'll showcase a couple of examples of the concrete utility of this for the users, and what they can achieve.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to show a pretty successful example of "total access to scripting" without sacrificing anything in terms of efficiency, how this had a huge impact on what the community does with the software, and how this impact has impacted back on FreeCAD, and how all this is beginning to make a lot of sense today, when connectivity is everything.
 
Q: What are some of the most complex 3D models you know that have been designed with FreeCAD?

We have [a special section on our forum](http://forum.freecadweb.org/viewforum.php?f=24) that will give you a good idea of what people do with it. Since FreeCAD has no specialty, you have a bit of everything, from [the little plastic piece](http://forum.freecadweb.org/viewtopic.php?f=24&t=6430) or [small electronic devices](http://forum.freecadweb.org/viewtopic.php?f=24&t=8525) to [big architecture projects](http://www.uncreated.net/?page=bh) (if you excuse a bit of self-promotion). But my favorites are definitely when people design their very own 3D printing machines, such as the [Prusa i3](https://plus.google.com/u/0/+JuanGonzalezGomez/posts/MoHNSndNMDk?pid=6100585319412174306&oid=109138697406392447933) and [Witbox](http://diwo.bq.com/en/witbox-rights-released-with-cc-by-sa-licence/), with FreeCAD... And this is certainly just the beginning...

But you asked about the most complex one, it might well be [this locomotive and wagon assembly](http://forum.freecadweb.org/viewtopic.php?f=24&t=5728).
 
Q: How does the FreeCAD community look like? Are many of its users also FreeCAD developers?

The FreeCAD community is incredible. It is highly knowledgeable technically, many people are there since years, several know the software better than me, and no mentally sane FreeCAD developer would ever take any serious decision without consulting the wise ancients of the community. Nowadays, with the advent of 3D printing, come a lot of "3D tinkerers", who often feel particularly at ease with this "scriptable tinkering tool". This also has a big influence on the direction FreeCAD is taking. As the archaic separation between developer and user has blurred, since almost all regular users have already developed something somehow along the way, the separation between the "professional" and "amateur" spheres is also disappearing.
 
Q: How can interested people contribute to the FreeCAD project? In which domains could you use some help?

At the moment, FreeCAD is a rather complex application, with enormous functionality exposed to the user who can do some Python scripting, but with too few well-polished, user-friendly GUI tools and controls. As a result, it can be rather harsh on newcomers expecting a usual 3D modeling application. What is mostly needed, basically, is everything that can help to bridge the gap between those users and FreeCAD: Better GUI tools in FreeCAD, of course, but also tutorials and better documentation.

The big connectivity and modularity of FreeCAD also makes it very easy to extend and dialogue with other applications. If you work with any area which is remotely connected to 3D modeling, it can be extremely easy to make FreeCAD cater for it. That is actually how most people involved with FreeCAD development today started...

Q: Which new features can we expect this year in FreeCAD?

Hopefully, the biggest, long-awaited feature which is the assembly module (a module that will handle inter-objects relationships), will be in this year. But we also have other important features that are reaching the end of their development and will be merged soon, such as the Path module, which will allow the generation and handling of toolpaths used by industrial cutting machines directly in FreeCAD, and therefore allow to directly manufacture FreeCAD objects with these machines. I'll try to talk briefly about this too.

Another feature that is almost ready is a revamped and finally decent-looking spreadsheet module, which will greatly improve the generation of Bills Of Materials.

Q: Have you enjoyed previous FOSDEM editions?

Actually I have to admit this will be my first one...  But I know about it since quite some time, you always fall on some FOSDEM video on YouTube...
