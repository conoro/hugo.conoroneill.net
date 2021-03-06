+++
aliases = ["/rolling-up-my-sleeves-to-build-a-cross-platform-mobile-app-with-feedhenry/","/2011/07/17/rolling-up-my-sleeves-to-build-a-cross-platform-mobile-app-with-feedhenry"]
date = "2011-07-17T10:53:00+01:00"
draft = false
title = "Rolling Up My Sleeves to Build a Cross-Platform Mobile App with FeedHenry"
description = ""
slug = "rolling-up-my-sleeves-to-build-a-cross-platform-mobile-app-with-feedhenry"
+++

#"Rolling Up My Sleeves to Build a Cross-Platform Mobile App with FeedHenry"


 <p>I've been playing around with the <a href="http://developer.feedhenry.com">FeedHenry</a> platform for the past few months and it really has me excited with the&nbsp;<span style="font-size: small;">possibilities</span>. If you are not familiar with it, it's a platform for building iPhone/Android/Blackberry/WP7/Nokia-WRT mobile applications from one code-base using just HTML, CSS and JavaScript. These are not just web-apps, they can be uploaded to the various App Stores too.</p>
<p>Pause for disclosure: I have done some work for the guys so feel free to treat my opinions accordingly.</p>
<p>There are several different ways of skinning the multi-platform cat and after all my study, FeedHenry is my preferred one. As they build everything in the cloud for you, you don't need to have 5 SDKs installed on your computer. Just upload and/or edit code in their online Studio, click Build and you are done.</p>
<p>On the handset side, you build your Apps using all the same HTML5/CSS3/JavaScript skills you learned doing normal web-apps. You then use the FeedHenry JavaScript APIs to access things like camera, GPS, local storage etc. The same calls are used no matter what handset you are on. You can use any UI library you like too. Raw HTML, JQuery Mobile and Sencha Touch are the three main ones. If you have other JS libraries, you can pull those in too.</p>
<p>If that's all it did, I'd still be interested because I will never sit down and learn iOS development or BB but if I can use general web skills to build Apps for those platforms, that's a huge win for me. But FeedHenry also has a Server-Side and that's where it gets very cool. You can write Server code in JavaScript too and they provide APIs for the handset to access that functionality. Now you can do all the heavy lifting and Web Services integrations on the Server and then just shoot over the information the handset needs. Your apps become far more lightweight, the battery usage is improved and you can use things like SQL or NoSQL databases on the Server.</p>
<p><div class='p_embed p_image_embed'>
<img alt="Fh_for_posterous" height="375" src="http://getfile6.posterous.com/getfile/files.posterous.com/temp-2011-07-17/BxvpapahdyxrarpAEABBfiyywqgCabmlJnnhJDpGfJAIAdupzcBtefhtqFyw/fh_for_posterous.jpg.scaled500.jpg" width="500" />
</div>
</p>
<p>Remember, we're still talking the same skillset you used to build your last "full size" web-app. How flippin cool is that? Suddenly, when customers ask for an iPhone App for the web-app you built, you don't have to suck air in through your teeth and mention months of work.</p>
<p>The most recent upgrade on FeedHenry was actually the prompt for me to write this post. I have become a <a href="http://www.github.com/">GitHub</a> fanatic. Whilst Git itself is fine as a version control system, I'm just in awe of the service that GitHub has layered on top of it. The notification system is amazing - I get a GTalk IM the second any developer does a commit on our repos. FeedHenry has now integrated GitHub into the build flow. So you can use your normal development toolset and work away on GitHub. When you are ready to build your Apps, just login to FeedHenry, give it the GitHub URL and bada-bing, your Apps are generated.</p>
<p>Thennnnnn, I got even more excited because I discovered the fabulousness of the <a href="http://cloud9ide.com/">Cloud 9 IDE</a>. A browser-based full-blown development IDE with GitHub integration! So I can work away in that IDE, committing my changes and then generate the Apps in FeedHenry. Full end-to-end Cross-Platform mobile App development without a single thing having to be installed on my PC.</p>
<p>I've said it many times before, but if someone is looking for an area to up-skill in, I think it has to be in mobile and it has to be in hard-core JavaScript development.</p>
<p>I have four projects at the minute which will be built in FeedHenry. Three itch-scratchers and one pretty serious-assed. I'll report back on them (and pimp them) as soon as they are ready.&nbsp;</p>
<p>&nbsp;</p>
 