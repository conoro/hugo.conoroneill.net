+++
date = "2026-03-06T10:00:00.000Z"
draft = false
title = "LLM Proxies: The API Gateways of the AI Era (and Why Aren't You Using One?)"
slug = "llm-proxies-the-api-gateways-of-the-ai-era-and-why-arent-you-using-one"
categories = ["AI & Machine Learning"]
tags = ["ai", "api", "aws", "cloud", "open-source", "python"]
+++

I've been thinking a lot about LLM proxies lately. Mostly because we've written two of them in the past few weeks. And the more I think about it, the more I'm genuinely surprised that every company making serious use of LLMs doesn't already have one sitting in front of their API calls. It feels like one of those "how are we not all doing this?" moments in tech.

## We've Been Here Before

Cast your mind back to approximately 2010-2015. API Gateways were the hot new thing. Apigee, MuleSoft, Kong, and others made a compelling case that you should never be calling backend services directly from your applications. Instead, you should have a smart layer in the middle that handles auth, rate limiting, monitoring, routing and failover.

It seems blindingly obvious now. Every serious organisation has an API Gateway. It would be negligent not to. But I remember the early days when people said, "why would I need that? I'll just call the API directly."

I'm getting the exact same feeling with LLM proxies right now. The arguments for having one are just as strong, if not stronger, than they were for API Gateways. And yet most teams I talk to are still making direct calls to OpenAI or Anthropic or Bedrock from their applications.

## So What Does an LLM Proxy Actually Do?

At its core, an LLM proxy sits between your application and the various LLM providers. But "proxy" undersells it massively. Here's what a decent one gives you:

**Single endpoint, multiple vendors.** Your application talks to one URL. Behind that, the proxy can route to OpenAI, Anthropic, Bedrock, Gemini, Mistral, or whoever else you're using. Your app code doesn't need to know or care which provider is handling a particular request. This is the big one.

**Automatic failover.** OpenAI having a bad day? Your proxy silently switches to Anthropic. Bedrock throwing 500s in us-east-1? Fail over to eu-west-1 or to another provider entirely. Your users never notice. This alone justifies the effort.

**Smart routing.** Not every request needs Claude Opus. Some are perfectly fine with Haiku or a cheap Mistral model. A proxy can route based on the complexity of the request, the cost budget, latency requirements, or whatever logic you need.

**Monitoring and alerting.** Every request logged. Latency tracked. Error rates visible. Token usage per team, per project, per user. Without a proxy, you're flying blind across multiple provider dashboards.

**Cost management.** This is the one that makes the CFO sit up. When you're spending serious money across multiple LLM providers, having a single place to see it all, set budgets, and get alerts is essential. Some proxies even do semantic caching to avoid making the same expensive call twice.

**Caching.** Speaking of which, if your users are asking similar questions repeatedly, why pay for the same completion over and over? Semantic caching can dramatically reduce your costs and improve response times.

**Guardrails and governance.** For any enterprise deployment, you need control over what goes in and what comes out. A proxy is the natural place to enforce content policies, PII filtering, and compliance rules.

## Our Own Adventures in Proxy-Land

We've been building LLM-powered products at ServisBot for years now and the need for proxies hit us from two completely different directions.

The first was **ServisRouter**, which we built to provide multi-vendor failover. When your business depends on LLM availability and you've experienced enough provider outages to be thoroughly paranoid about it, you build your own failover layer. ServisRouter gives us a single endpoint that handles automatic failover across providers, so an outage for one vendor doesn't mean an outage for our customers.

The second was much more prosaic but equally important. We built a **simple passthrough proxy for Amazon Bedrock Mantle** literally yesterday. Why? Because Mantle has no logging whatsoever. None. Zero. You make API calls and they disappear into the void. No way to debug, no way to audit, no way to understand what's happening. So we wrote a tiny proxy that sits in front of Mantle and logs every request and response. That's it. That's the whole thing. And it's already saved us hours of debugging time.

If you read my [recent post on Bedrock Mantle](/post/aws-bedrock-mantle-model-names-youve-been-looking-for/), you'll know that AWS's approach to developer experience with Mantle has been, shall we say, suboptimal. The lack of any built-in logging is just the cherry on top of that particular cake.

## What's Out There?

We've been evaluating the landscape and here's what I've found:

**LiteLLM** is probably the most well-known open-source option. It's a Python SDK and proxy server that supports 100+ LLM providers through a unified OpenAI-compatible API. It does cost tracking, virtual keys, retry/fallback logic, and has a nice admin dashboard. The 8ms P95 latency at 1K RPS they claim is decent. The Python ecosystem is both its strength and weakness depending on your stack.

**Bifrost** from Maxim AI is the newer, faster kid. Written in Go, it claims 50x better performance than LiteLLM with only 11 microseconds of overhead per request at 5K RPS. It does semantic caching, automatic failover, and has enterprise governance features baked in. The performance numbers are impressive. It's MIT-licensed, which I like.

**OpenRouter** is the obvious SaaS choice if you don't want to self-host. It gives you access to hundreds of models through one API with automatic fallbacks. Simple to set up, good for prototyping and smaller teams. But there's a cost implication at scale; that percentage markup adds up fast when you're burning through tokens.

And then there are the cloud-native options from AWS, Azure, and Google themselves, but those tend to lock you into their ecosystem, which rather defeats the purpose.

We'd always prefer open-source ourselves. Not just for the obvious cost reasons, but because the ability to inspect, modify, and extend is invaluable when you're building production systems. You need to understand exactly what's happening to your data as it flows through these layers.

## The Elephant in the Room: API Lock-In

Here's something that worries me. Almost every LLM proxy I've looked at standardises on the OpenAI Chat Completions API format. Which makes complete sense today, it's the de facto standard. But is it the right long-term bet?

We're already seeing the API landscape fragment. OpenAI has its new Responses API. Streaming and real-time interactions are moving towards WebSockets. Tool calling and function calling have different implementations across providers. Multi-modal inputs (images, audio, video) all work slightly differently. And MCP (Model Context Protocol) is adding another dimension entirely.

If your proxy only speaks Chat Completions, you might find yourself in the same kind of lock-in you were trying to avoid by having a proxy in the first place. Just at a different layer. This is something the whole ecosystem needs to think carefully about. We need proxies that can handle the full breadth of LLM interaction patterns, not just the text-in-text-out basics.

## So Why Aren't More People Doing This?

I have a few theories:

The LLM space is still young enough that many teams are in "just get it working" mode. They've picked one provider, hardcoded the API calls, and shipped. The pain of a provider outage or a surprise bill hasn't hit them yet. Yet.

There's also a perception that adding a proxy adds complexity and latency. To which I'd say, the latency overhead of a well-built proxy (microseconds to low milliseconds) is completely negligible compared to the seconds your LLM calls take. And the "complexity" of a proxy is nothing compared to the complexity of handling multi-provider failover in your application code.

And honestly, I think many teams just haven't thought about it. The API Gateway lesson from a decade ago hasn't been applied to this new world of AI APIs. Which is strange because the parallels are almost exact.

## What Are You Using?

I'm genuinely curious about this. If you're running LLMs in production:

Are you using a proxy or gateway? Which one? Did you build your own? What drove that decision? What features matter most to you? Have you been bitten by a provider outage that could have been avoided?

Drop me a comment or reach out. I'd love to hear what people are doing in the wild. And if you're not using an LLM proxy yet, maybe it's time to have that conversation with your team. You wouldn't run a production API without a gateway in 2026. So why are you running production LLM calls without one?
