+++
date = "2021-09-23T05:00:22Z"
draft = false
title = "Almost a decade of Espruino leading to the Bangle.js 2"
description = "You've Come a Long Way, Baby"
slug = "almost-a-decade-of-espruino-leading-to-the-bangle-js-2"
+++

TL;DR - Gordon Williams has a new [Espruino Kickstarter](https://www.kickstarter.com/projects/gfw/banglejs-2-the-open-smart-watch?ref=conor) for the fabulous [Bangle.js 2](https://www.kickstarter.com/projects/gfw/banglejs-2-the-open-smart-watch?ref=conor). Go and back the project and enjoy every geeky minute of playing with it. I have one of the devices already and it's a massive leap forward over V1. Imagine running JavaScript and TensorFlow Micro machine learning on your wrist!

![Bangle.js 2](/images/2021/09/banglejs2.jpg)


I'm still not sure how I heard about the [Espruino](http://www.espruino.com/) project originally back in 2013. [Hackaday](https://hackaday.com/tag/espruino/) maybe? What I do remember is getting very excited by the idea of running JavaScript directly on a low-power hardware device despite it being the opposite of everything we learned as Realtime Embedded Software Engineers. [My first post about it](https://conoroneill.net/2014/02/01/run-the-espruino-js-interpreter-on-windows/) was back when I got the board in 2014.

That [first Kickstarter device](https://www.kickstarter.com/projects/gfw/espruino-javascript-for-things) was a minimalist marvel. I was amazed that you could run **useful** JavaScript on something so small and had lots of fun trying little experiments.


![Original](/images/2021/09/original.jpg)

I was always surprised more people didn't know about its follow-up, [the Pico](https://shop.espruino.com/espruino-pico-pinned). Here was a ridiculously tiny device that plugged directly into USB and could do HID [and 2FA](https://conoroneill.net/2015/07/22/creating-an-otp-fob-compatible-with-google-authenticator-using-an-espruino-pico/) and lots of other cool USB related things. And was crazy easy to program, because JavaScript. Annnd you could even solder an ESP8266 wifi module on to it.

![Pico](/images/2021/09/pico.jpg)


But it was the [Puck.js](https://shop.espruino.com/puckjs) that I felt was a gigantic leap forward for Espruino. Here was another minuscule device, now running a Bluetooth chip (the NRF52832) and able to run all of the existing code plus opening up a whole new world of Bluetooth applications in JavaScript. To me, it's as close to perfect as you can get for a combined hardware and software hacker device. The addition of a Web Bluetooth based IDE in Chrome was just the icing on the cake. The entire thing is masterful and it is the core of a simple device I built several years ago that I still use multiple times per day (My "I'm On A Call" Light).

![Puck.js](/images/2021/09/puckjs.jpg)


So when I came up with the idea of doing a digital event badge for NodeConf EU 2017 (and was thrilled that others in NearForm were thinking along the same lines), it seemed like a no-brainer to talk to Gordon Williams about possibly designing it for us based on Espruino.

We worked intensely on the spec and were stunned when the first prototype was almost flawless. When we unveiled the final badges in Kilkenny, it completely blew the minds of the attendees. Most of them were from a web background, not hardware, so they had no idea such a thing was even possible.

![2017 Badge](/images/2021/09/nico2017.jpg)

Here are my posts about it:

* [Say hello to the NodeConf EU hackable badge](https://www.nearform.com/blog/say-hello-to-the-nodeconf-eu-hackable-badge/)
* [Simple hardware mods for your NodeConf EU hackable badge](https://www.nearform.com/blog/simple-hardware-mods-for-your-nodeconf-eu-hackable-badge/)


Gordon took everything he learned from that experience and built the superb [Pixl.js](https://www.espruino.com/Pixl.jspixljs) which I am still using for some of my treadmill experiments. It's basically an Arduino for a JavaScript generation!

![2017 Badge](/images/2021/09/pixljs.jpg)


The 2018 NodeConf EU badge was interesting because it wasn't revolutionary from a hardware point of view, it was simply much much better overall. Most importantly, it was gorgeous. The design of the bezel by the brilliant Agata Surgot remains one of my favourite things of all time. When it's lit up by the built in RGB LEDs, it's utterly perfect. 

![2018 Badge](/images/2021/09/hannah.jpg)


We also removed a lot of the hardware-hacker-centric features since they weren't right for the audience. We added LiPo power, charging, those RGB LEDs, the ability to plug-in WiFi and lots of other small tweaks ([papercuts](https://twitter.com/migueldeicaza/status/1392154167486160896?lang=en) as Miguel de Icaza calls them). The focus that year was on all the software we built around it including 20 Raspberry Pis acting as Bluetooth<>MQTT gateways to Azure. It was epic!

* [The NodeConf EU 2018 Digital Badge is here and it’s fabulous](https://www.nearform.com/blog/the-nodeconf-eu-2018-digital-badge-is-here-and-its-fabulous/)
* [Sending 1.24 million MQTT messages from NodeConf EU to Azure (and lots more digital badge details)](https://www.nearform.com/blog/sending-1-24-million-mqtt-messages-from-nodeconf-eu-to-azure-and-lots-more-digital-badge-details/)


In fact it was so good that Adobe used the core design for their annual conference in Vegas!!

![Adobe Badge](/images/2021/09/adobe.png)

* [Jason Mulligan talks about event IOT, the future of digital badges, opportunities for open source, and the Experience League](https://www.nearform.com/blog/conversations-with-changemakers-jason-mulligan-of-adobe/)


The hardware for that badge is [available to buy](https://shop.espruino.com/espruino-boards/pixljs-multicolour) from Gordon if you want to use it at your own event. You won't regret it.


2019 then provided us with a major challenge. How the hell do we beat that? Bigger faster stronger didn't really excite us. Other form factors hit lots of issues ("No Conor a belt buckle badge is not appropriate"). And then Gordon floated the idea of a watch, based on what he, others, and even I, had been playing with in the previous 18 months. After initially thinking "but that's not a badge", Agata convinced me that it was actually the perfect device for a conference. And yet again, she was right.

I'll bore you to death sometime in a pub with the story of the hell we went through over the next few months in testing, selecting, attempting to buy, failing, trying again, and again and again, until finally we had five hundred watches in our hands, four days before the event was due to start.

![Bangle.js](/images/2021/09/banglejs.jpg)


If people loved the first and second badges, they could not believe what we did with the watch. Web Bluetooth to their wrist, running a JS REPL and TensorFlow Lite Micro!! 

Here are my posts about 2019:

* [Bangle.js and Open Source pointing to the future of health platforms and wearables](https://conoroneill.net/2019/11/25/bangle-js-open-source-pointing-to-future-of-health-platforms-and-wearables/)
* [Why running TensorFlow Lite Micro on very inexpensive devices changes everything](https://conoroneill.net/2019/12/04/why-running-tensorflow-lite-for-microcontrollers-on-extremely-inexpensive-devices-changes-everything/)
* [Bangle.js: Open Source watch built on JavaScript](https://www.nearform.com/blog/banglejs-excitement-at-nodeconf-eu/)
* [Bangle.js – Open Source creating opportunities for Open Health wearables with JS & TensorFlow](https://www.nearform.com/blog/banglejs-oss-open-health-wearables-js-tensorflow/)
* [Bangle.js is the first hackable open source JS and TensorFlow-driven smartwatch!](https://www.nearform.com/blog/bangle-js-hackable-oss-js-and-tensorflow-smartwatch/)


Let's not be modest here, we knocked it miles out of the park. And I'll remain forever proud of the name [Bangle.js](https://shop.espruino.com/espruino-boards/banglejs) that I devised after sending Gordon a list of some of the most stupid device names in history.

Bangle.js has done incredibly well despite other watch projects getting far more press. And to me, that's the story of Espruino. It's so damned good, Gordon mostly lets it speak for itself. The latest version of the code still runs [on the original](https://shop.espruino.com/original), almost ten year old, board. These are devices you reach for to do useful practical things, they are not one of the endless cool Kickstarters that sit on your desk unused for six months and then go in a drawer never to be used again (I have sooooo many of those).

The Bangle.js 2 device deals with all the compromises we made in 2019. It has the much more powerful CPU I had hoped for back then, along with more RAM. The screen is readable outside. It looks good on the wrist. It uses standard straps. And from a hacking perspective, you can program it over the wire, not just over Bluetooth, using the SWD pins on the back.

I have four unrelated families of technologies that I reach for when I'm starting a project. Every recent hardware project has a mix of one or more of Arduino, Raspberry Pi, ESP32 and Espruino. And there can be no higher compliment for a tool than it's the thing you reach for, because you know it'll work.

And here they all are along with some Conor-Mods and the first 3D printed cases for a Puck.js-based watch from way back.

![Espruino All](/images/2021/09/espruino_all.jpg)


