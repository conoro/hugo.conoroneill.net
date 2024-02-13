+++
date = "2024-02-13T05:00:22Z"
draft = false
title = "Saving all your GitHub Stars to Pinboard"
description = "A simple Serverless function"
slug = "saving-all-your-github-stars-to-pinboard"
+++

Over the past 18 months or so, I've been replacing various IFTTT and Low-Code functions with my own code running either in GitHub Actions or AWS Lambda. The [latest one](https://github.com/conoro/github-stars-to-pinboard) is a simple function to save all my latest GitHub Stars to [Pinboard](https://pinboard.in/) once an hour.

This way, no matter what IFTTT/Zapier/etc decide to change this month, I don't have to change anything. Some of my Serverless functions have been running for years with no updates required.

The code is extremely simple and written in Python using the Serverless framework. Full setup instructions are in the [README on GitHub](https://github.com/conoro/github-stars-to-pinboard).

![GitHub Stars to Pinboard](/images/2024/02/github-stars-to-pinboard.png)

I remain a huge fan of [Pinboard](https://pinboard.in/). It's wonderful to have a tool that has done the same job reliably for me for almost a decade. Long may it continue.


