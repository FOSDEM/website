---
year: 2014
person: Daniel Martí 
speaker: daniel_marti
topic: "F-Droid: Free Software app distribution for Android"
event: f_droid 
---

Q: Could you briefly introduce yourself?

My name is Daniel, a Computer Engineering student from Barcelona and contributor to the F-Droid project.

Q: What will your talk be about, exactly? Why this topic? 

I will speak about [F-Droid](https://f-droid.org/), the Free Software app distribution platform for Android. We feel like this is an important topic, especially since privacy has been a general concern as of late. We want to show people that software freedom on Android is possible.

Q: What do you hope to accomplish by giving this talk? What do you expect?

My hopes are that people will see F-Droid as an alternative, rather than a competitor, to the standard Google Play market. This isn't about who has more apps, or what market has more features to offer. Respecting the user's freedoms and privacy is more important than that.

I expect to be able to show what F-Droid can do and how it can make life easier for both developers and users.

Q: What's the history of the F-Droid project? And how did you get involved?

It was started in late 2010 by Ciaran Gultnieks, and has been growing ever since. I got involved in early 2013 - I had been a user for about a year by then, and so I decided to start helping by maintaining packages. After some months, I also started helping develop the server (Python) and the client (Java).

Q: Packages made available by F-Droid are signed by F-Droid. Is it also possible for an app developer to offer his packages signed by his own private key in the F-Droid repository?

At the moment, no. Though there are ways around this, like setting up a separate repo with their own keys or publishing already built and signed APKs. Though the latter is not an option for us, since it means we won't be able to build the app from source.

We want to provide more security options in the future, amongst which are optional third-party apk signatures.

Q: How does the project's community look like? And how can interested people help?

There are the people with direct commit access to our Gitorious repos, including the metadata repo that maintains our main F-Droid repositories. Apart from this core team, there are the people that help us in the forums, on IRC, in the issue tracker and so on.

Granting access to our git repos is delicate, this is why we prefer merge requests as a start if anyone wants to contribute. This is exactly the way I started, and after some time, when it's obvious that you are committed, you are given access to work on your own.

Q: Which new features can we expect this year?

Amongst the features that we want to accomplish this year are:

* Optionally get rid of the "Unknown Sources" dependency by installing F-Droid as a system app;

* Make the client more efficient and scalable to keep supporting low-end   and old devices well;

* Better multi-repo support, making it easy for people to discover and use more repositories;

* Improve privacy and security by e.g. adding Tor and GPG support.

The [Guardian Project](https://guardianproject.info/) is working closely with us, since they are interested in using F-Droid more tightly with their services. They have started helping us with the last two listed features, amongst others.

Q: Have you enjoyed previous FOSDEM editions?

Unfortunately, no. This will be the first year I attend. So you can tell I am excited about it!
