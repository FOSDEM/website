---
year: 2017
speaker: jason_a_donenfeld
event: wireguard
---

Q: Could you briefly introduce yourself?

I’m Jason Donenfeld, sometimes known as “zx2c4”. I’m a security
researcher and the president of
[EdgeSecurity](https://www.edgesecurity.com/), a security consulting
firm. I’ve been doing all sorts of development for many years, ranging
from GUIs to kernels to zero-day vulnerabilities.

Q: What's the history of the WireGuard project? Why did you start it
and how did it evolve? Has it become what you planned it to be?

The requirements of high security and stealth actually grew out of the
design requirements for a kernel rootkit I wrote. In parallel, I had
been thinking for a while about how overwhelmingly complex and
terrible the general setups of VPNs are. I tried to boil down the VPN
to the most fundamental concept – the cryptokey routing table – and
combined that with some new modern cryptography, as well as with the
security requirements of my rootkit. The project was developed as a
series of puzzles – small challenges that usually involved trying to
come up with a new idea to maintain simplicity and security of the
overall interface. Those factors, combined with a general aesthetic
and attitude toward these kinds of systems, eventually gave way to
[WireGuard](https://www.wireguard.io/).

Q: WireGuard has much fewer lines of code than popular open source VPN
software such as OpenVPN and strongSwan. What’s the deal?

Indeed it is impossible for one human to audit [OpenVPN](https://openvpn.net/) or
[strongSwan](https://www.strongswan.org/)/IPsec in a single sitting. WireGuard, being less than 4k
LoC, strives to remain easily auditable, as well as enjoyable to read,
so that people actually review the code and are able to think about
the design coherently in their mind. WireGuard sticks to simplicity of
interfaces and simplicity of implementation, while at the same time
using more secure modern cryptographic constructs. How we achieve this
will be presented at the talk.

Q: Is WireGuard portable to other kernels than Linux?

Some folks are working on Go implementations, so that it can run
cross-platform in userspace. Some FreeBSD people have expressed
interest in porting it.
