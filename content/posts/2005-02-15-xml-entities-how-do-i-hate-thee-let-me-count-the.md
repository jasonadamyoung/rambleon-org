---
title: XML Entities, How do I hate thee? Let me count the
author: jay
type: post
date: 2005-02-15T21:54:44+00:00
url: /2005/02/15/xml-entities-how-do-i-hate-thee-let-me-count-the/
categories:
  - Uncategorized
tags:
  - sysadmin

---
I hate HTML and XML Character Encoding, what a nightmare.

This all started yesterday. Actually, this all started several days ago with a post to our [Campus “Network Administrators Group”][1] [mailing list][2] — in which I opined on the benefits of RSS and RSS aggregators and queried for the group’s favorites.

Well, a couple of people pointed out that [Thunderbird][3] does RSS — ala an old fashioned NewsReader. So I wanted to try it out.

Only the current release of Thunderbird doesn’t natively provide support for importing a bunch of subscriptions (using, say an [OPML][4]. file). Well, that led me to [this blog entry][5] Which adds OPML import/export support to Thunderbird.

Cool right? Well somedays it doesn’t pay to get out of bed and write your own weblog software.

See, on import of my [NetNewsWire][6] OPML output, Thunderbird reported that two of the feeds were invalid.

RSS feeds are XML, and like any XML/XHTML source — they should be [valid XML][7]. However, it practically seems that this can be a total nightmare.

When [EWE][8] was released, I checked all the feeds with sample data at [feedvalidator.org][9] to make sure things looked okay.

Valid RSS right?

Well, valid until it wasn’t valid 🙂

What broke one of the feeds was the innocuous Copyright symbol. (C) In the source text, it was actually the copyright symbol ( (C) ). I have been dutifully running the RSS output through the [htmlentities()][10] function, to convert things like that to their HTML entities representation. XML doesn’t know anything about HTML entities built-in, except for just a few. I understand that, but you’d think that I could supply some namespace or something and fix that.

Well, I probably can, but I don’t understand that. Trying to understand would likely make me curse a lot (more).

So I tried the xmlentities() function that was buried in the comments for [htmlentities()][10] — that was nice until it didn’t do the &nbsp because PHP’s [get\_html\_translation_table()][11] has a limited set of entries in it, none of which are &nbsp — which isn’t valid for XML.

So, heretofore I found [this article][12] — which has 2000+ translations.

So now I run the RSS text through htmlentities — then through a [strtr()][13] with the gigantic translation table (with the < and > and &amp translations commented out).

I think I’ve fixed things — until something else breaks.

But by then — I think I’ll be like [this chap][14] and if:

> <div class="highlighter-rouge">
>   <pre class="highlight"><code>1) You can type a character on the keyboard;  2) Browsers can display it (they better if (1) is true)  3) Printers can print it  4) Humans can read it	then the RSS feed is valid. This whole valid-invalid BS is making RSS difficult for both reader makers and publishers.</code></pre></p>
> </div>

Until then:

[!["[Valid][15]][15]

 [1]: //www.nag.ncsu.edu"
 [2]: //lists.ncsu.edu/cgi-bin/digest?list=nag&archive=nag.200502&Submit=Show+Archive"
 [3]: //www.mozilla.org/products/thunderbird/"
 [4]: //www.opml.org/spec"
 [5]: //dougal.gunters.org/blog/2005/01/17/improved-thunderbird-opml"
 [6]: //ranchero.com/netnewswire"
 [7]: //feedvalidator.org/about.html#why"
 [8]: //people.engr.ncsu.edu/jayoung/site/pages/ewe/default"
 [9]: //feedvalidator.org"
 [10]: //php.mirror.ncsu.edu/manual/en/function.htmlentities.php"
 [11]: //php.mirror.ncsu.edu/manual/en/function.get-html-translation-table.php"
 [12]: //www.coeus-group.com/en/archives/240-get_html_translation_tableUEBER.html"
 [13]: //php.mirror.ncsu.edu/manual/en/function.strtr.php"
 [14]: //www.olegdulin.com/index.php/archives/2004/09/02/my-current-rss-feed-is-invalid-tough/"
 [15]: //people.engr.ncsu.edu/jayoung/site/rss/binarypage"