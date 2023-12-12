+++
date = "2023-12-12T06:00:22Z"
draft = false
title = "An RSS Feed for the Google Chrome Developer Blog"
description = "Because these things matter"
slug = "rss-feed-for-the-google-developer-blog"
+++

Yesterday I was amused and faux-shocked to see that the company who did more to damage RSS than any other, got rid of the [RSS feed](https://developer.chrome.com/feeds) for [its Chrome Developer Blog](https://developer.chrome.com/blog).

So this morning I gave ChatGPT a few nudges/samples and it generated a basic Python script to create the feed. GitHub Copilot took care of some refinements and GitHub Actions took care of generating the feed once per hour and providing it via GitHub Pages.

You can subscribe to the [RSS Feed here](https://conoro.github.io/google-dev-blog-rss/rss/bring_back_reader.xml). It has passed the W3C validator and works fine on [Feedly](https://feedly.com).

A couple of things struck me as I put this together:

* I didn't use a single Google tool apart from Chrome/Chromium to do this
* I wouldn't even know where to start with running this on Google infra/tools
* Presumably the first two days would have involved getting an auth flow working
* The Chrome Developer "blog" homepage is a perfect example of the awfulness of modern web dev:
  * A page that is updated maybe once a week is dynamically generated
  * A page that has almost no interactivity needs 248 requests (mostly JavaScript) to load
  * A page with maybe 400 words of text requires 8MB of downloads
  * I could go on, but pages like that should score Zero on Lighthouse instead of the 81-100 they give themselves
* A 70KB RSS file provides more value and is more readable
* We need Team Chainsaw for a better lighter web but I know it's too late
* A blog without an RSS feed isn't a blog. Find another word.

I hope you find the feed useful.
