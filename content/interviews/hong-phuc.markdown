---
year: 2019
speaker: hong_phuc 
event: susi_ai 
---

Q: Could you briefly introduce yourself?

My name is Hong Phuc from [FOSSASIA](https://fossasia.org/), the Free and Open Source organization in Asia. We are developing software and hardware and organize developer events across Asia. Since 2009, our mission has been to improve people’s lives through sharing Open Technologies and knowledge. I’m originally from the Mekong-Delta in Vietnam.

Q: What will your talk be about, exactly? 

I will be talking about [SUSI.AI](http://susi.ai), our Free and Open Source voice assistant framework for the conversational web. SUSI.AI is an alternative to Google Home, Alexa, Siri or the other Chinese solutions. We want a voice assistant without excessive data collection, censorship and surveillance technologies. Our goal is to allow users to access content and functionalities through a voice user interface privately, freely and with a high level of anonymity. SUSI.AI consists of different software components that we will showcase --- the server, a skills CMS, a web client, mobile clients and the Debian based headless client for smart speakers.

We are still at the beginning of providing SUSI.AI as a service and I am thrilled to share our lessons learned so far. Running a service is very different from releasing software. There are a lot of challenges, but with whatever decision we take we want to give users the choice to limit the storage of personal data in the cloud. As it is FOSS of course, technical users can install the entire stack or fork the code. That is what software freedom stands for!

And, we will also talk about the SUSI.AI smart speaker in detail. Even non-tech users will soon be able to run a personal version of SUSI.AI on their own Raspberry Pi with an extended privacy option where they don’t have to connect to our servers at all and still retain many of the basic functionalities like listening to music.

Q: Why is the topic of FOSS AI voice assistants important now?

More and more applications are equipped with voice user interfaces using one of the proprietary assistants. The conversational web is the next generation UI of the internet. Closed-source voice assistants are readily available on the market, but there is no solution that truly respects the user’s freedom. This is why we develop SUSI.AI and I am glad to have the opportunity to share the story about our fight for freedom at FOSDEM. I hope to get more coders and companies interested in our solution.

Q: Are we getting a new browser war like in the 2000s, but now between voice assistants?

Yes, voice is the new frontier for software freedom, just as web browser competition was critical for an open web. In the age of AI assistants we are heading towards silos again. Today’s assistants are developer unfriendly: incompatible, closed, restricted, opaque, limiting users and they have premature APIs under terms and conditions we must accept in order to get to our users. Services that are operated in internet-restricting countries, for example in Asia, have backdoors for government surveillance, censorship or social credit systems. In many countries there is a controlled public sphere, while at home you could still speak freely. With the “always-on” feature voice assistants continuously transmit private conversations from homes to cloud servers. Private speech ends with operators, big data analytics and state actors. The invisible features of closed source smart speakers put users at risk.

Q: Why would FOSS assistants like SUSI.AI be more secure and respect users' privacy?

Security experts can inspect FOSS projects like SUSI.AI. You don't have that chance in the proprietary conversational web: we cannot see the code! We do not know where the data are kept. We cannot set up our own servers. You develop a successful third party skill for a voice assistant, and in the next release the platform prioritises its own competing skill. Service providers decide for us what information we get, who may provide services under their terms, what data we may share. We can’t do a thing when APIs change, and services get restricted, or the platform gets retired. Platform owners can use user data to train their AI systems without releasing the knowledge back to the community. They set their own “laws”, their terms and conditions, and because of their market position we don’t have a chance to refuse them if we want to participate in the tech development. 

Q: What do you hope to accomplish by giving this talk? What do you expect?

I hope to get people to try out the project, give us their feedback and contribute to SUSI.AI. If people install our SUSI.AI Debian based distribution on their Raspberry Pi and start collaborating with us on the final features to make it into a real alternative to proprietary clients, then I have achieved my goal. It is a huge endeavour to build a FOSS personal assistant framework. We work hard to get it to run on all systems and layers. By giving this talk I hope to start the conversation with more developers, admins, documentation writers and any other contributors. I want a successful ecosystem of FOSS smart assistants. Let’s engage companies and speaker producers who can run SUSI.AI on their hardware and in-house systems. We want open smart assistants to run on washing machines, in cars, on phones, help desks, everywhere --- without market barriers.

Q: What's the history of the SUSI.AI project? What was the motivation to start it and how did it evolve?

The motivation behind SUSI.AI is our curiosity, technical interest and personal demand for a FOSS assistant.

One root of SUSI.AI is the search engine [Yacy](https://yacy.net/en/index.html) and a lot of the knowledge to build scalable systems stems from the experience of our tech lead Michael Christen. He is the amazing coder who built the Yacy distributed search engine. 

The second project that used to share a substantial amount of code with the initial SUSI.AI server is [loklak](https://loklak.org/). In FOSSASIA we have been working for a few years on the social media data engine loklak under Michael Christen’s and Mario Behling’s leadership. The project was started in 2014 at the Chaos Communication Congress. At that time we just could not find good big data sets to play with. With loklak we built big data indexes and social media data analytics. At the beginning we implemented a simple search with terms. Over the years we tried to come up with answers to natural language questions, geolocation and utterances of feelings using the loklak search index that we enriched with data from location and sentiment analysis. At one point the team implemented a conversation chat interface instead of a search box. A quick hack. Many of the answers of the system resulted in conversations that actually made sense.

This was totally exciting and the start of the SUSI.AI project. It was 2016 then. Over the following months Michael and Mario outlined the detailed development master plan of SUSI.AI. A big jump forward was the first version of the Language of Thought for SUSI.AI skills that we store on a Git repository. It defined additional action types for images, video, maps, tables, and charts. Step by step we started the development of additional components --- the web client, skills CMS, mobile clients, and plugins for chat systems. It was an exciting time and we were thrilled that a lot of people in the FOSSASIA community immediately began contributing.

Q: What are the biggest technical challenges in building the SUSI.AI server?

Creating an expert system using natural language processing is definitely a challenge. It requires the design of a new markup language --- our Language of Thought --- and an implementation using AI technology. Michael decided to implement concepts from predictive logic and in particular from functional Prolog as well as concepts of theorem proving.

Q: What does the SUSI.AI project's community look like? How can interested developers contribute? In which domains could you use some help?

We have over 300 developers who contributed code, mostly developers from Asian countries like India, China, Vietnam. The development is completely open and easily accessible. We provide documentation, developers can check out various SUSI.AI projects on our Git repositories, such as the [SUSI.AI server backend](https://github.com/fossasia/susi_server). Gitter serves as [our main communication channel](https://gitter.im/fossasia/susi_server). In the community you always find someone around to help you. A current focus is to get the mobile apps and the SUSI.AI smart speaker working. Here we also need to develop more hardware expertise, especially for the voice recognition. The SUSI.AI core team also offers customer support and FOSSASIA supports the team to setup a commercial entity to ensure the project becomes sustainable, can afford to hire more developers and to grow the FOSS ecosystem. 

SUSI.AI developers regularly meet face to face at conferences and hackathons --- to name a few: at Jugaad Fests in India, the OpenTechSummit in China and Germany or our lead event, the March FOSSASIA Summit in Singapore. We had SUSI.AI at 35C3 in Leipzig. And now we are at FOSDEM!

Q: Suppose I want to create a SUSI.AI skill. Where do I start and what do I need to do?

You can start with our [SUSI.AI Skill Development Tutorial](https://github.com/fossasia/susi_skill_cms/blob/master/docs/Skill_Tutorial.md). It is a step-by-step guide that helps you to build a skill. Our [skill CMS](https://github.com/fossasia/susi_skill_cms) has a much easier interface than the proprietary clients. The goal is to make creating a skill as simple as editing a Wikipedia article. We try to keep the entry barrier low to engage a wider community. It is possible to build public skills or to create private skills using private APIs. The system is still under heavy development. So, while things are mostly working, you might experience occasional glitches.

Q: Which new features can we expect this year in the SUSI.AI server?

As with many FOSS projects our active coders often steer the progress by their contributions. They often make quite swift progress on fronts that were not on our radar or on our priority list. From a project lead perspective and with the resources at our disposal, we at FOSSASIA prioritize SUSI smart speakers. We want to move these clients for the SUSI.AI server beyond the development state towards production. This means running of the SUSI.AI server component on the local hardware! And, here is our list for 2019, on top of it:

  * **Feature parity**: We aim that the SUSI.AI smart speaker subsumes all media player features of similar proprietary hardware like Siri, Google, Xiaomi, Alexa.
  * **User readiness**: We focus on the smart speaker stability and the ability to configure smart speakers via a mobile app.
  * **Problem-solving dialog with counterquestions**:  We implement SUSI.AI variables and conditional rules to create experts which are able to conduct a conversation to solve a user request.
  * **Backtracking**: The ability of a program to revert an already made setting and take an alternative option. If we consider this behaviour at different states of a computation, then this produces a tree-like parameter graph, which is called a decision tree. SUSI.AI's data structures are made in such a way that result tables are an element of 'thinking'. Such result tables are 'bags' for backtracking options. We will learn how to use that principle to create loops which are useful for problem-solving.
  * Finalizing the **step by step skill editor**.
  * Allowing **organisations and user groups for skills** inspired by the GitHub feature.
  * Conversation testing and debugging.

Q: Have you enjoyed previous FOSDEM editions?

Yes! FOSDEM is always a fantastic and lasting experience. You meet your friends and serious community members. Belgian beer is the best. I love the mussles with fries in Brussels. Oh, and FOSDEM is the place where shells mean something completely different than to the rest of the population. FOSDEM as a serious community convention inspired us to launch the FOSSASIA summit in Singapore. I wish my talk will raise attention to free and open smart speakers.
