+++
aliases = ["/sorting-out-the-on-behalf-of-nonsense-on-gmail-with-authsmtp/","/2011/01/07/sorting-out-the-on-behalf-of-nonsense-on-gmail-with-authsmtp"]
date = "2011-01-07T10:18:42Z"
draft = false
title = "Sorting out the 'On Behalf Of' Nonsense on GMail with AuthSMTP"
description = ""
slug = "sorting-out-the-on-behalf-of-nonsense-on-gmail-with-authsmtp"
+++

#"Sorting out the \"On Behalf Of\" Nonsense on GMail with AuthSMTP"


 I have long been pained by GMails handling of multiple &quot;From&quot; accounts. We use Google Apps For Your Domain which we generally like apart from that one feature.<p /><div>Obviously we have accounts like sales@ and support@ which are accessed by more than one of us. On the face of it GMail allows you to send from these addresses using your main account. So I can send a mail when logged in as conor@ but have it appear to be From sales@.</div> <p /><div>But Google insists on sticking an additional header called &quot;Sender&quot; which identifies that it really was conor@ who sent the mail. That then appears in the recipients Outlook Inbox as &quot;From conor@blah on behalf of sales@blah&quot;. This completely defeats the purpose of having generic group addresses. It means we can&#39;t have seamless &quot;tonight Matthew I&#39;m going to be Support&quot;.</div> <p /><div>But it turns out Google does have a solution for it and you can continue to use the web interface. When you are setting up those extra accounts you can tell Google not to use their servers to send but to use another SMTP server. They generally expect that to be your own mail server but we actually use <a href="http://www.authsmtp.com/">AuthSMTP</a> for all our automated sending from EC2 and it works perfectly here too. It&#39;s a very inexpensive solution which has never let us down. Highly recommended. (Note - enable SSL on your AuthSMTP account but don&#39;t on GMail).</div> <p /><div>Job done!</div>
 