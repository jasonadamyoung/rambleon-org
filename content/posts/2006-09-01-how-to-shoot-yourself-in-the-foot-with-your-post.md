---
title: How to shoot yourself in the foot with your post
author: jay
type: post
date: 2006-09-01T13:08:34+00:00
url: /2006/09/01/how-to-shoot-yourself-in-the-foot-with-your-post/
categories:
  - Reflections
  - Uncategorized
tags:
  - sysadmin

---
So, we are a burgeoning Ruby on Rails shop. But, I’m a system administrator first, and a pseudo-developer second (which means that I troubleshoot and debug like nobody’s business, but forget about me really writing great code. Although I do comment my code, which covers for a lot of that 🙂 ) So, while I think RoR is neat. I’d be the first to admit where I think it needs work. Serious work. (like starting with the Capistrano peeps that think it’s real cool to put chmod’s in the thing when they are useless on my server and give me fits when the devs actually think they should work)

But it’s damn sure making a lot of sites go right now.

So that’s when I was a bit surprised to read Joel Spolsky’s [Language Wars][1]

And, Joel, I know you have to, like, pimp your products and all. But when you write a whole missive on the “Language to Pick” and diss RoR because it’s not built for “Serious Business Stuff”…

Well, you might want to take that gigantic plank out of your eye first. See, I’m a Fogbugz customer. And I like it and all (though I don’t know that we’ll stay with it in the long haul). And your so-called fantastic “Wasabi” language? — well, I’m sure that’s cool and all.

But it produces PHP that blows up in my very admittedly non-very-supported configuration. Like, when it tries to include adodb multiple times and blows up in PHP5 with “Cannot redeclare class” errors. And don’t get me started about your single-tasking php maintenance script that has to beat the mail server and mysql so hard I had to move it away from anything remotely considered production. And the hacks I’ve done and found to make it do SSL right. So much for serious business stuff. Which is fine, it’s a product by and for developers. And system admivelopers make stuff work — especially when we drift from your carefully constructed script silos.

But really. Get a clue.

Oh — and see also what [Hanson][2] said.

(though I’m not sure that [“Upgrade your Rails NOW NOW NOW”][3] qualifies as a Enterprisy Thingy either)

 [1]: http://www.joelonsoftware.com/items/2006/09/01.html
 [2]: http://www.loudthinking.com/arc/000596.html
 [3]: http://weblog.rubyonrails.com/2006/8/9/rails-1-1-5-mandatory-security-patch-and-other-tidbits