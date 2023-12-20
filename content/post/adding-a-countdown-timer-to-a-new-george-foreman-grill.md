+++
date = "2023-12-20T06:00:22Z"
draft = false
title = "Adding a countdown timer to a new George Foreman grill"
description = "A fun Christmas break project"
slug = "adding-a-countdown-timer-to-a-new-george-foreman-grill"
+++

My wonderful late mother-in-law Mary bought us an original massive George Foreman Lean Mean Grilling Machine more than 10 years ago. Like most people we discovered it was pretty rubbish at cooking almost everything but was a superb toasted sandwich maker. With 5 kids, we have easily toasted thousands of cheese-based sambos.

![Old George Foreman Lean Mean Grilling Machine](/images/2023/12/gf1.jpg)

Unfortunately, as with all non-stick surfaces, eventually it wore away on the grill until it became a stick surface.

So off I went to Amazon to survey potential replacements. There was nothing really like the original so I went with a panini-style maker from George. 

![New George Foreman](/images/2023/12/gf2.jpg)

And boy was that a mistake. Problems with it include:

* The lid arrived dented as the packaging doesn't protect it
* The lid is too light so toasties don't get compressed properly
* The ridges are too deep so it just scorches black bars on the bread but doesn't really toast it unless you incinerate the contents
* There's no temperature control
* There's no timer

We've had multiple cheese-tastrophes with the new grill as people get distracted and forget the grill is on. Clean-up on aisle 6.

I can't do much about most of the above but I thought I'd try to solve the last one, so I ordered a plug-in mains timer. 


![Timer](/images/2023/12/gf3.jpg)


I was disappointed to find that it (and it seems all others) doesn't have a countdown feature. I want to be able to set N minutes and then have it turn off after that time.

I went back to Amazon to discover that timers on grills now appear to be as rare as hens teeth. Why?

Of course I immediately thought, I can solve this. I did, but it took a smidge longer than expected.

* Step 1: Take apart the cheap Amazon timer.
* Step 2: Rip out the display and replace it with an Aliexpress-special SPI OLED one.
* Step 3: Rip out the low-voltage controller board.
* Step 4: Wire in a Wemos Lolin ESP32-C3 Pico board to replace the controller board.
* Step 5: Find 5V or 3.3V to power the ESP32. Oh oh - problem 1 encountered.

Weirdly there was no obvious power I could tap into on the original timer. Only 1.2V or 30V. I tried using a step-down regulator on the 30V but it wasn't able to power the ESP32. The voltage collapsed under load. I still don't know how the original controller gets sufficient power.

I thought the project was over but then remembered the brilliant [iTead S20 WiFi Smart Sockets](https://wiki.iteadstudio.com/S20_Smart_Socket) I bought back in 2017.

![S20](/images/2023/12/s20.png)

And so was born the Franken-timer.

I took the controller board from the iTead and the case from the original timer. I discarded all of the innards of the original timer. I cut out the ESP8266 microcontroller from the iTead and wired my ESP32-C3 into the relay on it. I then wired the mains voltage from the case pins to the other side of the iTead.

![Franken-Timer](/images/2023/12/gf4.jpg)


It all worked! But, the screen refresh was atrociously slow. Some googling uncovered that the Adafruit library defaults to Software SPI if you use custom pins for SPI. No amount of messing was able to get Hardware SPI working. This is the second project where I've gotten so far with the ESP32-C3 and then had to discard it. I'm avoiding it from now on. Any of the ESP32 original, S2 or S3 are great in comparison.

So out came the C3 and in went an ESP32-S2 I had handy. And it worked first time! Annnnd I could get Hardware SPI working so the screen refreshes instantly.

![George Foreman with Timer](/images/2023/12/gf5.jpg)


The final result looks horrendous. But it works. And it works exactly like the original. One button to increment the number of minutes and a second button to Start/Stop/Reset the countdown. Plus a little tune at the end played on an overly-quite mini speaker.

<video width="640" height="480" controls>
  <source src="/images/2023/12/gf6.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

It may also be the world's first OLED display mains timer?

I had been concerned the 10A relay in the S20 might be a bit weedy for a grill but it's rated for 2000W and the George Foreman is rated at 1800W. And so far it works perfectly.

The Arduino code to control this [is here](https://gist.github.com/conoro/77058e27bf3d34567d13f21ac0462aad). It's the usual cobbled-together rubbish from me. As always, once I get a positive result on a non-serious project, I move on to the next thing.

It does make me think tho that a commercial countdown timer socket would be very useful for a multitude of products that lack built-in timers.
