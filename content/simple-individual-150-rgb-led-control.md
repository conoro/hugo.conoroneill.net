+++
Categories = []
Description = "Controlling each LED in a 150 RGB LED strip with an Arduino Nano"
Tags = []
date = "2015-12-27T11:34:18Z"
title = "Simple Christmas Control of each LED in a 150 RGB LED WS2812 strip"

+++
One mistake I made with our [Halloween setup](http://conoroneill.net/all-the-tech-behind-our-halloween-hallway-of-horror/) was buying an analogue RGB LED strip where all the LEDs had to be set to the same colour. Then a few weeks ago, [Joe Desbonnet](https://twitter.com/joedesbonnet) Facebooked about getting a waterproof WS2812 strip with individual LED control. And it wasn't that much more expensive than the analogue one. Off to eBay I went [and ordered one](http://www.ebay.com/itm/141757617308?_trksid=p2057872.m2749.l2649&var=440868603421&ssPageName=STRK%3AMEBIDX%3AIT), far too late for Christmas.

So I was chuffed that it arrived on Christmas Eve. Unfortunately the 8 amp PSU I ordered on Aliexpress didn't arrive. A quick rustle in my psu drawer found a 4 amp one. Another quick rustle in another box found an old [Arduino Nano](https://www.arduino.cc/en/Main/ArduinoBoardNano) and it took barely 5 mins to load it up with the [Adafruit strand test code](https://github.com/adafruit/Adafruit_NeoPixel/blob/master/examples/strandtest/strandtest.ino) and wire everything together (one digital pin, gnd, 5v) to give this:


<iframe src="https://vine.co/v/iAaKnlhxXWX/embed/simple" width="600" height="600" frameborder="0"></iframe><script src="https://platform.vine.co/static/scripts/embed.js"></script>


The psu was running warm but not crazily so. However the Arduino kept crashing which hinted that the psu was dropping below 5V to power all those LEDs. So I ran separate power to the Arduino from a phone charger.

This was followed by 4km of duct tape as the connections and Arduino would have to live outside. A gale was blowing as I tried to attach it to the window frame so I switched to the more sheltered door frame. This [Mammoth tape](http://www.everbuild.co.uk/index.php?route=product/product&product_id=364) worked _really_ well:

<div>
<iframe src="https://vine.co/v/iAWEdMizFbB/embed/simple" width="600" height="600" frameborder="0"></iframe><script src="https://platform.vine.co/static/scripts/embed.js"></script>
</div>

And that was it. Almost zero effort for the best house light decoration we've ever done. Since these strips can be cut to any length you want and also spliced together, I'll be fashioning a full house-length monstrosity for next Christmas. However I doubt I'll ever reach this level:

{{< youtube 90oZ52M4IC0 >}}
