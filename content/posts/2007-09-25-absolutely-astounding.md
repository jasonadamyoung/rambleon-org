---
title: Absolutely Astounding
author: jay
type: post
date: 2007-09-26T03:26:02+00:00
url: /2007/09/25/absolutely-astounding/
categories:
  - Reflections
  - Uncategorized
tags:
  - atom
  - software
  - stupidity
  - wordpress

---
Dear WordPress devs.

I really appreciate the work you do on WordPress. I appreciate your open source philosophy &#8211; I appreciate your contributions to the community of a relatively easy-to-use software package that has been a part of a revolution in how people communicate. Long ago, I threw away my own blogging platform, because I was attracted by the community and ecosystem surrounding WordPress (once it got going out of a languishing b2 product).

But I continue to be mystified by your continued obstinate behavior about helping the product’s users actually pick a standard way of syndicating their data. I know that Uncle Earl cares not about what text strings are formatted where and in what way. But as programmers you should actually get the fact that standard ways of consuming and sharing information really do matter &#8211; and they are going to matter more and more for Earl and Millie both when they begin to realize the power of mixing, mashing, and aggregating information.

I was so impressed that you enlisted the community help with implementing Atom support &#8211; including the publishing protocol. But why on earth did you not write a few lines of code to make it easier to change the default format from the InternetJerrySpringerDrama that is rss2 to atom?

Oh, I see, [you “didn’t think this option should be part of the UI, because for almost all people the option is not useful.”][1]

Of course, because my timezone offset and my encoding preference and whether or not I use “wp-hacks” support is stuff that more people care about than using an actual standard way of syndicating our content.

I really, really do in all sincerity appreciate that WordPress is Open Source &#8211; because it give me a chance to route around your damage to it.

For the rest of the world &#8211; the quick hack &#8211; until plugins show up to make this a little more seamless is to (I THINK) replace line 845-846 in wp-includes/functions.php from:

 <code class="highlighter-rouge">if ( $feed == '' || $feed == 'feed' ) $feed = 'rss2'; </code>

to

 <code class="highlighter-rouge">if ( $feed == '' || $feed == 'feed' ) $feed = 'atom'; </code>

That was only a quick, cursory examination on my part, I’m sure others will be coming out with better solutions.

I realize that open source means putting your coding fingers where your mouth is, but some coding choices in life just seem better off in the core &#8211; and this is certainly one of them. The WordPress devs apparently disagree, and it’s their software and their prerogative to do so. I respect that &#8211; I just don’t have any respect _for_ it.

 [1]: http://trac.wordpress.org/ticket/4595