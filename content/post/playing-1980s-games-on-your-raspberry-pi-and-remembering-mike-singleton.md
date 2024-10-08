+++
aliases = ["/playing-1980s-games-on-your-raspberry-pi-and-remembering-mike-singleton/","/2012/10/16/playing-1980s-games-on-your-raspberry-pi-and-remembering-mike-singleton"]
date = "2012-10-16T15:02:46+01:00"
draft = false
title = "Playing 1980s games on your Raspberry Pi and remembering Mike Singleton"
description = ""
slug = "playing-1980s-games-on-your-raspberry-pi-and-remembering-mike-singleton"
+++

#"Playing 1980s games on your Raspberry Pi and remembering Mike Singleton"

This post was going to be just an up-to-date summary of many other articles out there on this subject. With the rapid rate of change in the RPi world, even very recent guides have proven to be unusable quite quickly.

However I'd first like to remember Mike Singleton who died last week. I didn't know his name until today when I read <a href="http://www.giantbomb.com/forums/general-discussion/30/the-father-of-home-computer-gaming-died-last-week/564063/">this lovely piece about him</a>. But what I did know about was <a href="http://en.wikipedia.org/wiki/The_Lords_of_Midnight">Lords of Midnight</a> and Doomdark's Revenge. Those two adventure games dominated that category on the ZX Spectrum in the mid-80s. Mike was still creating new games until very recently. It's just another reminder of how important the 1980s UK home computer scene has been to the current gaming industry. In memory of Mike, I'm playing Lords of Midnight from the start again this evening on the Raspberry Pi. RIP.

<a href="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/10/Fuse_001.png"><img class="alignnone size-full wp-image-875" title="Fuse_001" src="https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2012/10/Fuse_001.png" alt="" width="962" height="776" /></a>

The Raspberry Pi makes a brilliant base for old-school game emulation, just as it does for <a href="http://www.raspbmc.com/">XBMC</a>. You literally just need it, a USB joystick, maybe a wireless dongle, a TV and you are in business. I've been very tempted to double-sided-sticky-tape one to the side of the TV without a case, it's that small. I'm currently using an ancient 14" Philips portable CRT to get the full retro effect, including blinding flickering.
<h2>Atari 2600</h2>
OK, I have to admit my rose-tinted spectacle were on overdrive here. The Atari 2600 Pacman in my head was actually thearcadeversion. The real thing is pretty awful. This console was a bit before my time and the main thing I remember about it were the completely unusable joysticks. But if you want to re-live that horror, then it's really very simple.

Grab all the Atari 2600 ROMs from one of many sites. They are tiny so the download takes no time at all.

Then install the Stella emulator:
<pre><code class="language-bash">sudo apt-get install stella</code></pre>
Then just run stella inside X Windows. More details <a href="http://www.engadget.com/2012/09/28/how-to-set-up-your-raspberry-pi-to-play-atari-2600-games/">here</a>.
<h2>MAME Arcade</h2>
MAME seems to have been around forever. It enables you to play old arcade games on a wide variety of machines. I remember using it on my brother-in-law's Atari 520ST in the 90s.

So it's no surprise it works well on the Raspberry Pi. Compiling from source apparently takes forever and some of the binaries from this summer don't work on the latest Debian release. However<a href="http://sheasilverman.com/rpi/raspbian/mameBin.zip">this latest compiled version</a> of Advance MAME <a href="http://blog.sheasilverman.com/2012/07/raspbian-on-raspberry-pi-mame-mess-quake3-neogeo-and-cave-story-binaries/">by Shea Silverman</a> runs perfectly on the latest Debian.

Download it to your home directory, then
<pre><code class="language-bash">
unzip mameBin.zip
sudo chmod 777 /dev/fb0
</code>
</pre>
Put your roms into ~/mame/share/advance/rom/
<pre><code class="language-bash">
cd mame/bin/
./advmame
</code>
</pre>
Edit the config file
<pre><code class="language-bash">nano ~/.advance/advmame.rc</code></pre>
to include the proper display configuration

For HDMI try:
<pre><code class="language-bash">device_video_clock 5 - 50 / 15.62 / 50 ; 5 - 50 / 15.73 / 60</code></pre>
For NTSC TVs try:
<pre><code class="language-bash">device_video_clock 5 - 50 / 15.73 / 60</code></pre>
For Composite PAL TVs:
<pre>device_video_clock 5 - 50 / 15.62 / 50 ; 5 - 50 / 15.73 / 60</pre>
Then run MAME with the name of the game e.g. pacman or zaxxon.

I'll leave it as an exercise for the reader to source their own legal ROMs.
<pre><code class="language-bash">
 cd mame/bin/
./advmame gamename
</code>
</pre>
<h2>ZX Spectrum</h2>
Installing the Fuse emulator is now trivial to do:
<pre><code class="language-bash">sudo apt-get install fuse-emulator-common fuse-emulator-utils spectrum-roms</code></pre>
Then grab your favourite games from <a href="http://www.worldofspectrum.org/">World of Spectrum</a> and run fuse inside X Windows. More details <a href="http://raspi.tv/2012/how-to-install-fuse-zx-spectrum-emulator-on-raspberry-pi">here</a>. And <a href="http://www.worldofspectrum.org/infoseekid.cgi?id=0006604">Lords of Midnight here</a>.

There are ton of other emulators out there, at various levels of usability. Our eldest has already been asking about SNES.

&nbsp;