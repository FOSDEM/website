---
year: 2017
speaker: martin_pitt 
event: distribution_ci
---

Q: Could you briefly introduce yourself?

I have been a Debian developer for about 14 years and an Ubuntu developer for
over 12 years now. During that time I've touched a lot, ranging from security
work over PostgreSQL, printing, or GNOME all the way to the Linux plumbing
stack (systemd, networking, and similar) and Continuous Integration, which are my current main
occupations.

Q: What will your talk be about, exactly? Why this topic?

Ubuntu has created and enforced test-based gating of package updates into the
distribution for several years now, which significantly increased the quality of
both the development and stable series as well as reducing the release team's
insomnia. Despite these successes, even Ubuntu's closest relative Debian hasn't
started to use these tests for gating yet, and most other distributions don't
even have package-level tests.

In my opinion, systematic and powerful integration testing for gating changes
at both the upstream and distro level is still relatively rare in the FOSS
world, despite its tremendous benefits. For example, I've introduced test-based
gating of GitHub pull requests into several upstream projects, and all of them now can't
imagine how they ever worked without it. :-)

Q: What do you hope to accomplish by giving this talk? What do you expect?

I'm hoping to stir some interest in this matter by showing the benefits (but
also the problems) of this approach and how upstreams and distros can
collaborate in this area to improve quality and confidence on both levels.

Q: Ubuntu's development and stable releases have been using Continuous Integration for about four years now. What challenges did you encounter and what lessons did you learn?

This approach works great for packages that Ubuntu does actively maintain, and even better if these tests are being used for gating upstream commits.

The main challenge for Ubuntu is that most of its packages and thus also most of its tests are imported directly from Debian, and because Debian doesn't gate on regressions Ubuntu also imports a lot of regressions. Ubuntu developers don't have the capacity to address most of them, so these mostly get overridden, even though in a lot of cases they detect actual bugs.

Q: How does Ubuntu's use of Continuous Integration help other distributions and upstream projects?

Due to the proximity of both people and packages, the vast majority of tests that were originally written in Ubuntu as well as the mechanics of running the tests are available in Debian too. Where applicable, these also get sent upstream, and in some cases even used upstream for gating pull requests. The most prominent example I'm aware of is systemd, and since that got set up the quality of pull requests and upstream releases increased dramatically.

Q: Have you enjoyed previous FOSDEM editions?

Oh yes, very much! I like the casual atmosphere and meeting a lot of people I
usually work with remotely only.

Many thanks for organizing this event!
