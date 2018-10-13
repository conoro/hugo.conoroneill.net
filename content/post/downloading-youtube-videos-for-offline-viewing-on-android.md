+++
aliases = ["/downloading-youtube-videos-for-offline-viewing-on-android/","/2018/02/02/downloading-youtube-videos-for-offline-viewing-on-android"]
date = "2018-02-02T08:00:00+00:00"
draft = false
title = "Downloading YouTube videos  on Android for offline viewing later"
description = " "
slug = "downloading-youtube-videos-for-offline-viewing-on-android"
+++

One of the all-time great tools of the internet era is [youtube-dl](https://rg3.github.io/youtube-dl/). It enables you to download any YouTube video for watching offline/later. It has been a fantastic boon over the years for watching all my hundreds of subscribed channels when in planes, trains, automobiles and treadmills. It's also the basis for my own [YTPodders](https://ytpodders.com/) tool for generating podcasts from videos.

Normally I run it on the PC and copy the files to the mobile devices, tablets or media players. On Wednesday I was cut short in the middle of watching the latest episode of the wonderful [Project Binky](https://www.youtube.com/channel/UCHvBHWBzzB7NyU5tIiEZHBg) on the tarmac in Heathrow when it came time to take-off. There would have been no viewing interruption if I'd had a mobile version of youtube-dl. Of course I immediately checked to see if that existed when I got home.

It doesn't, but.....

![get-youtube](/images/2018/02/get-youtube.png)

It's really easy to set it up since it's written in Python and doesn't need to be compiled. Just follow these few steps to always have the ability to grab a video on to your Android phone for watching later.

## Installation

(Updated Oct 13th 2018)

- Save my little wrapper code on to your phone by long-pressing [this link](https://gist.github.com/conoro/d63c9f326ee65647a717b0283f21683f/raw) and selecting Download Link
- Install [QPython](https://play.google.com/store/apps/details?id=org.qpython.qpy) (Make sure to pick QPython2 not 3)
- Launch QPython
- Tap the QPYPI icon
- Tap QPYPI Client
- In the Terminal that launches, install `youtube-dl` with:

```
pip install -U youtube-dl
```

- Exit the Terminal (answer No to the question)
- Tap the Editor Icon
- In the Editor, tap the Folder icon
- Tap the Explorer Tab
- Now browse to where you saved my wrapper code in step 1 - likely to be the `Download` folder
- Tap the `get-youtube.py` file
- This opens the file in the Editor
- Long tap the small floppy disk icon to save the file as a new name
- Tap the projects directory
- Tap the folder icon with the + sign in it to create a new folder called `get-youtube`
- Save the file as `main.py` in the `get-youtube` directory
- Tap Back to get to the main screen
- Exit QPython
- Install [VLC](https://play.google.com/store/apps/details?id=org.videolan.vlc&hl=en) to play the downloads

## From then on you can download videos like so

- Browse to the video in the YouTube App
- Tap Share > Copy Link
- Launch QPython
- Tap the Projects icon (large unlabelled one above the sign-in link)
- `get-youtube` will be listed there
- Tap it to run it
- If the clipboard has a YouTube URL, it'll automatically download the video.
- Otherwise if the clipboard is empty or has a non-YouTube video URL you must paste it by long-pressing at the cursor and tapping Paste. Then tap again near the cursor if the keyboard has not appeared, and tap Enter.
- The video will download to `/storage/emulated/0/qpython`
- Open VLC, which should automatically find the video. If not, browse to `/storage/emulated/0/qpython`

## Even better, you can add a direct short-cut on your Android Home Screen

- Go back into QPython
- Go to Projects (large unlabelled icon above the sign-in link)
- Long press the icon for `get-youtube` in Projects
- Woohoo, now you have a Home Screen shortcut to download a video whenever. Just copy the video URL and launch get-youtube
- And remember it's not just for YouTube, it works for Vimeo, BBC iPlayer and [many more](https://rg3.github.io/youtube-dl/supportedsites.html)
- Note: Re-run the `pip install -U youtube-dl` step above if it ever stops working. The developers are in a constant battle with YouTube to keep it working
- If you ever get weird errors about DistributionNotFound, tap the More icon in QPython. Then Permissions and Storage > Storage > Clear Cache and Clear Storage. Then re-run QPython and accept all permissions dialogs.
- [Link to the source code](https://gist.github.com/conoro/d63c9f326ee65647a717b0283f21683f) for my simple wrapper.

Enjoy
