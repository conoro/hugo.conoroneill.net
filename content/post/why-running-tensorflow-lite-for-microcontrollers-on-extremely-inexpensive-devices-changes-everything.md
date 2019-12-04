+++
date = "2019-12-04T07:00:00+00:00"
draft = false
title = "Why running TensorFlow Lite Micro on very inexpensive devices changes everything"
description = "Most people missed the buried lede about TensorFlow Lite Micro on Bangle.js so I thought I'd lay it out more clearly."
slug = "why-running-tensorflow-lite-for-microcontrollers-on-extremely-inexpensive-devices-changes-everything"
+++

When [NearForm Research](https://www.nearform.com/research/) announced [Bangle.js](https://www.nearform.com/blog?_sf_s=bangle.js) at [NodeConf EU](https://www.nodeconf.eu/) with Gordon Williams from [Espruino](https://espruino.com), we highlighted the uniqueness of having an inexpensive off-the-shelf Chinese smartwatch running both JavaScript and Google's [TensorFlow Lite for Microcontrollers](https://www.tensorflow.org/lite/microcontrollers).

Whilst hardcore technology people got the implications of this, most people didn't. You can now run Machine Learning models directly on the $5 chip inside a watch and do all of the interaction inside a web browser. If you can't wait until Bangle.js is available in March 2020 to try it out, Gordon has gone one better and [emulated the watch](https://www.espruino.com/ide/emulator.html?codeurl=https://banglejs.com/apps/apps/flappy/app.js&upload) using Emscripten. So you can run everything inside the browser! 


![Flappy Bird Emulation](/images/2019/12/emulator1.jpg)


And "everything" means you can run the Espruino port of TF Lite Micro in the emulator too. [Here is](https://www.espruino.com/ide/emulator.html?gist=c0404a867b3531527428a1843c5fd5fc&upload) the "Hello World" sine wave example from the [TensorFlow repo](https://github.com/tensorflow/tensorflow/tree/master/tensorflow/lite/experimental/micro/examples/hello_world) running inside Chrome.

![TF Lite Micro Emulation](/images/2019/12/emulator2.jpg)


## The Learning ML Stack
This  isn't just cool geekiness, it means that anyone can get involved in Machine Learning on inexpensive devices without having to learn about cross-compilers, Python distributions, USB-Serial adapters or GPUs. It has hugely reduced the on-boarding friction. More importantly, this is something any educational establishment could embrace. The following could be the de-facto standard setup for learning (literally) hands-on ML in high-school or even younger:

* Chromebooks running Web Bluetooth in Chrome
* [Google Colab](https://colab.research.google.com/)
* WebApps with [TensorFlow.js](https://www.tensorflow.org/js) 
* [Espruino IDE](https://espruino.com/ide)
* [Blockly](https://developers.google.com/blockly) ML blocks for Espruino
* [Bangle.js](https://banglejs.com)

I'm convinced tanglible/tactile ML like this will engage people for far longer than "yes you're right, it's a cat".

## ML Everywhere in 2020-2021
Back to our $5 NRF52832 chip. It's a fabulous SoC, which is why we've used it for 3 NodeConf EU's in a row. But it's still pretty pricey. And it only does Bluetooth (plus Thread with the right SDK).

If power consumption isn't an issue, how about $2.45 for [an ESP32 chip with Wifi and Bluetooth](https://www2.mouser.com/ProductDetail/Espressif-Systems/ESP32-S0WD?qs=sGAEpiMZZMve4%2FbfQkoj%252BEaa%252BXdRvdmbR%2FQ7UMJWB9I%3D)? Or [an ESP8285 for $1.05](https://www2.mouser.com/ProductDetail/Espressif-Systems/ESP8285H16?qs=sGAEpiMZZMsG1k5vdNM%2Fc8yNQq7qgKEx8g19WW57dfQ%3D) (a buck!) with just Wifi? 

The ESP8285 can already run TensorFlow Lite for Microcontrollers. This means you can add Wifi and Machine Learning to *any* piece of consumer electronics for ~$1.50. 

The ESP8266 family itself transformed inexpensive Chinese electronics like lightbulbs and home automation devices in recent years. What could the addition of ML everywhere do? Why wouldn't you just add one to the BOM and easily get better reliability, potential data feedback, failure mode discovery, optimisation for environment and everything else that ML can offer? Could manufacturing become cheaper as tolerances are loosened during manufacture but dealt with by ML during device operation?

*That's how profound TensorFlow Lite for Microcontrollers is. Everything changes and this time it starts from the bottom up.*

And it doesn't have to be multi-hundred dollar Nests. Sonoff already has the ESP8266 in their [$16 lightbulb](https://www.aliexpress.com/item/32824271928.html) which means they can add ML for free. So there is your retail price point for mainstream ML in consumer electronics in 2019, $16. Here's that TF Lite Micro Hello World again, running on my lightbulb:

![TF Lite Sonoff](/images/2019/12/sonoff2.jpg)

![TF Lite Sonoff Arduino](/images/2019/12/sonoff1.jpg)


