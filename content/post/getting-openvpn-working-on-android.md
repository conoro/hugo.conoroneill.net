+++
aliases = ["/getting-openvpn-working-on-android/","/2010/08/23/getting-openvpn-working-on-android"]
date = "2010-08-23T07:52:08+01:00"
draft = false
title = "Getting OpenVPN working on Android"
description = ""
slug = "getting-openvpn-working-on-android"
+++

#"Getting OpenVPN working on Android"


 There are many uses for a VPN and they are generally very easy to setup on desktop computers. The experience with phones can be variable. iPhone is a doddle but Android is a horror (see my last post). The built-in PPTN VPN is utterly broken and does not work over 3G at all or for more than a few minutes on Wifi. The steps to get an alternative working on a HTC Desire are as follows:<br /> <ol><li>Brace yourself</li><li>Install Windows OpenVPN and get it working on your PC with your VPN provider</li><li>Root your Android phone. If you don&#39;t know how to do this, stop reading now.</li><li>Replace the standard ROM with the latest community Froyo. Either <a href="http://forum.xda-developers.com/showthread.php?t=719544">Cyanogen 6.0 Nightly</a> or <a href="http://forum.xda-developers.com/showthread.php?t=690477">DeFroST </a>are good(I use DeFroST). OpenDesire does not seem to work in the later steps of this process and I haven&#39;t had a chance to try any of the Modaco ones with Sense still enabled.</li> <li>Install the Google Apps add-on too if your ROM doesn&#39;t include them.</li><li>In Android Market, install the &quot;OpenVPN Settings App&quot;</li><li>Note this is not the same as the OpenVPN Settings Page in Network-&gt;Settings. I wasted a ridiculous amount of time trying to get Cert files etc working there. Avoid it. That settings page is the source of most of the confusion around OpenVPN on all the forums. I&#39;m sure there is a use for it if you have your own keys/certs etc but not for generic VPN users.</li> <li>Copy the config directory from C:Program FilesOpenVPN (including the sub-dir) on your PC to a directory like openvpn on the SD Card on your phone</li><li>Go to that OpenVPN Settings App you installed</li><li>Tell it where you have stored the config files and it should show you the configurations you copied from the PC</li> <li>Tap on the config you want and all going well, it will connect for you</li><li>You are in business!</li><li>I&#39;ve noticed that it sometimes disconnects after a minute or so and then reconnects and stays solid after that.</li> <li>All of the above works on both WiFi and 3G</li></ol><br />So Google, any ETA on fixing all those built-in VPN bugs?
 