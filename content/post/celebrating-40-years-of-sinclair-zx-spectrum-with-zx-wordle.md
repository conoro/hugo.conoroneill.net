+++
date = "2022-03-26T07:00:22Z"
draft = false
title = "Celebrating 40 years of the Sinclair ZX Spectrum with ZX Wordle"
description = "Oh I went there! And for real. A playable version of Wordle with 2 years of answers built-in"
slug = "celebrating-40-years-of-sinclair-zx-spectrum-with-zx-wordle"
+++

Sir Clive launched the greatest home computer of all time on April 23rd 1982, almost 40 years ago. I got mine in late 1982 and I still have it. Better, faster, stronger.

![Bionic Speccy](/images/2022/03/bionic_speccy.jpg)

I wanted to do something to mark the occasion and decided to play around with [Z88DK](https://github.com/z88dk/z88dk), a C Compiler and toolchain for 8-bit micros like the Speccy. It runs on Windows, Mac and Linux and it turned out to be ridiculously easy to write programs using it. So there was no need for me to re-learn BASIC or Z80 Assembly. Of course the last time I wrote any real C was around 1999 but it wasn't tooooo hard to get going again. Even if proper C devs will scream when they see how I wrote it.

After considering a few options for games etc, I wondered if [Wordle](https://www.nytimes.com/games/wordle/index.html) was doable in 48K. The core algorithm is easy and luckily the words are only 5 characters each. After a few hours of messing around, I give you ZX Wordle!

![Speccy Wordle](/images/2022/03/speccy_wordle.jpg)


Fully playable and with the answers up to March 23rd 2024, it still only uses 17KB of RAM!

Try it yourself for real below, running in the [JSSpeccy 3 emulator](https://github.com/gasman/jsspeccy3):

<br>
<script src="/assets/jsspeccy/jsspeccy.js"></script>
<div id="jsspeccy"></div>
<script>JSSpeccy(document.getElementById('jsspeccy'), {zoom: 2, machine: 48, autoStart: true, autoLoadTapes: true, openUrl: "/assets/2022/03/zxwordle.tap"})</script>
<br>

Of course my Speccy isn't connected to the Internet (yet) and lacks a real-time-clock, so you have to tell it which Wordle you want to play. The first one available is 272, the highly controversial sauté. I doubt France has forgiven the NYT for that foh pah ;-)

![Unreal](/images/2022/03/zx_wordle_emulator_01.png)

The terrible [source code is here](https://github.com/conoro/zxwordle) and [the TAP is here](/assets/2022/03/zxwordle.tap) to load into your Spectrum or emulator. The only real changes needed to get it working on other micros is replacing the INVERSE blocks used for colour with something appropriate for those platforms. Everything else is text.

There is still huge activity in the retro scene with new games being created for the Spectrum and other 1980s machines all the time. Similar to working with embedded devices, it's very satisfying to get code running with limited resources. This lovely article [in the NME](https://www.nme.com/features/gaming-features/zx-spectrum-at-40-a-look-back-3162913) about the Spectrum really highlights that aspect as being core to the popularity of the Speccy. Some of the things that programmers did with such basic hardware were mind-blowing. And how they got such audio out of a tinny speaker on an IO pin, I'll never understand.

Next up? I might think about re-doing some of my Z80 Assembly games from 1985/1986 in C. The first one (The Grid) was originally written in BASIC, then Forth and finally Assembly. 