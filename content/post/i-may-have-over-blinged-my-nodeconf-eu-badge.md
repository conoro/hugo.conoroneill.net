+++
Categories = []
Description = "It started as just a *small* battery upgrade and then spiralled out of control"
Tags = ["espruino", "nodeconfeu", "puckjs", "javascript", "lifepo4"]
draft = false
date = "2018-01-01T12:00:00+00:00"
title = "I may have over-blinged my NodeConf EU badge"
slug = "i-may-have-over-blinged-my-nodeconf-eu-badge"
+++

If you attended [NodeConf EU](http://www.nodeconf.eu/) 2017 in Kilkenny, Ireland, you'll know all about the digital badge powered by [Espruino](https://www.espruino.com/) that we created with Gordon Williams. You can read more about it on the [nearForm blog](https://www.nearform.com/blog/say-hello-to-the-nodeconf-eu-hackable-badge/) and check out the [docs site](https://nodeconfeubadge.org/).

I hope you've continued to learn about Espruino and the power of JavaScript on tiny microcontrollers. Don't forget it's entirely Open Source Software and Hardware. Our [Github repo is here](https://github.com/nearform/nceubadge).

I've been having lots of fun with LEDs, NeoPixel rings, BLE and general messing.

![Prototype Badge](/img/2018/01/nceubadge_bling_1.jpg)

Of course if you use NeoPixels you're going to burn through that CR2032 battery pretty damn quickly. Like really really quickly :-) My first attempt to solve this, which worked well, was to use various sizes of LiPo batteries connected to the power pins via an LD1117 voltage regulator. I had some full size regulators sitting around but they took up too much room. So I ordered some SMT ones and they were just as good. Note you should _not_ connect a LiPo directly to the power pins. Fully charged they get to 4.2 volts which will probably kill the microcontroller.

Gordon mentioned the LiFePO4 batteries to us as an alternative. I'd read a bit about them previously but hadn't realised their multiple benefits: [1] They can't catch fire! [2] They max at 3.2V so can be connected directly to 3.3V electronics and [3] They come in the same sizes as many LiPos like 18650.

The downsides are [1] You need [special chargers](https://www.gearbest.com/chargers-batteries/pp_56674.html) (not too expensive) and [2] They have lower capacity than the same-sized LiPo.

You can see the ridiculously overesized one on the badge here. I'll be [buying more](https://www.gearbest.com/batteries-and-cases/pp_1113456.html).

![Prototype Badge](/img/2018/01/nceubadge_bling_2.jpg)

Other mods include an on-off switch, a buzzer, a loudspeaker and various LEDs on the front (no NeoPixels in the picture, I'm awaiting on a big ring of them).

The buzzer is a little weak so I'll order something bigger. I'm running it directly off an IO pin which is probably a terrible idea. I'll wire it to a transistor at some point.

The loudspeaker was a replacement for the disc ones we provided at NodeConf EU. TBH those discs were pretty rubbish. Gordon did a great job figuring out how to [double the voltage swing](https://nodeconfeubadge.org/workshop/sound/) to increase the volume but they were still pretty quiet. These green ones are much much louder and very usable.

I had ordered some microphone modules for the event but the arrived afterwards. It turns out they were useless. They only trigger on/off for loud sounds. So avoid [these](https://www.ebay.ie/sch/i.html?_nkw=Microphone+Sensor+AVR+PIC&_sacat=0) if you are searching on eBay. I've ordered some alternatives to see if they are better.

Another small fail was my order of some generic PIR detectors which I couldn't get working well. It turns out they needed 5V not 3.3V. I'm waiting on some 3.3V modules to see if they behave or not.

So have any of you been hacking your badges or writing interesting software for it?
