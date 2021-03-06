+++
aliases = ["/months-behind-in-my-blogging-here-are-some-tech-things-for-your-enjoyment-that-have-caught-my-eye-recently/","/2014/10/29/months-behind-in-my-blogging-here-are-some-tech-things-for-your-enjoyment-that-have-caught-my-eye-recently"]
date = "2014-10-29T11:21:21Z"
draft = false
title = "Months behind in my blogging. Here are some tech things for your enjoyment that have caught my eye recently"
description = "Once you get out of the habit of blogging it can take ages to get back in the zone. A week's vacation this week should do the trick for me."
slug = "months-behind-in-my-blogging-here-are-some-tech-things-for-your-enjoyment-that-have-caught-my-eye-recently"
+++

Once you get out of the habit of blogging it can take ages to get back in the zone. A week's vacation this week should do the trick for me. This is partially a link dump and partially the subjects of a bunch of upcoming posts.

* [Red Hat acquired FeedHenry](http://www.feedhenry.com/red-hat-to-acquire-feedhenry/). I first installed Linux in 2006 when working in San Jose and was a Red Hat user all through those early years and into the initial Fedora years. I launched a start-up on 2 CentOS servers. After a period in the Ubuntu wilderness, it feels like I'm coming home :-)

* Bought a [Printrbot Simple](http://robosavvy.com/store/product_info.php/cPath/2050/products_id/4603) - One of the cheapest 3d printers you can buy. Took me a lazy weekend to assemble. Still freaks me out that I can print plastic. Not using it as much as I'd expected as I need to up-skill in CAD first but love being able to print STL files off the web on a whim. Print quality not amazing but for €400, I can't complain. Lots more posts coming on this. I'll probably be upgrading from the fishing line to proper belts and pulleys soon.

* Bought a [DSO Nano oscilloscope](http://www.seeedstudio.com/depot/DSO-Nano-v3-p-1358.html) - When I walked out of UCD in 1992 I swore I'd never touch an oscilloscope again as long as I lived. Far too many afternoons spent doing elec labs with those horrible unusable things. Turns out they are dead handy when you can't figure something out from software! Have decided to sit down and [learn how to use it properly](https://learn.sparkfun.com/tutorials/how-to-use-an-oscilloscope).

* Bought a [Bus Pirate](http://www.seeedstudio.com/depot/Bus-Pirate-v36-universal-serial-interface-p-609.html) - This is a cool mini "logic analyser" that understands many common protocols like I2C, MIDI, SPI. I seem to spend inordinate amounts of time getting I2C and SPI working on my projects. This should finally help me figure out the nRF24L01 issues.

* Have been getting frustrated with most Arduinos being 5V whilst most modules nowadays are 3.3V. Level shifters are a pain. So I got some [3.3V 8MHz Pro Minis](http://arduino.cc/en/Main/ArduinoBoardProMini) to deal with this. Two days of grief trying to get them working with one module before I finally figured out that they cannot do 115200 serial comms reliably. Grr.

* The [ESP8266](http://www.electrodragon.com/product/esp8266-wi07c-wifi-module/) is a stunning piece of kit. It's a full Wi-Fi module and TCPIP stack on a tiny board for only $4.50. It works over a serial connection and can Wifi-enable the most basic of Arduinos. It has been a bit of a pain to get going with it since there are tons of conflicting blogposts out there about them. I'm sure the stability will improve over time as the Open Source community focuses a lot of their attention on them. One important note is that they use a lot of power and you'll struggle to power them from a pin on an Arduino. This also means that long-term battery-powered operation is a no-no.

* The [Google Cardboard clones](http://www.elecfreaks.com/store/unofficial-version-google-cardboard-p-773.html) I've been getting from China are head-wreckers. It should not be this easy to give people a sense of Oculus Rift style VR. Sure they don't compare with Oculus but it's one of the first times I've seen the kids blown away by a piece of tech. They just got it! For the sake of a tenner, you'd be silly not to try it out. The Versailles demo and Google Earth are amazing. The simple roller-coaster is less so but you need to be sitting down!

* The [Plug-up security key](https://store.kliidje.com/index.php/security-key.html) for 2 Factor Authentication is interesting. It's a cheap USB key that implements the FIDO U2F standard and gives you another way of authenticating for GMail (on Chrome only so far). I don't know if I'll keep using it but it's a damn sight quicker to use that the bloody Authenticator app on your phone. 

* I finally got a proper soldering station. From 1984-2012 I used the one from my youth. Then two years with a crappy Draper iron from a local hardware shop with some usage of the €10 Lidl one. This [Aoyue Int937](http://www.aoyue.eu/aoyue-int937-soldering-station-smd-soldering-iron-esd-safe.html) is a good quality Chinese clone of an older Hakko design. So far I'm finding it extremely good. Even the reduction in waiting time from 5mins+ to 30 secs for it to heat up makes it worth it. German supplier sent to Ireland for €65 incl delivery.

* [eFibre](http://www.eircom.net/efibreinfo/map) is now available in Old Chapel, Bandon. You have no idea how big a deal this is for me. We've been stuck on 6Mbs/384kbs for what feels like a decade. Things like backups, Dropbox, Webinars, Netflix etc etc have been torture. All our kids are intimately familiar with "buffering". Given the closeness of the VDSL cabinet, we're hoping for the full 90Mbs. Fingers crossed.

* The [Red Bear BLE Nano Kit](http://www.exp-tech.de/Shields/Wireless/Bluetooth/redbearlab-ble-nano-mk20-usb-board.html) is a superb way of getting into BLE, iBeacons etc. I'm playing around with one for the [Google Physical Web](https://github.com/google/physical-web/blob/master/documentation/getting_started.md) initiative. The idea is that every beacon just advertises a URL instead of some Apple-mandated/or-random UUID. So simple but actually quite profound. I got the kit from Exp Tech in Germany and they seem to be good value for electronics in general. €7 postage to Ireland for most things with advantage of Eurozone and speed of delivery.

* Speaking of the Red Bear kit, this is also my first experience of the ARM mbed online development studio. Wow, love it! It generates the binary and you download in the browser but the really impressive bit is that you drop the binary on the pseudo memory stick that the module presents to Windows and it auto-installs and runs the binary for you. So so so much better and slicker than the poxy USB-Serial messing on Arduino.

* I haven't been able to get the cheap [HM-10 BLE module](http://www.aliexpress.com/store/915658) to work with Google Physical Web. The [Chinese manufacturer](http://jnhuamao.cn/) sent me a one line "just do X" without explaining how, in response to my query. So I may have to give up on it and only use it as an iBeacon.

* Halloween is coming on Friday. Projects under-way. Less ambitious than before but should have some pics up on Saturday :-)

* I was disappointed that my 13 year old Mondeo uses a version of CAN bus that is incompatible with the fun [OBD-II bluetooth modules](http://www.dx.com/p/elm327-obd-bluetooth-diagnostic-interface-black-130325#.VFDV4fmsUwM) that you can get for half-nothing online. If yours is newer, you can plug it in just under your right knee. However it worked beautifully on my wife's 10 year old Zafira. You have to remove the panel underneath the handbrake. The app you use on your Android phone is called Torque. It's really impressive to see all of your engine stats appearing on your phone. I'd love to see us return to the old days where everyone was able to fix their own cars. I used to do a lot of the maintenance on my old Citroens (because, ye know, they're Citroens) but never touched the Mondeo until recently. I've replaced both the coil pack and all the brake-pads myself but I'd love to have been able to use the OBD-II to analyse the engine.

* The power of APIs - Just had a request this morning from someone who wants to make use of an API I launched in 2008. It had some updates in 2009 but hasn't been changed since then. It still works perfectly and is at the heart of a bunch of features and tooling/automation. I've been saying it for years but you should do everything API-first. You should read [API Evangelist](http://apievangelist.com/) regularly, he has this stuff nailed.


OK, I'll probably do another batch of these tomorrow. For the moment, it's time to tie together a bunch of things I've been playing with since 2012.
