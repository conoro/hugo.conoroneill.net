+++
aliases = ["/slight-screw-up-by-facebook-in-move-to-https/","/2011/05/25/slight-screw-up-by-facebook-in-move-to-https"]
date = "2011-05-25T11:19:56+01:00"
draft = false
title = "Slight screw-up by Facebook in move to https"
description = ""
slug = "slight-screw-up-by-facebook-in-move-to-https"
+++

#"Slight screw-up by Facebook in move to https"


 As you probably know, Facebook are transitioning over to https for security reasons. You can opt-in now but it will be mandatory in the coming months. I&#39;ve already written about the fact that every App developer will have to get an SSL cert but I discovered a bigger problem yesterday. <p /><div>If you are running the old Facebook Connect code on your site (and based on my experience, that&#39;s a _lot_ of sites), you are probably accessing this URL:</div><p /><div><a href="http://apps.new.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php">http://apps.new.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php</a></div> <p /><div>Facebook now re-directs that to:</div><p /><div><a href="https://apps.new.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php">https://apps.new.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php</a></div> <p /><div>But their security Cert is only valid for *.<a href="http://facebook.com">facebook.com</a> not *.*.<a href="http://facebook.com">facebook.com</a> so Firefox 4 and Chrome 12 are refusing to access it and therefore disabling Facebook Connect on your site.</div> <p /><div>Whilst everyone _should_ move to the new Graph API, not everyone has the time/money/resources to get it done. Hopefully Facebook can fix this soon and give sites more time to transition to the newer code.</div>
 