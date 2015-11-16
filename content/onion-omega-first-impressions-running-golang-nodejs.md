+++
Description = "This new $25 IoT board sits between microcontrollers and Raspberry Pis. Its small size is the big attraction. But language support is currently weak at this early stage"
date = "2015-11-16T22:35:48Z"
title = "First impressions of @OnionIoT Omega. Also running #golang 1.1.2 and #nodejs 0.10.5 on MIPS"

+++
I did a splurge of backing IoT KickStarters a few months ago and the [Onion Omega](https://onion.io/omega/) is the first one to land in my postbox. It's a tiny (barely bigger than an SD card) board running the same basic guts as many OpenWRT routers i.e. 400 MHz Atheros MIPS CPU with 64MB of DRAM and 16MB of Flash. 

![Onion Omega](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2015/11/omega_sd.jpg)

If you're not familiar with [OpenWRT](https://openwrt.org/), it's an Open Source community replacement firmware for many routers (similar to DD-WRT that I've used many times) and is Linux under the hood. You generally do your own custom Firmware builds which bundle exactly what you want but you can also install packages via the opkg tool.

Obviously 400MHz with tiny RAM cannot compete with an RPi but it is far more powerful than most MCUs and runs Linux. The question is whether this middle ground addresses a big enough market, particularly when the price point is almost the same as an RPi Model A and you need to buy add-on cards to work easily with it. I'm not sure yet.

The Onion team are currently building a Web UI and an IoT "Cloud" as value-adds and of course everything is OpenSource. 

The fact that it just launched means that the software story isn't great right now. The KickStarter mentions things like Node but that isn't available in a supported way. Also the effort around accessing GPIOs etc is focused on Python. And add-on boards like the OLED screen I bought have no support yet.

![Onion Omega Kit](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2015/11/omega_kit.jpg)

## Summary Opinion
Overall it's a nice board but the lack of "buzz" around it has me a little worried. The number one thing that projects like this need is community. I think the CHiP might steal a lot of its thunder with more welly at a much lower pricepoint. But perhaps a focus on realtime embedded applications will help here.

I'd like to see a library like WiringPi built for it that can easily have wrappers for others languages implemented.

I think it'll be ideal as a home API server that I can put anywhere and forget about. 

Another area it could shine, due to its tiny size and low power consumption is robotics. See my comment below about [Gobot](http://gobot.io/).

## Node.js partial success
After an initial play around with it, I decided to try out Node and Go. Node was [built by a community member](https://community.onion.io/topic/46/simple-node-js-wrapper-samples) but is back on version 0.10.5. 

I copied the Node executable and libv8 to a USB stick and plugged that into the Onion standard "dock". I mounted it and ran hello world successfully. Hurrah! 

But then I realised it doesn't have NPM. So I put together a simple Tweeting App, did the NPM install on my Fedora VM and then copied everything to the USB stick. 

The code which ran fine on Fedora crapped out with "not authenticated" on the Onion. I tried two other Twitter modules with the same result. I wasn't able to see any other error apart from Twitter complaining about authentication. 

So I gave up on Node for the moment.

## Golang 1.1.2 first failed attempt
On to Go and a giant big rabbit hole.

So you can't get a recent version of Go for MIPS. However, one smart person [forked OpenWRT and added Go support](https://github.com/GeertJohan/openwrt-go) via [gccgo](https://gcc.gnu.org/onlinedocs/gccgo/Invoking-gccgo.html). Yay it's Go, boo it's Go 1.1.2. 

But I thought it'd be a good experience to try building OpenWRT from scratch anyway. The [instructions here](https://github.com/GeertJohan/openwrt-go/issues/2) and [here](http://www.sajalkayan.com/post/golang-openwrt-mips.html) are pretty straightforward and I managed to build the Gnu cross-compile toolchain inside a Fedora 22 VM on Windows 10.

NOTE: DO NOT DO THE FOLLOWING. IT DIDN'T WORK. FOLLOW THE STEPS LATER FOR CLEAN NEW OPENWRT

```
git clone git@github.com:GeertJohan/openwrt-go.git openwrt
cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a
cp ~/Desktop/scons-2.3.5.tar.gz dl (needed to download this manually as it was missing)
cp ~/Desktop/openssl-1.0.2c.tar.gz dl (needed to download this manually as it was missing)
make menuconfig
```

In menuconfig you have to enable a few things:

* -> Advanced configuration options
* --> Toolchain options
* ---> C library implementation
* ----> Use eglibc
* -> Advanced configuration options
* --> Toolchain options
* ---> Select Build/Install gccgo

Then save and exit, followed by:

```
make
```

Several hours later on my old i7 laptop, I had everything I needed.

Then a simple helloworld Web Server helloweb.go that only uses standard library features: 

```
package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hi there, I love %s!", r.URL.Path[1:])
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":8080", nil)
}
```

Create ~/openwrt.config which consists of
```
export STAGING_DIR=/home/conor/openwrt/staging_dir 
export TOOLCHAIN_DIR=$STAGING_DIR/toolchain-mips_34kc_gcc-4.8-linaro_glibc-2.19 
export LDCFLAGS=$TOOLCHAIN_DIR/usr/lib 
export LD_LIBRARY_PATH=$TOOLCHAIN_DIR/usr/lib 
export PATH=$TOOLCHAIN_DIR/bin:$PATH
```

Then build it:
```
. ~/openwrt.config
mips_gccgo -Wall -o helloweb_static_libgo helloweb.go -static-libgo
```

I copied it over to the Onion but no joy. It just kept saying "not found". Distant memories told me this was related to libraries and versions but nothing I tried worked. So I took a break.

## Golang 1.1.2 second successful attempt
A while later I decided that what I needed to do was build OpenWRT for the Onion but then I hit a blocker. Onion support was added to OpenWRT in July but the latest version of the toolchain that included Go was from May. So I bit the bullet and manually "cherry-picked" [all of the author's changes](https://github.com/GeertJohan/openwrt-go/commits/add-gccgo-and-libgo?author=GeertJohan) from the older toolchain into the latest version of OpenWRT. 

You can get [the patchfile I generated here](https://gist.github.com/conoro/887362ebdbbada2cfbc6) and apply it.

NOTE: THESE STEPS WORK OK.

Now to build from scratch again:
```
sudo dnf install -y subversion binutils bzip2 gcc gcc-c++ gawk gettext flex ncurses-devel zlib-devel zlib-static make patch unzip perl-ExtUtils-MakeMaker glibc glibc-devel glibc-static quilt sed sdcc intltool sharutils bison wget

. ~/openwrt.config   (see the contents of that file in the first failed attempt)

rm -rf ~/openwrt
git clone git://git.openwrt.org/openwrt.git openwrt
cd openwrt
```

```
nano feeds.conf.default
```

and append the following:
```
src-git onion https://github.com/OnionIoT/OpenWRT-Packages.git
```

Then:
```
scripts/feeds update -a

make menuconfig
```

Note you have to include the same menuconfig settings as before i.e.

* -> Advanced configuration options
* --> Toolchain options
* ---> C library implementation
* ----> Use eglibc
* -> Advanced configuration options
* --> Toolchain options
* ---> Select Build/Install gccgo

Plus the following for both the Onion and USB stick. This uses [some instructions from the Onion site](https://github.com/OnionIoT/OpenWRT-Packages/wiki/Setting-Up-the-Cross-Compile-Environment):

1. Target System is Atheros AR7xxx/AR9xxx
2. Subtarget is Generic
3. Target Profile is Onion Omega
4. Target Images is squashfs
5. Add kmod-fs-vfat
6. Add kmod-nls-cp437

```
make
```

Several hours later again, I finally had [a version of the firmware that included Go support](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2015/11/openwrt-ar71xx-generic-onion-omega-squashfs-factory.bin) and ran on the Onion by doing the following on the Onion:

```
cd /tmp
scp conor@192.168.0.9:/mnt/disk2/software/openwrt-ar71xx-generic-onion-omega-squashfs-factory.bin .
sysupgrade openwrt-ar71xx-generic-onion-omega-squashfs-factory.bin 
```

## Hello World Web Server in Go on the Onion Omega
Back to helloworld on the Fedora 22 VM:
```
alias mips_gccgo='mips-openwrt-linux-gccgo -Wl,-R,/home/conor/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_glibc-2.19/lib/gcc/mips-openwrt-linux-gnu/4.8.3 -L /home/conor/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8.0-linaro_glibc-2.19/lib'

mips_gccgo -Wall -o helloweb_static_libgo helloweb.go -static-libgo
```

Copy to the Onion and run it with a simple ./helloweb_static_libgo

Hurrah, Hello World in Go on the Onion!

![I love mac and cheese](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2015/11/go_on_onion_omega_02.jpg)

## Tweeting from the Onion Omega in Go
I should have left it at that but no, I wanted to Tweet from the Onion. My problems multiplied. Basically, gccgo doesn't have all the bells and whistles of recent Go and can't handle included packages easily. After some reading and playing, I managed to build a Tweeting App that used the [Twittergo package](https://github.com/kurrik/twittergo). Note you need a local Fedora version of [Go installed and configured](https://golang.org/dl/) for "go get" to work (or just git clone). My $GOPATH is /home/conor/gitwork/go 

I used the [example from Twittergo](https://github.com/kurrik/twittergo-examples/blob/master/tweet/main.go) to send the tweet, with the same mods to remove paths from the imports as the other files.

```bash
. ~/openwrt.config

cd ~/gitwork/go/src/github.com
go get github.com/kurrik/twittergo
go get github.com/kurrik/oauth1a
go get github.com/kurrik/json
cd kurrik/json
mips-openwrt-linux-gccgo -c json.go
cd ../oauth1a
mips-openwrt-linux-gccgo -c oauth1a.go userconfig.go
cd ../twittergo
cp ../json/json.o .
cp ../oauth1a/oauth1a.o .
emacs twittergo.go  (change github.com/kurrik/oauth1a to oauth1a)
emacs models.go  (change github.com/kurrik/json to json)
mips-openwrt-linux-gccgo -c twittergo.go models.go
emacs tweetomega.go
mips_gccgo -Wall -o tweetomega main.go -static-libgo json.o  oauth1a.o twittergo.o
gedit CREDENTIALS
```


I was nearly there. The code ran but threw an error almost immediately about x509 root certs being missing. I ran all of the following, which seemed to fix it (but I'm not sure if all needed):

```bash
opkg update
opkg install ca-certificates
opkg install openssl-util
opkg install curl
wget http://curl.haxx.se/ca/cacert.pem
mv cacert.pem /etc/ssl/certs/ca-certificates.crt
scp conor@192.168.0.9:/mnt/disk2/software/CREDENTIALS .
scp conor@192.168.0.9:/mnt/disk2/software/tweetomega .
./tweetomega
```

And finally ta-daaaa, a Tweet from the Omega:

![Tweetin Omega](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2015/11/hushvine_onion_01.jpg)

I now suspect that the Node.js error may have been exactly the same thing but just hidden so I'll go back and try the same for it.

## Final notes
1. That custom firmware I built is missing all of the Onion's own stuff and I'm not sure how to add that. However you can easily re-install the latest factory Onion image by wgetting it using the URL you find [in this file](http://cloud.onion.io/api/firmware/stable.json) into /tmp using sysupgrade name_of_image.
2. We really need Go 1.6 to support MIPS. I think the Onion is a great device for running Go. We might even get [Gobots](http://gobot.io/) running. 

