+++
Categories = []
Description = "YTPodders grabs the latest videos from your favourite YouTube users and channels, converts them to MP3, saves them in your Dropbox and provides a podcast URL that you can subscribe to on your podcasting app on your phone."
Tags = []
date = "2016-05-02T19:32:32+01:00"
title = "Introducing YTPodders - Get your fave YouTubers as audio podcasts on your phone"

+++
Like my kids, I love regular YouTubers. My particular favourites are the tech, craft, metal and woodworking people who make amazing things every week. [Those](https://www.youtube.com/channel/UCjA8vRlL1c7BDixQRJ39-LQ) [gals](https://www.youtube.com/user/darbinorvar) [and](https://www.youtube.com/channel/UC3KEoMzNz8eYnwBC34RaKCQ) [guys](https://www.youtube.com/user/jimmydiresta) [have](https://www.youtube.com/channel/UCHWvlZ6jGmXKYa1w8yRVcbA) [to](https://www.youtube.com/channel/UCETeXD_3awsQv-9rSdCYXQQ) [be](https://www.youtube.com/user/urbanTrash) [watched](https://www.youtube.com/user/Jayscustomcreations) [to](https://www.youtube.com/channel/UCYdkEm-NjhS8TmLVt_qZy9g) [really](https://www.youtube.com/channel/UCkhZ3X6pVbrEs_VzIPfwWgQ) [get](https://www.youtube.com/user/arduinoversusevil) [the](https://www.youtube.com/user/colinfurze) [value](https://www.youtube.com/channel/UCV8D6u7_jkuGf_iUvNzXpmg) [from](https://www.youtube.com/user/rusticman1973) [them](https://www.youtube.com/user/JoergSprave) [and](https://www.youtube.com/channel/UCpV7D0LoRbYhdx2G-whWyog) [here's](https://www.youtube.com/channel/UCfCKUsN2HmXfjiOJc7z7xBw) [a](https://www.youtube.com/channel/UC6x7GwJxuoABSosgVXDYtTw) [few](https://www.youtube.com/channel/UCUaiGrBfRCaC6pL7ZnZjWbg) [more](https://www.youtube.com/channel/UCHvBHWBzzB7NyU5tIiEZHBg) [worth](https://www.youtube.com/user/punishedprops) [looking](https://www.youtube.com/user/stevinmarin) [at](https://www.youtube.com/channel/UCAL3JXZSzSm8AlZyD3nQdBA) [too](https://www.youtube.com/user/testedcom), [of](https://www.youtube.com/channel/UCupK5wJGXHDemXmHFMCMtHA) [course](https://www.youtube.com/user/DrunkenWoodworker) [not](https://www.youtube.com/user/thebenheckshow) [forgetting](https://www.youtube.com/user/Matthiaswandel) [these](https://www.youtube.com/user/ferrynick) [other](https://www.youtube.com/user/makemagazine) [gems](https://www.youtube.com/user/benbrandt22).

But there are others I love equally where it's mostly about what they are saying. For example, [Ethan Newberry](https://www.youtube.com/user/TheGingerRunner) (aka The Ginger Runner) does a fantastic weekly live session where he mostly interviews Ultra runners. This works just as well without the video. I listen to this when running or driving. It's seriously one of the best motivational things you can listen to on a marathon!

For a few months I was using [youtube-dl](https://rg3.github.io/youtube-dl/) to grab the latest episode video file, then [Winff/ffmeg](http://winff.org/html_new/) to convert to MP3, then I manually copied the file to the music player on my Android phone. Not exactly slick.

Of course, I decided to automate it and figured it'd take a couple of evenings. Two months later, here we are :-)

![YTPodders](https://ytpodders.com/images/YTPodders_256x256_gradient.png)

Introducing [YTPodders](https://ytpodders.com), an App that does everything you need to have automated podcastification of YouTube Users and Channels. It works very similarly to my manual process as follows:

* When you run ytpodders, it checks the list of YouTube Users and Channels you previously added for any new content. It downloads any new ones it finds using youtube-dl
* As part of that download process, youtube-dl uses ffmpeg to convert the videos to MP3 audio
* It copies the MP3s to the YTPodders App directory in Dropbox and waits until they are all synced properly with Dropbox
* It then generates an rss.xml file containing all the entries and tells you the URL of that rss.xml file
* You subscribe to that rss.xml file in your Podcasting App on your phone e.g. [BeyondPod](https://play.google.com/store/apps/details?id=mobi.beyondpod&hl=en) on Android.
* The Podcasting App then regularly checks for updates and pulls any new content from Dropbox on to your phone for offline listening.

![BeyondPod](https://www.dropbox.com/s/22pziqm50ep9r55/beyondpod.png?raw=1)

This has been working really well for me for several weeks now. I have a Windows 10 Scheduled Task setup which runs it every morning at 6am. And I have BeyondPod checking a few times a day too. So my phone always has the latest and greatest YouTube MP3s.

The code needs lots of work and there is still a lot of maintenance type functionality that needs to be added (pruning old MP3s; cleaning up when you remove subscriptions etc).

The important thing you need to do is to give [YTPodders authorisation](https://ytpodders.com) to access your Dropbox. It only gets access to its own sub-directory in the Apps directory in Dropbox so it can't mess anything else up.

Full installation and usage instructions for End-Users and Developers are over [on GitHub here](https://github.com/conoro/ytpodders).

It has been mostly tested on Windows 10 but also runs on Mac and Linux. The server runs on Windows, OSX, CentOS and Fedora too (presumably any Linux distro).

As this is basically time-shifting for personal use only, it should come under US fair use. The download of the video by youtube-dl should count as a view for advertising purposes. If you are concerned about depriving your favourite YouTubers of income, why not back them on [Patreon](http://www.patreon.com), if they use it? I did that for [Ethan](https://www.patreon.com/thegingerrunner?ty=c) because I get so much value as a runner from the videos he creates and the interviews that he does.

Improvements, suggestions and bug reports all gladly accepted [over on GitHub](https://github.com/conoro/ytpodders). The code is written in Go/GoLang, yes it's a giant awful ball of mud hack and it doesn't do multiple downloads in parallel on purpose, not because I can't figure out goroutines :-) But it works.
