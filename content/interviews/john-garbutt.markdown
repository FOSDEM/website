---
year: 2019
speaker: john_garbutt
event: square_kilometre_array
---

Q: Could you briefly introduce yourself?

I am John Garbutt. I have been working on [OpenStack](https://www.openstack.org/) related things
since December 2010, originally with Citrix, then Rackspace, and now
StackHPC. With StackHPC I am looking more generally at the HPC area. I spend much of my non-work time with my one-year-old son. I also play the tuba, hence my IRC nick of johnthetubaguy.

Q: What will your talk be about, exactly? Why this topic?

The Square Kilometer Array (SKA) is actually two radio telescopes,
currently in the final stages of prototype work. The SKA's Science
Data Processors (SDP) is facing data processing and flexibility
challenges that really push the current capabilities of HPC hardware
and software. I have recently been working as a subcontractor for
Cambridge University on both the Performance Prototype for the SDP and
helping write the recently reviewed architecture, and to share
our experience.

Q: What do you hope to accomplish by giving this talk? What do you expect?

Firstly, I hope it's going to be an interesting look at what is
possible using an interesting collection of existing FOSS tools.
Secondly, the hope is find others with similar challenges to help get
engaged in the [OpenStack Scientific Special Interest Group](https://wiki.openstack.org/wiki/Scientific_SIG) and help
work on these problems together.

Q: What are the biggest challenges in building fast storage with OpenStack and related FOSS tools?

The biggest challenge has been integration. Taking all the various
pieces and making them work together, providing a stable platform so
the scientists can stay productive.

Q: Which capabilities or features are lacking in OpenStack for HPC workloads?

OpenStack is already ready for [the majority of HPC workloads](https://www.openstack.org/science). The current work is really about making its operations more efficient (such as work on Ironic Deploy Templates) and looking to make more efficient use of the hardware (such as work on Preemptible instances, Hierarchical Quotas and Blazar Reservations).

Q: Have you enjoyed previous FOSDEM editions?

I have only been lucky enough to previously attend FOSDEM 2016, when I
presented in the IaaS and Virtualization dev room. I am certainly
finding weekend travel harder after becoming a dad a month or so
before last year's FOSDEM, but at least I can get a train all the way
here! I don't ever remember attending an event with such an epic
amount of choice of amazing sessions to attend, never mind in a city
with such beauty and beer!
