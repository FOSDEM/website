---
year: 2019
speaker: roger_dingledine
event: tor_project
---

Q: Could you briefly introduce yourself?

I'm the original developer of [Tor](https://www.torproject.org/), and now I wear pretty much every hat:
developer, fundraiser, outreach, user support, person with the vision
of what we ought to work on, research coordinator, and so on.

Q: What will your talk be about, exactly? Why this topic?

I've never been to a FOSDEM before, so the first part will just be helping
everybody get up to speed on what Tor is, how it works, and some of its
challenges. Many people learn about Tor through random newspaper articles,
so they'll come into the talk with a wide variety of ideas about what
Tor is and what it's for. I plan to talk about online surveillance and
how to avoid it, about censorship and how it isn't just a problem for
far-away countries, and about how the technical mechanics of surveillance
and censorship are more similar than people realize.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want people to get a better intuition about tracking, surveillance,
and censorship online, and to understand why Tor's "distributed trust"
and transparency make it stronger than other privacy approaches.
Hopefully I will also dispel some myths along the way.

Q: What was your motivation to start the Tor project and how did it evolve? Has it become what you planned it to be?

When I was very young, my parents were killed in a freak privacy accident,
and ever since then I have dedicated my life to -- wait, no. I actually
don't have a defining pivotal moment like the movie scripts expect. I've
just always been interested in security, and in tools that empower people
and that shift power back to individuals. One of the great things about
Tor, which we hoped for at the beginning but it's still amazing to see
in practice, is how many different kinds of people need and use Tor. We
have ordinary internet users, Syrian activists, Chinese professors,
and so on all blending together to provide privacy for each other.

Q: You don't like to talk about the "dark web". Why is that?

What even is it? To a lot of people, it's anything scary online. But
scary stuff exists all over the internet. Some people use it to describe
websites reachable as Tor onion services. But reaching websites via
onion services can provide *better* safety (encryption, authentication,
metadata security) than legacy ways of reaching websites. Second,
commercial companies like to inflate the size of the "dark web", which
is easy to do when they don't define what they're talking about. The
reality is that there are only a few thousand websites available as
Tor onion services currently, which makes the "iceberg" metaphor about
the huge dark unknown particularly misleading. Third, it confuses the
idea of a website with how you reach it: we don't hear anybody saying
"the https web", because people realize that websites don't change when
you're reaching them via https or something else. Lastly, onion services
are also used for metadata-free file sharing and chat and can be used as
a security layer for others to build safety into their services. Calling
all of this the dark web doesn't make any sense, and it distracts from
the cool security properties that onion services offer.

Q: What are currently the biggest challenges, both technical and political, that the Tor project is facing?

I'll start with a challenge that we're *not* facing anymore: getting
people to care about privacy. Recent measurements put the number of
daily Tor users at around eight million. But not everyone in the world
can use Tor, and that's a problem.

We have to keep up with countries that are censoring the internet and
censoring Tor. We also want to make sure Tor is easy to use for everyone,
so we've been making big UX changes and are improving our localization
efforts. We're especially need to make Tor usable for people with slow
and unreliable internet connections, who only access the internet on
their mobile device, and who may be facing serious threats to their lives
for accessing some basic resources online. The understanding that some
people come to Tor in life or death situations is always a challenge we
must consistently meet.

Another huge challenge for internet privacy is government over-reach. We
still have a growing number of governments around the world who undermine
the internet by breaking into routers and inserting backdoors into common
software, who take people aside at airports for no reason, and who break
their own laws to build large-scale surveillance systems. Technology
alone cannot solve this problem: we need social and political change too.

Q: Recently both Cloudflare and Facebook have adopted Tor onion services. How did that happen?

The Facebook onion service happened in 2014 thanks to Alec Muffett,
a security engineer who used to be at Facebook. He created [EOTK](https://github.com/alecmuffett/eotk),
the Enterprise Onion Toolkit, which The New York Times used to make
their .onion address. Cloudflare got their onion service because of
a really enthusiastic intern who wanted to help shift their users to
safer connections. The options of ways to access the Tor network are
expanding, and that's great. We want to make it even easier for others
to integrate Tor.

Q: What does the Tor project's community look like? How can interested developers help? In which domains could you use some help?

The Tor community is a diverse group of people around the world united
by the belief that people should have privacy and freedom online. People
in our community are human rights defenders, activists, developers,
researchers, and anyone else who shares this same belief. We're always
looking for and welcoming people interested to help spread the word about
Tor in their communitities. Because we're improving our localization
efforts, translators are a big help right now, too.

We're also working on some exciting new projects around
anti-censorship. These projects will take us into some development
environments that we are not particularly used to, such as JavaScript
and APIs that are only available in the browser domain. One of these projects is [Snowflake](https://snowflake.torproject.org/), a proxy using WebRTC. We'd love to have some help in these areas in 2019.

Q: Which new features can we expect this year in Tor?

The upcoming releases of Tor include many improvements for conserving
power and bandwidth, which are especially important for people only
accessing the internet on their phones. For example, we've made a
lot of progress on a "dormant mode" which tells Tor to stop using the
network when it hasn't seen client activity lately. We're also going
to launch the stable version of Tor Browser for Android, the first
official version of Tor Browser on a mobile device.

Q: Have you enjoyed previous FOSDEM editions?

I've never been to a FOSDEM before. But I've heard great things, and
[Tails](https://tails.boum.org/) and Tor have had a booth in several previous editions, so I am
looking forward to it. In fact, we have four Tor-related talks this
year: besides mine, we have talks on onion services, our UX approach,
and our privacy-preserving metrics.
