+++
Categories = []
Description = "Just as no one expected a book seller to dominate the cloud, I think the company that will disrupt Amazon is Facebook."
Tags = ["IaaS", "PaaS", "Facebook", "Amazon", "AWS"]
date = "2015-10-23T13:54:25+01:00"
title = "Facebook is the Amazon AWS Killer"

+++
AWS is now an $8Bn business for Amazon. Could anyone have predicted that in 1997 or even 2007? This week I was talking to a few people about who might be able to disrupt AWS. It won't be easy. We immediately discounted the old guys like HP, IBM, Dell etc and even Google seems to be a complete also-ran in IaaS. Microsoft Azure might have potential.

PaaS is separate as it's higher up the stack and makes use of IaaS. I expect Open Source PaaS like [OpenShift 3](http://www.openshift.com/) to grow very quickly in the coming years as it makes deployment and management of Apps incredibly easy. Where PaaS might hurt AWS is in abstracting what IaaS you are using, so as long as the feature set is there, you don't care where your Apps are running (apart from Geo lag and data protection laws).

One of the people I talked to thinks that AWS will be slayed by a startup who may not even exist yet. He also felt that smart VPSes like [DigitalOcean](http://www.digitalocean.com) might do it. I'm a huge fan of DO and gained enormous reliability and speed by switching to it from Google Compute Engine/CloudSQL whilst reducing my bill by 2/3rds. But it still feels like an SME/SMB or individual developer solution.

So I'm predicting it'll be Facebook. Why? Think about the following:

* They understand building things at massive scale on a global basis
* They build their [own datacenters](http://www.thejournal.ie/facebook-building-data-centre-in-meath-2161944-Jun2015/)
* They built the [most energy efficient computing facility](http://www.theguardian.com/technology/2015/sep/25/facebook-datacentre-lulea-sweden-node-pole) ever
* They created the [Open Compute](http://www.opencompute.org/) project
* They have incubated some [incredible Open Source projects](https://github.com/facebook) like [Cassandra](http://cassandra.apache.org/) and [React](https://facebook.github.io/react/)
* They use PHP. Forget I mentioned that ;-)
* They understand that [mobile is eating the world](http://ben-evans.com/benedictevans/2015/6/19/presentation-mobile-is-eating-the-world) and they own [Parse](https://parse.com/)
* They understand real-time messaging [at massive scale](https://www.whatsapp.com/)
* They could do this in their sleep

The big open question is how they do their virtualisation and containerisation. If they have that nailed, then I think they might go for it.

Let's re-visit this post in 5 years.
