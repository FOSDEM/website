---
year: 2017
speaker: klaus_aehlig 
event: bazel 
---

Q: Could you briefly introduce yourself?

  My name is Klaus Aehlig. I work as a software engineer in the
  [Bazel](https://bazel.build/) team at Google.

Q: What will your talk be about, exactly? Why this topic?

  The talk will be about Bazel, a build tool developed at Google.
  While it has been used at Google for years, it has only recently become
  open-source. So it might not yet be widely known and used.

Q: What do you hope to accomplish by giving this talk? What do you expect?

  The talk will give an overview on how Bazel works and what it is good for.
  As Bazel is relatively new as open-source project, this might also help
  increase community awareness. At least I'm hoping so. Bazel certainly has a
  value for more people than just the ones currently using it.

Q: What's the history of the Bazel build tool? When and why did Google start it and how did it evolve?

  Google started the tool that has recently been open-sourced as Bazel about a
  decade ago, when the limits of the previous [Make](https://www.gnu.org/software/make/)-based approach were
  reached for Google's then main repository. It quickly became the primary build
  tool within Google.

Q: Bazel has been designed to handle build problems present in Google's development environment. So what is Bazel best at and in what circumstances should I not use Bazel?

  Bazel's specialty is to handle large source repositories with everything
  being built from scratch, typically involving a variety of languages and
  target platforms. Of course, Bazel can also build small projects, but
  the bigger the code base is, the more the caching pays off. Having the
  use case of large projects in mind, Bazel doesn't mind being a bigger binary,
  using more memory to keep the relevant part of the dependency graph in memory,
  or having Java as a run-time dependency. So if you have to build in a very
  restricted environment where cutting dependencies for the build is an issue,
  Bazel might not be the best choice.

Q: What does the project's community look like? Mainly Google employees? How can interested people help?

  Bazel does have quite some external users, also because Bazel is the preferred
  build tool for [TensorFlow](https://www.tensorflow.org/). There are also external contributors, but being
  open-sourced only recently, the community of external contributors is still
  small, whereas Google spends a considerable effort developing Bazel further.
  So, at the moment, it is indeed still mainly Google employees that contribute
  to the Bazel code base, but we hope that the community grows.

  Everyone is welcome to join the user or developer mailing list, discuss on
  IRC, file bugs on the Bazel's public bug tracker, and, of course contribute
  patches for review and addition to Bazel.

Q: Why isn't all development on Bazel done in the open and why are some parts of the code not open source?

  The parts of Bazel that are open source form a fully working build utility.
  At Google, it is used with certain Google-specific extensions compiled in,
  like interaction with the version control system used, authentication against
  Google-internal services, and specifics about Google's configuration for
  their build clusters and artefact storage. In the current form, those
  extensions do not make sense outside Google. Nevertheless, it is a requirement
  for Google that no changes to Bazel break Google's internal use case.

  In the (still ongoing) process of open-sourcing Bazel, the team is trying to
  abstract away generic interface from those extensions so that they can also
  be meaningfully used outside Google. This process of clarifying and
  stabilizing the interfaces will also allow independent Bazel development,
  as Google's internal use case will then only depend on specified and tested
  semantics of interfaces. But getting there is unfortunately a long process.

Q: Which new features can we expect this year in Bazel?

  A big effort will go into stabilizing Bazel's interfaces. Besides the already
  mentioned extension interface, this also includes the build language, the API
  for remote execution, and a machine-readable stream of important build events.
  There are also plans to improve the handling of external repositories,
  Windows support, and the collection of Skylark rules for various languages.
  The [public roadmap](https://bazel.build/roadmap.html) contains more details.

Q: Have you enjoyed previous FOSDEM editions?

  This year will actually be the first time I'm attending FOSDEM. But
  lots of people have told me how great FOSDEM is, so I'm looking forward
  to it.
