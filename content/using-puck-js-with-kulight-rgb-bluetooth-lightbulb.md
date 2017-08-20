+++
Categories = []
Description = "You can have huge fun with the Puck.js. Here are the settings for talking to a cheap Bluetooth lightbulb"
Tags = []
draft = false
date = "2017-08-20T18:11:00+01:00"
title = "Using Puck.js with the KuLight RGB Bluetooth Lightbulb"
slug = "using-puck-js-with-kulight-rgb-bluetooth-lightbulb"
+++


I have a massive backlog of tech posts to do but I never quite finish the projects to the level I want and they are left hanging. So I'm going to start posting more WIP stuff from now on and hopefully they'll be useful to someone.

I've been a long-time fan of the [Espruino project](https://www.espruino.com) created by Gordon Willams and have had great fun with the [original board](https://www.espruino.com/Order), the [Pico](https://www.espruino.com/Order) and [Puck.js](https://www.espruino.com/Order). If you like JavaScript and you'd like to play around with hardware, you really should get your hands on one of his boards.

[Puck.js](https://www.espruino.com/Puck.js) is a tiny button-cell-battery-powered Bluetooth board. You program it using a Chrome Web App over Bluetooth (or standalone Electron-based IDE on Windows. Glares at Google) and it'll put a smile on your face every time you do. You can use it as an iBeacon or Eddystone device or as a Bluetooth button for your computer. Basically anything with Bluetooth (BLE) is up for grabs.

![Puck.js](/img/2017/08/Puck.js_board.jpg)

Gordon did a really nice [demo video](https://www.youtube.com/watch?v=LCvmmpQjnj0) of [how to control a Bluetooth lightbulb](https://www.espruino.com/Puck.js+and+Bluetooth+Lightbulbs) late last year. 

I finally ordered a [random one off eBay](http://www.ebay.co.uk/itm/332254514323) recently and decided to follow his steps. As it's a different bulb, the settings are very different. So if you find yourself with a KuLight like this, 

![KuLight](/img/2017/08/kulight.png)

which uses the [ColorfulLight App](https://play.google.com/store/apps/details?id=com.cloudlink.bleled&hl=en) on iOS/Android then these are the basic settings you need, based on Gordon's code:

```
/*
On     = 0x02, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Off    = 0x32, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Red    = 0x02, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
Orange = 0x02, 0xff, 0x9c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Yellow = 0x02, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Green  = 0x02, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Cyan   = 0x02, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Blue   = 0x02, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
Pink   = 0x02, 0xff, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

*/


function setLight(isOn) {
  var gatt;
  NRF.connect("e1:fb:c1:6b:81:6f random").then(function(g) {
    console.log("Connected");
    gatt = g;
    return gatt.getPrimaryService("8d96a001-0002-64c2-0001-9acc4838521c");
  }).then(function(service) {
    return service.getCharacteristic("8d96b002-0002-64c2-0001-9acc4838521c");
  }).then(function(characteristic) {
    if (isOn){
      return characteristic.writeValue([ 0x02, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]);
    } else {
      return characteristic.writeValue([ 0x32, 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]);
  }
  }).then(function() {
    gatt.disconnect();
    console.log("Done!");
  });
}

var on = true;
setWatch(function() {
  on = !on;
  setLight(on);
}, BTN, { repeat:true, edge:"rising", debounce:50 });


```

Note the code lacks error handling so e.g. if Mobile App is already connected, the Puck will throw an exception trying to connect. And obvs the MAC address will probably be different for your light.

More Puck.js posts coming soon!
