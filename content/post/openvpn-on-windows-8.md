+++
aliases = ["/openvpn-on-windows-8/","/2013/03/06/openvpn-on-windows-8"]
date = "2013-03-06T08:52:11Z"
draft = false
title = "OpenVPN on Windows 8"
description = ""
slug = "openvpn-on-windows-8"
+++

#"OpenVPN on Windows 8"

I'm two months using Windows 8 64-bit on my desktop and I'm still ok with it. The only real weirdness is a lot of disk churning even when nothing is happening. I turned off indexing but to no avail.

The only major annoyance has been OpenVPN. Whilst it works fine when it's on, the problem arises when I disconnect or shut it down. The routing gets all messed up and I cannot connect to any external site. The fix is to disable/re-enable the network adapter which is a total pain in the ass.

I did some searching but didn't find anyone else having the same issue. But I did find that there is finally [a] a new version of OpenVPN and [b] a 64-bit version. Even better, <a href="http://openvpn.net/index.php/open-source/downloads.html">this official version</a> works with saved passwords, which the old one didn't.

I've been running it all morning and testing disconnect/re-connect. All seems fine. So if you are a BlackVPN or similar user and you are having Win 8 issues, give it a go. Obviously, like all other versions of OpenVPN, run as Administrator.
