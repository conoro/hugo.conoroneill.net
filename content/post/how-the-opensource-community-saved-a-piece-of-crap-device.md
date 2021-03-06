+++
aliases = ["/how-the-opensource-community-saved-a-piece-of-crap-device/","/2010/12/20/how-the-opensource-community-saved-a-piece-of-crap-device"]
date = "2010-12-20T10:22:00Z"
draft = false
title = "How the OpenSource Community Saved a Piece of Crap Device"
description = ""
slug = "how-the-opensource-community-saved-a-piece-of-crap-device"
+++

#"How the OpenSource Community Saved a Piece of Crap Device"


 <p>Until my recent falling out with DealExtreme over their refusal to refund me for a returned item, I spent a lot of money on their site buying various gadgets and gizmos. The trick is to buy really cheap things so that if they break or aren't quite what you wanted, you can bin them or try and use them for something else. Hence I would buy replacement NDS parts, pens, USB cables etc.</p>
<p>This year I bought a few more expensive ($25+) items and most of them have been a disappointment. My falling out with them was over an MSI Bluetooth transmitter which decided to mess-up the entire raison d'etre of Bluetooth by only working with other MSI devices!</p>
<p>The biggest let-down was a device that enables many USB devices to connect to a lan. They called it a "<a href="http://www.dealextreme.com/details.dx/sku.20382">LAN-Storage UPNP USB/HDD/NAS/Scanner/Printer/Webcam Sharing Network LAN Server</a>" and it cost $38. Its model name is the WLXKJ<span style="font-family: arial, sans-serif;">652.&nbsp;</span>So it has two USB ports and a LAN port. You can (in theory!) connect hard drives, printers, scanners etc and all can then be accessed over a network. The storage bit, in particular, looked really impressive. You can connect 2 USB HDDs (FAT32 or NTFS) and share them out both as network drives or UPnP shares. It's a mini-NAS basically. I loved the idea of it and had lots of plans involving hacked FONs and Nokia N770 tablets in a car.</p>
<p><div class='p_embed p_image_embed'>
<a href="http://getfile2.posterous.com/getfile/files.posterous.com/temp-2010-12-20/mjxJAwkyxBCjDbhlzzJoBikspwAwDoiaJlwGGFlJdlAtisagIqAlJIcGmfeA/PoC1.jpg.scaled1000.jpg"><img alt="Poc1" height="286" src="http://getfile8.posterous.com/getfile/files.posterous.com/temp-2010-12-20/mjxJAwkyxBCjDbhlzzJoBikspwAwDoiaJlwGGFlJdlAtisagIqAlJIcGmfeA/PoC1.jpg.scaled500.jpg" width="500" /></a>
</div>
</p>
<p>The reality was a lot less impressive. It's basically single-tasking and freezes up if you look at it crooked. It also runs crazily hot. No matter what I tried to do with it, it screwed up. The forums on DealExtreme confirmed I wasn't the only one.</p>
<p>So in the back of the drawer it has laid for nearly a year, until yesterday.</p>
<p>I was trying to figure out a way of giving my most recently hacked XBOX access to media without [a] installing a big internal HDD or [b] needing a wired LAN. The idea is to set the XBOX up in the parents' house so that any of the grandchildren could play ripped movies and tv shows. It was given to me by my brother-in-law to convert during the summer but I only finally got around to it now.</p>
<p>In the past I did this with a cheap EDIMAX wireless router from Dabs. I configured it to use WDS to the main router. So it plugged into the XBOX and then the XBOX seamlessly used it to connect to main router and the media shares in the house. It actually works really well. However it is a pig to configure and I wanted something more flexible.</p>
<p>A similar solution, which I tried yesterday, is to use a hacked FON router running DD-WRT in Client Bridge Mode. Here the router effectively acts as a wireless dongle to the XBOX. The theory seems solid but I couldn't get it working.</p>
<p>So I decided to give the Piece of Crap (PoC) another go. I very quickly ran into all the same problems. Lock-ups, disappearing off the network etc. Even worse, when it did work, the throughput on an NTFS HDD was so slow, the XBOX gave up.</p>
<p>The setup is really simple: Connect the PoC via lan cable to XBOX. Plug in USB HDD to PoC. Access USB HDD from XBOX as if it's a network device. I was ready to give up in frustration but decided to do a bit more googling.</p>
<p>And then I found it: <a href="http://code.google.com/p/snake-os/">SNAKE - Star NAS Altered Killer Edition</a>. A community-built mini stripped down version of Linux designed to run on the Star series of SoCs. As a guy with many years embedded experience I'm embarassed to admit that it never struck me there was a SoC+RAM+ROM inside the wee box. The Star STR<span style="font-family: arial, sans-serif;">8132 (aka&nbsp;</span><span style="font-family: arial, sans-serif; line-height: 15px; font-size: small;"><a href="http://www.caviumnetworks.com/ECONA_CNS2XXX.html">Cavium CNS2132</a></span><span style="font-family: arial, sans-serif;">) is pretty bloody impressive. It's a 250MHz ARM CPU with on-chip Ethernet and USB.</span></p>
<p><span style="font-family: arial, sans-serif;">Installing SNAKE was as easy as downloading the image and using the web-upgrade feature built into the box. Took about 3 minutes. And now I'm a very happy camper indeed. I setup a generic share for one of the USB ports and configured the lan settings. And it just works. Perfectly. Reliably. Quickly!</span></p>
<p><span style="font-family: arial, sans-serif;">The only feature which seems to be missing is UPnP. But it appears to be easy enough to extend this software so I'll look at that soon.</span></p>
<p><span style="font-family: arial, sans-serif;">So whilst I don't recommend buying one of these devices, if you have one, you now have something usable.</span></p>
<p><span style="font-family: arial, sans-serif;">The really neat bit about this setup is that anyone with a USB thumbdrive or USB HDD can come along, plug it into the PoC and the XBOX will be able to access it without any re-configuring. The technically challenged in our family will love this. And since the XBOX itself has a DVD player, it really is a perfect (non-h264) media player.</span></p>
<p><span style="font-family: arial, sans-serif;"><span>Last year I predicted that a glut of cheap phones would come out of China, all running Android. Chinese manufacturers seem to be ingenious at creating cheap silicon and hardware but truly awful at software. So if they used Android, that's a big problem solved. For the same reason, I wish all those Chinese companies building really smart hardware like the PoC would switch to Linux too. Then they can work with the OSS community to build some seriously kick-ass products.</span></span></p>

 