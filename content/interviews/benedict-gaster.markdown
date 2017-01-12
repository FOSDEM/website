---
year: 2017
speaker: benedict_gaster_cuberoo_
event: lorawan
---

Q: Could you briefly introduce yourself?

I am a senior lecturer and researcher at the University of the West of England were I'm working on teaching and following research in the Internet of Things (IoT), particually with application to Bluetooth Low Energy (BLE) and more recently I have also become interested in LoRaWAN (Long Range Wide Area Network) and its application to building communities. Recent research has also included GPGPU, compilers, and functional programming. I developed a new CFG abstraction for SIMD execution and a representation of SOA that is easy for programmers, among other things.

Q: What will your talk be about, exactly? Why this topic?

In this talk, I will introduce LoRaWAN as a key radio technology for IoT and walk through why it is a technologically important development as I show how to build LoRaWAN node applications to explore the possibility of IoT. There are a number of LoRaWAN networks emerging across Europe and I will highlight the political importance of why these networks should be open, supporting Open Data and Open Science and empowering the development of a new set of application domains. LoRaWAN is open to everyone and is a key reason for me to talk about this particular topic, it opens possibilities of really seeing the democratization of the internet, devices for everyone needs, not just a few!

Q: What do you hope to accomplish by giving this talk? What do you expect?

My hope is that by introducing LoRaWAN to a wider audience, it will enable others to get the bug: deploy gateways in their home towns, extend an already existing network, build devices, all of which can be open to everyone, we must create a Zine like industry, beyond the current makers of today, to enable people of all ages, gender (including non-binary), and race, to build devices suited to their own needs. We must do this soon, otherwise once again it will be the market of the big companies, building applications such as "smart meters"!

Q: Why is LoRaWAN such an interesting technology for the Internet of Things?

LoRaWAN is a very easy to use and cheap radio technology, that while the chipsets itself are not open source, stacks built on top of the low-level radio technology often is, e.g. [The Things Network (TTN)](https://www.thethingsnetwork.org/). LoRaWAN can transmit over long distances, up to 10 km, with devices having a battery life of many years. The ability to build nodes (i.e. devices) cheaply that can communicate over many kilometres, with long battery life, opens up possibilities for a whole new world of applications. Combine this with the infrastructure of open source network providers, such as TTN, providing the cloud infrastructure to easily connect devices online, then it is possible to see a world of connected devices open to everyone, and what we do with it is up to us.  

Q: What are some disadvantages of LoRaWAN?

There are two main disadvantages to LoRaWAN; firstly as it is in unlicensed spectrum, then it is open for anyone to use and quite possible that interference might become an issue; secondly, it is very low bandwidth and as such it is not suitable for many common applications, e.g. streaming of video. It may be the case that the bandwidth limitations are more down to user expectations of what the technology can be used for, we need to think out of the box for new and exciting applications. 

Q: How much does it cost to cover a city with LoRaWAN gateways?

This really depends on the city, topology and so on, and where the gateways are located. For example, a city like Amsterdam (very flat), one of the first European cities to have a large LoRaWAN deployment, is very different from a city like Bristol (very hilly), where we are deploying. However, in our deployment we have been very lucky to have access to some very high (tower blocks) points in locations around Bristol city centre and with 4 carefully designed full wave antennas, we have managed to cover most of the centre. Each gateway costs around 250 euros, plus an additional 150 euros for the antenna. It is quite possible to use cheaper (less powerful) antennas, however, this might effect the antenna choice on the nodes.

Q: Let's say I'd like to create an IoT application using the LoRaWAN radio technology. How do I start and what do I need?

There are a whole array of options and much will depend on your prior experience. First it will depend if there is an existing LoRaWAN network in your area, there are many now, and so its a good chance there will be. If this is the case, then I would recommend starting with an Arduino compatible system, for example [Adafruit's Feather range](https://www.adafruit.com/feather), or [The Things Network new UNO compatible node](https://www.thethingsnetwork.org/docs/devices/node/). For the more experienced, interested in building a more direct, possibly cheaper solution, then LoRaWAN radio chips are provided by companies such as Microchip, which support simple serial protocols, similar to AT commands. It's exciting to see that Arduino, at CES'17, announced that they will soon be releasing a new product that provides LoRaWAN support and of course this will come with all the usual ease of use within their environment, so while maybe not for everyone it will be an excellent entry point into the world of IoT and LoRaWAN.

From a software perspective, sending messages via LoRaWAN, using solutions such as Microchips LoRa chipsets, is very straightforward and from a node perspective most of the work will be sampling sensors and other devices that will generate the data to be sent across the network. Once sent the data is transmitted to a cloud backend, in our case The Things Network, and once your device is registered it is straightforward using [Node.js](https://nodejs.org/en/) or [MQTT](http://mqtt.org/) to access the collected data from your application.

Q: Have you enjoyed previous FOSDEM editions?

This will be my second time, after attending last year I'm really excited to return again and this time a talk to boot.
