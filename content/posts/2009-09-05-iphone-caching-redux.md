---
title: iPhone Caching, redux
author: jay
type: post
date: 2009-09-05T23:16:44+00:00
url: /2009/09/05/iphone-caching-redux/
tags:
  - iphone
  - limits
  - safari
  - web development

---
Because every good technical discovery is based on trying to prove someone else wrong, I set out this evening to try and prove that the iPhone cache limits are no longer what [this 2008 YUI blog post says.][1]

The 2008 article is awesome, but the problem is that the article is taken as gospel now. And the problem with that is that the prototype framework (and I assume the jquery framework too, but I’m not as familiar with technical details there) is well over the gospel-assumed 25K limit. Prototype in one of our rails apps (which is using Prototype 1.6.0.3) clocks in at 126KB uncompressed and 29KB when compressed using mod_deflate.

The gospel then assumes that you can’t use prototype in iPhone (Mobile Safari) web views without killing performance. My own assumption was “WTF? That can’t be right”

And at least with the iPhone 3.0 Mobile Safari on my iPhone 3GS — I’m pretty convinced this is not the case. After spending about 30-40 minutes realizing that I had the cache disabled in Firefox. And then I had mod\_expires loading, but not active for our web apps — I’m watching an approximately 39 item, 562KB web page (yes I know, don’t ask, but mod\_deflate _is_ turned off) being happily cached in Mobile Safari. Either getting 304’s for everything, or just not making the request once I finally fixed the mod_expires headers issue.

I do not know what the limits are, search turns up questions and no answers. And I’ve gone through iPhone developer and other documentation — even WebKit Framework headers (not that I really expected them there, but you never know) — and I can’t find an answer on what the limits are.

I just completely believe right now, with the limited testing that the limits are **no longer 25K and 19 items. It’s definitely higher.** But I need to do more testing and probably get some peer confirmation out there.

Lazywebs? Any better answers here?

 [1]: http://yuiblog.com/blog/2008/02/06/iphone-cacheability/