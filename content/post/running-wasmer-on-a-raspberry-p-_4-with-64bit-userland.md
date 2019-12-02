+++
date = "2019-12-02T07:00:00+00:00"
draft = false
title = "Running Wasmer on a Raspberry Pi 4 with 64-bit userland"
description = "Just some info collected from trying to set it up myself to save you the hassle."
slug = "running-wasmer-on-a-raspberry-pi-4-with-64bit-userland.md"
+++

Like many people I'm excited by all of the possibilities opened up with [WebAssembly/WASM](https://webassembly.org/). Most recently I've been keeping an eye on [Wasmer](https://wasmer.io/) and similar projects that enable WASM outside of the browser.

So when I saw that you can now [run it on a Raspberry Pi](https://medium.com/wasmer/running-webassembly-on-arm-7d365ed0e50c), I had to give it a try. But it's not quite as straightforward as the article suggests and this is what I had to do to get it working.

I did all of these steps on a 4GB Pi 4 running the latest version of Raspbian Buster.

* First, you have to switch to a 64-bit kernel to get started. That's pretty easy. Edit /boot/config.txt and add the line `arm_64bit=1`. Then reboot
* I'm not sure if it's needed but I did a full `sudo rpi-config` too to update. And rebooted again.
* But this isn't enough because the Pi still uses a 32-bit userland. Even if you successfully run the Wasmer installer, the wasmer binary won't run. I read lots of threads with lots of complicated setups involving Docker and other distros etc but it turns out that the solution is just chroot. And luckily [someone else figured out](https://raspberrypi.stackexchange.com/a/101802) those details.
* So you just need to do the following:

```bash
sudo apt install -y debootstrap schroot
cat << EOF | sudo tee /etc/schroot/chroot.d/pi64
[pi64]
description=V3D arm64 testing
type=directory
directory=/srv/chroot/pi64
users=pi
root-groups=root
profile=desktop
personality=linux
preserve-environment=true
EOF
sudo debootstrap --arch=arm64 buster /srv/chroot/pi64
sudo schroot -c pi64 -- apt install -y curl sudo
schroot -c pi64
```

* You are now running in a 64-bit shell so you can now install Wasmer with

`curl https://get.wasmer.io -sSfL | sh`

* and then install and run [rustpython](https://wapm.io/package/rustpython)

```bash
$ wapm install rustpython
$ wapm run rustpython
>>>>> 2+2
4
```

That's incredibly cool. A Rust version of Python running via WebAssembly on a <$70 computer.

Note tho that this mixed 64-bit and 32-bit setup is still experimental and I've seen some glitches like the Raspbian file manager crashing at launch.
