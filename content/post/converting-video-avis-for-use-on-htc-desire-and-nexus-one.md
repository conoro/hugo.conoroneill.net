+++
aliases = ["/converting-video-avis-for-use-on-htc-desire-and-nexus-one/","/2010/05/05/converting-video-avis-for-use-on-htc-desire-and-nexus-one"]
date = "2010-05-05T12:42:17+01:00"
draft = false
title = "Converting Video AVIs for use on HTC Desire and Nexus One"
description = ""
slug = "converting-video-avis-for-use-on-htc-desire-and-nexus-one"
+++

#"Converting Video AVIs for use on HTC Desire and Nexus One"


 Grab <a href="http://handbrake.fr/">Handbrake</a> (Windows, Mac, Unix)<p /><div>For zero effort just use the iPhone preset in the GUI.</div><p /><div>If you use the command-line, this creates very nice video indeed (via <a href="http://www.nexusoneforum.net/forum/nexus-one-faq-how-tos/840-how-convert-any-video-your-nexus-one.html">NexusOneForum</a>) that makes use of the h264 graphics accelerator in the phone.</div> <p /><div><div><div>HandBrakeCLI -i &quot;infile.avi&quot; -o &quot;outfile.mp4&quot; -f mp4 -e x264 -q 0.60 --loose-anamorphic -x level=30:cabac=0:ref=2:mixed-refs:analyse=all:me=umh:no-fast-pskip=1 --deblock -E faac -B 128 -R 48 -6 d</div> </div><p /><div>Note that it can now also convert unencrypted DVDs directly too.</div><p /> </div>
 