+++
date = "2025-05-20T02:34:48.313Z"
draft = false
title = "Microsoft's NLWeb and Agentic AI could trigger the resurgence of RSS"
slug = "microsofts-nlweb-and-agentic-ai-could-trigger-the-resurgence-of-rss"
+++

I've never given up on RSS. It still provides enormous utility for me. The silly number of RSS converters in my [GitHub account](https://github.com/conoro?tab=repositories) are testament to that.

The recent removal of all RSS feeds from the EPA Ireland site was a major disappointment and I've been forced to Vibe Code a horror of a replacement scraper using their dreadful API instead.

In contrast, my heart skipped a beat when I started going through the README for Microsoft's [NLWeb](https://github.com/microsoft/nlweb). There was RSS, right up top along with MCP!

> 
> Building conversational interfaces for websites is hard. NLWeb seeks to make it easy for websites to do this. And since NLWeb natively speaks MCP, the same natural language APIs can be used both by humans and agents.
> 
> Schema.org and related semi-structured formats like RSS, in use by over 100m websites, have become not just the defacto syndication mechanism but also the semantic layer for the web. NLWeb leverages these to make it much easier to create natural language interfaces.
> 

And it's pretty obvious why RSS is there really. Why lose your mind trying to scrape abominable modern websites with their randomly generated classes and ids or run a full blown LLM-Powered Playwright tool, when you can just read the RSS feed to get lots of useful information from a site? Of course you'll need the former if you want to interact and you'll need MCP servers for many Enterprise systems. But RSS on its own is still the best way to get the latest updates from sites.

In some ways RSS could be seen as the anti-hallucination solution for up-to-date information in LLMs. Timely information is one big area where it's impossible to trust what ChatGPT and the others say. If they know to check the feeds first for the latest updates, the chances of showing out-of-date information are reduced.

I just had an off-the-wall exciting thought - If OpenAI embraced it, could ChatGPT become my new RSS Reader?

![ChatGPT RSS](/images/2025/05/chatgpt_rss.jpg)
