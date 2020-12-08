+++
date = "2020-12-08T07:00:22Z"
draft = false
title = "Getting PCManFM on your Raspberry Pi to remember SMB/Samba passwords"
description = "A simple solution to an infuriating problem"
slug = "pcmanfm-raspberry-pi-smb-samba-password"
+++

It's always this time of year when I say I'll definitely blog more next year. I was also sure I'd blog tons during lockdown but I was busy doing other things.

This is the type of post I used to do very regularly on this blog so I thought I'd ease myself back in with a simple one.

If you access Samba/SMB shares on your home network via the stock PCManFM file manager on your Raspberry Pi, you'll probably have hit the problem that it forgets the password on reboot, even tho you ticked "remember forever". 

It's a surprisingly difficuly fix to find via Google but is easy to do.

* First install gnome-keyring which remembers your SMB passwords with `sudo apt install gnome-keyring`
* Then install seahorse which is a simple gnome-keyring GUI with `sudo apt install seahorse`
* Run seahorse by typing `seahorse` in a terminal and using instructions from [here](https://wiki.archlinux.org/index.php/GNOME/Keyring), do the following:
  * Select View > By Keyring 
  * If there is no keyring in the left column (it will be marked with a lock icon), go to File > New > Password Keyring and give it a name. 
  * You will be asked to enter a password. If you do not give the keyring a password, your SMB passwords will not be stored securely.
  * Finally, right-click on the keyring you just created and select "Set as default".

Now access an SMB share in the file manager, enter the password and tick "remember forever". After a reboot, go to the share again and you'll get straight in without being prompted for the SMB password.


