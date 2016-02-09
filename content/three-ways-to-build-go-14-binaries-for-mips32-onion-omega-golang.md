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

## Linux (or Linux VM on Windows)
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

## Windows 10
I was very surprised this worked but of course Go is strongly cross-platform. My standard build setup for Node.js native modules did the trick. You'll probably need Visual Studio Community 2015 and Git for Windows. Then:

Open a CMD prompt (note I have all my code on D: drive)

```
d:
cd gitwork
git clone https://github.com/gomini/go-mips32.git
cd go-mips32\src
set GOOS=linux
set GOARCH=mips32
make.bat
```

I then created a simple CMD file which sets everything up when I need to build for MIPS so it doesn't interfere with my main Go install.

```bat
set GOOS=linux
set GOARCH=mips32
set GOROOT=d:\gitwork\go-mips32
set GOPATH=d:\gitwork\go
set PATH=d:\gitwork\go-mips32\bin;%PATH%
CMD
```

When I launch that, I can do the usual go build filename.go. Note that the MIPS port seems to be able to share the same GOPATH as my x86-64 one. Not sure that will work in every case tho e.g. If C modules are bound?

For Windows I use WinSCP to copy the files to the Omega. For some reason Filezilla SFTP has a problem talking to it.

## Docker Container on Windows
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

1. Install [Docker Toolbox for Windows](https://www.docker.com/products/docker-toolbox). It'll also install VirtualBox if you don't already have it.
2. Run a Docker shell and type:

```
docker run -t -i conoro/go-mips32:v2 /bin/sh
```

3. You'll now be at a Linux prompt and you can type:   _go version_
4. Then create a Hello World using:    _vi helloworld.go_

```go
package main

import "fmt"

func main() {
	fmt.Println("Hello, Conor")
}
```

5. Compile it with:   _go build helloworld.go_
6. Copy it to the Onion Omega with:     _scp helloworld root@ip-of-your-onion/helloworld_
7. Open a shell on your Omega with the webapp or Putty and just type:   _helloworld_

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

I'm looking forward to running a lot more code on the Omega now.

Next step with the Dockerfile is to add some shared directories so I can develop in the main OS and just use Docker for the compilation piece.
