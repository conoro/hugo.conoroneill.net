+++
date = "2024-08-18T06:34:48.313Z"
draft = false
title = "Running Postgres inside Node-RED via WASM and PGlite"
slug = "running-postgres-inside-node-red-via-wasm-and-pglite"
+++

I've been using [Node-RED](https://nodered.org/) for many years, mostly for fun and personal projects. The coolest thing I did with it was to build the prototype for the [NodeConf EU 2018 badge](https://www.youtube.com/watch?v=jSirIWSbF7g) back-end. 

But 2024 is the first time I've worked with it in production, with the [ServisBOT](https://servisbot.com) team doing some pretty incredible things using it. One aspect I've been interested in recently is local persistence beyond context stores. Of course my first port of call was the world's greatest database, SQLite. The Node-RED module for this works really well and I've been very happy with the results I'm seeing so far.

But then two weeks ago, fans of the world's second greatest database, Postgres, started talking about [PGlite](https://pglite.dev/) and I found myself going down a fantastic rabbit-hole. PGlite was created by the people at [ElectricSQL](https://electric-sql.com/). It's a WASM build of Postgres so it can be run in the browser, in Node.js or in Bun. The latter two were the exciting ones for me.

So of course I immediately wondered "could I run that in Node-RED?". It turns out I can. And it works great!

Introducing [Node-RED PGlite](https://github.com/conoro/node-red-pglite)

![PGLite in Node-RED](/images/2024/08/pglite.png)

As always with any Conor weekend project, the code is an abomination (IANAP) but it seems to work. I basically took the SQLite module and bashed at it until I had a working PGlite module. Due to the early stage status of PGlite (V0.2.x at the moment) some of the SQLite features have been ripped out of the module, like prepared statements.

But all the basic stuff seems to work fine. It supports PGlite databases both on-disk and in-memory.

Even more impressively, the ElectricSQL team also got a bunch of Postgres extensions working in PGlite. For fun, I have enabled the hstore key/value extension and the pgvector vector database extension. As of v0.2.2, PGlite has Full Text Search (FTS) working too.

Everything is over on GitHub. I've included a set of simple examples of everything in a sample flows.json. I haven't submitted the module to the Node-RED library yet but if there's interest I will. Work commitments mean I'm unlikely to be able to give it much attention tho.

I hope you find it useful but obviously do not use this in Production. It is wide open to SQL injection attacks and I have no idea how it performs under load. I have only run it on a Raspberry Pi 5 with 8GB RAM and an NVMe drive in simple scenarios.


