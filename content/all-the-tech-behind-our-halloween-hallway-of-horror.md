+++
Categories = []
Description = "This year's Halloween brought to you by 3x Arduino, 1x Banana Pi, 1x ESP8266 and some Adafruit modules"
Tags = []
date = "2015-11-03T08:22:29Z"
title = "All the tech behind our Halloween Hallway of Horror"

+++
Despite starting weeks earlier than usual, Halloween still involved a day of last minute panic to bring everything together. The end result was this:

![Alt text](/path/to/img.jpg)

The basic setup was an update of ideas from previous years and consisted of the following.

## 3D-printed Mummy in Coffin Doorbell
This was my favourite aspect of the whole thing. I spotted a cool 3D design on Thingiverse and realised I could turn it into a doorbell by dremeling a hole in the back and hot-glueing the mummy to a simple push button. In fact the button was one I originally bought in 2012 when I got back into electronics. There was a small bug in my debounce code which I discovered too late and meant that kids had to press the button twice. But overall only a few failed to figure it out.

![Alt text](/path/to/img.jpg)

## Adafruit Audio breakout board and amp with speakers
I had intended everything to be Arduino and ESP8266 (running Arduino code) only so I needed some way of playing the scream. In previous years I used a Raspberry Pi (successfully) and a really crappy device (less successfully). In a bizarre twist to the BE Maker Kit Indiegogo scam, one of the people involved somehow got a Florida company to provide free electronics to the right amount. I used this to buy the Adafruit VS and Adafruit Audio Amp. The wiring on this looks complicated but it's straight out of their tutorial. Audio courtesy of youtube-dl and WinFF on [this clip from YouTube]().

The Arduino Nano for this was the "Master" device. It detected the doorbell press and then started playing the file on the SD card and sent a high signal both to the Banana Pi for the LED strip and the Arduino Uno for the relays controlling the skull.

## Wifi Controlled RGB LED Strip

## Banana Pi controlling the LED Strip

## Rotating anatomically correct skull

### Ping pong eyeballs with Neopixel RGB LEDs

### Cheap electric screwdriver controlled by Arduino Nano and 2x relays
