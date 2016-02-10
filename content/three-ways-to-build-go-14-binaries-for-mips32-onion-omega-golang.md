+++
Categories = []
Description = "An unofficial port of Go 1.4 to MIPS32 means the Onion Omega and other Atheros AR9331 boards can run proper Go binaries without the need for gccgo. Here are three ways (Linux, Windows and Docker) you can build those binaries."
Tags = []
date = "2016-02-08T17:43:26Z"
title = "Three ways to build Go 1.4 binaries for MIPS32 Onion Omega #golang #docker"

+++

I previously [wrote about using gccgo](http://conoroneill.net/onion-omega-first-impressions-running-golang-nodejs/) to build Go binaries for the [Onion Omega](https://onion.io/) due to Go's lack of support for MIPS CPUs. But TBH it's a pain in the butt. Things were looking up when it was revealed that Go 1.6 would have MIPS support but sadly it's for MIPS64 only, for datacenter applications I guess.

![Onion Omega](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2016/02/onion_omega_small.jpg)


However [Cathal Garvey](https://twitter.com/onetruecathal) discovered a [GitHub repo](https://github.com/gomini/go-mips32) where some lovely person has ported v1.4.2 of Go to MIPS32 and it works perfectly on the Onion Omega (and presumably all other Atheros AR9331 boards).

This is a huge jump forward for the Onion Omega. Language support has been a bit of a problem for me with both Node.js and Go not really being usable there until now.

Due to the lack of storage on the Omega, you won't be able to install the full Go build system there so a cross-compilation setup is needed.

I've been able to build the binaries on Linux, Windows and in a Docker container. All are easy.

# Linux (or Linux VM on Windows)
Following [Cathal's simple instructions](http://www.black-swift.com/forum/suggestion-box/59-go-1-4-2-on-black-swift), I was able to build Go for MIPS32 in a few minutes in a Linux VM on my main Windows machine. I then cross-compiled a Hello World and scp'ed it to the Omega. It worked first time!

My steps:

```
cd
git clone https://github.com/gomini/go-mips32.git
cd go-mips32/src
export GOOS=linux
export GOARCH=mips32
sudo mkdir /opt/mipsgo
./make.bash
cd ..
sudo cp -R * /opt/mipsgo
export GOROOT=/opt/mipsgo
export PATH=/opt/mipsgo/bin:$PATH
vi helloworld.go
go build helloworld.go
```

# Windows 10
I was very surprised this worked but of course Go is strongly cross-platform. My standard build setup for Node.js native modules did the trick. You'll probably need Visual Studio Community 2015 and Git for Windows. Then:

Open a CMD prompt (note I have all my code on D: drive)

```dos
d:
cd gitwork
git clone https://github.com/gomini/go-mips32.git
cd go-mips32\src
set GOOS=linux
set GOARCH=mips32
make.bat
```

I then created a simple CMD file which sets everything up when I need to build for MIPS so it doesn't interfere with my main Go install.

```dos
set GOOS=linux
set GOARCH=mips32
set GOROOT=d:\gitwork\go-mips32
set GOPATH=d:\gitwork\go
set PATH=d:\gitwork\go-mips32\bin;%PATH%
CMD
```

When I launch that, I can do the usual go build filename.go. Note that the MIPS port seems to be able to share the same GOPATH as my x86-64 one. Not sure that will work in every case tho e.g. If C modules are bound?

For Windows I use WinSCP to copy the files to the Omega. For some reason Filezilla SFTP has a problem talking to it.

# Docker Container on Windows

## Hello World
To get more familiar with Docker I decided to create a Docker image that others can use. That turned out to be pretty easy too. Here is the Dockerfile:

```
FROM alpine:3.3

ENV GOLANG_VERSION 1.4.2
ENV GOLANG_SRC_URL https://github.com/gomini/go-mips32.git
ENV GOOS linux
ENV GOARCH mips32
ENV GOROOT /usr/local/go

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
        bash \
        git \
        file \
        ca-certificates \
        gcc \
        musl-dev \
        openssl \
        openssh \
	\
  && cd /usr/local/ \
	&& git clone "$GOLANG_SRC_URL" go \
	&& cd /usr/local/go/src \
	&& ./make.bash \
	\
	&& apk del .build-deps

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN rm -rf "$GOROOT/src"
RUN rm -rf "$GOROOT/test"
RUN rm -rf "$GOROOT/doc"
RUN mkdir -p "$GOPATH/src" "$GOPATH/pkg" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH/src
```

And you can grab the image from [Docker Hub here](https://hub.docker.com/r/conoro/go-mips32/).

The full set of steps for Windows are as follows:

* Install [Docker Toolbox for Windows](https://www.docker.com/products/docker-toolbox). It'll also install VirtualBox if you don't already have it.
* Run a Docker shell and type:

```
docker run -t -i conoro/go-mips32:v1 /bin/sh
```

(Note v2 has some problems I need to fix so you'll need to manually install openssh and git on v1)

* You'll now be at a Linux prompt and you can type:   _go version_
* Then create a Hello World using:    _vi helloworld.go_

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, Conor")
}
```

* Compile it with:   _go build helloworld.go_
* Copy it to the Onion Omega with:     _scp helloworld root@ip-of-your-onion/helloworld_
* Open a shell on your Omega with the webapp or Putty and just type:   _helloworld_

## Web App
A more advanced example which also works perfectly is to run a web-app using the [Gin](https://github.com/gin-gonic/gin) framework. For that, all you need to do is:

```bash
go get github.com/gin-gonic/gin
vi gintest.go
```

then in vi:

```go
package main

import "github.com/gin-gonic/gin"

func main() {
    r := gin.Default()
    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{
            "message": "pong",
        })
    })
    r.Run() // listen and server on 0.0.0.0:8080
}
```
Then build that, scp it to the Omega and run it. Then open http://ip-of-your-onion:8080/ping to see everything working nicely.

![Gin Ping Onion Omega](http://conoroneill.net.s3.amazonaws.com/wp-content/uploads/2016/02/gin_ping_omega.jpg)

Note I also built this using the Windows setup for comparison and it worked too.

## Database
Not so much luck with embedded databases I'm afraid. I suspect Bolt and LevelDB are using some more advanced filesystem features which are causing issues on OpenWRT. I lack the expertise to debug.

* [Bolt](https://github.com/boltdb/bolt) has some CPU specific code which prevented building. I added an entry for MIPS32 (based on i386) and it then cross-compiled but throws error EINVAL when opening DB. Possibly OpenWRT FS related or down to bug in the Go MIPS port. But I'm using Bolt with Stow successfully on another non-MIPS32 project.
* [go-sqlite3](https://github.com/mattn/go-sqlite3) has a C library dependency so it also won't cross-compile.
* I gave up trying to get [ql](https://github.com/cznic/ql) to do anything, even on Windows and Linux. It doesn't like standard SQL syntax and I ran out of patience with the lack of example code.
* [kv](https://github.com/cznic/kv) has no sample code and my frustration levels with nothing working meant I gave up instantly
* [tiedot](https://github.com/HouzuoGuo/tiedot) generates a large number of massive files which the Onion wouldn't be able to handle. If I can get it down to LevelDB sizes, I might retry. Actually it doesn't like 32-bit systems so forget that.
* [goleveldb](https://github.com/syndtr/goleveldb) looked like it would be perfect but it crashes trying to open a DB it created on the Onion. I have a feeling this is a bug in the MIPS32 port of Go. The crash happens in the Snappy library from what I can see. It can create an empty DB and it can read an empty DB but it crashes on a DB that has entries whether the DB was created on the Onion or on Windows.
* [gkvlite](https://github.com/steveyen/gkvlite) - It works! Hurrah! Well the sample code works. Now to try it on some simple stuff I've done elsewhere
* [diskv](https://github.com/peterbourgon/diskv) - Double hurrah, it seems to work too.

# Conclusion
I'm looking forward to running a lot more code on the Omega now.
