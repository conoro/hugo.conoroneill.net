+++
date = "2021-07-15T05:00:22Z"
draft = false
title = "TikTok RSS Flat - Generate RSS feeds from TikTok using GitHub OCTO Flat Data"
description = "Using GitHub Flat Data, GitHub Actions and GitHub Pages to fix the internet"
slug = "tiktok-rss-feeds-using-github-octo-flat-data"
+++

Gen-X nerds continue to ruin the internet for Gen-Z by implementing RSS feeds for [TikTok](https://www.tiktok.com/@conor.runs?lang=en) 😁

![TikTok RSS Flat Logo](/images/2021/07/tiktok-rss-flat.png)

I was really intrigued by the launch of [GitHub OCTO Flat Data](https://octo.github.com/projects/flat-data), having already been a longtime fan of [Simon Willison's](https://simonwillison.net/) work (all the way back to the early days of Django). There is something very powerful in there that is not obvious on first look. Connecting it to [Low-Code platforms](https://tines.io) could unleash lots of crazy fabulous new ideas.

I'm also an old curmudgeon who has clung fiercly to RSS despite the best attempts of Google, Twitter, Facebook and old media to kill it. I get breaking news via Twitter and gave up on Faecbook aeons ago, whilst the vast majority of the media I consume online is via hundreds of RSS subscriptions on [Feedly](https://feedly.com). 

In fact, I'm so obnoxious about this that in recent years I've built an array of tiny tools to add (or re-add) RSS support to various sites/systems that I read including [Vimeo](https://github.com/conoro/vimeo-rss), [The Far Side](https://github.com/conoro/cowtools-rss), [The Tokyo Marathon](https://github.com/conoro/tokyo-marathon-rss), [The South China Morning Post](https://github.com/conoro/southchina-rss), [The Irish Independent](https://github.com/conoro/indo-rss), Cork's [Evening Echo](https://github.com/conoro/evening-echo-rss), [Cork County Council news](https://github.com/conoro/corkcoco-news-rss), [World Mountain Running Association](https://github.com/conoro/wmra-rss), the [HSE Digital Blog](https://github.com/conoro/hse-digital-blog-rss) and [Microcosm](https://github.com/conoro/microcosm2rss).

But all of those have been built on AWS Lambda using the Serverless framework.

I wondered if the same was possible using Flat Data to make it very low effort for anyone else to use and it turns out it's pretty easy.

My first attempt to do it all in Deno (Node.js mavens look away now) on the Tokyo Marathon web-site took almost no time. There's [a basic functional setup here](https://github.com/conoro/flat-rss-example). But that works as one repo per RSS feed which is wasteful.


I then wanted to try TikTok which is a lot more complex as it's a SPA with no scrapable data from its webapp. I initially failed to do it in straight Deno as my complete lack of knowledge of it meant I couldn't get the Node.js [TikTok Scraper](https://www.npmjs.com/package/tiktok-scraper) running under it. I did however manage to make [a tiny change](https://github.com/conoro/tiktok-scraper) which allows that scraper to run directly in Node.js under AWS Lambda without native code problems from jsdom/canvas.

So back to good old Python I went to do it using Flat Data and it was all very quick.

[TikTok RSS Flat](https://github.com/conoro/tiktok-rss-flat) generates usable RSS feeds from TikTok using the unoffical [TikTokApi Python library](https://github.com/davidteather/TikTok-Api) to extract information about user videos from TikTok as JSON and generate RSS feeds for each user you are interested in.

To get your own instance running is simple:

* Fork my [repo](https://github.com/conoro/tiktok-rss-flat)
* Enable GitHub Pages for your new repo
* Change the `ghPagesURL` in `postprocessing.py` from "https://conoro.github.io/tiktok-rss-flat/" to your URL
* Add the TikTok usernames that you like to `subscriptions.csv`


It's set to run once per hour and generates one RSS XML file per user in the rss output directory.

You then subscribe to each feed in Feedly or another feed reader using a GitHub Pages URL. Those URLs are constructed like so. E.g.:

* TikTok User = iamtabithabrown
* XML File = rss/iamtabithabrown.xml
* Feedly Subscription URL = https://conoro.github.io/tiktok-rss-flat/rss/iamtabithabrown.xml
(Or in my case where I've set a custom domain for the GitHub Pages project called tiktokrss.conoroneill.com, the URL is https://tiktokrss.conoroneill.com/rss/iamtabithabrown.xml)

And that's it. Less than 50 lines of beginner-level Python to drag TikTok out of its silo and into the Open Web.

Wouldn't it be amazing to have a standardized approach for this where everyone could share their Scrapers+RSSGenerators, remove all the complex language around it, and re-Open the web?

As [Tabitha](https://www.tiktok.com/@iamtabithabrown?) says - Because it's my business.

{{< youtube rEv6y4_fgKE >}}
