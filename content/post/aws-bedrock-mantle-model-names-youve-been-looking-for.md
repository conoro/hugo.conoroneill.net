+++
date = "2026-02-20T07:40:48.313Z"
draft = false
title = "The AWS Bedrock Mantle Model Names You've Been Looking For"
slug = "aws-bedrock-mantle-model-names-youve-been-looking-for"
+++

I honestly can't understand how Amazon is doing such a dreadful job of communicating how to use Bedrock Mantle or even what it is. Every blogpost about new supported models links to information pages that are factually useless if you want to use them.

![Bedrock Cartoon](/images/2026/02/bedrock-cartoon.jpg)

Yesterday I finally figured out, with the help of some random Python script in a random GitHub repo, not made by Amazon, how to get a list of the real model names you need to use.

Of course this post will be out of date as soon as I publish it, but hopefully you'll read this and I'll have saved you banging your head off a desk like I have been doing since Mantle was announced.

So here are the basics.

Bedrock Mantle is many things but the only thing of interest to me is that it provides a range of LLMs on OpenAI-compatible endpoints using API keys for access. So no need for Amazon SDKs or IAM or any of that malarkey. Just use the OpenAI API and the right model names.

If you go to this page: https://docs.aws.amazon.com/bedrock/latest/userguide/bedrock-mantle.html you'll see the list of regional end-points. These are now correct. They weren't originally.🤦‍♂️

Nowhere on that page does it link to the list of actual models available on Mantle. It links to OpenAI's list of models 🤦‍♂️

I asked AWS support on Twitter for the list and they told me to ask a question on their support forums.🤦‍♂️

You'll probably Google for the names of Bedrock models and find [this page](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html). Then you'll discover that Mantle only has a subset of those and those model IDs are not correct for Mantle in many cases.🤦‍♂️

So, as of Feb 20th 2026, here are the correct model names available on Bedrock Mantle:

```csv
mistral.ministral-3-3b-instruct,
moonshotai.kimi-k2.5,
openai.gpt-oss-20b,
qwen.qwen3-coder-next,
qwen.qwen3-235b-a22b-2507,
mistral.mistral-large-3-675b-instruct,
qwen.qwen3-next-80b-a3b-instruct,
google.gemma-3-27b-it,
nvidia.nemotron-nano-12b-v2,
mistral.magistral-small-2509,
openai.gpt-oss-safeguard-20b,
zai.glm-4.7,
minimax.minimax-m2.1,
zai.glm-4.7-flash,
openai.gpt-oss-safeguard-120b,
mistral.voxtral-mini-3b-2507,
qwen.qwen3-coder-30b-a3b-instruct,
google.gemma-3-12b-it,
mistral.ministral-3-8b-instruct,
zai.glm-4.6,
deepseek.v3.1,
qwen.qwen3-coder-480b-a35b-instruct,
mistral.voxtral-small-24b-2507,
openai.gpt-oss-120b,
qwen.qwen3-32b,
minimax.minimax-m2,
google.gemma-3-4b-it,
nvidia.nemotron-nano-3-30b,
qwen.qwen3-vl-235b-a22b-instruct,
mistral.ministral-3-14b-instruct,
deepseek.v3.2,
moonshotai.kimi-k2-thinking,
nvidia.nemotron-nano-9b-v2
```

The relevant end-points for me are:

```
https://bedrock-mantle.us-east-1.api.aws/v1/chat/completions

https://bedrock-mantle.eu-west-1.api.aws/v1/chat/completions

```

You create long-term API keys in the Bedrock Console (set expiry to never). You'll need Administrator-level permissions to do this or a very specific set of IAM creds.

You can't name the keys yourself, Amazon will pick obtuse random nonsense for those. So you'll have to track what keys are used by what somewhere else.🤦‍♂️

AWS is where UX goes to die.

A sample Curl command to use Z.ai GLM-4.7-flash is as follows:

```bash
curl -X POST https://bedrock-mantle.us-east-1.api.aws/v1/chat/completions \
   -H "Content-Type: application/json" \
   -H "Authorization: Bearer YOUR_API_KEY_HERE" \
   -d '{
    "model": "zai.glm-4.7-flash",
    "reasoning": { "enabled": false },
    "messages": [
        {
            "role": "user",
            "content": "Hello! What model are you?"
        }
    ],
    "max_tokens": 512,
    "temperature": 0.7
}'

```

I still don't know if it's `"reasoning": { "enabled": false }` or `"extra_params": { "reasoning": { "effort": "low" } }` for each of the reasoning models. The latter seems to shut GPT-OSS-120B up correctly.

Finally, I recommend installing that [simple Python tool](https://github.com/danilop/bedrock-mantle) I used if you ever need to get a list of the current models available. I had tried to use the API call provided on one of the AWS pages and it returned an empty list.🤦‍♂️

```bash

git clone git@github.com:danilop/bedrock-mantle.git
cd bedrock-mantle
uv tool install .
export OPENAI_BASE_URL=https://bedrock-mantle.us-east-1.api.aws/v1
export OPENAI_API_KEY= YOUR_API_KEY_HERE

bedrock-mantle list-models | awk -F': ' '/ID:/ {print $2}'

```

Hope that Helps.

AWS, feel free to copy and paste this post on to the Bedrock docs site and save your users a lot of wasted time and frustration.

Finally, to end on a non-snarky note, Mantle is a huge improvement over the previous dog slow unreliable GPT-OSS endpoints and I'm seeing some superb TTFT numbers on the newer models. Will do some sort of Mantle model bake-off next week hopefully.
