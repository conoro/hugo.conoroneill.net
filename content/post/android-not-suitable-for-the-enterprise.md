+++
aliases = ["/android-not-suitable-for-the-enterprise/","/2010/08/22/android-not-suitable-for-the-enterprise"]
date = "2010-08-22T15:51:46+01:00"
draft = false
title = "Android not suitable for the Enterprise?"
description = ""
slug = "android-not-suitable-for-the-enterprise"
+++

#"Android not suitable for the Enterprise?"


 I&#39;m been trying and failing to get two features working on Android over the weekend: VPN and Proxy. A ton of googling revealed that both are utterly broken and have been since V1.0 of Android. Whilst my use-case is trivial (getting Facebook Places working outside of the US), the much bigger use case is a much bigger deal: the Enterprise. <p /><div>I have read tons of posts with people pulling their hair out as they either cannot get these features working or can&#39;t get them working reliably. Even worse, lots of people have returned their Android phones since they simply don&#39;t work in an Enterprise setting.</div> <p /><div>The problems are as follows:</div><p /><div><ol><li>PPTP VPN - Works intermittently over WiFi, doesn&#39;t work at all over mobile data.</li><li>Android VPN in general not compatible with Cisco VPNs</li> <li>OpenVPN (community effort) requires PKCS12 files for the security bit. Cannot get this working with a generic VPN provider.</li><li>There is NO, you heard me, NO support for web proxies in Android. This is incredible for a modern OS. You can find some hacks for basic HTTP proxies on rooted phones and Cyanogen has built this into his latest ROMs but there is no support anywhere for SOCKS proxies.</li> <li>You can use Mozilla Fennec as your web-browser if you need SOCKS but only if you want your 1GHz phone to run at the speed of treacle and have the browser hang constantly.</li></ol><div>It begs the question, how do Google employees access the Google network on their phones?</div> </div>
 