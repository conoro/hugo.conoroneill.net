+++
date = "2021-09-20T03:00:22Z"
draft = false
title = "Using Low Code for Home IoT Automation"
description = "Once I realised that Low Code could be used to automate anything, I let my imagination take over"
slug = "using-low-code-for-home-iot-automation"
+++

As long-time readers of my blog(s) know, I come from an Embedded Systems background and still love to play with home electronics and IoT. And of course, since last year I've been noodling around with CO2 monitors and other environmental sensors because of you-know-what.

So I decided to see if I could connect my sensor setup to Low Code platforms like Node-RED, parse the values, persist them and alert me somehow if CO2 in particular got too high. I was stunned how easy it was.

I received some requests to share the details of my setup, hence this blogpost. It is very straightforward.

## The IOT Hardware and Software
The hardware setup is fairly basic. I've found that every CO2 sensor gives different results (sometimes wildly) so I wired up three of them along with a pressure/temperature one to track and compare. They are:

* [Pimoroni SGP30](https://shop.pimoroni.com/products/sgp30-air-quality-sensor-breakout) for eCO2 and TVOC
* [Adafruit BME680](https://shop.pimoroni.com/products/adafruit-bme680-temperature-humidity-pressure-and-gas-sensor-stemma-qt) for Temperature, Pressure, Humidity, Gas, Approx. Altitude
* [Aliexpress generic MHZ19](https://www.aliexpress.com/wholesale?SearchText=MHZ19) for CO2 and Temperature
* [Aliexpress generic CCS811](https://shop.pimoroni.com/products/adafruit-ccs811-air-quality-sensor-breakout-voc-and-eco2) for eCO2 and TVOC. That link is for a proper Adafruit one instead.

![Hardware](/images/2021/09/co2_hardware.jpg)

In theory the MHZ19 should be the most accurate but I think mine is a knock-off as the temperature reading is at least 10C too high. I've read that the SGP30 is good and mine is usually in the same ballpark as the MHZ19. The CCS811 is generally considered to be rubbish, but to be fair to it, whilst they all rarely show the same number, they all trend within spitting distance of each other over time. The BME680 numbers look good except for approx altitude.

These are all wired to a generic ESP32 board with three of them hanging off the main I2C bus and the MHZ19 on serial TX/RX pins. So that's

* 3V3 pin to power pin on the SGP30, BME660 and CCS811
* 5V/Vin pin to power on the MHZ19
* GND pin to GND on all devices
* SDA pin (D21 on DevKit board) to SDA on the SGP30, BME660 and CCS811
* SCL pin (D22 on DevKit board) to SCL on the SGP30, BME660 and CCS811
* TX2 pin on DevKit board to RX on the MHZ19
* RX2 pin on DevKit board to TX on the MHZ19
* GND pin on DevKit board must also be connected to the WAK pin on generic CCS811 modules
## Telegram Bot 
Telegram seems to be the only mainstream mobile messaging App with an open API that encourages Bots etc. It's surprisingly easy to setup and use. I'll be using it for lots more things over time. The steps are as follows:

* Start a conversation with the [BotFather bot](https://t.me/botfather) in Telegram
* Type the command `/newbot`
* Follow the step-by-step Q&A
* Save the access token that it provides somewhere safe
* The only awkward bit in Telegram is finding the `chat_id` for conversations. 
    * Start a conversation with your bot
    * Send it a message like `hello how are you`
    * `curl https://api.telegram.org/{{.CREDENTIAL.telegram_bot_key }}/getUpdates`
    * Save the id 
* You can now use the Telegram API to interact, in particular the [sendMessage method](https://core.telegram.org/bots/api#sendmessage)

![Telegram](/images/2021/09/co2_telegram.png)

* Use Node-RED to send me an alert via a call to Telegram. That consists of:
    * The URL: `https://api.telegram.org/{{.CREDENTIAL.telegram_bot_key }}/sendMessage`
    * chat_id: `{{.RESOURCE.telegram_chat_id}}`
    * text: "CO2 > 1000!"
## The ESP32 Arduino Code
The bashed-together Arduino code [is here](https://raw.githubusercontent.com/conoro/low-code/main/co2-environmental-sensors/BME680_MHZ19_SGP30_CCS811_Generic/BME680_MHZ19_SGP30_CCS811_Generic.ino). It's basically the example code for each module from the usual suspects online and then I've done my usual quick n dirty on it to make them all work together. The code grabs the values regularly from the devices and then posts it to a URL. 

The coolest aspect of the setup is that the ESP32 only needs to know the Node-RED URL and POST to it. From then on the data can go anywhere and be processed in any way. No matter what I do to the data, I don't have to make any changes to the ESP32 code.

Then install the following Libraries from the Arduino IDE:

* [Pimoroni SGP30](https://github.com/sparkfun/SparkFun_SGP30_Arduino_Library)
* [Adafruit BME680](https://github.com/adafruit/Adafruit_BME680) 
* [WifWaf MHZ19](https://github.com/WifWaf/MH-Z19) for CO2 and Temperature

The only changes you need to make to my code are as follows:
* Set your Wifi SSID and Password
* Set `serverName` to the Node-RED URL.

Then flash that to the board. DevKit boards need you to press and hold the BOOT button for the entire upload process. Other ESP32 boards just work.

## TO-DOs
* Check the last time a Telegram alert was sent and make sure not to send too many
* Possibly enable Telegram replies acknowledging the alert so that no more are sent that day
* Error checking in general
* More robust Arduino code

## That CO2 data
I've written about CO2 levels a bit on Twitter to indirectly refer to the situation in schools. So in a large home office on my own, the CO2 level goes above 1000ppm within an hour or so. Opening a window temporarily drops it back down. But within another hour or so, the level goes above 1000ppm again. The only way to keep it consistently below that "orange" level is to have 2 windows open or a window and door open i.e. airflow!

![GSheets](/images/2021/09/co2_gsheets.png)

## Data Store Lament
As I moaned on Twitter recently, I'd love if Google did their version of MS Access in the cloud with a direct connector for Data Studio. I'm hoping their Tables experiment provides this kind of lightweight database that doesn't involve the crazy complexity of trying to talk to Firebase/Firestore/DataStore/BigTable/BigQuery over REST. I just want somewhere I can dump JSON with a simple REST API and then query it with a dashboard-type tool, all wrapped in a simple Auth system. Right now I'm abusing GSheets as a pseudo-database (and it's doing a fine job to be fair).  

## Wrap-up
I've ended up very quickly with a really flexible toolkit in Low-Code+Telegram that I have been using in multiple different ways recently. This is just the first I've written up. I'll share more in the coming weeks. 
