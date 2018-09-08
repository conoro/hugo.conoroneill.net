+++
date = "2018-09-08T09:34:48.313Z"
draft = false
title = "Creating RSS feeds for Cork's Evening Echo newspaper website with Node.js and Serverless"
slug = "creating-rss-feeds-for-cork's-evening-echo-newspaper-website-with-node.js-and-serverless"
+++

For nearly 10 years I relied on Twitter as my primary source of news. Now that I have left Twitter and Facebook mostly behind, I have turned back to email newsletters and RSS for non-tech news. I never stopped using RSS for tech news. 

  

Of course, in that time, many news sites have forgotten about RSS. e.g. The Cork [Evening Echo](https://www.eveningecho.ie/) in Ireland has some pages that refer to RSS but they are no longer functional.

  

![echo.jpg](/images/2018/09/08/echo.jpg)  

  

As their news pages are pretty straightforward and simply marked-up, it took me less than an hour this morning to bash together a crude RSS feed generator and deploy it to AWS Lambda as a Serverless function.

  

So I'm now happily reading my local Cork news in Feedly Pro. Open Web FTW.

  

[The code is here](https://github.com/conoro/evening-echo-rss). Awful as always.

  

Usual Serverless deploy: 

1.  Configure your AWS account
2.  Install Node.js 8+
3. Then:

```bash
git clone git@github.com:conoro/evening-echo-rss.git
cd evening-echo-rss
npm install -g serverless
npm install
serverless deploy
```

Then you access each RSS feed like so:
  

*   [https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/corknews](https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/corknews)
*   [https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/nationalnews](https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/nationalnews)
*   [https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/business](https://url.of.serverless.function/dev/rss?page=https://www.eveningecho.ie/business)
