+++
date = "2021-07-12T05:00:22Z"
draft = false
title = "Pano2Insta - Panoramic photo to Instagram converter"
description = "Python script that runs almost anywhere including Android"
slug = "pano2insta-panoramic-photo-to-instagram-converter"
+++

My Huawei P30 Pro takes great panoramic photos but Instagram isn't able to use them properly. The trick is to split them into multiple 1080x1080 photos (up to 10 of them) and include all of them in one post. People can then swipe right and left to get a pseudo-panoramic view.

![Beara Way](/images/2021/07/beara_panorama.jpg)

There are lots of ad-supported or pay-for apps to do this in the Google Play Store. But I figured it was hardly difficult to do.

A few lines of Python later and I was done.

[Pano2Insta](https://github.com/conoro/pano2insta) takes a panoramic image and does the following:

* Resizes image so height is 1080
* Crops left and right ends equally so that the width is a multiple of 1080
* Chops image up into multiple 1080x1080 images
* Saves them all with sequential filenames

It runs fine on Windows etc.

But it also runs on Android using Termux. All details over on the [repo](https://github.com/conoro/pano2insta) along with a Windows executable if you can't be bothered with all the setup messing.

Usual provios. Terrible code. No error handling. YMMV. Caveat emptor.
