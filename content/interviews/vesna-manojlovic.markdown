---
year: 2017
speaker: vesna_manojlovic
event: network_measurement_ethics 
---

Q: Could you briefly introduce yourself?

My name is Vesna, I am a Community Builder at [RIPE NCC](https://www.ripe.net/), and a hacker.

I have been studying engineering and using computer networks since 1991, first in Yugoslavia, and during the last 20 years in Holland.

I was initially a trainer and lecturer at RIPE NCC for 12 years, covering topics such as IPv6, BGP security, DNSSEC, Internet Governance and distribution of IP addresses. For five years after that, I was a
Community Builder for [RIPE Atlas](https://atlas.ripe.net/) - an active measurements platform. In
my other life, I am a member of hackerspaces and a speaker at hacker events, and I am fortunate to be able to combine my participation both in the networking community and the hacker community. Recently, I have organised four hackathons, in order to bring together network operators and software developers, together with designers, researchers and hackers, to create tools and data visualizations based on RIPE Atlas data.

Q: What will your talk be about, exactly? Why this topic?

  * Technology is not neutral.
  * We are always making a choice.
  * Our actions have consequences.

These are the main messages that I want to convey.

My reasons for this choice of topic are both personal and professional: my outlook about the consequences of technology has changed over time.

When I started using the Internet, it was in the spirit of
"hacker ethics" and "techno optimism", when we believed that technology in general and the Internet in particular were going to bring only positive changes to the world. Now, 20 years later, it is becoming more and more
clear that those who have the power to influence the technology also
have a large responsibility that comes with that power.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I want to raise awareness of the ethical considerations that our choices
have, both in relation to those who are building the new technologies, the FOSDEM
audience for example, and as users of tools for measuring Internet
reachability, particularly RIPE Atlas.

After my talk, I hope that the audience will:

  * take a broader view of the field (science, engineering, programming): that is, that they will adopt a systems-level view within the social context (law, social sciences, political implications, social justice, human rights of ordinary people);
  * choose problems to work on wisely: be mindful of your values;
  * also: get familiar with RIPE Atlas and become part of our community!

Q: RIPE Atlas started in 2010. How did it evolve during all those years?

Here's a one sentence introduction to RIPE Atlas: it is a global, open,
distributed Internet measurement platform, consisting of thousands of
measurement devices that measure Internet connectivity in real time.

On the technical level, we have mostly kept to the fundamental decisions that
were decided at the start of the RIPE Atlas project: active measurements, on the IP layer, from small (affordable) hardware devices, hosted by community participants and funded
by the community (mostly via RIPE NCC membership).

According to the plan, we keep growing: in order to show the
reachability of Internet infrastructure from "everywhere", we need to
deploy more and more devices across the globe - to ensure broad
representation.

Over time, small adjustments have been made:

  * in 2011, we reached out to other organisations to obtain more sponsorship: to diversify funding and ensure neutrality and independence;
  * in 2012, we started distributing "probes" via community "ambassadors";
  * in 2013, we added another type of device: RIPE Atlas anchors, which are larger servers that do more measurements, and are used as regional targets. At this point in time, we've deployed about 250 of these, directly payed for by hosting organisations;
  * in 2015 we enabled HTTP measurements, but only towards anchors.

Q: Were you already aware of the ethical implications of RIPE Atlas when
    it started?

Yes, indeed, the architects of RIPE Atlas made decisions about
significant characteristics of the system based on ethical concerns:

  * no passive measurements: we do not observe any user traffic;
  * no "application layer" measurements;
  * making the data open and publicly available for everyone to analyse;
  * making participation easy and the "barrier to entry" as low as possible;
  * making the devices inaccessible to 3rd parties, so as to protect hosts;
  * keeping the set of measurements very limited, in order to prevent endangering hosts;
  * deliberately not making the goal of the measurements platform one of detecting censorship, malicious blocking of Internet traffic, or other interference - in order to not put probe hosts in danger of oppressive political regimes - while accepting that some conclusions of those activities can be made based on the analysis of RIPE Atlas measurements data;
  * all of our APIs are open and public, documented and available;
  * all the code produced at our hackathons is released on GitHub with FLOSS licenses.

In 2015 we published extensive documentation in the IP Journal, which provides [further details](http://ipj.dreamhosters.com/wp-content/uploads/2015/10/ipj18.3.pdf).

Q: Are the users of RIPE Atlas aware of their moral obligations when
    using the network?

We are fortunate to have very active, aware and technically educated hosts.

Our community already has high ethical standards, and they hold us to
these standards too. One example is that they requested us to make the
measurements source code open, which led to us [releasing the code in 2013](https://labs.ripe.net/Members/philip_homburg/ripe-atlas-measurements-source-code).

Another example is: every time they "hacked" a probe, they followed
"responsible disclosure" security procedures, and informed us first,
so that we can fix the bugs before they [become public](https://atlas.ripe.net/docs/security/).

When we were moving from prototype towards production service, we held
a discussion with the community and came up with ["Terms and Conditions"](https://atlas.ripe.net/legal/terms-conditions/)
that respect the privacy of hosts, and which clarify expectations and
responsibilities between us. All hosts need to agree to them before
becoming part of the system:

Q: What are some of the most interesting moral dilemmas you have
    encountered while building or using RIPE Atlas?

In short: HTTP measurements. I will cover these in more detail in the
talk, but for the impatient, they are covered in these RIPE Labs articles: [HTTP measurements with RIPE Atlas](https://labs.ripe.net/Members/kistel/http-measurements-with-ripe-atlas) and [Ethics of RIPE Atlas measurements](https://labs.ripe.net/Members/kistel/ethics-of-ripe-atlas-measurements).

Q: Have you enjoyed previous FOSDEM editions?

Yes, I enjoyed FOSDEM every time! It's an amazing event, and I
appreciate that is is organised by volunteers. The content is often
overwhelming, but the social aspect of it is vital - I see it as an opportunity
to meet with friends and collaborators.
