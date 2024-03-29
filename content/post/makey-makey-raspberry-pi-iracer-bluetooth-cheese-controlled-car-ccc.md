+++
aliases = ["/makey-makey-raspberry-pi-iracer-bluetooth-cheese-controlled-car-ccc/","/2012/12/29/makey-makey-raspberry-pi-iracer-bluetooth-cheese-controlled-car-ccc"]
date = "2012-12-29T18:45:16Z"
draft = false
title = "MaKey MaKey + Raspberry Pi + iRacer + Bluetooth = Cheese Controlled Car (CCC)"
description = ""
slug = "makey-makey-raspberry-pi-iracer-bluetooth-cheese-controlled-car-ccc"
+++

#"MaKey MaKey + Raspberry Pi + iRacer + Bluetooth = Cheese Controlled Car (CCC)"

When Santa told me that he was getting an <a href="http://www.coolcomponents.co.uk/catalog/racer-p-993.html">i-Racer</a> remote controlled car for Fionn, I was very excited. This is a remote controlled car that, on the surface looks very crude. Heck it doesn't even come with a remote control.

<a href="http://www.coolcomponents.co.uk/catalog/racer-p-993.html"><img class="size-medium wp-image-914 aligncenter" title="iracer" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/iracer-300x300.jpg" alt="" width="300" height="300" /></a>

That's because it's Bluetooth-controlled! You can install a simple Android App, pair with the car and control it either with on-screen controls or using the accelerometer in the phone.

As a standalone present it is pretty neat but like all remote controlled toys, I'm sure would be discarded after a few days use. However Santa didn't want to spend a fortune on a full-blown Arduino-based robot platform or an even bigger fortune on Lego Mindstorms.

It's when you start thinking about what is possible over time with the i-Racer that things get really interesting. Forgetting electronics for a minute, you could have huge fun making new shells for it out of different materials. Imagine a Foldify template for it so you could make printed paper shells. Lego might be a bit heavy but K'Nex plus some Sugru could work very nicely. Or what about bamboo food skewers or ice-pop sticks? Maybe just some stickers.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/IMG_20121229_141040.jpg"><img class="size-large wp-image-919 alignnone" title="IMG_20121229_141040" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/IMG_20121229_141040-1024x768.jpg" alt="" width="584" height="438" /></a>

Then there is the code running on the car. The source is available so you can play around with it. Now this isn't the easiest thing in the world to do since the car is not Arduino so you need compilers and special programming dongles, but the option is there.

Taking that one step further, you could clip on other bits of electronics. I have a temp sensor, a PIR detector and an Ultrasonic distance detector all winging their way from China. You could use these to give the car a lot more "intelligence". There is also someone working on porting the car's code to Arduino since the microcontroller is compatible.

But that stuff is hard and more long term and wouldn't actually involved Fionn doing much. Always have to keep your focus on the "customer"! So I thought about it some more and realised that you could have enormous fun with how you control the car. The use of Bluetooth gives you a giant range of pretty *cough* easy possibilities.

So I started playing with some Python code and after a ton of dead-ends, Linux bugs and system problems I was finally able to talk to the car from my Ubuntu PC with a $2 Bluetooth dongle. (Details below)

Then I realised that this would be no use over Christmas as we spend it travelling to family houses around the country without the Ubuntu PC. My Windows laptop should work with tweaks but that's not for games! So I started looking at the Raspberry Pi. Whatever problems I had run into on my PC were 10x worse on the Pi. (More details below)

After a ton of messing I got keyboard control working the way I wanted over USB on the RPi. Which leads to the piece de resistance - <a href="http://www.makeymakey.com/">MaKey MaKey</a> control. MaKey MaKey is a beautifully simple idea. It's an Arduino-compatible board you plug into a PC and it emulates various key-presses and mouse clicks. You then connect whatever you want, as long as it is vaguely conductive, and use that for input. It famously uses bananas, pencil drawings and buckets of water as inputs to various fun software.
<h2>The Cheese Controlled Car (CCC)</h2>
So Fionn finally had the ultimate car controller. 5 Pieces of Christmas Cheese connected to a Raspberry Pi via MaKey MaKey talking to a car over Bluetooth. Check it out in action:

https://www.youtube.com/watch?v=qb9wso0pB4o

If you want to try this yourself and run into any problems, pop a comment in below.

Otherpossibilitiesinclude grapes (GCC):
<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/grapes.jpg"><img class="alignnone size-large wp-image-918" title="grapes" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/grapes-1024x509.jpg" alt="" width="584" height="290" /></a>

And Barbie (BCC):
<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/IMG_20121229_141006.jpg"><img class="alignnone size-large wp-image-917" title="IMG_20121229_141006" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/IMG_20121229_141006-768x1024.jpg" alt="" width="584" height="778" /></a>

Now for the nasty details. Whilst these steps are quite short and the code is very simple, it took a week of evenings cursing, hacking and googling to get everything working right.
<div></div>
<h2>Technical Nitty Gritty</h2>

<strong>UPDATE 1</strong>: Much improved code compared to the simple one below <a href="https://github.com/conoro/iracer-controllers">is now available on GitHub</a>.

The main steps in getting the code to run were as follows:
<ol>
	<li>Figure out Bluetooth on Linux using<a href="http://people.csail.mit.edu/albert/bluez-intro/x232.html">Bluez</a></li>
	<li>Figure out how to connect to car over Bluetooth using Python with<a href="http://code.google.com/p/pybluez/wiki/Documentation">PyBluez</a></li>
	<li>Sort out bad bug in Bluetooth on Debian (and therefore Ubuntu)</li>
	<li>Realise that most cheap micro Bluetooth dongles from China have duplicate MAC addresses and cannot talk to each other.</li>
	<li>Discover that Bluetooth dongle works on USB hub on Raspberry Pi at low-level but Bluetooth stack cannot see it. So connect it to one of USB ports on Raspberry Pi</li>
	<li>Discover that cheap Chinese Bluetooth dongles hang the Raspberry Pi after random amount of time</li>
	<li>Switch to using older bigger more expensive Bluetooth dongle</li>
	<li>Realise that Bluetooth dongle must be plugged in after booting Raspberry Pi in order for it to be detected</li>
	<li><em>Repeatedly curse the totally messed up implementation of USB on the Raspberry Pi</em></li>
	<li>Use a powered USB Hub to connect the MaKey MaKey and anything else like WiFi to the Raspberry Pi</li>
	<li>Figure out basic keyboard reading in Python</li>
	<li>Figure out reading keyboard in Python without carriage-return</li>
	<li>Try PyGame for keyboard reading but discover it needs a screen attached</li>
	<li>Figure out reading directly from USB with auto-repeat using<a href="http://gvalkov.github.com/python-evdev/">Evdev</a>and<a href="https://github.com/gvalkov/python-evdev">python-evdev</a>(must be run as sudo)</li>
</ol>
<h2>Installs and Tweaks</h2>
<pre><code class="language-bash">
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install python-pip python-dev build-essential
sudo apt-get install --no-install-recommends bluetooth 
sudo apt-get install bluez python-bluez bluez-hcidump
sudo pip install evdev
</code></pre>

Now you need to work around a nasty bug in Debian and Ubuntu. They have accidentally compiled in code for Nokia Series 60!

<pre><code class="language-bash">
sudo nano /etc/bluetooth/main.conf
</code></pre>

add this line to it:

<pre><code class="language-bash">
DisablePlugins = pnat
</code></pre>

Now plug in the Bluetooth dongle, power up the i-racer and run:

<pre><code class="language-bash">
hcitool dev
</code></pre>

It should detect your dongle and report its MAC address. If it does, then run:

<pre><code class="language-bash">
hcitool scan
</code></pre>

This should find the i-racer as a Dagu Car. Note its MAC address and then pair to it by running:

<pre><code class="language-bash">
bluez-simple-agent hci0 00:12:05:09:94:26
</code></pre>

where you replace 00:12:05:09:94:26 with the MAC address of your car. The PIN is either 1234 or 0000

In a Python shell, (sudo python) run the following to find out your Keyboard or MakeyMakey ID:

<pre><code class="language-python">
from evdev import InputDevice, list_devices
devices = map(InputDevice, list_devices())
for dev in devices:
 print( '%-20s %-32s %s' % (dev.fn, dev.name, dev.phys) )
</code></pre>

My MaKey MaKey comes up (with KB/Mouse/Joystick disconnected) as:

<pre><code class="language-bash">
/dev/input/event0 Unknown USB IO Board usb-bcm2708_usb-1.3.3/input2
</code></pre>
<h2>The Code</h2>
Finally run this code as sudo to control the car using the MaKey MaKey:

<pre><code class="language-python">
import sys
import select
import tty
import termios
import bluetooth
import time
from evdev import InputDevice, categorize, ecodes

if __name__ == '__main__':

 dev = InputDevice('/dev/input/event0')

 bd_addr = &quot;00:12:05:09:94:26&quot;
 port = 1
 sock = bluetooth.BluetoothSocket( bluetooth.RFCOMM )
 sock.connect((bd_addr, port))

 for event in dev.read_loop():
 if event.type == ecodes.EV_KEY:
 key_pressed = str(categorize(event))
 if 'KEY_LEFT' in key_pressed:
 # 0x5X for left forward. 0x51 very slow. 0x5F fastest
 sock.send('\x5A')
 if 'KEY_RIGHT' in key_pressed:
 # 0x6X for right forward. 0x11 very slow. 0x1F fastest
 sock.send('\x6A')
 if 'KEY_DOWN' in key_pressed:
 # 0x2X for straight backward. 0x21 very slow. 0x2F fastest
 sock.send('\x2A')
 if 'KEY_UP' in key_pressed:
 # 0x1X for straight forward. 0x11 very slow. 0x1F fastest
 sock.send('\x1A')
 if 'KEY_SPACE' in key_pressed:
 #stop
 sock.send('\x00')
</code></pre>

Note that this is extremely simple control with fixed speed just to prove the idea works. Real code will go up on GitHub when it has much more usable controls with automatic acceleration/deceleration etc and after I make it configurable with any i-Racer and with the MaKey MaKey on any USB port.
<h2>What's next?</h2>
Apart from extra sensors and new outer shells, I want to do more playing with controllers. I have an Arduino Joystick shield, Arduino Nano and serial Bluetooth breakout board coming from China. It'd be cool to make some sort of interesting custom controller case with the Arudino controlling the car. I may also get an <a href="http://arduino.cc/en/Main/ArduinoBoardEsplora">Arduino Esplora</a>.

The other really obvious one is to stick with the RPi and pair a Wiimote to it too. That could be the ultimate controller for the car.

One downside of the i-Racer is that <a href="http://www.arexx.com.cn/ch/ProductShow.asp?ID=120">Arexx</a>, the Chinese manufacturers, have not released the source-code to their Android App, only to the car software itself. Given how trivially simple the control protocol is, it should be very easy for someone to create Open Source equivalents for Android and iOS or even WP8 or BB10. I'm currently poking around inside PhoneGap's Bluetooth support (<a href="https://github.com/huseyinkozan/phonegap-bluetooth/blob/master/README_EN.md">this plugin</a>) to see if a simple cross-platform Mobile Hybrid App could be created.

If this is a success, with success being defined as Fionn remaining interested, then I'll bite the bullet and start getting the parts for one of the good Arduino robot kits out there. A good intermediate step might be the <a href="https://www.sparkfun.com/products/11012">Sparkfun Protosnap Minibot Kit</a>. After that, the sky is the limit:

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/Moon2_1434681c_1746903c.jpg"><img class="alignnone size-full wp-image-921" title="Moon2_1434681c_1746903c" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/12/Moon2_1434681c_1746903c.jpg" alt="" width="460" height="288" /></a>