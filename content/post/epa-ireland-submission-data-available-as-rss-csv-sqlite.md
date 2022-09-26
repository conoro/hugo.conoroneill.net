+++
date = "2022-09-26T08:30:22Z"
draft = false
title = "EPA Ireland Submission Data available as RSS, CSV and SQLite"
description = "I bashed this together quickly last week after a request from Ashley of the Irish River Project"
slug = "epa-ireland-submission-data-available-as-rss-csv-sqlite"
+++

Whilst there is a ton of useful data on the [EPA Ireland](https://www.epa.ie/) web-site, it's not exactly easy to track what's going on. After my recent [RSS post](https://conoroneill.net/2022/07/18/rss-is-on-fire-again-and-its-all-down-to-slackops/), I got a request from [Ashley](https://twitter.com/gloverstweets) to see if something better was doable with the EPA data.

After a bit of playing around I was able to scrape the thousands of individual RSS feeds and generate what is hopefully helpful to those of you who wish to monitor submissions on the site. Ashley has [a good thread](https://twitter.com/gloverstweets/status/1573322689745412099) about it here on Twitter.

The code is all up on [GitHub here](https://github.com/conoro/epa-rss). In summary what it does is:

* Once a day around 1.30am GMT, it scrapes all the feeds on the EPA site
* It saves all the data into a SQLite database and uploads that to Amazon S3
* It updates a single small RSS feed with all the submissions from the previous day
* It generates a new CSV file with the same data as the RSS feed and saves that to GitHub


## Subscribing to the RSS Feed
Use this URL in Feedly or similar: https://raw.githubusercontent.com/conoro/epa-rss/main/output/daily.xml

## Viewing the daily CSV files.
They are all here in the repo starting on Sep 22nd 2022: https://github.com/conoro/epa-rss/tree/main/output/csv/daily

## Getting notified by email (experimental)
If you'd like to receive email with a link to the latest CSV each day:

* Create a GitHub Account
* Click the drop-down menu beside "Watch" in the top right of this project's page.
* Select "Custom" and tick the box beside "Issues". Then click Apply.
* You should start receiving the emails beginning tomorrow.

## SQLite Database
The latest full set of scraped data is available as a SQLite DB that you can [download here](https://epa-rss.s3.eu-west-1.amazonaws.com/latest/epa-rss.sqlite). Use something like [SQLiteStudio](https://sqlitestudio.pl/) to browse and query it.

## Examining the data in the SQLite Database using Datasette Lite
You can use a very cool project by Simon Willison called [Datasette Lite](https://github.com/simonw/datasette-lite) to browse and query all the latest data in your browser by [going here](https://lite.datasette.io/?url=https%3A%2F%2Fepa-rss.s3.eu-west-1.amazonaws.com%2Flatest%2Fepa-rss.sqlite#/epa-rss/allsubmissions). I highly recommend playing around with it, as you can query by keywords and date ranges.

![ABP](/images/2022/09/abp.jpg)

## Finally
This was thrown together very quickly. There is minimal error checking or handling. If you'd like to improve this project, let me know and I'll give you access. It's unlikely I'll have much time in the coming months to work on it.
