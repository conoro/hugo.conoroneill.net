+++
aliases = ["/tp-link-tl-wa830re-wifi-extender-a-pile-of-junk-until-you-install-dd-wrt/","/2013/03/30/tp-link-tl-wa830re-wifi-extender-a-pile-of-junk-until-you-install-dd-wrt"]
date = "2013-03-30T16:32:02Z"
draft = false
title = "TP-Link TL-WA830RE Wifi Extender - A pile of junk until you install DD-WRT"
description = ""
slug = "tp-link-tl-wa830re-wifi-extender-a-pile-of-junk-until-you-install-dd-wrt"
+++

#"TP-Link TL-WA830RE Wifi Extender - A pile of junk until you install DD-WRT"

I use a lot of TP-Link gear for home stuff. It's as cheap as chips and the hardware is usually totally reliable. But the software, dear god the software. I cannot understand why Chinese manufacturers of cheap networking gear don't take a leaf out of the book of Chinese manufacturers of cheap phones. The latter _all_ use Android now, so why don't the former all use <a href="http://www.dd-wrt.com/">DD-WRT</a> or <a href="https://openwrt.org/">OpenWRT</a>? When free software is 10x better than anything you have built yourself, save time and effort and point all your engineers at improving DD-WRT instead of your own crappy code.

Some of the walls in my parents house are 3ft thick so Wifi is a "challenge". My Mum finally joined the world of computers and the internet last year when she got an iPad. The problem is that the main router is in one room whilst she likes to use the iPad in the kitchen. And those walls get in the way.

We tried using a setup with TP-Link Powerline adapters and a DD-WRT-hacked FON rotuer in the kitchen but the house wiring is so old it was totally unreliable. At the start of the year, they got someone in to move the phone wiring closer to the kitchen so the router would be visible. And this just about works but the signal is very weak still.

I have previously had some success with using WDS to connect routers together over Wifi on an XBox-1 but it was a nightmare to configure and I'm trying to do all the setup for the parents remotely.

Given that they are using a TP-Link W8961ND with stock firmware as their main router, I thought it would make sense to go for an out-of-the-box solution and use a TL-WA830RE Range Extender. They are both made by the same company and I believed their claim that a simple push of the QSS button on both would "just work", so I got one on <a href="http://www.amazon.co.uk/TP-Link-TL-WA830RE-300Mbps-Wireless-Extender/dp/B006BBYXPA">Amazon</a> (Note they are now selling the V2 which is different). The reviews mostly seemed positive too.

I have a W8961ND as a backup here too. So the plan was to set it up identically to the parents one, then configure the Range Extender with it and then they should be able to just plug it in when I give it to them at Easter.

But no. Zero success getting them to talk to each other. Automatic methods didn't work and manual methods seem to involve MAC addresses so that means whilst I might get it working here, it would then fail for the parents.

Grrr. So I did my usual trick. I headed over to <a href="http://www.dd-wrt.com/">DD-WRT</a> to see if there is a version for it. There isn't but <a href="http://www.dd-wrt.com/phpBB2/viewtopic.php?p=695273">there is for a similar model</a> and the forums said it worked fine. It did.

I then followed the simple instructions <a href="http://www.dd-wrt.com/wiki/index.php/Repeater_Bridge#Atheros">here</a> and <a href="http://www.dd-wrt.com/wiki/index.php/Repeater_Bridge">here</a> to make it a client bridge and 10 minutes later I had extended the wireless from one end of our house to the other using the same SSID.

Now to see if it works for the parents :-)

