+++
date = "2021-09-20T03:00:22Z"
draft = false
title = "Using Tines for Home IoT Automation"
description = "Once I realised that Tines could be used to automate anything, I let my imagination take over"
slug = "using-tines-for-home-iot-automation"
+++

I recently joined [Tines](https://tines.com) as Head of Community and have been on a wonderful exploration of its capabilities over the past few weeks. Tines can connect to almost any system, process data and events and then forward on or persist that transformed data somewhere. This seemingly simple model with seven action types and a variety of auth options has turned out to be incredibly flexible.

![Tines General](/images/2021/09/tines_general.png)

That flexibility caused me to look far beyond security use-cases and examine other things I could connect to and automate. As long-time readers of my blog(s) know, I come from an Embedded Systems background and still love to play with home electronics and IoT. And of course, since last year I've been noodling around with CO2 monitors and other environmental sensors because of you-know-what.

So I decided to see if I could connect my sensor setup to Tines, parse the values, persist them and alert me somehow if CO2 in particular got too high. I was stunned how easy it was and it instantly made me forget about using Lambda or Pi-based tools for doing work like this in the future.

I received some requests to share the details of my setup, hence this blogpost. It is very straightforward.

## The IOT Hardware and Software
The hardware setup is fairly basic. I've found that every CO2 sensor gives quite different results so I wired up three of them along with a pressure/temperature one to track and compare. They are:

* [Pimoroni SGP30](https://shop.pimoroni.com/products/sgp30-air-quality-sensor-breakout) for eCO2 and TVOC
* [Adafruit BME680](https://shop.pimoroni.com/products/adafruit-bme680-temperature-humidity-pressure-and-gas-sensor-stemma-qt) for Temperature, Pressure, Humidity, Gas, Approx. Altitude
* [Aliexpress generic MHZ19](https://www.aliexpress.com/wholesale?SearchText=MHZ19) for CO2 and Temperature
* [Aliexpress generic CCS811](https://shop.pimoroni.com/products/adafruit-ccs811-air-quality-sensor-breakout-voc-and-eco2) for eCO2 and eCO2 and TVOC. That link is for a proper Adafruit one instead.

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
## Google Auth for Google Sheets
This is the hardest part of the entire process but even then, it's just a bunch of fiddly steps where you have to be careful, rather than requiring any deep expertise. I won't clog up this post with the steps, you can follow them over here on [GitHub](https://github.com/conoro/tines-stories/blob/main/co2-environmental-sensors/google_sheets_auth_on_tines.md). 

The vast majority of the complexity comes from Google itself. After you do the steps once, you can re-use the credentials over and over with a simple copy and paste to a new Story.
## Telegram Bot 
Telegram seems to be the only mainstream mobile messaging App with an open API that encourages Bots etc. It's surprisingly easy to setup and use. I'll be using it for lots more things over time. The steps are as follows:

* Start a conversation with the [BotFather bot](https://t.me/botfather) in Telegram
* Type the command `/newbot`
* Follow the step-by-step Q&A
* Save the access token that it provides somewhere safe
* Create a new Text Credential in Tines and use the name `Telegram Bot Key` in order to refer to it in your Story as `{{.CREDENTIAL.telegram_bot_key }}`
* The only awkward bit in Telegram is finding the `chat_id` for conversations. 
    * Start a conversation with your bot
    * Send it a message like `/dummycommand hello`
    * Create a HTTP Request action in your Tines Story called `Get Telegram Chat ID` where
        * The URL is `https://api.telegram.org/{{.CREDENTIAL.telegram_bot_key }}/getUpdates`
    * Connect that to an Event Transform action which just outputs `{{.get_telegram_chat_id.body.result.last.message.from.id }}`
        * Save the id from the message output by that action as a Resource called `Telegram Chat ID` so you can use `{{.RESOURCE.telegram_chat_id}}` in the main Story below
* You can now use the Telegram API to interact, in particular the [sendMessage method](https://core.telegram.org/bots/api#sendmessage)

![Telegram](/images/2021/09/co2_telegram.png)

## The Tines Story
You can download the [JSON of my Story](https://github.com/conoro/tines-stories/tree/main/co2-environmental-sensors) here and import it into your Tines Account.

![Story](/images/2021/09/co2_story.png)

Once you have a good grasp of how to set up Auth for various systems you use, the Tines Stories themselves tend to come together very quickly. Mine is particularly straightforward.

* First you have the Webhook. No configuration needed. Just drag it on to the Story. Note the URL and use that in the section below about the Arduino code. This is what gets called every 15 minutes by the ESP32 which POSTs the sensor data.

* Next you have an Event Transform which just averages the three CO2 numbers and creates a new data point to go with them

* Then you have a branch in the flow. 
    * The left side is a Trigger which simply compares the average CO2 number to 1000. If it's higher than 1000 it goes to the Alert step. 
    *  The right side of the branch does two things. It writes all the values we received from the ESP32 to Google Sheets, along with the calculated average, a timestamp and an indication that we sent an alert (not necessary right now). The second thing it does is provide the Authorization to Google Sheets. It uses an incredibly neat feature of Tines to automatically grab a refresh token from Google as it does this. More details in the Auth doc referenced above.
* If the step above detects CO2 greater than 1000 then the final action is a call to Telegram to send me an Alert. That consists of:
    * The URL: `https://api.telegram.org/{{.CREDENTIAL.telegram_bot_key }}/sendMessage`
    * chat_id: `{{.RESOURCE.telegram_chat_id}}`
    * text: "CO2 > 1000!"


## The ESP32 Arduino Code
The bashed-together Arduino code [is here](https://raw.githubusercontent.com/conoro/tines-stories/main/co2-environmental-sensors/Tines_BME680_MHZ19_SGP30_CCS811_Generic/Tines_BME680_MHZ19_SGP30_CCS811_Generic.ino). It's basically the example code for each module from the usual suspects online and then I've done my usual quick n dirty on it to make them all work together. The code grabs the values regularly from the devices and then posts it to a Tines Webhook. 

The only really interesting aspect of the code is that Tines obviously uses https which is not very straightforward on low-power devices like ESP32. So I need to have the Root Cert for Amazon in the Arduino code in order to be able to communicate with Tines on AWS.

The coolest aspect of the setup is that the ESP32 only needs to know the webhook URL and POST to it. From then on the data can go anywhere and be processed in any way. No matter what I do to the data, I don't have to make any changes to the ESP32 code.

Unfortunately the Adafruit CCS811 library has hard-coded pin numbers which don't match the ESP32 DevKit, so I have my own copy with a minor change to enable pin definition. So don't install the Adafruit one, grab mine [from here](https://github.com/conoro/tines-stories/raw/main/co2-environmental-sensors/Adafruit_Conor_CCS811.zip) and unzip it to the Documents/Arduino/Libraries directory in your home directory. Apologies for the stupid name, I was in a hurry to get it working!

Then install the following Libraries from the Arduino IDE:

* [Pimoroni SGP30](https://github.com/sparkfun/SparkFun_SGP30_Arduino_Library)
* [Adafruit BME680](https://github.com/adafruit/Adafruit_BME680) 
* [WifWaf MHZ19](https://github.com/WifWaf/MH-Z19) for CO2 and Temperature

The only changes you need to make to my code are as follows:
* Set your Wifi SSID and Password
* Set `serverName` to the Tines Webhook URL. Something like `https://blah-blah.tines.com/webhook/1f3f5673245/`

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
As I moaned on Twitter recently, I'd love if Google did their version of MS Access in the cloud with a direct connector for Data Studio. I'm hoping their Tables experiment provides this kind of lightweight database that doesn't involve the crazy complexity of trying to talk to Firebase/Firestore/DataStore/BigTable/BigQuery over REST. I just want somewhere I can dump JSON with a simple REST API and then query it with a dashboard-type tool or Tines, all wrapped in a simple Auth system. Right now I'm abusing GSheets as a pseudo-database (and it's doing a fine job to be fair).  

## Wrap-up
I've ended up very quickly with a really flexible toolkit in Tines+Telegram+GSheets that I have been using in multiple different ways recently. This is just the first I've written up. I'll share more in the coming weeks. 

