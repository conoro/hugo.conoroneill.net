+++
aliases = ["/a-product-and-support-failure-by-adafruit-with-the-bluefruit-ez-key/","/2013/11/17/a-product-and-support-failure-by-adafruit-with-the-bluefruit-ez-key"]
date = "2013-11-17T13:32:35Z"
draft = false
title = "[No Longer] a Product and Support failure by Adafruit with the Bluefruit EZ-Key"
description = ""
slug = "a-product-and-support-failure-by-adafruit-with-the-bluefruit-ez-key"
+++

#"[No Longer] a Product and Support failure by Adafruit with the Bluefruit EZ-Key"

<strong>UPDATE: Incredibly fast response and resolution from Adafruit. Feel free to ignore my negative post below. But still some good tips for any biz about handling product change and support. Back in? with Adafruit.</strong>

I've been working on a simple-ish project recently which required Bluetooth comms between some hardware and a phone. I've had lots of success with those cheap HC-05/HC-06 modules from China and made some progress with a Slave module. The problem was having to write native Android code to take the info from Bluetooth and "action" it.

Then mid-project, Adafruit announced the<a href="http://learn.adafruit.com/introducing-bluefruit-ez-key-diy-bluetooth-hid-keyboard">Bluefruit EZ-Key HID</a> module which solved everything (I thought) in one fell swoop. I immediately ordered one and it arrived quickly from the US. I had it paired and sending key-presses to my PC and phone within a few minutes.

Then I moved to using it in the actual project. I needed to be able to send Play/Pause music commands over Bluetooth. I opened up the key definition file and there was no mention of media controls. The file referenced another filename which I googled and found. A short while later I realised that a HID keyboard can't send media commands, it requires just a slightly different HID Consumer profile (a simple setting). But I couldn't see how to change the Bluefruit profile and <a href="http://forums.adafruit.com/viewtopic.php?f=19&amp;t=44730&amp;p=223765&amp;hilit=bluefruit#p223765">asked how on their only Support method</a> for paying customers - the Adafruit forums. Crickets. One non-Adafruit person tried to help but I'd already failed with the method suggested. Strike 1 for Adafruit support.

After a delay of a few weeks whilst I focused on Halloween tech, I finally got back to it last week and rolled up my sleeves. Back I went to the Adafruit site to get as much info as possible to see if there was any way to add the "Consumer" profile to Bluefruit. I was stunned to see they had released two new versions in less than 4 weeks. The first to add the mouse profile and the second to add the (yup, you guessed it) Consumer profile. So a feature I asked about, to which they never replied, is now part of the product!

Naturally I went straight to the forums and asked how I could upgrade my 4 week old device to the new firmware. Response: <em>you can't</em>. My basic response: <em>you're kidding me</em>. <a href="http://forums.adafruit.com/viewtopic.php?f=19&amp;t=45724&amp;p=229432#p229432">As I said on the forum</a>:

"<em>I really have to express my annoyance about this. You released a non-user-upgradable product and then iterated it twice in the space of a few weeks? So anyone like me who bought v1.0 was basically a beta-tester without realising it? I feel very let down here by a company I have huge respect for.</em>

<em>As someone who works in product management I know that this is a sure-fire way to kill a product stone-dead. Why would anyone even buy v1.2 if they suspect there might be a v1.3 next week? Did you do a beta cycle with real users at all? The features of v1.1 and v1.2 would have been obvious additions to anyone who even played with it for 5 minutes.</em>"

Now if this was a standard hacker product, there would be new firmware available to burn or instructions for hardware mods or whatever. Not in this case. This is effectively a consumer product. It is "non-user-serviceable". Once you buy it, that's it, it will be forever fixed function, like a vacuum cleaner.

This type of product is a new departure for Adafruit and they have royally screwed it up. Any normal consumer product company would offer a full or partial replacement/exchange for the people who bought the first incomplete versions. Adafruit's attitude seems to be "tough luck, caveat emptor dude". The almost complete lack of questions about Bluefruit on the forums tells me it is either so perfect that no-one needs any support or (more likely) very few people have bought them. So the cost of keeping a few customers happy and loyal would have been minimal.

My final comment to them was "<em>I'll continue to buy Adafruit products that I can hack myself but you've really soured me with anything black-boxed like the Bluefruit.</em>". And that's my advice to others. Until Adafruit make the necessary organisational changes to properly release and support products like this, you should stick to their excellent motor shields, Floras and other devices instead.

Of course yesterday I discovered <a href="https://www.sparkfun.com/products/10823">a similar Roving Networks product</a>variant that does exactly what I want and was released 2 years ago! And it comes with full configurable HID support unlike the still fixed-function HID of the Bluefruit (v1.7 next week?). The RN42 is also available <a href="http://embeddedwirelesssolutions.com/rn-42_HID_breakout_board">here on a breakout board</a>. Then I found that HID is now built-in by default to the RN42 and I can get it for <a href="http://ie.farnell.com/microchip/rn42n-i-rm/module-bluetooth-class-2/dp/2143324">16.50 in Farnell in Ireland</a>. Sure it'll need some soldering etc, but I can live with that.

For me, two of the brightest lights of the Maker movement have been Sparkfun and Adafruit. After this experience, one of those LEDs is just a little dimmer.