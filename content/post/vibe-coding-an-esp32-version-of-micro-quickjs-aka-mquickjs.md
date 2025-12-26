+++
date = "2025-12-26T06:40:48.313Z"
draft = false
title = "Vibe-Coding an ESP32 version of Micro QuickJS aka MQuickJS"
slug = "vibe-coding-an-esp32-version-of-micro-quickjs-aka-mquickjs"
+++

In an early Christmas gift to everyone, the legendary Fabrice Bellard released a tiny new JavaScript engine called [Micro QuickJS](https://github.com/bellard/mquickjs). As someone who has been using [Espruino](https://espruino.com) for years and was responsible for ushering the NodeConf EU 2017/2018/2019 digital conference badges into being, this obviously caught my attention immediately.

I looked at the small stack of ESP32 C6, H2 and S3 boards on my desk and thought "well this could be fun". So I set about Vibe Coding an ESP32 port of MQuickJS.

I'm an unapologetic Vibe Coder and absolutely reject a lot of the hatred directed at it. I see it as a tool to get things done faster or enable me to do things I wouldn't otherwise be able to do. Running MQuickJS on an ESP32 is definitely in the latter category.

In this case, Cursor with ChatGPT 5.1 Codex Max and Opus 4.5 got me a fully functional REPL running on an ESP32-S3 in less than 3 intermittent hours. Another hour to get LED Blinken-Lights working. Less than 30 minutes to switch from ESP32-S3 (240Mhz dual-core Xtensa LX7) to ESP32-C6 (160MHz single-core RISC-V) and ESP32-H2 (96Mhz single core RISC-V) microcontrollers.

I figure, with my lack of skills, without Cursor, that'd be weeks of futile effort with very little chance of success.

My main thoughts about MQuickJS are that I love the simplicity of the project, which is one of the reasons it was so quick to port. But it has a much smaller subset of modern JS than Espruino implements. And from an embedded hardware perspective, it lacks all of the hardware APIs that Espruino has built up over the years. So I wonder is it more for "embedding" than "embedded"? I'm reminded a bit of embedding Tcl and Forth into systems in the 90s.

I'm probbaly going to do nothing with this. It was a light-hearted Christmas experiment, some of which was done waiting for the Christmas turkey to cook, and I'm just chuffed it actually worked. I might add basic GPIO read/write as it feels a bit odd to have LEDs and not GPIO.

The code, build configs and instructions are all [on GitHub](https://github.com/conoro/mquickjs) if you want to try it out yourself.

```js
led.init(8)

function blink() {
  led.rgb(0, 0, 255)
  setTimeout(function() {
    led.off();
    setTimeout(blink, 500)
  }, 500)
}
blink()
```

<div align="center">
<video width="800" loop controls autoplay muted>
  <source src="/images/2025/12/micro_quickjs_led_blink_esp32h2.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
</div>
