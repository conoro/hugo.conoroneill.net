+++
date = "2025-05-26T02:34:48.313Z"
draft = false
title = "We need more than Vibe Coding, we need an entire Vibe Pipeline"
slug = "we-need-more-than-vibe-coding-we-need-an-entire-vibe-pipeline"
categories = ["AI & Machine Learning"]
tags = ["ai", "api", "cloud", "javascript", "nodejs", "python"]
+++
Whilst we're all accelerating 10x with Vibe Coding, it's only one piece of the process.

We need an entire Vibe Pipeline.

I want to move that fabulous Vibe-Coded app on http://localhost:3000 to a fully secure deployed solution with Auth, CI/CD, a domain and a cert by literally saying "take that fabulous app on http://localhost:3000 and deploy it securely with Auth, CI/CD, a domain and a cert".


As lots of us have said recently - Heroku for Vibe Coding. But it can't be completely bound to one vendor/framework. Ideally it would be OSS or an open standard.

A few months ago I vibe-coded a simple Node.js PoC app for a customer that had one Azure API call and one local binary call. I had it running locally in an hour. It took a week of shouting at ChatGPT to get the same thing running under Serveless with Lambda. In the end I gave up trying to get S3 static hosting working with it and used Cloudflare Pages instead.

Two weeks ago I asked ChatGPT to rewrite it in Python, use FastAPI and try to avoid local binary calls. It worked first time. I was able to deploy it to Replit 10 minutes later. 

That's probably the closest I've come to a Vibe Pipeline. But that's not going to work for a lot of Enterprise customers. You're hosting with who? Does that work with my crazy SSO?

10x reducing the time from customer request to tool in customers hands is the next massive leap forward.

![Vibe Pipeline](/images/2025/05/vibe-pipeline.jpg)
