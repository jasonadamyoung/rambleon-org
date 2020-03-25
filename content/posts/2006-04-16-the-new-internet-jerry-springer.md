---
title: The New Internet Jerry Springer
author: jay
type: post
date: 2006-04-16T13:20:43+00:00
url: /2006/04/16/the-new-internet-jerry-springer/
categories:
  - Reflections

---
So it [should have been a warning][1] instead of an error. But Sam Ruby took the _software_ and [fixed that][2].

But the New Internet Jerry Springer episode list is starting to shape up:

Matthew Mullenweg: [The Feed Validator is Dead To Me][3]

> The latest in their line of enlightened changes is that the author of the Well-formed Web spec has changed the capitializition of the wfw:commentRSS element at some unknown point to lowercase Rss. This arbitrary decision has been codified by the validator, which now reports the millions and millions of feeds that use the previously correct capitialization as invalid. [Confusion ensues.][4]

If the previous paragraph makes your eyes glaze over, congratulations, you’re normal.

Well, probably. But if correcting the FeedValidator to **match the specification** gets you annoyed like this, then your software philosophy is sloppy. [Specifications matter.][5] Checking against the specifications matter. Your software has to match the spec. And when it doesn’t &#8211; you fix your software. You don’t complain bitterly about the people pointing out that your software doesn’t match the specification.

(however- what the heck is up with all these server side validators not letting people add almost valid feeds to their subscription list &#8211; or at least pointing out the trivial little change and asking if you want to add it anyway, knowing it might break later. I really shudder at something outright breaking based on a Yes or No from a third party web tool That seems worse to me than any of this other debate about the specs).

 [1]: http://feedvalidator.org/docs/warning/CommentRSS.html
 [2]: http://www.intertwingly.net/blog/2006/04/16/commentRss
 [3]: http://photomatt.net/2006/04/15/feed-validator/
 [4]: http://sourceforge.net/mailarchive/forum.php?thread_id=10183105&forum_id=37467
 [5]: https://rambleon.org/2006/03/09/why-standards-matter/