+++
date = "2025-06-10T06:35:48.313Z"
draft = false
title = "MCP can be a supercharger for Open Data projects and Vibe Coding"
slug = "mcp-can-be-a-supercharger-for-open-data-projects-and-vibe-coding"
+++

For personal projects, I generally follow Andrej Karpathy's [original definition of Vibe Coding](https://x.com/karpathy/status/1886192184808149383?lang=en) - I don't look at the generated code, I just tell the LLM what I want, paste in the error messages and iterate until it gives me the output I need. But that's a lot easier to do when you've been writing software for 40+ years and know what to ask for!

But when it comes to creating Open Data projects, I often find that the challenge isn't the code, it's the data. It's can be inconsistent, difficult to access, difficult to understand, never designed for scraping or in some awful format. 

Sometimes you can be lucky, as I was last week. I've been moving the [EPA Ireland scraper](https://github.com/EPA-Ireland-Updates-Unofficial/epa-rss) from the now-deleted RSS feeds to their OpenAPI/Swagger based API. Weirdly RSS is far more efficient on that site and needs far fewer requests. But it is what it is, so I've been bashing away and finding it a bit of a struggle even with Vibe Coding. This is not an API designed to be used, it is designed to meet regulations. (If you've been wondering where my daily EPA updates have gone, they'll be back soon.)

Then last week I discovered the fantastic Open Source project - [OpenAPI to MCP Generator](https://github.com/harsha-iiiv/openapi-mcp-generator). In a few minutes I was able to give it the root EPA OpenAPI end-point and have an MCP server running exposing all the end-points and their descriptions.

Two more minutes later and I had that MCP server wired into Windsurf. And then I could simply ask questions like "Get me the list of Compliance Records types  from Leap MCP" and within seconds get:

"Here is the list of Compliance Records types from the LEAP MCP:"

- Annual Environmental Report
- Complaint
- Compliance Investigation
- etc

"Let me know if you need details on any specific type or want to fetch related records."

![OpenAPI to MCP Generator on Windsurf](/images/2025/06/openapi-to-mcp-generator.png)

I'm now able to interrogate the EPA OpenAPI with natural language queries, and I can use that to generate and validate the code.

I could just say that this is a game changer for Open Data projects and Vibe Coding. And highlight that it allows you to focus on the data and the insights you want to extract, rather than getting bogged down in the complexities of the API or the data format. Those last two sentences were written by Windsurf, by the way.

But it goes much much further than that. Imagine a Copilot that's not just wired to all of your heterogeneous and legacy systems via MCP, but can generate disposable code dynamically to interrogate, analyse and report on data and systems. I wrote that sentence.

You could go directly from a voice prompt like "correlate effluent compliance warnings with weather by region and month" to having an analytics dashboard in minutes without lifting a finger.

The promise of technology since the days of COBOL is finally coming true.

<div align="center">
<video width="800" controls>
  <source src="/images/2025/06/Mad_Max_Supercharger.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>
</div>
