+++
aliases = ["/what-excited-conor-in-tech-in-2015/","/2015/12/31/what-excited-conor-in-tech-in-2015"]
date = "2015-12-31T21:20:12Z"
draft = false
title = "What excited Conor in tech in 2015?"
description = " "
slug = "what-excited-conor-in-tech-in-2015"
+++

A completely random braindump of stuff that got my juices flowing this year.

# ESP8266 $1 Wifi modules
I've talked about [the ESP8266](http://espressif.com/en/products/esp8266/) constantly all year. A price-point of ~$1 in volume means that you can wifi-enable anything. Where previously you might have used one of the many low bandwidth "IoT" protocols internally and connected them to hub-device, now you can do Wifi and IP end-to-end. The only downside is high power consumption. I'd actually prefer if they did a low-power V2 instead of the bells-and-whistles ESP32.

The number of projects and initiatives that have grown up around ESP8266 is impossible to keep track of. Ones to check out are:

* [NodeMCU](http://nodemcu.com/index_en.html) - A really nice [dev board](http://www.electrodragon.com/product/nodemcu-lua-amica-r2-esp8266-wifi-board/) and Lua-based stack. This is what I used for most of this year but will be switching to [Espruino](http://www.espruino.com/)
* [Espruino on ESP8266](https://github.com/tve/EspruinoDocs/blob/master/boards/EspruinoESP8266.md) - Still in heavy development but feels like a complete winner. JavaScript + Wifi for $4 is a killer solution.
* [Cesanta Smart.js](https://blog.cesanta.com/esp8266-and-iot-smartjs-starter-guide) - A Dublin-based company. Ex-Googlers I think. Similar to Espruino but without the community. Wish they'd join forces instead.
* [Arduino](https://github.com/esp8266/Arduino/) - Yup, you can run a huge amount of Arduino code straight on the ESP8266. Really exciting to have this. Only drawback is that native AVR code and (I think) interrupt-driven code will not compile. Also far fewer IOs than normal Arduinos.

# Raspberry Pi Zero and The Mag Pi Issue 40
A [$5 computer](https://www.raspberrypi.org/blog/raspberry-pi-zero/) that came free on the front of a magazine. Very little else needs to be said here. $5 for 1GHz, 512MB RAM, 1080p HDMI, Linux, Mathematica, Node-Red, Kodi and anything else you want to try. I still get the shivers thinking about it. Meanwhile the never-satisfieds will whine about $1 adapters or the fact that it needs electricity. I'm framing my first one.

![PiZero](https://s3-eu-west-1.amazonaws.com/conoroneill.net/wp-content/uploads/2015/12/raspberry-pi-zero-_3510859b.jpg)

# Let's Encrypt
Anyone who has had to go through the rigmarole of setting up a https server knows what a pain it is. The certs are generally completely overpriced too. [Let's Encrypt](https://letsencrypt.org/) Certs are free and full automation is already available for Apache, NGINX, Caddy and more. Now you basically have no reason not to use https.

This is a massive industry segment disruption. I'm thrilled to see it happen.

# Security First and Privacy First
I use uBlock Origin, Pop-up Blocker, Do Not Track and Ghostery on all my browsers. A lot of the time I use [BlackVPN](https://www.blackvpn.com/) too. Yet somehow, with my anti-business setup, many many companies received online orders and money from me this Christmas. I'm done with the online advertising industry. All the stuff Doc Searls has been talking about for years is still valid. As for governments thinking our online activities are their business, you need to start fighting back now.

# Google Cardboard and YouTube 360
Somehow I completely missed the launch of Cardboard support in YouTube and the creation of 360 videos by an ever growing set of people. The first one I saw was [Colin Furze](https://www.youtube.com/watch?v=QnYncJdEh64) and it's just incredible. The [second](https://www.youtube.com/watch?v=f-7qq8n2iqw) was one based on Star Wars The Force Awakens, and is 100x better than the movie. I went and got a much more [high quality plastic](http://eud.dx.com/product/844380189) "Cardboard" as a result. It's excellent. The recently launched [Google Cardboard Camera](https://play.google.com/store/apps/details?id=com.google.vr.cyclops) is also superb but images are sadly locked to the device the panoramic photo was taken on.

This is one overall technology-set that myself and the kids are 100% in agreement on. It rocks. The next Star Wars movie should be launched on Cardboard (or Oculus or whatevs).

# Node.js 4.x
Phew. The schism has been healed and 4.x is a really great release. Initially I had lots of problems with native modules on Windows which I hope are finally starting to settle down now. Node is still the best choice for a huge range of workloads and cannot be beaten for mobile back-ends.

# Embedded JavaScript
I think JavaScript will completely take over the Embedded world where hard realtime is not required. The [Espruino project](http://www.espruino.com/) has shown what is possible here and should be much more widely used. I'm looking forward to seeing it running on the BBC's micro:bit. Other projects like [Cylon.js](http://cylonjs.com/) are also worth a look.

# Go/Golang
I'll be honest, C has been the only language I really loved working in. I like Python and I really enjoy the productivity of Node.js but C was what I spent most of my real programming years using. C++ is an abomination and Java always feels like a crazy amount of work to eventually run some bloated barely-portable thing.

And then I found [Go](http://golang.org) and immediately felt comfortable. It's C with the sharp edges removed and some really useful stuff added. Static compilation is the killer feature for me. Just drop the very-quickly-compiled binary in anywhere and run it. I'm using it more and more for small projects that aren't backing a webapp or mobile app. It could work in both those cases too but it just doesn't have the community in that area the way Node.js has.

I think Node.js and Go will dominate software development over the next few years.

Left-field: Go is slowly getting some Android capabilities. Google should go all-in on it and replace Java. If Apple can manage it so well with the move to Swift on iOS (and they used 3 CPU architectures on Mac!), why not? It would kill all the Oracle problems completely and move them away from a legacy language.

# Scriptcraft & Minecraft
Minecraft continues to dominate my younger kids' lives. From Stampy to Servers, they are never bored playing it or watching videos about it. My buddy Walter built the amazing [Scriptcraft](http://scriptcraftjs.org/) which enables you to build mods and control Minecraft in, yes you guessed it, JavaScript. [His book](http://www.peachpit.com/store/beginners-guide-to-writing-minecraft-plugins-in-javascript-9780133930146) is a must-read for anyone looking for an interesting way to teach kids how to program. I really want to try out some stuff where it interfaces with the real world. I think Microsoft are missing a trick by not rowing in behind Walter and this wonderful project.

It's also a huge pity to watch Lego completely miss the boat here and continue to sell the crazily overpriced and overspecced Mindstorms. There is a sweetspot to be found in an online-world + real-world + electronics + JavaScript and it ain't Lego bleedin Dimensions.

# Particle Photon
I was given a [Particle Photon](https://www.particle.io/) recently and was blown away by how easy the setup was and how slickly the Cloud IDE works even through firewalls and NAT. Despite the Open Source nature of it, I still worry about lock-in to some degree. Having said that, my [DigiStump Oak](https://www.kickstarter.com/projects/digistump/oak-by-digistump-wi-fi-for-all-things-arduino-comp) just shipped (ESP8266 again!) and it it now Particle API compatible. I'd love to see some sort of multi-vendor federated distributed Particle clouds where you aren't betting your IoT strategy on the financial stability of one startup.

# React Native
Use JavaScript to [build Native Apps on iOS and Android](https://facebook.github.io/react-native/). What's not to like? Weird how I hate Facebook the site/app but love so much of their Engineering.

# RGB LEDs / Neopixels
Ridiculous amount of fun with simple individually controllable RGB LEDs. These are going to be everywhere in 2016. Everywhere.

# 3D Printing
I still adore my [Printrbot Simple Maker's Edition](https://printrbot.dozuki.com/Guide/Assembling+the+NEW+Printrbot+Simple+Maker's+Kit/123). I continue to be surprised by the quality of prints from such a cheap printer. I've had some fun with Ninjaflex and unusual colours this year. Also a multitude of #PiZero cases! If funds permit, I'll probably start looking at one of the [Prusa i3 variants](http://www.bq.com/es/prusa) to get a bigger print area but otherwise it does everything I need.

# eFibre by Eir
We get 92Mbs down, 19Mbs up. It's completely changed how we use the internet. Bravo Eir(com). Genuinely surpassed all expectations. Getting speeds like that on a poxy twisted pair is staggering.

But let's be absolutely clear about broadband in this country, the Government's latest target of 30Mbs for everyone is a joke. By the time it's done, it'll be completely out of date. Why can these people not understand that ultra-fast broadband everywhere will do more for employment in this country than anything else. They'd be heroes in history for doing this right, not remembered as a bunch of clowns who couldn't properly roll out a water quango and postcode quango.

# Statically hosted Blogs
It feels like every day there is another WordPress security scare. And that's without mentioning the plugin ecosystem horror. I got sick of the upgrade cycle treadmill and constant exploits last year and moved everything to statically hosted blogs. First with [Harp.js](http://harpjs.com/), then with [Hexo](https://hexo.io/) and now with [Hugo](https://gohugo.io/). All fine tools, all work well with GitHub Pages and OpenShift. The incredible speed of Hugo is what makes it my current favourite. Edit, build, deploy, fuggedaboudit. I will never go back to a traditional DB-backed CMS.

# Dirt-cheap Android phones and tablets
I got a [Doogee X5 Android phone for €55](http://www.dx.com/p/presale-doogee-x5-quad-core-android-5-1-wcdma-bar-phone-w-5-0-ips-hd-8gb-rom-gps-xender-black-400551) a few weeks ago as a backup device. Apart from the case being a bit plasticky, it could pass for €200 worth. It has a great screen and surprising speed. 2 SIM slots and an SD card slot. Samsung could learn a lot from Doogee.

One of my daughters got the lowest-level Kindle Fire as a Christmas present. The specs are garbage. She loves it. It does absolutely everything she needs and she hasn't asked to use the iPad Mini once since she got it.

I seriously doubt I'll ever buy a premium phone on contract again. Once One Plus return to removable backs, replaceable batteries and SD card slots, I'll jump to either them or the Wileyfox. Apart from the camera, there is practically nothing on my Galaxy S6 that I couldn't do with an S4 or HTC Sensation. And they are both more robust and have replaceable batteries and SD card slots.

# Linux everywhere
Everywhere. This makes me happy. I was very surprised my other daughter was more than happy to get an old hand-me-down laptop running Fedora 23. As long as it had Chrome, YouTube, Kodi and Minecraft she didn't give a damn what the OS was. The OS is irrelevant to all my kids. In our house we segue seamlessly from Android to iOS to Windows to OSX to Fedora to Raspbian. The only things that matter are the apps and the content.

# Messaging Apps
Our entire extended family is on WhatsApp including grandparents. SMS is dead to us. MMS was never a thing. I'd prefer if we were all using an Open Source secure P2P system but we'll get there. The family breakdown is as follows:

* Adults: WhatsApp. Tiny amount of FB Messenger
* Teens: FB Messenger, some Viber and some WhatsApp to the (grand)parents
* Tweens/Smallies: Viber, Snapchat and some WhatsApp to the (grand)parents
* Youngest: Uses Hangouts to her cousin. Including live video!
* No one: Telegram.
* Curveball - Tweens using Instagram comments as a weird chat channel

Top tip - WhatsApp needs a phone number, Viber doesn't. Many many smaller kids have tablets, not phones. WhatsApp really missing out here. Our solution is to put free Tesco Mobile SIMs in old phones and never put credit on them. Gets over the WhatsApp problem.

9yo yesterday: "What's 'Messaging' on my iPhone". Me: "It's SMS". Her: "What's that". Me: "Texts". Her: "Ah ok. Why are there so many apps for messaging? Why not just one?"

# 2FA and Authy
Two Factor Authentication is a complete pain in the neck. It really is.

Turn it on everywhere now. Do it. Do it now.

The fact that PayPal still doesn't have it is a complete disgrace. I'd strongly recommend using [Authy](https://www.authy.com/) instead of the Google Authenticator App. The main reason is that you can install Authy on multiple phones/tablets which you cannot do with Authenticator. They also have a Chrome extension.

# Things that continue to disappoint
* Twitter - Useless Web App and Mobile App. Still hostile to developers who make better ones. And still no Filters, in 2015!
* Facebook - Uninstalled the mobile Apps. A hand-crafted List is the only way to put it under your control. Impossible to use FB for realtime events. Ugh.
* Google - Local Search and Reviews remain a complete embarrassment. Have them AdBlocked and Ghostery-ed. Maps degenerating. Photos great tho!
* Google Compute Cloud - Awful. Amateur hour. Avoid. Particularly the MySQL service.
* Mobile device form factors - Nothing new since 2007. Bored to death of glass slabs.
* Mobile device usability - I'll still use a desktop for anything other than quick glance. Everything feels slow and awkward. Android and iOS
* Batteries - Hurry up already. The only excitement here seems to be exploding LiPos
* AMD CPUs - RIP AMD. After decades of building PCs with AMD CPUs, I got my first i7 in December. It's over AMD, give up.
* Emojis - All those emojis but they never have the one I want.
* Blockchain - Hype machine in overdrive far too soon. Show me something a kid can understand in 30 seconds and delivers immediate benefit. Everything I've tried has been a giant pain in the arse including Identity, Money, DNS and Messaging.
