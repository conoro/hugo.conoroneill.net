+++
aliases = ["/sharing-family-videos-using-amazon-cloudfront-cloudberry-jwplayer-and-wordpress/","/2010/11/03/sharing-family-videos-using-amazon-cloudfront-cloudberry-jwplayer-and-wordpress"]
date = "2010-11-03T17:15:44Z"
draft = false
title = "Sharing Family Videos using Amazon Cloudfront, CloudBerry, JWPlayer and Wordpress"
description = ""
slug = "sharing-family-videos-using-amazon-cloudfront-cloudberry-jwplayer-and-wordpress"
+++

#"Sharing Family Videos using Amazon Cloudfront, CloudBerry, JWPlayer and Wordpress"


 We have tons of old video going back to 1997 that I have been capturing as MPG files over the past few years with WinTV boxes. They then sat unloved on a harddrive until now. We have recently got family requests for copies of some of the videos and it prompted me to finally do something. I had considered burning DVDs but they are just going to get lost/scratched and I&#39;ve always found generating them to be a complete pain. <p /><div>I switched my thinking to online site which we have used before for very short school-play type snippets. Password protected Vimeo worked fine for that. But I realised it was finally an opportunity to store the videos somewhere safe for the long-term so my focus switched to my old friend Amazon S3. Some fiddling and configuring later and it is working like a charm. So these are the steps:</div> <p /><div><ol><li>Run all the video files through <a href="http://handbrake.fr/">Handbrake</a> to create MP4s at the quality level you want. In our case a lot of the source is Video8 so it starts pretty rough in the first place.</li> <li>Create a bucket on Amazon S3 using the very useful <a href="http://cloudberrylab.com/">CloudBerry S3 Explorer</a></li><li>Note that if you are an S3 noobie, CloudBerry can guide you through the account setup</li><li>Make that bucket a Streaming Distribution. I got this wrong initially and the videos would have to download entirely before playing! See the CloudBerry <a href="http://blog.cloudberrylab.com/2009/12/how-to-configure-cloudfront-streaming.html">instructions here</a>.</li> <li>Use CloudBerry to upload the video to S3. CloudBerry has a throttle so you can keep working away and not saturate your broadband</li><li>Now on your Wordpress blog, you install the <a href="http://www.longtailvideo.com/addons/modules/148/JW-Player-Plugin-for-WordPress?q=">JW Player Plugin</a> and follow the on-screen instructions.</li> <li>Once the video is uploaded you need to get the streaming code for it. CloudBerry can generate the code for you but it is for generic HTML pages, not the WP Plugin. But you use the code CloudBerry gives you as a starting point (see below).</li> <li>Also, all the discussion in the CloudBerryinstructionsabout crossdomain.xml and hosting the JW Player on S3 isirrelevantif you use the plugin and are streaming</li><li>Create a new Wordpress Page or Post. Make it password protected if it is stuff that is not for broadcast to a wider audience</li> <li>Add the following to the page: <span style="font-family: Georgia, Times New Roman, Bitstream Charter, Times, serif; font-size: 13px; line-height: 19px;">[jwplayer config=&quot;ConorVids1&quot; file=&quot;BlahBlah.mp4&quot; streamer=&quot;rtmp://<a href="http://whatever.cloudfront.net/cfx/st/mp4:/">whatever.cloudfront.net/cfx/st/mp4:/</a>&quot; provider=&quot;rtmp&quot;]</span></li> <li><span style="font-family: Georgia, Times New Roman, Bitstream Charter, Times, serif; font-size: 13px; line-height: 19px;"></span>You use the info that Cloudberry gave you above to fill out the file and streamer details. The config thing is just a JWPlayer config that you create in the Wordpress settings to suit the height/width of your video.</li> <li>Save</li><li>Done!</li></ol>So far it&#39;s working like a charm. I&#39;ll spend the next few weeks with MP4 conversions and uploads happening in the background until it is all up there, safe and accessible to the family.</div> <div></div>
 