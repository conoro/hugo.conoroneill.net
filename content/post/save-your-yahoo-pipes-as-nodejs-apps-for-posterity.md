+++
date = "2015-06-06T15:06:15+01:00"
draft = false
title = "Save your Yahoo Pipes as Node.js Apps for posterity"
description = "I swore I'd never use another Yahoo product after the cultural terrorism of their Geocities shutdown. Now one of their few bright lights of the past decade is biting the dust. However some very very smart person wrote some code two years ago which you may find useful. It converts your Pipes to Node.js apps."
slug = "save-your-yahoo-pipes-as-nodejs-apps-for-posterity"
+++

I swore I'd never use another Yahoo product after the cultural terrorism of their Geocities shutdown. Now one of their few bright lights of the past decade, Pipes, is biting the dust. However a very very smart person wrote a program called [pipes2js](https://github.com/neyric/pipes2js) three years ago which you may find useful. It converts your Pipes to Node.js apps!

![RIP Pipes](https://s3-eu-west-1.amazonaws.com/conoroneill.net/wp-content/uploads/2015/06/rip_pipes.png)

Installation is a tiny bit different from the instructions as it doesn't seem to be on NPM any more. Here's what worked for me on a Fedora 22 Virtual Box. I assume OSX would be similar. I might try Windows 8.1 later for the laugh.

The steps are as follows:

* sudo npm install -g git://github.com/neyric/pipes2js.git
* Go to [Yahoo Pipes](https://pipes.yahoo.com/pipes/)
* Get the ID of each Pipe from its URL
* pipes2js the_id_of_your_pipe
* cd pipes/the_id_of_your_pipe/
* Edit package.json and change "pipes2js": "0.0.1" to "pipes2js": "git://github.com/neyric/pipes2js.git"
* npm install .
* node run.js

The sad reality for me is that most of my Pipes are no longer functional as they use the old brilliantly simple but deprecated Twitter APIs (shakes fist at Twitter too). But it's nice to be able to keep some sort of copy and give 2 fingers to the purple charlatans.

Update: It runs fine on Windows 8.1 if you have the various Visual Studio Express bits installed to compile Native Node modules. You may also have to run pipes2js with the full path to pipes2js.cmd so Windows can find it.
