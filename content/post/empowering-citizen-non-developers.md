+++
date = "2020-12-10T07:00:22Z"
draft = false
title = "Empowering Citizen Non-Developers"
description = "All this talk of low-code and no-code forgets the millions of citizen non-developer Excel ninjas"
slug = "empowering-citizen-non-developers"
+++

I've been thinking about tools for non-developers for several years. It seems to me that all the big players are missing out on a huge market. They keep talking about citizen developers, low-code and no-code. But the focus is on "code" so most of the world will self-select out of using any of those tools, including the no-code ones. Even the title of Satya Nadella's article this week is ["Want a More Equitable Future? Empower Citizen Developers"](https://www.wired.com/story/want-a-more-equitable-future-empower-citizen-developers/). And Google [announced a big revamp of Apps Script](https://developers.googleblog.com/2020/12/get-ready-to-up-your-apps-script.html) with a cool new IDE. For developers.


Back in the [FeedHenry](http://feedhenry.org) days we created a very useful feature set that enabled non-developer Enterprise employees to build forms-based mobile apps with a few clicks. No code necessary at all. It was fantastic for people involved in data collection. When Red Hat acquired FeedHenry, I thought the combination of mobile forms with a user-friendly version of their Business Process Manager tools would be a killer combo for an even wider range of people. But for a variety of reasons it never happened.

There is still no easy solution for non-technical people in that space.

This summer, I went to build a proof-of-concept of a wearables data collection and analysis tool, based on [Bangle.js](https://www.nearform.com/blog/bangle-js-hackable-oss-js-and-tensorflow-smartwatch/) (of course!). I wanted minimal effort, minimal code and as much off-the-shelf tooling as I could find. Damn was I disappointed. The data collection from the Bangle itself in a simple webapp required some code but I've done that multiple times using Web Bluetooth, so it was a copy/paste exercise. Once I had the "CSV" in the browser, I thought it would be trivial to automatically push it into the cloud somewhere and build an analysis dashboard.

Like many people I tried [AirTable](https://airtable.com) first but its pricing model is based on tiny amounts of data. I could get the data in easily enough but my view of it as "Cloud Excel on Steroids" turned out to be either wrong or out of date. And there is no way those prices make sense for the scale of what I was trying to do.

The simplest way to automatically get the data "somewhere" ended up being via the Firebase SDK. Only a few lines of JavaScript and no need to build an entire OAuth flow just to move some CSV around. Then I thought I'd use Google Data Studio to do the visualisation. But nope, there is no official connector between the two. There's some horrible Apps Script thing written by a Googler which didn't work for me. Ah but there is a connector from Data Studio to BigQuery and there is also a connector from BigQuery to Firebase. So a couple of BigQuery queries later and I had a pipeline from webapp to Data Studio to display the data the way I wanted. It was a couple of intermittent day's work but I'm an ex-developer so I could manage it. But damn all I wanted to do was easily get CSV from point A to point B in an automated way so I could visualise it. It should not be that hard.

We had the same problem in late 2018 trying to do visualisations of data from all the [NodeConf EU digital badges](https://www.nearform.com/blog/sending-1-24-million-mqtt-messages-from-nodeconf-eu-to-azure-and-lots-more-digital-badge-details/). We had 1.2 million rows of simple data in CosmosDB but no obvious way in Azure to do anything with it. PowerBI was an unusable disaster and direct SQL queries returned paginated data. Our live dashboard ended up using a crazy number of Azure features just to display a heatmap. For batch processing afterwards, what did we do? Export to CSV (again!) and [a] build a webapp which crunched the CSV directly for some visualisations and [b] load the CSV into Tableau to build the other visualisations.

![Swiss Army](/images/2020/12/swissarmy.jpg)

<span>Photo by <a href="https://unsplash.com/@michaelhlk?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Michael Heng</a> on <a href="https://unsplash.com/s/photos/swiss-army-knife?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText">Unsplash</a></span>

Now compare that to the Irish Government grant application I worked on recently with our Financial Controller. It required detailed analysis and presentation of hours worked by certain people on certain projects in certain time windows. Some people were excluded by location, some by daterange, some by project. The people/projects/date-ranges/locations/etc/etc all had to be configurable. All of the source data was in a SaaS timesheet tool called 10,000ft. It has some basic querying capability but really that's just used to generate, yes you guessed it, a CSV, so it can be properly analysed elsewhere.

Now the old dev in me would have loaded that CSV into a database and started running SQL queries against it. But our Financial Controller loaded it into Excel and started working her magic on it using Pivot Tables. And it was a joy to behold. Click, click, click, filter, BAM, data. "Can you show it by X?". Click, click, click, done. "How about....?". Click, click, done. I still can't quite wrap my head around the three dimensional manipulations that were going on across multiple tabs.

By any reasonable measure, what she was doing was programming, just not the type of programming we do. 

**And that was always the magic of Excel and Lotus 1,2,3. It empowered accountants and other non technical people to do incredibly complex tasks without ever thinking they were writing code. Even when they were writing complex formulae and macros.** 

IBM and all the other PC makers sold millions of computers to those people, not to developers.

For fun, I did load that CSV into SQLite and used a free ODBC connector to query it in Excel. It functioned fine but in 28 years of working I have never seen an accountant use ODBC in a spreadsheet.

I know of multiple consulting companies who charge millions of dollars in fees based on knowledge they have encapsulated in crazily-complex Excel spreadsheets too. And I'm sure they have filenames ending in FINAL_FINAL_USE_THIS_ONE. And they used CSV to get the data in.

I've also just realised that the vast majority of the tools I've written for myself over the past few years have been "ETL". Whilst they have mostly been "Website X to RSS" convertors (glares at most newspaper sites and now Vimeo), I also had to build RunKeeper-to-Endomondo, Withings-to-GSheets and Yunmai-to-CSV.

So where is Excel NG or Lotus 4,5,6 to get people out of XLSX-via-email mode? The thing that empowers those millions of people, but on the cloud. Where data flows from tool to tool and system to system without programming or damned OAuth. Where huge amounts of data can be crunched with a few clicks by an accountant and displayed exactly how it's needed. Where teams of people can work on the same data and the same "spreadsheet" at the same time. Where it's never a case of "oh, to do that complicated thing, you'll need to get a developer". Where you never have to call IT to get started on your "spreadsheet". Where it all just works as brilliantly as Excel has worked for all these years. And no, I won't have a word said against Excel.

I'm not talking about the innovation-free zone that is Google Sheets. It's definitely not that unusable monster Power BI. It really really isn't whatever that dreadful mickey-mouse online version of Excel is (it only imports from OneDrive 🙄). And with that pricing model, it's not AirTable. 

It's something new and it's going to be amazing for all those Citizen Non-Developers. 

Who's going to build it?


