+++
aliases = ["/adding-a-realtime-clock-to-the-raspberry-pi-and-the-sweetbox-ii/","/2013/11/03/adding-a-realtime-clock-to-the-raspberry-pi-and-the-sweetbox-ii"]
date = "2013-11-03T17:33:32Z"
draft = false
title = "Adding a realtime clock to the Raspberry Pi and the Sweetbox II"
description = ""
slug = "adding-a-realtime-clock-to-the-raspberry-pi-and-the-sweetbox-ii"
+++

#"Adding a realtime clock to the Raspberry Pi and the Sweetbox II"

I got one of these <a href="http://dx.com/p/meeeno-ds1307-real-time-clock-brick-module-for-arduino-yellow-works-with-official-arduino-boards-213941">$3 RTC modules</a>a few months back and I finally set it up this weekend. It simply has a battery-backed clock so when your Raspberry Pi (or Arduino) boots up, it has the correct time immediately. For a network-connected Pi, it's not really necessary as you can have the time updated regularly via NTP but not all Pis spend their life connected to the network. So if you are working away locally on your Pi, your files will no longer look like they were all created in 1970. This <a href="http://learn.adafruit.com/adding-a-real-time-clock-to-raspberry-pi/overview">Adafruit tutorial</a> explains exactly how to do it. You could even get <a href="http://www.adafruit.com/products/264">their RTC module</a> instead.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/rtc1.jpg"><img class="aligncenter size-full wp-image-1199" alt="rtc1" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/rtc1.jpg" width="1024" height="768" /></a>

On a totally unrelated note, I finally got my <a href="http://www.kickstarter.com/projects/677951563/sweetbox-ii-the-perfect-case-for-your-raspberry-pi/">Sweetbox II</a> case for the Raspberry Pi which I backed on Kickstarter. It's a minimalist low-profile case that comes with cute heatsinks and a cut-out for the header pins. I'm not a huge fan of the semi-translucent look of the plastic but I do love how little space it takes up. And unlike many cases, you don't have to take it apart to plug/unplug the ribbon cable. And finally, it's nice to have more good tech coming out of Greece.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/rtc2.jpg"><img class="aligncenter size-full wp-image-1200" alt="rtc2" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/11/rtc2.jpg" width="1024" height="768" /></a>