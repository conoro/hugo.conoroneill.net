+++
date = "2021-11-22T05:00:22Z"
draft = false
title = "The new MongoDB Atlas Data API is huge for No-Code and Low-Code Automation Platforms like Tines"
description = "Removing the need for an SDK to access a database empowers a legion of Citizen Non-Developers"
slug = "mongodb-atlas-data-api-huge-for-no-code-low-code-automation-platforms-like-tines"
+++

It looks like I first started talking about MongoDB online back in 2011 - We've come a long way baby.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Right, need to finish watching the MongoDB vids (easier than I thought) and then do an Amazon ELB setup for kicks.</p>&mdash; Conor O&#39;Neill (@conoro) <a href="https://twitter.com/conoro/status/74460796041695232?ref_src=twsrc%5Etfw">May 28, 2011</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

Mongo has remained one of my favourite tools for getting things done. I always think that's why it succeeded. Whilst the factions argued it out on HN, developers just got on with using it for practical purposes. 

One of my big frustrations on various personal projects in recent years was in failing to find an affordable easily-accessible scalable online datastore that could also be queried. The usual suspects like DynamoDB and Cosmos DB ended up being dead-ends where, with a bunch of SDKs, you could get data in, but you had to then move it somewhere else to do anything useful with it. Some of the newer Low-Code platforms also looked attractive initially until their pricing or performance went completely out of whack with barely a few thousand rows of data.

To my shame I have to admit to using SQLite on Dropbox and Google Sheets as my de-facto databases for many of these scenarios. Hell, I even investigated using the GitHub GIST API as some sort of JSON database. Don't worry, I gave up. 

When I started working for [Tines](https://www.tines.com), I instantly fell in love with its ability to connect to almost anything via bog-standard HTTP(S), Webhooks and common Auth protocols. It also has a simple persistent resource store and API for small amounts of data. For the vast majority of our customers' security use-cases, nothing more is needed. The output targets of most of the automations are not general databases, they are something like Email, JIRA, ServiceNow or Slack.

But when using Tines or other LCNC tools for more general automations, I often find myself wanting to store output data somewhere. That might be low-volume IOT data like home-office CO2 levels or specific Google Alerts or a Slack event history. That's how I ended up on Google Sheets as a pseudo-DB. It's accessible over REST, it uses standard Auth protocols, it's cheap and it scales to thousands of rows. However of course it does not do ACID, it blatantly overwrites rows, it's slow and you can't even easily find out if a Sheet already has a specific row of data. Because it's not a DB, it's a spreadsheet!

![Google Sheets](/images/2021/11/lcnc_alerts2.png)


And then I saw last week's announcement of the [MongoDB Atlas Data API](https://www.mongodb.com/blog/post/introducing-mongodb-atlas-data-api-now-available-preview) and you could not wipe the smile off my face, despite the vicious throat infection that currently has me in bed.

This isn't just close to what I need, it's exactly what I need. REST access to a full-blown online database that can then be used for whatever querying, analytics or visualisations I want to do afterwards 🤯

Even better - like everything historically with MongoDB, it just works! 5 minutes after reading the announcement I was writing and reading to/from a collection using cURL against my Atlas instance. 


```bash
curl --request POST \
  'https://data.mongodb-api.com/app/{{.RESOURCE.mongodb_data_api_app_id}}/endpoint/data/beta/action/insertOne' \
  --header 'Content-Type: application/json' \
  --header 'Access-Control-Request-Headers: *' \
  --header 'api-key: {{.CREDENTIAL.mongodb_data_api_key}}' \
  --data-raw '{
      "dataSource": "{{.RESOURCE.mongodb_cluster_name}}",
      "database": "learn-data-api",
      "collection": "people",
      "document": {
        "name": "John Sample",
        "age": 42
      }
  }'
```

30 seconds after that, I had copied those cURL commands as Tines HTTP requests with CTRL-C/CTRL-V and was reading and writing to MongoDB in our No-Code Automation platform. I don't think I've stopped grinning even whilst asleep.

[![Regex REad](/images/2021/11/mongodb_regex_read.png)](//conoroneill.net/images/2021/11/mongodb_regex_read.png)


I never thought I'd get this excited by a database API but it's a step-change moment for the growth of Low-Code and No-Code. The frustration of trying to do anything meaty with most of the toy online pseudo-databases in the LCNC world has been infuriating. I wonder how many projects started well and then hit a brick wall as soon as they tried to scale? I suspect many of the "Is it a Spreadsheet? Or is it a Database?" tools may start fading away as their limitations become more obvious. The brilliant trick with MongoDB Atlas is that it's suitable for both dabblers and hard-core fast-scaling apps and companies.

[![CO2 data into MongoDB](/images/2021/11/mongodb_tines.png)](//conoroneill.net/images/2021/11/mongodb_tines.png)

I've started switching the output of all of my GSheets-based [Tines Community Edition](https://www.tines.com/) automations to MongoDB Atlas and I'll fiiiiiiiinally start doing some decent queries on the data. I have months of office CO2 data that I have yet to crunch. But switching to storing that data in MongoDB literally took me another 5 minutes:

[![CO2 data inside MongoDB](/images/2021/11/mongodb_data2.png)](//conoroneill.net/images/2021/11/mongodb_data2.png)

Next up - all those Google Alerts into a proper database where they belong.

