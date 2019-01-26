---
year: 2019
speaker: lorenzo_fontana 
event: ebpf_kubernetes
---

Q: Could you briefly introduce yourself?

My name is Lorenzo Fontana and I work as an SRE at [InfluxData](https://www.influxdata.com/), the creators of the time series database [InfluxDB](https://github.com/influxdata/influxdb).

Before joining Influx I've always been interested in Linux, distributed systems and performance analysis but in the past year I've had the opportunity to concentrate on those topics and started making tools to fit my needs and express my opinions.

Q: What will your talk be about, exactly? Why this topic?

I will give an introduction to the kernel tracing subsystem and how eBPF programs can be used to instrument it, followed by some real world examples and then an overview on how to use eBPF programs in [Kubernetes](https://kubernetes.io/) clusters.

Q: What do you hope to accomplish by giving this talk? What do you expect?

I would love to get more people involved in the eBPF on Kubernetes space in order to make the tooling better and more reliable for everyone.

Q: What's eBPF exactly and what are its possibilities?

eBPF is a highly flexible and efficient virtual machine-like construct in the Linux kernel allowing to execute bytecode at various hook points in a safe manner.

eBPF programs have many use cases: IO analysis, networking and monitoring at various level of depth from aplications to device drivers.

Q: What's the history of the kubectl trace plugin? What was the motivation to develop it?

While working I found myself repeatedly in the process of installing and using [bpftrace](https://github.com/iovisor/bpftrace), the tool kubectl trace is based on. On various machines, this process is very slow, because you have to figure out the machine first and then you have to point all your guns there.

I just wanted something simpler, the idea was that given a pod I want to be able to automatically use bpftrace right there so [kubectl trace](https://github.com/iovisor/kubectl-trace) was born.

Q: What kind of visibility does the kubectl trace plugin give into a Kubernetes cluster?

I don't want to spoiler but there's a whole set of probe types that comes immediately available at your fingertips that go from attaching to kernel functions, to userland functions and even hardware events!

Q: Which new features can we expect this year in the kubectl trace plugin?

Kubectl trace recently joined [IO Visor](https://www.iovisor.org/), the Linux Foundation's eBPF project where also bpftrace is hosted.

Thanks to that it can concentrate on adding more container awarness to bpftrace that kubectl trace will leverage to let the user write more targeted programs.

For example, we are working right now on adding pid namespaces support to bpftrace so that when running kubectl trace against a pod one can filter only the container's specific processes.

Q: Have you enjoyed previous FOSDEM editions?

Of course I did, I enjoy being at FOSDEM because there's too much to learn in this world and at FOSDEM you just go there and you are in a inclusive environment where you can just go talk to people and learn stuff.
