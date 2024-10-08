+++
aliases = ["/introducing-the-bandon-bluetooth-button-bbb-using-rn42-hid/","/2013/12/01/introducing-the-bandon-bluetooth-button-bbb-using-rn42-hid"]
date = "2013-12-01T12:18:54Z"
draft = false
title = "Introducing the Bandon Bluetooth Button (BBB) using RN42 HID"
description = ""
slug = "introducing-the-bandon-bluetooth-button-bbb-using-rn42-hid"
+++

#"Introducing the Bandon Bluetooth Button (BBB) using RN42 HID"

TL;DR - A Bluetooth-enabled Button/Joystick to control music/podcasts on your phone whilst driving.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/bbb01.jpg"><img class="size-large wp-image-1212 alignnone" alt="bbb01" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/bbb01-1024x849.jpg" width="584" height="484" /></a>

One thing I find very dangerous in the car is changing tracks etc on my phone when it's in its screen mount. It's impossible to do so without taking your eye off the road even for a second. And it's illegal in many countries. I used to love the steering column controls for the old car radio but they don't work over A2DP or AVRCP Bluetooth to my phone which streams to my Lidl car stereo.

I've made three attempts at solving this and I finally succeeded today.

The first attempt involved one of those cheap Chinese Bluetooth Serial modules like HC-05 or HC-06. I got pretty far with this and was able to send commands to my phone. But that's where I got stuck. I would need to write a native Android App to take those commands and broadcast them as media commands in the phone. I made some progress there but I was way out of my depth.

Whilst in the midst of that, Adafruit announced the <a href="http://learn.adafruit.com/introducing-bluefruit-ez-key-diy-bluetooth-hid-keyboard">Bluefruit</a>. We know how <a href="http://conoroneill.net/a-product-and-support-failure-by-adafruit-with-the-bluefruit-ez-key/">that turned out</a> for me, but if you want to make something like my BBB, I'd recommend that route since you get almost everything out of the box.

Finally I settled on the Microchip Roving Networks RN42 HID Bluetooth module. It only cost 16.50 ex-VAT from <a href="http://ie.farnell.com/jsp/search/productdetail.jsp?sku=2143310&amp;CMP=i-bf9f-00001000">Farnell Element 14 in Ireland</a>. As usual with Farnell, you need to bump the order over 20 to get free (fast!) deliver. My big concern was to make sure I'd get the right variant since there are quite a few. But since May 2013 it looks like the HID one is what they ship by default. Of course the big drawback is that this is an SMD module which isn't really designed for hand soldering into a hobby project. You can get them on breakout boards but it adds a lot to the cost. In the end the soldering was fine since it only really involved 4 wires and a stiff drink ;-) (Power, Ground, Serial Receive, Serial Transmit).

So what does it do? It's really very simple. You pair it to your phone and it appears as a combo Keyboard/Mouse device. You then send commands using an Arduino Nano to the RN42 and it sends them to the phone. The trick here is that the commands are "Consumer Report" ones which means Play/Pause, Next/Prev Track and Volume Up/Down (amongst many others). It's all powered by a LiPo battery I salvaged from some broken kids toy.

https://www.youtube.com/watch?v=IuH-1LcZlYo

It works beautifully and will take pride of place attached to my steering wheel as I wend my way around the country. Update: Just tested on an emergency drive from Bandon to Mount Mellary to collect a sick Boy Scout.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/12/2013-11-30-19.41.41.jpg"><img class="size-large wp-image-1214 alignnone" alt="2013-11-30 19.41.41" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/12/2013-11-30-19.41.41-1024x768.jpg" width="584" height="438" /></a>

I have tested on an SGS4 but there is no reason it won't work on an iDevice unless Tim and Co have not implemented Consumer Report HID on iOS. Update: Tested and working beautifully on an iPhone 5 with iOS 7.

The only real issues I have so far are that it won't auto-connect to the phone (I think this is the SGS4's fault) and I haven't implemented any power saving. I'm trying to sort auto-connect by using an NFC sticker to force the Samsung to connect. Not much joy yet. Power-saving should be easy to do since the joystick itself could be used to wake everything up. In the meantime I'll just unplug when not in use and charge the battery every once in a while from the cigarette lighter socket using one of these very neat <a href="http://dx.com/p/mini-usb-1a-lithium-battery-charging-board-charger-144856">$3 USB LiPo chargers</a> from the usual crew in DX in China.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/bbb02.jpg"><img class="aligncenter size-large wp-image-1213" alt="bbb02" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/bbb02-1024x911.jpg" width="584" height="519" /></a>

One thing I haven't figured out is why it won't work with a 3.3V Arduino Pro Mini. The RN42 is a 3.3V device but only works with my 5V Arduinos like the Nano and the Uno. Is it possible the UART pins need 5V?

The Bill of Materials is as follows:
<ul>
	<li><a href="http://dx.com/p/repair-parts-replacement-analog-stick-module-for-ps2-controller-black-121340"><span style="line-height: 15px;">Cheap Chinese Joystick Module</span></a></li>
	<li><a href="http://www.elecfreaks.com/store/arduino-nano-p-14.html">Arduino Nano</a></li>
	<li><a href="http://ie.farnell.com/jsp/search/productdetail.jsp?sku=2143310&amp;CMP=i-bf9f-00001000">RN42 HID</a></li>
	<li>3.7V Lipo Battery</li>
	<li>Double sided foam tape :-)</li>
	<li>A few headers</li>
	<li>NFC Sticker</li>
</ul>
Wiring is beyond easy: TX on Arduino to RX on RN42. RX on Arduino to TX on RN42. 3V3 on Arduino to VCC on RN42. GND on Arduino to GND on RN42.

<a href="https://github.com/conoro/bandon-bluetooth-button">My code</a> is trivially simple and uses my improved version of <a href="https://github.com/baselsw/BPLib">an existing Arduino library</a> called BPLib to talk to the RN42. I had to modify the library to work on anything other than an Arduino Mega but that was a simple search/replace. I also added a bunch of the Consumer Report functions to the library if you want to make use of them. They are:
<ul>
	<li>void volumeUp();</li>
	<li>void volumeDown();</li>
	<li>void muteAudio();</li>
	<li>void playPause();</li>
	<li>void nextTrack();</li>
	<li>void prevTrack();</li>
	<li>void stopAudio();</li>
	<li>void fastForwardAudio();</li>
	<li>void rewindAudio();</li>
	<li>void keyRelease();</li>
</ul>
My Arduino sketch and library are available <a href="https://github.com/conoro/bandon-bluetooth-button">on GitHub here</a>. Edit the ino file to suit yourself e.g. shorten a lot of the overly conservative delays or add proper power management. The BPLib directory should be dropped into the libraries sub-directory of your Arduino IDE installation.

One thing to be careful of is that most Arduinos only have one serial port. So if you have the RN42 attached to the serial pins and powered up, then you won't be able to program the Arduino using the IDE until you disconnect power or RX/TX to the RN42.

As always, any questions, let me know in the comments.

UPDATE: I've been using it for two days now and I love it! One problem I've run into which should have been obvious is that once I pull the power, the BBB forgets what it has been paired to. So when I reconnect power, the phone thinks it is paired but the BBB doesn't and therefore connection fails. So I have to un-pair and re-pair. The solution is obviously to implement strong power management so the LiPo lasts more than the current 48hrs. I'll post new code when I have that figured out.

The other tiny problem is that play/pause on Android by default uses your main Music app rather than the last audio app you ran,. In my case I want it to control the Doggcatcher Podcast player. It's no biggie, I just have to manually open Doggcatcher at the start of a journey and then the controls work perfectly.