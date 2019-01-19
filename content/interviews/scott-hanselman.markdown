---
year: 2019
speaker: scott_hanselman 
event: open_source_microsoft
---

Q: Could you briefly introduce yourself?

My name is Scott Hanselman and I work on Open Source .NET and Azure at Microsoft. I went there 10 years ago to open source as much as I could! (Until it's all OSS or they fire me, whichever comes first.)

Q: What will your talk be about, exactly? Why this topic?

I think a lot of people have some misconceptions about how the Microsoft of 2019 works, so I'm gonna walk you through the history of .NET, and show a ton of demos and show our OSS stuff running on open operating systems. I personally very much like C# and F# and I'd like more people to use these languages. I run them on Android, on Raspberry Pis, on tiny microcontrollers, and in containers in the cloud. 

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to edutain. I'd like to get feedback on what C#/[.NET Core](https://docs.microsoft.com/en-us/dotnet/core/) does that people like, and what they don't like. I expect the FOSDEM audience to be challenging but kind. I'm looking forward to inquisitive questions!

Q: If you look back at your last ten years at Microsoft and how the company changed its stance on FOSS, what do you consider some milestones in this evolution?

The biggest is the flip of the developer division to "open by default." Whenever we make a new thing or think about making a new thing we have to ask ourselves: is there any reason for this to NOT be OSS? That's huge when you consider Microsoft was a big mysterious black box just a decade ago. 

Q: With .NET Core, C# is now running on a variety of platforms, even in the browser. With the web UI framework Blazor, C# code is compiled to WebAssembly and then executed in the browser. What is possible already with Blazor and what are its current limitations?

The limitations of [Blazor](https://blazor.net/) and [WASM](https://webassembly.org/) are largely the same as with the DOM and JavaScript itself. If the browser chooses to expose something, then it can be called from C#. Looking deeper, there are some fundamental things like Reflection and Assembly loading that aren't really possible (or at least, not at all easy) about .NET on WASM. Remember this is a statically typed, originally JITted to IL environment, that's now being run inside another VM, effectively. Can you do threads? Green threads or native threads? What about async/await? What can we abstract away and what do we just not support in the browser for technical reasons?

Q: Long before Microsoft open-sourced .NET Core, the Mono project created an open source .NET implementation. How do both projects compare? And is there some collaboration going on between both developer communities?

There's a ton of collaboration. [Mono](https://www.mono-project.com/) isn't a competitor, as it is (IMHO) a parallel universe or (spiritual) fork. There's a bunch of places where Mono does things better, or does things .NET Core can't do. For example, WASM and [AoT](https://www.mono-project.com/docs/advanced/aot/) is a Mono innovation. It's the creation of the .NET Standard as well as the standardization of IL and the open ECMA standards for C# that allow us to share soooo much. Mono and .NET are "instances of .NET" just like there's other instances of Java. They are more compatible than they are not. The teams talk all the time and the goals are the same. 

Q: .NET Core gets a lot of contributions from outside the company, how did that happen? And how are Microsoft's needs aligned with the needs of the community?

The .NET Foundation recently changed its governance model and added 7 seats for the community --- with just one seat for Microsoft --- in order to find that balance. There are a lot of companies like Google, Samsung, Unity and more that want .NET to serve their needs. The idea is to push it all in the same general direction with collaboration --- not conflict --- at the heart.

Q: Which new features can we expect this year in .NET Core?

Blazor and WASM work continues. The .NET Core roadmap [starts here](https://github.com/dotnet/core/blob/master/roadmap.md) and the biggest feature coming is that .NET Core is effectively becoming swappable with the .NET Framework from Windows. That means all those .NET Framework apps (WinForms, WPF, etc) from 10+ years ago will be able to have 'brain transplants' and have the new OSS .NET Core transplanted in. Additionally WPF and WinForms have both been open sourced, so we should see some new innovation there. We'll also see more support for devices like Raspberry Pis and there's some community work with things like Wilderness Labs' [Meadow microcontroller board](https://www.wildernesslabs.co/).

Q: Have you enjoyed previous FOSDEM editions? 

Totally, I've been a fan since 2003! 
