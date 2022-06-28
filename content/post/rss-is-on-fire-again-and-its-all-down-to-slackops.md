+++
date = "2022-07-01T04:00:22Z"
draft = true
title = "RSS is on fire again, and it's all down to SlackOps"
description = "RSS is the API they couldn't kill. It's back stronger than ever as an underpinning of SlackOps in many organizations."
slug = "rss-is-on-fire-again-and-its-all-down-to-slackops"
+++

![RSS and SlackOps](/images/2022/07/RSS_plus_bounding_box_05.png)

## Bring out your dead
I'm that guy, the one who never gave up on blogs and never ever gave up on RSS. "Let me tell you, young whippersnappers, what the Internet was like in 2007, it was glorious," etc.

My GitHub account is mostly just a collection of scrapers to turn webpages into RSS for all those companies who have killed their feeds over the years. RSS and advertising never made good bedfellows.

## Not just blogs
Because RSS evolved from news sites and podcasting, most people think of it as just a media thing, but it's far more than that. It's your base-level API that can be used to notify people of anything via pull, not push. That's the reason RSS is coming out, once again, fighting fit and ready to help another generation of users. 

RSS has become the first part of the answer to the question, "how do I get alerted when something important has happened out there?"

Part two of the answer is Slack. 

## IRC with emojis?
Yes, Slack can be an annoyance when managed poorly, but, despite what some old co-workers in Red Hat used to say, it's not just IRC with emojis and animated GIFs. Handled well, it's a fantastic message bus for alerts and responses.

Every Slack installation has the RSS application, and you connect feeds up by just typing /feed! This simple feature is at the heart of the resurgence of RSS for many ITOps and SecOps teams.

(Before you ask, while TeamsOps does not appear to be a thing, Teams has an RSS App too.)

## Feed me
Take a basic example - how do I stay notified of [CISA Security alerts](https://www.cisa.gov/uscert/ncas/alerts)? You can sign up for emails that go into the black hole of your inbox, or you can take their [RSS feed](https://www.cisa.gov/uscert/ncas/alerts.xml) and pipe it into a dedicated Alerts channel on Slack. In under 30 seconds, you are fully up to date on some major threats to your business.

In one Slack instance, I saw 43 RSS feeds coming directly into public channels. Some are important, like CISA, and others are more related to security news stories. For example, I have a Google Alerts feed for certain security topics, which I de-duplicate and filter before they are DMed to me.

The feeds from the various status pages of AWS, DigitalOcean, and GitHub are even more important for many working in Ops. All can be fed into a dedicated Status channel or filtered first based on severity.

Even something as simple as an RSS feed for product updates can get a big response from users. 

## Bashing Slack
Forget Zsh, forget Fish, forget Powershell, the Ops replacement for Bash is Slack. (Ducks 😀)

But more seriously, consuming these RSS feeds is not a passive behavior. SlackOps means you can do something in response to an RSS update. One simple but useful action is to open a JIRA ticket when you spot something important coming in. 


## Even Twitter had RSS
While RSS is still delivering enormous value more than two decades later, it could be doing so much more in certain venues. Back in 2007/2008, during the golden era of Twitter for Developers, thousands of mini-applications and information sites were built on top of the RSS feeds they provided. And then they killed them all. 

For people in SecOps and ITOps, there is still timely important information flowing through Twitter, but now you need OAuth Apps and requests for access to process it. Imagine if they brought back RSS?! Filtered and auto-triaged topic-specific information feeds piped into Slack would be immensely powerful and undo over a decade of bad blood between the tech community and the Twitter API.

In fairness, at least Twitter has an API. I created a simple TikTok RSS generator based on a fantastic library which tries to provide a simple TikTok API but they constantly break/block it.

## My little API
Finally, if you're building an app or site with potentially valuable Ops data for Slack users but don't have the bandwidth to build a full API yet, why not make RSS your MVP API? Minimal effort, massive upside for your users. Do it.

