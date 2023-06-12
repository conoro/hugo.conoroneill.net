+++
aliases = ["/my-2015-christmas-turkey-oven-thermometer-and-clock/","/2015/12/31/my-2015-christmas-turkey-oven-thermometer-and-clock"]
date = "2015-12-31T18:41:12Z"
draft = false
title = "My 2015 Christmas turkey oven thermometer and clock"
description = " "
slug = "my-2015-christmas-turkey-oven-thermometer-and-clock"
+++
For the [third year](http://conoroneill.net/our-first-arduino-christmas-turkey/) in a row I decided to build a new oven thermometer for the Christmas turkey, as all of the markings on our temperature knob have been gone for years. We also have one of those mechanical dial thermometers you place inside the oven but they are hard to read and get in the way. My last two attempts worked ok but I was concerned about accuracy. I also used a temperature probe in the meat for belt and braces. The setup was as follows:

* [Teensy 3.1](https://www.pjrc.com/store/teensy31.html) which has 16-bit (13-bit effective) ADCs rather than the usual Arduino 10-bit
* The same [Adafruit AD8495](https://www.adafruit.com/products/1778) thermocouple amplifier as last year
* A new long, slightly more expensive K-type thermocouple
* A [voltage-booster and battery charging module](http://www.dx.com/p/produino-5v-voltage-boost-mobile-power-module-green-1a-282899) from DX
* A dirt-cheap [ILI9341 TFT LCD](http://www.ebay.co.uk/sch/i.html?_nkw=ILI9341) from eBay
* [DS1307 Realtime Clock](http://www.dx.com/p/meeeno-ds1307-real-time-clock-brick-module-for-arduino-yellow-works-with-official-arduino-boards-213941) from DX using an [Adafruit library](https://github.com/adafruit/RTClib)
* A small 3.7V Lipo battery
* Lego, as I didn't have enough time to design a 3D-printable case and last year's cardboard was just [too klassy](https://twitter.com/conoro/status/554986388861779968)

The code is a mix of Adafruit, [Paul Stoffregen](https://github.com/PaulStoffregen/ILI9341_t3) for the improved LCD code with lovely Magenta Comic Sans Font :-) and my own.

I didn't bother with averaging the values but the jumpiness of the temperature compared to room temp or boiling water tells me our old oven is a disaster and needs replacing.

And just like the previous two years, the turkey was dry despite [spatchcocking it](http://www.seriouseats.com/2012/11/how-to-spatchcock-cook-turkey-thanksgiving-fast-easy-way-spatchcocked-slideshow.html), [dry-brining it](http://www.seriouseats.com/2014/11/quick-and-dirty-guide-to-brining-turkey-chicken-thanksgiving.html) and watching the temperature closely :-( Next year I'm doing a boned and rolled one and I've ordered a cheap but protected Chinese [oven probe](http://www.aliexpress.com/item/Generic-New-3-Meter-High-Temperature-100-1250-C-Thermocouple-K-Type-50mm-Probe-Sensors/32334218983.html) and [temperature readout](http://www.aliexpress.com/item/Brand-New-TM-902C-Black-K-Type-Digital-LCD-Temperature-Detector-Thermometer-Industrial-Thermodetector-Meter-Thermocouple/32220138975.html).

I really like the DX voltage booster. It enables you to connect a LiPo battery and a micro-USB power source. It then provides 5V on a standard USB socket. The power source can also charge the battery whilst powering the device. You can then remove the power source and the battery will power the device without interruption. It's almost perfect except for one stupid feature. You can't connect a battery to it to power a device without connecting (even momentarily) the power source (e.g. a phone charger). If it could do that then it'd be pretty much at the same level as the Adafruit boost devices. I've been unable to find any datasheets for it but ordered two more anyway. 

## Prototype
![Prototype](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/12/thermometer05.jpg)

## Completed Board
![Completed board](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/12/thermometer02.jpg)

## Lego Case
![Lego Case](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/12/thermometer03.jpg)

## Side View
![Side View](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/12/thermometer04.jpg)


# Code (latest always [on Gist here](https://gist.github.com/conoro/2875556b7477e443ae0a) )

```c++
// Temperature from AD8495 K-type Thermocoule adapter and Datetime from DS1307 RTC. Displayed on ILI9341 LCD.
//
// MIT License (MIT)
// Copyright (c) 2015 Conor O'Neill
// Portions copyright Limor Fried/Ladyada for Adafruit Industries and others
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#include <Wire.h>
#include "RTClib.h"

#include "SPI.h"
#include "Adafruit_GFX.h"
#include "ILI9341_t3.h"
#include "font_ComicSansMSBold.h"

#if defined(__SAM3X8E__)
    #undef __FlashStringHelper::F(string_literal)
    #define F(string_literal) string_literal
#endif

// These are the pins used for the UNO and Teensy
#define _sclk 13
#define _miso 12
#define _mosi 11
#define _cs 10
#define _dc 9
#define _rst 8

// Using software SPI is really not suggested, its incredibly slow
//Adafruit_ILI9340 tft = Adafruit_ILI9340(_cs, _dc, _mosi, _sclk, _rst, _miso);
// Use hardware SPI
ILI9341_t3 tft = ILI9341_t3(_cs, _dc, _rst);

RTC_DS1307 RTC;

String dateOut="";
String timeOut="";
String datePrev="";
String timePrev="";
float temperature=0;
float temperaturePrev=0;

void setup () {
    Serial.begin(57600);

    tft.begin();  
    tft.fillScreen(ILI9341_BLACK);

    Wire.begin();
    RTC.begin();

    // following line sets the RTC to the date & time this sketch was compiled
    // Uncomment this once per power down of the RTC and flash it. Then re-comment-out and reflash
    //RTC.adjust(DateTime(__DATE__, __TIME__));

  if (! RTC.isrunning()) {
    Serial.println("RTC is NOT running!");
    // following line sets the RTC to the date & time this sketch was compiled
    //RTC.adjust(DateTime(__DATE__, __TIME__));
  }

}

void loop () {

    // Read temperature as analogue voltage from AD8495
    analogReadResolution(13);  
    int raw = analogRead(A7);
    float Vout = raw * (3.3 / 8191.0);
    temperature = (Vout - 1.25)/0.005;

    // Print Temperature to Serial console
    Serial.println(temperature);

    // Get current DateTime from DS1307 RTC
    DateTime now = RTC.now();

    // Print it to Serial Console
    Serial.print(now.year(), DEC);
    Serial.print('/');
    Serial.print(now.month(), DEC);
    Serial.print('/');
    Serial.print(now.day(), DEC);
    Serial.print(' ');
    Serial.print(now.hour(), DEC);
    Serial.print(':');
    Serial.print(now.minute(), DEC);
    Serial.print(':');
    Serial.print(now.second(), DEC);

    // Generate nicely formatted datetime string for ILI9341
    dateOut="";
    timeOut="";
    if (now.hour() < 10){
        timeOut += "0";
    }
    timeOut += now.hour();
    timeOut += ':';
    if (now.minute() < 10){
        timeOut += "0";
    }
    timeOut += now.minute();
    timeOut += ':';
    if (now.second() < 10){
        timeOut += "0";
    }
    timeOut += now.second();
    Serial.println();
    if (now.day() < 10){
        dateOut += "0";
    }
    dateOut += now.day();
    dateOut += '/';
    if (now.month() < 10){
        dateOut += "0";
    }
    dateOut += now.month();
    dateOut += '/';
    dateOut += now.year();

    // Print Temperature and Datetime to ILI9341 LCD
    unsigned long start = micros();
    tft.setCursor(0, 0);
    tft.setTextColor(ILI9341_MAGENTA);
    tft.setFont(ComicSansMS_24_Bold);
    tft.println("Temperature:");

    // Wipe out previous text and write new text
    tft.setCursor(0, 45);
    tft.setTextColor(ILI9341_BLACK);
    tft.println(temperaturePrev);
    tft.setTextColor(ILI9341_MAGENTA);
    tft.println(temperature);
    temperaturePrev = temperature;

    // Wipe out previous text and write new text
    tft.setCursor(0, 100);
    tft.setTextColor(ILI9341_BLACK);
    tft.println(datePrev);
    tft.setTextColor(ILI9341_MAGENTA);
    tft.println(dateOut);
    datePrev = dateOut;

    // Wipe out previous text and write new text
    tft.setCursor(0, 145);
    tft.setTextColor(ILI9341_BLACK);
    tft.println(timePrev);
    tft.setTextColor(ILI9341_MAGENTA);
    tft.println(timeOut);
    timePrev = timeOut;

    delay(1000);
}
```
