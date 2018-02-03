+++
Categories = []
Description = "Some day YouTube will support offline viewing on mobile. Until then you can use this"
Tags = ["youtube", "youtube-dl", "offline", "python", "android"]
draft = false
date = "2018-02-02T08:00:00+00:00"
title = "Downloading YouTube videos  on Android for offline viewing later"
slug = "downloading-youtube-videos-for-offline-viewing-on-android"
+++

One of the all-time great tools of the internet era is [youtube-dl](https://rg3.github.io/youtube-dl/). It enables you to download any YouTube video for watching offline/later. It has been a fantastic boon over the years for watching all my hundreds of subscribed channels when in planes, trains, automobiles and treadmills. It's also the basis for my own [YTPodders](https://ytpodders.com/) tool for generating podcasts from videos.

Normally I run it on the PC and copy the files to the mobile devices, tablets or media players. On Wednesday I was cut short in the middle of watching the latest episode of the wonderful [Project Binky](https://www.youtube.com/channel/UCHvBHWBzzB7NyU5tIiEZHBg) on the tarmac in Heathrow when it came time to take-off. There would have been no viewing interruption if I'd had a mobile version of youtube-dl. Of course I immediately checked to see if that existed when I got home.

It doesn't, but.....

![get-youtube](/img/2018/02/get-youtube.png)

It's really easy to set it up since it's written in Python and doesn't need to be compiled. Just follow these few steps to always have the ability to grab a video on to your Android phone for watching later.

## Installation

* Install [QPython](https://play.google.com/store/apps/details?id=org.qpython.qpy) (Make sure to pick QPython2 not 3)
* Launch QPython
* Tap the Terminal Icon
* Install `youtube-dl` with:

```
pip install -U youtube-dl
```

* Exit the Terminal
* Tap the Editor Icon
* Paste my crappy code in to the editor

```python
# get-youtube.py 
# Wrapper around youtube-dl for Android
# Grabs URL from clipboard if it's a YouTube one. Otherwises prompts for URL
# See https://conoroneill.net/downloading-youtube-videos-for-offline-viewing-on-android/ for instructions
# Copyright Conor O'Neill 2018. Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

from __future__ import unicode_literals
from androidhelper import Android
droid = Android()

import youtube_dl

def input_default(prompt, default):
    return raw_input("%s [%s] " % (prompt, default)) or default

# If clipboard URL is a YouTube one, grab it and automatically download
if droid.getClipboard().result.startswith('https://youtu'):
    url = droid.getClipboard().result
else:
    # Either the clipboard is empty or it has a non-YouTube URL. User must paste the required URL.    
    url = raw_input("YouTube URL?: ")

ydl_opts = {
    'nocheckcertificate': True, 
    'outtmpl': '%(title)s.%(ext)s'
}

with youtube_dl.YoutubeDL(ydl_opts) as ydl:
    ydl.download([url])
```

(Latest code here on [GitHub Gist](https://gist.github.com/conoro/d63c9f326ee65647a717b0283f21683f))

* Tap the small floppy disk icon to save the file
* Save it as `main.py` in a new project called `get-youtube`
* Tap back to get to the main screen
* Exit QPython and Install [MX Player](https://play.google.com/store/apps/details?id=com.mxtech.videoplayer.ad&hl=en)
* Open MX Player and go to `Settings > List > Folders`
* Tap "Add" and browse to `/storage/emulated/0/qpython`

## From then on you can download videos like so

* Launch QPython
* Tap the Projects icon (large unlabelled one above the sign-in link)
* `get-youtube` will be listed there
* Tap it to run it
* If the clipboard has a YouTube URL, it'll automatically download the video. 
* Otherwise if the clipboard is empty or has a non-YouTube video URL you must paste it by long-pressing at the cursor and tapping Paste. Then tap again near the cursor if the keyboard has not appeared, and tap Enter.
* The video will download to `/storage/emulated/0/qpython`
* The video will automatically appear in MX Player when you launch it
* You can delete it in MX Player once you are done

## Even better, you can add a direct short-cut on your Android Home Screen

* Go back into QPython
* Go to Projects
* Long press the icon for `get-youtube` in Projects
* Woohoo, now you have a Home Screen shortcut to download a video whenever. Just copy the video URL and launch get-youtube
* And remember it's not just for YouTube, it works for Vimeo, BBC iPlayer and [many more](https://rg3.github.io/youtube-dl/supportedsites.html)
* Note: Re-run the `pip install -U youtube-dl` step above if it ever stops working. The developers are in a constant battle with YouTube to keep it working

Enjoy
