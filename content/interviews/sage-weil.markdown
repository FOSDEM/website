---
year: 2019
speaker: sage_weil 
event: ceph_data_services
---

Q: Could you briefly introduce yourself?

Hi!  My name is Sage Weil.  I became involved in storage when I joined a 
research team at the University of California, Santa Cruz for graduate 
school in 2004.  We were designing a petabyte scale file system for 
supercomputers, a system that eventually came to be known as [Ceph](https://ceph.com/) and was 
released as open source in 2007.  I spent several years building
and refining and extending the system at DreamHost, spun off a startup 
(Inktank) in 2012, and we were acquired by Red Hat in 2014.  Today I continue 
to lead the Ceph open source community and work closely with the teams at 
Red Hat to integrate storage into the product portfolio.

Q: What will your talk be about, exactly? Why this topic?

Organizations today are increasingly likely to have their IT infrastructure 
spread across multiple data centers and public clouds.  Managing the 
storage for that infrastrucure across the various footprints, especially 
the ability to migrate applications (and their data) or replicate across 
footprints for availability, requires a range of capabilities from the 
storage system and integration with the application platform.  These 
scenarios are becoming more common and it is not always clear what the 
open source community currently provides ---or will soon provide.

Q: What do you hope to accomplish by giving this talk? What do you expect?

This talk aims to make some sense of the range of scenarios and use-cases 
available under the "multi-site," "multi-cloud," and "hybrid cloud" 
umbrellas, and then describe how Ceph's existing and future capabilites 
apply.  We'll cover object, block, and file storage, and different 
data services capabilities, including migration, replication, stretch 
clusters, and indexing or analytics.

Q: What role can Ceph play in making data as portable in multi-cloud environments as applications? And what's the interplay between Kubernetes and Ceph to enable portability across clouds?

The reality is that data portability requires a partnership between 
storage and the layers that consume it.  The emerging leader for 
application orchestration is [Kubernetes](https://kubernetes.io/), so we'll talk primarily about how 
Ceph integrates with Kubernetes today, and what capabilities we're working 
on going forward.  Ceph has to provide the key features for the data path 
(migrating data sets that are actively being used, and/or replicating 
active data sets across sites), while Kubernetes needs to coordinate the 
use of those features with migration and orchestration of the application 
containers that use that storage.  The Kubernetes operator pattern 
provides an architecture that enables coordinated automation of high 
level operations like moving an entire application and its data to another 
cloud.

Q:How has this multi-cloud perspective changed the development focus of the Ceph project?

Ceph's focus has changed and expanded, yes.  Our current priorities are (1) 
usability and manageability, (2) performance, (3) container platform 
enablement, and (4) multi-cloud and hybrid cloud capabilities. It turns 
out that (3) and (4) are closely related.

Q: Wat's new in the upcoming Ceph Nautilus release? And what's cooking for the Octopus release later this year?

Nautilus is going to be a big release for us.  It brings some key 
capabilities to RADOS (like automated selection and scaling of pg\_num, 
device health metric tracking and failure prediction, and centralized 
configuration) to simplify management, a vastly improved management 
dashboard, and a new orchestrator abstraction layer that allows the 
dashboard and Ceph CLIs to connect to whatever tool deployed Ceph (Rook.io 
for Kubernetes, Salt/DeepSea, ceph-ansible, or plain ssh) to perform 
deployment tasks, like provisioning new daemons, replacing disks, and so 
on.  The orchestration work is still a work in progress, but many pieces 
are working today, like seamless management of nfs-ganesha daemons for 
exposing CephFS volumes via NFS.

Q: Have you enjoyed previous FOSDEM editions?

This is only my second time at FOSDEM and I'm really excited to return!
