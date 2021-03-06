+++
aliases = ["/tingodb-and-sqlite-instead-of-mongodb-and-mysql-for-tiny-projects-or-raspberry-pi/","/2015/09/20/tingodb-and-sqlite-instead-of-mongodb-and-mysql-for-tiny-projects-or-raspberry-pi"]
date = "2015-09-20T13:03:54+01:00"
draft = false
title = "TingoDB and SQLite instead of MongoDB and MySQL for tiny projects or Raspberry Pi"
description = "As an old Embedded guy who actually cares about resource usage, I've been bothered for quite a while by the number of trivial projects out there that require a full-blown MongoDB or MySQL server to operate. It's a particular problem on the Raspberry Pi or small DigitalOcean Droplets. In many cases a simple SQLite DB or TingoDB is more than sufficient. Here's some notes on using them. "
slug = "tingodb-and-sqlite-instead-of-mongodb-and-mysql-for-tiny-projects-or-raspberry-pi"
+++

As an old Embedded guy who actually cares about resource usage, I've been bothered for quite a while by the number of trivial Node.js projects out there that require a full-blown MongoDB or MySQL server to operate. It's a particular problem on the Raspberry Pi or small [DigitalOcean](https://www.digitalocean.com/) Droplets. In many cases a simple SQLite DB or TingoDB is more than sufficient.  

If your Web App has 2 registered users and 100 visitors per day, may just maybe you don't need MongoDB or MySQL. I have a set of small Node.js projects now where I use the following combinations and they all work well. Anything you are doing in-house on a Raspberry Pi should absolutely use one of these. In fact I'm not even sure recent Mongos run on the RPi 1?

## Dulcimer, LevelUP and LevelDB
[LevelDB](https://github.com/google/leveldb) and [LevelUP](https://github.com/Level/levelup) are well known and widely used. I think [Dulcimer](https://github.com/fritzy/Dulcimer) probably less so. It's a [Mongoose-ish](http://mongoosejs.com/) ORM for LevelDB. I was able to tie it into [PassportJS](http://passportjs.org/) without much effort to handle users/sessions/etc. I have two setups using it and both have been running for many months on d'internet with zero problems. In one case it's a small stats dashboard running on DigitalOcean with a few registered users who check it maybe once a day. The other one is a registration system for people requesting access to some internal work resources. All submissions go into LevelDB. This is running on [OpenShift Online](https://www.openshift.com/products/online).

## TingoDB and Tungus
Of the NoSQL file-based databases, this seems to have the lowest profile and I think it deserves a _lot_ of attention. [TingoDB](https://github.com/sergeyksv/tingodb) emulates most of the common MongoDB APIs and [Tungus](https://github.com/sergeyksv/tungus) emulates most of the Mongoose ones. I was able to take a [random Node.js project](https://github.com/sahat/tvshow-tracker) off GitHub which is based on MongoDB/Mongoose/Mongoskin and get it running using TingoDB/Tungus on an RPi with only a tiny bit of fiddling with the [Agenda](https://github.com/rschmukler/agenda/) module. This is huge for those wanting to do NoSQL on Raspberry Pi. I'll be playing a lot more with this setup in the coming weeks. You really should too.

## SQLite, Knex and Bookshelf
Whilst the whole hipster dev world thinks NoSQL is the answer to everything, good old relational databases just keep on trucking. I've used [SQLite](https://www.sqlite.org/) many times over the years for simple projects and it has always worked well. I hadn't realised until recently that the main SQL ORMs on Node.js support it out of the box. So again, if you have a project that needs a relational DB and doesn't need huge scale, you should be looking at SQLite. I'm currently wrapping up a simple in-house project using SQLite with [Knex](http://knexjs.org/) and [Bookshelf](http://bookshelfjs.org/) on a Raspberry Pi. The DB hold simple relationships between devices and their status.


The latter two setups above also have the big advantage that you can use them in development or in the early production stages and then you can drop in MongoDB or MySQL at a later stage if needed, without any re-coding.
