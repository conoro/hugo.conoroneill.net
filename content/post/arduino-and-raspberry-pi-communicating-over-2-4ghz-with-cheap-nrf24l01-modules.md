+++
aliases = ["/arduino-and-raspberry-pi-communicating-over-2-4ghz-with-cheap-nrf24l01-modules/","/2013/09/07/arduino-and-raspberry-pi-communicating-over-2-4ghz-with-cheap-nrf24l01-modules"]
date = "2013-09-07T15:51:57+01:00"
draft = false
title = "Arduino and Raspberry Pi communicating over 2.4GHz with cheap nRF24L01+ modules"
description = ""
slug = "arduino-and-raspberry-pi-communicating-over-2-4ghz-with-cheap-nrf24l01-modules"
+++

#"Arduino and Raspberry Pi communicating over 2.4GHz with cheap nRF24L01+ modules"

I've had a lot of fun over the past year messing with wireless comms. The 433Mhz/434MHz dirt-cheap modules are fantastic for Arduino, particularly when used with the <a href="http://www.airspayce.com/mikem/arduino/">VirtualWire library</a> which makes them trivial to setup. I've been able to send sensor data and RC car commands using them with just a few lines of code. However, there isn't a version of VirtualWire for RaspberryPi and I don't have the time/skills to port the Arduino one.

I've also mentioned multiple projects using those HC05/HC06 serial Bluetooth modules. Again, dead easy to use and they connect Arduinos to PCs, Raspberry Pis and mobile phones. They are a bit pricey tho.

My latest experiments involve the Nordic Semiconductor nRF24L01+ modules. These cost <a href="http://www.ebay.ie/itm/1X-NRF24L01-2-4GHz-Antenna-Wireless-Transceiver-Module-For-Microcontroller-WST-/271265848197?pt=UK_BOI_Electrical_Test_Measurement_Equipment_ET&amp;hash=item3f28b45b85">approx 1.26 each on eBay</a> and strike me as the perfect middle ground between the two approaches above. They are cheap, work over a decent distance and have libraries available for both Arduino and Raspberry Pi.

However I spent nearly all of last weekend trying to get a Raspberry Pi talking to an Arduino using instructions in some <a href="http://arduino-for-beginners.blogspot.ie/2013/02/setup-nordic-nrf24l01-rf-modules-to.html">blogposts</a>. It turns out his instructions were a mix of incorrect text, links to wrong repos, self-contradictory blogposts and code/comments which also contradicted each other. Eventually by ignoring text/comments and just reading the code, I got the wiring right and the sample code working. Whilst I hugely appreciate someone putting time and effort into writing/improving Open Source code like this, it really is a bad idea to then wrap it in such error-riddled explanations.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/2013-09-07-15.34.49.jpg"><img class="aligncenter size-large wp-image-1157" alt="2013-09-07 15.34.49" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/2013-09-07-15.34.49-1024x556.jpg" width="584" height="317" /></a>

To avoid you going down the same rabbit hole, this is what you need to do to get Arduino talking to RPi over nRF24L01+.
<h2>Arduino Connections</h2>
Note that the module is 5V tolerant (apart from VCC) but just to be sure I used it with an <a href="http://www.elecfreaks.com/store/freaduino-leonardo-p-442.html">Elecfreaks Freaduino Leonardo</a> which has a physical switch to toggle between 3.3V and 5V. You could also use a <a href="https://www.sparkfun.com/products/11114">3.3V Pro Mini from Sparkfun like this</a>. It has worked fine on my 5V Uno too.
<ul>
	<li>Arduino GND - Module Pin 1</li>
	<li>Arduino 3.3V - Module Pin 2</li>
	<li>Arduino Pin 8 - Module Pin 3</li>
	<li>Arduino Pin 9 - Module Pin 4</li>
	<li>Arduino Pin 13 - Module Pin 5</li>
	<li>Arduino Pin 11 - Module Pin 6</li>
	<li>Arduino Pin 12 - Module Pin 7</li>
	<li>Module Pin 8 Not Connected</li>
</ul>
<h2>Raspberry Pi Connections</h2>
The Raspberry Pi is 3.3V itself so can connect directly to the module. Here is the pin-out. Only pay attention to the pin numbers in the circles, not the names.
<h2><a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/RPi-pinout-GPIO.png"><img class="aligncenter size-large wp-image-1149" alt="RPi pinout GPIO" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/RPi-pinout-GPIO.png" width="584" height="275" /></a></h2>
<ul>
	<li>RPi Pin 6 - Module Pin 1</li>
	<li>RPi Pin 1 - Module Pin 2</li>
	<li>RPi Pin 22 - Module Pin 3</li>
	<li>RPi Pin 24 - Module Pin 4</li>
	<li>RPi Pin 23 - Module Pin 5</li>
	<li>RPi Pin 19 - Module Pin 6</li>
	<li>RPi Pin 21 - Module Pin 7</li>
	<li>Module Pin 8 Not Connected</li>
</ul>
<h2>Building The Library on RPi</h2>

<pre><code class="language-bash">
    javascript
	mkdir ~/gitwork
	cd gitwork
	git clone https://github.com/stanleyseow/RF24.git
	cd RF24
	cd librf24-rpi/librf24
	make
	sudo make install
	sudo ldconfig -v | grep librf
	cd examples/
	make
</code>
</pre>

<h2>Arduino Libraries</h2>
You need to install the Arduino libraries:
<ul>
	<li>Grab a <a href="https://github.com/stanleyseow/RF24/archive/master.zip">zip file of all of the latest code from Github</a>.</li>
	<li>Unzip that file</li>
	<li>Rename the directory from RF24-master to RF24</li>
	<li>Delete all of its sub-directories</li>
	<li>Copy the overall RF24 directory to the libraries directory of your Arduino IDE install. In my case that becomes: C:\Program Files (x86)\Arduino\libraries\RF24</li>
	<li>The nRF24L01.h and RF24.h includes should now work in your code when you run the IDE</li>
</ul>
<h2>Arduino Sketch</h2>
This is my quick and dirty hack of the author's Arduino sending sketch. It removes all of the LCD display stuff and only returns one sensor value. In my case that's a single switch on Digital Pin 6 which is either open or closed. I'll post a tidier one with updated comments when I have it completed.

<pre><code class="language-c">
	/*
	Written by Stanley Seow
	stanleyseow@gmail.com
	*/

	#include <SPI.h>
	#include "nRF24L01.h"
	#include "RF24.h"
	#include "printf.h"

	#define RF_SETUP 0x17

	// Set up nRF24L01 radio on SPI pin for CE, CSN
	RF24 radio(8,9);

	// Example below using pipe5 for writing
	const uint64_t pipes[2] = { 0xF0F0F0F0E1LL, 0x7365727631LL };

	char receivePayload[32];
	uint8_t counter=0;
	int inPin = 6; // button connected to digital pin 6

	void setup(void)
	{

		// Conor Switch
		pinMode(inPin, INPUT);

		Serial.begin(57600);

		printf_begin();
		printf("Sending nodeID & 1 sensor data\n\r");

		radio.begin();

		// Enable this seems to work better
		radio.enableDynamicPayloads();

		radio.setDataRate(RF24_1MBPS);
		radio.setPALevel(RF24_PA_MAX);
		radio.setChannel(76);
		radio.setRetries(15,15);

		radio.openWritingPipe(pipes[0]);
		radio.openReadingPipe(1,pipes[1]);

		// Dump the configuration of the rf unit for debugging
		radio.printDetails();
		delay(1000);
	}

	void loop(void)
	{
		uint8_t Data1,Data2,Data3,Data4 = 0;
		char temp[5];
		bool timeout=0;

		// Get the last two Bytes as node-id
		uint16_t nodeID = pipes[0] & 0xff;

		char outBuffer[32]=""; // Clear the outBuffer before every loop
		unsigned long send_time, rtt = 0;

		// Get readings from sensors, change codes below to read sensors
		Data1 = counter++;
		Data2 = digitalRead(inPin);

		if ( counter > 999 ) counter = 0;

		// Append the hex nodeID to the beginning of the payload
		sprintf(outBuffer,"%2X",nodeID);

		strcat(outBuffer,",");

		// Convert int to strings and append with zeros if number smaller than 3 digits
		// 000 to 999

		sprintf(temp,"%03d",Data1);
		strcat(outBuffer,temp);

		strcat(outBuffer,",");

		sprintf(temp,"%04d",Data2);
		strcat(outBuffer,temp);

		printf("outBuffer: %s len: %d\n\r",outBuffer, strlen(outBuffer));

		send_time = millis();

		// Stop listening and write to radio
		radio.stopListening();

		// Send to hub
		if ( radio.write( outBuffer, strlen(outBuffer)) ) {
			printf("Send successful\n\r");
		}
		else {
			printf("Send failed\n\r");
		}

		radio.startListening();
		delay(20);

		while ( radio.available() && !timeout ) {

			uint8_t len = radio.getDynamicPayloadSize();
			radio.read( receivePayload, len);

			receivePayload[len] = 0;
			printf("inBuffer: %s\n\r",receivePayload);

			// Compare receive payload with outBuffer
			if ( ! strcmp(outBuffer, receivePayload) ) {
				rtt = millis() - send_time;

				printf("inBuffer --> rtt: %i \n\r",rtt);

			}

			// Check for timeout and exit the while loop
			if ( millis() - send_time > radio.getMaxTimeout() ) {
				Serial.println("Timeout!!!");
				timeout = 1;
			}

			delay(10);
		} // End while

		delay(250);
	}
</code>
</pre>

This sketch makes use of printf so you need a file in the same directory called printf.h which consists of:

<pre><code class="language-c">
	/*
	Copyright (C) 2011 J. Coliz maniacbug@ymail.com

	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public License
	version 2 as published by the Free Software Foundation.
	*/

	/**
	* @file printf.h
	*
	* Setup necessary to direct stdout to the Arduino Serial library, which
	* enables 'printf'
	*/

	#ifndef __PRINTF_H__
	#define __PRINTF_H__

	#ifdef ARDUINO

	int serial_putc( char c, FILE * )
	{
		Serial.write( c );

		return c;
	}

	void printf_begin(void)
	{
		fdevopen( &serial_putc, 0 );
	}

	#else
	#error This example is only for use on Arduino.
	#endif // ARDUINO

	#endif // __PRINTF_H__
</code>
</pre>

<h2>Running the code on the RPi and Arduino</h2>
On the Arduino, just compile and upload the sketch and then open the Serial Monitor window and set the baud rate to 57,600.

On the RPi, run the following. It will show you what it is receiving from the Arduino and echoes it back.

<pre><code class="language-bash">sudo /home/pi/gitwork/RF24/librf24-rpi/librf24/examples/rpi-hub</code></pre>

If everything is working ok, both the RPi and the Arudino should be showing very similar output and reporting success.
<h2>Next Steps?</h2>
The Raspberry Pi libraries and sample code are obviously in C which is probably too hardcore for most people. Ideally they'd be available to both Python and JavaScript deveopers. I'll do a little poking around to see how you go about that. I wouldn't hold my breath tho.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/2013-09-01-14.44.06.jpg"><img class="aligncenter size-full wp-image-1160" alt="2013-09-01 14.44.06" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2013/09/2013-09-01-14.44.06.jpg" width="1024" height="768" /></a>

I haven't done any major distance testing on the modules. In our house, which has concrete internal walls, two modules could communicate from one room to the next but not from one end of the house to the other. They also worked successfully with one module inside an oil tank in the garden and the other one inside the house &lt;10m away. I'll try some open air testing soon.
