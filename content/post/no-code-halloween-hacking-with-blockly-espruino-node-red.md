+++
date = "2021-11-01T05:00:22Z"
draft = false
title = "No-Code Halloween Hacking with Blockly, Espruino and Node-RED"
description = "Low-Code/No-Code Tools are easily capable of building fun Halloween scare setups and are much more inclusive"
slug = "no-code-halloween-hacking-with-blockly-espruino-node-red"
+++

Every Halloween for the past decade or so, I've built something silly to scare or entertain the trick-or-treaters. Some years it works brilliantly, other years, not so well. But the basic idea is always the same - detect arrival of kids and use sound/light/motion to jump-scare them.

And every Halloween is a last-minute race to assemble electronics, plastic, duct-tape and code. That code is often a horrendous unreliable mish-mash of Arduino, Espruino, Python, Node.js and Bash scripts. 

I've often thought that more people could easily build things like this if the tools were more approachable and inclusive. Hobbyist electronics and IoT often feels like this classic joke:

![Owl](/images/2021/11/owl.jpg)

Where our version of that is:

![Red LED](/images/2021/11/red-led.jpg)

![Strandbeest](/images/2021/11/strandbeest.gif)

So this year, I wondered if it was possible to build something that really worked, but only using No-Code/Low-Code tools for the implementation. 

Whilst these tools absolutely don't make it any easier to understand what a TIP120 is or how an ultrasonic sensor works, they remove one huge chunk of required setup/configuration/deployment/expertise. I'll talk more about that in a bit.

## So what was the project idea?

* PIR detector at the gate to register when trick-or-treaters are approaching
* LED light strip around door which lights up red on approach
* Big hidden loudspeaker which blares out something scary
* Message via Telegram to tell us they are coming
* Log all arrival times in Google Sheets to implement Halloweenalytics
* Turn on cheap old smoke machine which fills the hall with smoke before we open the door

## And what was the actual final setup?

* Ultrasonic detector near door wired to an ESP32 running [Espruino](http://www.espruino.com/) sending arrival notifications over Wifi

![LEDs](/images/2021/11/photo_ultrasonic.jpg)

* Analogue LED light strip connected to a [NodeConfEU 2018 badge](https://shop.espruino.com/espruino-boards/pixljs-multicolour) running Espruino and controllable over Bluetooth

![LEDs](/images/2021/11/photo_lights.jpg)

* Raspberry Pi 4 running [Node-RED](https://nodered.org/) to accept Ultrasonic Sensor notifications and then
    * Play loud sound through AV port
    * Trigger GPIO pin to a second NodeConfEU 2018 badge running Espruino

![LEDs](/images/2021/11/photo_mess.jpg)

* That second NodeConfEU 2018 badge notified the first one over Bluetooth to turn on the LED lights for 60 seconds
* It also controlled a cheap hobbyist servo taped to the on-off switch of the smoke machine to turn it on for 20 seconds

![LEDs](/images/2021/11/photo_servo.jpg)


* When the webhook was triggered, Node-RED would then send a message via a Telegram Bot which I received on my phone

![Telegram](/images/2021/11/telegram_halloween.jpg)

## Hardware
I've just realised that there was almost no extra "electronics" required to implement this project. Apart from the boards themselves, standard household items like speakers and extension cables and various powerbanks and power supplies, I had:

* A TIP120 to connect the Espruino board to the LED Strip
* The HC-SRO4P ultrasonic sensor
* A generic low-power hobbyist servo motor
* A few wires to connect things together
 
## Show me the code
But here's the even cooler thing. I only had to write a single line of "traditional" code to make all of this work. All of the Espruino code was done using Blockly with the exception of the one HTTP request to Node-RED as there isn't an Espruino Blockly block for that.

* Here's the LED light code:

![LED Light Code](/images/2021/11/leds_on_off.png)

* Here's the Smoke Machine code and remote LED light trigger:

![Smoke Machine Code](/images/2021/11/espruino_smoke_and_lights_blockly.png)

* Here's the Ultrasonic sensor code (only complexity is making sure to not send an excess of notifications):

![Ultrasonic Code](/images/2021/11/ultrasonic_blockly.png)

* Here's the Node-RED code:

![Node-RED Code](/images/2021/11/node_red_halloween.png)


## How well did it work? 

See for yourself:

{{< youtube i8a4AJPny50 >}}

&nbsp;

## Challenges
* Cheap PIR sensors are awful. Completely inconsistent and totally useless outdoors
* Cheap ultrasonic sensors are pretty good. Unless it rains, which it did.
* Bluetooth for time-sensitive reliable communications remains problematic and is too hard to understand for most people
* Internet access using Espruino Blockly on devices like the ESP32 can be patchy due to a (completely understandable) lack of official support
* Ditto using an ESP-01 on a NodeConfEU 2018 badge - I wasn't able to get this working in Blockly
* Node-RED is not pre-installed on Raspberry Pis but it should be. Installing is very easy tho.
* Authentication/Authorisation for hobbyist stuff on the internet remains a huge hurdle. It should not be that hard to access one Google Sheet. 
* [Edublocks](http://app.edublocks.org/) has a lot of potential as a Python alternative to Blockly but it currently seems more for classroom experimentation rather than deploying and running code somewhere. I made some progress with it but dropped it in favour of Blockly for this project.

## Wins
### Espruino
Espruino + Blockly + Save-To-Flash is an incredibly powerful and easy way to have code in production in minutes that you can power-cycle.

### Node-RED
Node-RED, whilst a bit scary initially, is crazily powerful and again enables you to have code in production that you can power-cycle.

### Telegram
Telegram seems to be the only messaging app that welcomes Bots and integrations and has done it extremely well.

## Final thoughts
No-Code tools don't imply no-tech. Whatever the vertical, you still need to learn how the technology there works. And in this area there is no getting away from having to learn how various electronic modules are wired up. You may have to install tools or look at the JSON coming back from an API or figure out a simple regex or follow the steps to enable Google Auth. 

But what you don't have to do is worry about the nuances of Arduino vs C++ vs Python vs JavaScript vs Go vs Assembly or how to build/compile/deploy your code or use each MCU vendor's SDK. And that's a massive gain for so many people.

I love the idea of being able to hand someone, who is new to hobbyist electronics/IoT, an Espruino device or a micro:bit or a Raspberry Pi Zero along with a few components/wires and know that they could have something far more complex than a blinking LED working in a Low-Code tool the same day.

But we're not fully there yet. Espruino+Blockly and Edublocks still feel too much like "coding" and they lack a rich ecosystem of community blocks. Bluetooth and Wifi are still a pain in the butt and I wonder if a big push for LoRa is needed. Or some other simple supported protocol to get lightweight data from cheap device to cheap device without ever having to think about the implementation details. We live in a connected world. Flashing an LED doesn't cut it any more. Flashing an LED remotely in your friend's house by dragging-and-dropping some blocks, well that's another thing altogether!

Companies like Adafruit, Sparkfun and Pimoroni have done wonderful work with Open Source Hardware and Software. Adafruit is also leading the charge with software like CircuitPython. It'd be amazing if some common Low-Code/No-Code standard could be created that meant every new hardware module that these companies release had a "Block" available to use in these environments. Even if that means one LCNC tool has to become the winner.




