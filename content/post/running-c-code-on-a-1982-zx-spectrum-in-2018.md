+++
Categories = []
Description = "Whilst this is old-hat to those in the retro scene, the idea that I can write new code for my old Speccy is very exciting!"
Tags = ["zx spectrum", "retro"]
draft = false
date = "2018-02-13T08:00:00+00:00"
title = "Running new C code on a 1982 ZX Spectrum in 2018"
slug = "running-c-code-on-a-1982-zx-spectrum-in-2018"
+++

The 1980s home computer retro scene remains very vibrant. I dip a toe in every so often and recently have been enjoying the new Speccy games that I've found on [Indie Retro News](http://www.indieretronews.com/2018/02/fantasy-zone-escape-from-pyramid-final.html).

One thing that caught my eye with these releases was the mentions of "engines". It turns out that people have been building games engines for the ZX Spectrum for years. Mostly in C it seems and mostly using the [z88dk](https://www.z88dk.org/forum/) toolchain.

So I had a quick play around with z88dk and was gob-smacked to see how easy it is to generate a TAP file from C code that you can run on a Spectrum emulator:

{{< youtube 0upqnnRZZ4k >}}

And if you have an SD card interface like the [divMMC Future](https://www.thefuturewas8bit.com/index.php/divmmcfuture) for your original 1982 Spectrum, like me, then you can run your first new code on it since 1986. Yes I know it's Hello World but I'm buzzing.

![Hello Speccy](/img/2018/02/hello_speccy.jpg)

Related to this, I discovered recently that a game I wrote in 1985, The Cherry Run ([play it online here](http://jbacteria.retrolandia.net/48s?cherryru.tap)) has an awful bug.

![Cherry Run](/img/2018/02/the_cherry_run.jpg)

I don't have the original Z80 Assembly code so I tried out a disassembler and realised I have forgotten 100% of whatever I knew about Z80 :-) However I was able to extract the Basic loader for the game which was cool.

![Cherry Basic](/img/2018/02/cherry_basic.jpg)

So do I try and fix that 33 year old bug or re-write the game in C using one of those game engines?
