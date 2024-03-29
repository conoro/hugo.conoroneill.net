+++
aliases = ["/node-v01040-and-v0127-for-arm-v7-raspberry-pi-2-banana-pi-odroid-c1-available/","/2015/07/11/node-v01040-and-v0127-for-arm-v7-raspberry-pi-2-banana-pi-odroid-c1-available"]
date = "2015-07-11T19:56:57+01:00"
draft = false
title = "Node v0.10.40 and v0.12.7 for ARM v7 and v6 (Raspberry Pi, Raspberry Pi 2, Banana Pi, ODroid C1) available"
description = "I compiled both on a Banana Pi for a change. Nothing special for the 0.12 build, and ./configure --without-snapshot for the 0.10 build"
slug = "node-v01040-and-v0127-for-arm-v7-raspberry-pi-2-banana-pi-odroid-c1-available"
+++

I compiled both on a Banana Pi for a change. Nothing special for the 0.12 build, and ./configure --without-snapshot for the 0.10 build.

"make test" threw up the usual 7 minor errors or so.

I ran both Banana Pi and Raspberry Pi 2 without any immediate obvious issues.

Enjoy.

* [node-v0.10.40-linux-arm-v7.tar.gz](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/07/node-v0.10.40-linux-arm-v7.tar.gz)
* [node-v0.12.7-linux-arm-v7.tar.gz](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/07/node-v0.12.7-linux-arm-v7.tar.gz)

* [node v0.10.40 release notes](http://blog.nodejs.org/2015/07/09/node-v0-10-40-maintenance/)
* [node-v0.12.7 release notes](http://blog.nodejs.org/2015/07/10/node-v0-12-7-stable/)


```bash
mkdir nodetemp
cd nodetemp
wget https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/07/node-v0.10.40-linux-arm-v7.tar.gz
tar -zxvf node-v0.10.40-linux-arm-v7.tar.gz
cd usr/local
sudo cp -R * /usr/local/
```

UPDATE: I also built 0.10.40 for Raspberry Pi 1 (i.e. Original Model) ARM V6 on a Series 1 Model B:
* [node-v0.10.40-linux-arm-v6.tar.gz](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/07/node-v0.10.40-linux-arm-v6.tar.gz)

UPDATE 2: I also built 0.12.7 for Raspberry Pi 1 (i.e. Original Model) ARM V6 on a Series 1 Model B:
* [node-v0.12.7-linux-arm-v6.tar.gz](https://d2j17b10ywb1i7.cloudfront.net/wp-content/uploads/2015/09/node-v0.12.7-linux-arm-v6.tar.gz)
