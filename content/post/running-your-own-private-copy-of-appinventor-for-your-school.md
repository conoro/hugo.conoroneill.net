+++
aliases = ["/running-your-own-private-copy-of-appinventor-for-your-school/","/2011/12/11/running-your-own-private-copy-of-appinventor-for-your-school"]
date = "2011-12-11T11:42:18Z"
draft = false
title = "Running Your Own Private Copy of AppInventor for Your School"
description = ""
slug = "running-your-own-private-copy-of-appinventor-for-your-school"
+++

#"Running Your Own Private Copy of AppInventor for Your School"


 <div class='p_embed p_image_embed'>
<img alt="Logo" height="140" src="http://getfile6.posterous.com/getfile/files.posterous.com/conoroneill/XoNUmYwaSLt62uKwheiARkeXcy7alphg0orxWsWLVFtAVL8YvOZI7sV0BI6u/logo.png" width="140" />
</div>
<p>I had been getting quite concerned recently about the switchover of <a href="http://www.appinventorbeta.com">AppInventor</a> from Google to MIT. For some reason Google is sticking hard to the Dec 31st shutdown date whilst MIT won&#39;t be ready to publicly host until &quot;some time in Q1&quot;. This would leave 60 kids I&#39;m teaching in my kids&#39; school in the lurch for potentially a few months. </p><p /><div>I&#39;m on the main Group mailing list but saw nothing recently as we raced towards the deadline. But a bit of poking around in the other Groups this morning and I found a link to<a href="http://appinventoredu.mit.edu/download-jar-files"> the test code from MIT</a>. So this is a package for running the main AppInventor JAR on <a href="http://code.google.com/appengine/">Google AppEngine</a>. Lots of warnings about instability and frequent changes but I&#39;m delighted they have done this.</div> <p /><div>I&#39;m off to install it now. Here&#39;s hoping Google <a href="http://code.google.com/appengine/docs/billing.html">doesn&#39;t charge</a> for Educational projects on AppEngine! Damn, yes they do. And the MIT teamdoesn&#39;tknow yet what level of activity/users will kick you out of the Free Tier.</div> <p /><div>I&#39;m neither a Java nor an AppEngine person, but I&#39;ve managed to get simple Python code running there before so it should be too hard to get running.</div><p /><div>OK, I just started reading the doc. We need a separate Linux Build server to generate the APKs etc. This shouldn&#39;t be a problem, we can sign up for a Free EC2 instance to do that. In fact, not to be ungrateful, but it&#39;d probably be easier for most people if the whole thing ran on EC2.</div> <p /><div>Hmm, ok, I&#39;ll finish this later and write a new post on any gotchas. Suffice to say, if you ain&#39;tcomfortablewith SDKs and building software, don&#39;t even think about it!</div>
 