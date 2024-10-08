+++
aliases = ["/check-out-scratch-for-arduino-s4a-easier-electronics-for-kids/","/2013/05/19/check-out-scratch-for-arduino-s4a-easier-electronics-for-kids"]
date = "2013-05-19T18:40:00+01:00"
draft = false
title = "Check out Scratch for Arduino S4A. Easier electronics for kids"
description = ""
slug = "check-out-scratch-for-arduino-s4a-easier-electronics-for-kids"
+++

#"Check out Scratch for Arduino (S4A). Easier electronics for kids"

Whilst I'm a huge fan of the Arduinoinitiative(is "initiative"the right word?), its programming language, Wiring, is still fundamentally C with most of its power but also most of its difficulty.

C was the fifth language I learned after ZX Spectrum BASIC, Forth, Z80 assembler and Fortran (spit). I then spent the next 13 years using little else. But here I am still struggling to read a number from a sensor, add it to an ascii string, send it over a wireless link and then convert that back to a number at the far end. The wireless link bit is trivial using <a href="http://www.airspayce.com/mikem/arduino/">VirtualWire</a>, whilst the pain is all in the int/char/char */char []/String rubbish that would make most kids give up after an hour of hair pulling. And don't get me started on Null termination.

That's why I'm very positive about both <a href="http://www.modk.it/">Modkit</a> and <a href="http://seaside.citilab.eu/scratch">S4A</a>. Modkit is a pay-for in-browser Scratch-like environment and I'm impressed with it, but I'll blog about that another day. Today is about S4A which came out of a <a href="http://citilab.eu/en/citilab/what-is">Citilab team</a> in Spain. It's a modified version of Scratch that can interact with Arduino boards and electronics connected to it. I tested using an Arduino UNO and it worked perfectly.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/05/s4a.jpg"><img class="aligncenter size-large wp-image-1057" alt="s4a" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/05/s4a-1024x635.jpg" width="584" height="362" /></a>

Getting started is very easy. You <a href="http://seaside.citilab.eu/S4AFirmware15.ino">download some code</a> for the Arduino which you put on the board using the usual <a href="http://arduino.cc/en/Main/Software">Arduino IDE</a>. Then you <a href="http://seaside.citilab.eu/S4A15.exe">install S4A</a>on your PC and run it.

There are <a href="http://seaside.citilab.eu/s4a_basic_examples.zip">some basic examples</a>available to learn the core ideas.The examples all come with simple wiring diagrams which are appropriate for anyone with one of the UNO Starter Kits.

It'll be interesting to see what we can do beyond simple button+led. I'm trying out some of the servo stuff with Oisn this afternoon.