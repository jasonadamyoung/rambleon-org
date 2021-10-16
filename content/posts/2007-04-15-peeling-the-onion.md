---
title: Peeling the Onion
author: jay
type: post
date: 2007-04-15T00:48:39+00:00
url: /2007/04/15/peeling-the-onion/
categories:
  - development
  - Uncategorized
tags:
  - sysadmin

---
And no, I don’t mean [The Onion][1] — which would have been far more entertaining.

Through [Joi Ito’s blog][2] I have recently become aware of the phrase “Yak Shaving.” Joi [wrote about it in 2005][3], here’s [WikiPedia’s take][4] — and [here’s an etymology from Alexandra Samuel][5].

When I first read Joi’s blog. I took Yak Shaving to mean a pointless activity (Joi writes in a bit more layered fashion than most folks). It’s part that of course (read Alexandra’s post). But it’s more about good problem solving. Especially when you go and read the entry in the [Jargon File][6]

> Any seemingly pointless activity which is actually necessary to solve a problem which solves a problem which, several levels of recursion later, solves the real problem you’re working on.

One of the things that I’ve spent my entire career doing is looking for the root causes of problems. Yes, just like every other system administrator/developer, there are times that I’ll defer the problem to another day (to this day, I’m still avoiding a mime types/magic file problem with Red Hat and PHP and MediaWiki that I’ve spent too much time on already). But I recognized a long time ago that digging into something, rather than stopping when the problem was mitigated was going to be much better for everyone. I spent a lot of long nights doing this early on, and still do occasionally — and I’m thankful for some early examples from mentors that encouraged this. It’s made me a much, much better troubleshooter over the years for doing so.

The latest peeling the onion activity came last thursday. I arrived at work, with every intent of taking the example OpenID rails server in the ruby-openid distribution and beginning to pull it in our internal authentication tool. Doing that is very much a “Yak Shaving” activity. There’s some other more pressing problems, but doing OpenID in the internal application solves part of 2 or 3 other problems.

Well that fell by the wayside by mid-morning. We have a preview version of our public website. Most days I’m actually surprised that it works given our Rube-Goldberg esque technical framework for taking mediawiki pages and getting them to the public web site. But it’s been a real benefit internally to have the preview site. Making it happen also made the public application more flexible too.

Well, mid-morning thursday, there was a report that content wasn’t updating on the preview site. At first it was thought this might be a by-product of the previous day’s activity — pulling out a rewrite rule that was eating encoded “?” characters (i.e. %3F) in MediaWiki page titles and causing 404’s by the time those URL links made it into a Flash application and a Rails application. In the process of fixing that, we actually fixed another problem where the source URL for each page in our atom update feed was wrong.

Making that URL correct was what broke things the next day. It turns out that Problem #1 was that the process that pulled in the atom feed keyed in on the _URL_ as the unique identifier for the content (as a fake unique identifier actually, it wasn’t enforced by MySQL). Since the URLs changed when they were fixed — voila! duplicate content — and of course the Find was doing a Find first — and pulling the original, un-updated article.

There was a whole lot of scratching our heads (okay, there was a lot of cursing) about that unique key. The URLs in question are “internal” and pretty much guaranteed to change. Keying off that certainly wasn’t great design. I guess it goes back to that original issue — it solved the problem for a day, but no one gave any future thought as to what it would impact.

So we needed to key off the page title. Well, the page titles weren’t unique either. Which was also a head scratching/cursing problem. MediaWiki page titles are unique in a namespace, and our find functions assume they’ll be unique as imported, but that uniqueness was not enforced.

Well, MySQL folks can guess what happened next. We’ve never actually ever dealt with the [collation][7] issues with our MySQL server (there’s a lot we haven’t dealt with with our MySQL server — but that’s another post for another day).

For good or for bad, I really didn’t understand why our collation was set to “latin1\_swedish\_ci” — and thought that I had made a major mistake setting up the server defaults in the first place, that no dev ever caught when thinking about their schemas. I was pretty relieved to find out that that was just the default for MySQL in the first place.

James’ absolutely groaner of a quote?

> Well at least we didn’t [bork][8] it up

Well, MediaWiki titles are case sensitive, and it made sense for that column to be case sensitive too — so in went the migration. This actually gave the additional benefit that searches for articles titles would actually be accurate now (even though we have some content that differs only in case that needs to be fixed).

<code class="highlighter-rouge">execute "DROP INDEX title_idx ON wiki_articles" execute "alter table wiki_articles change title title text character set latin1 collate latin1_general_cs null default null" execute "alter table wiki_articles add unique title_idx (title(255))"</code>

(p.s. <code class="highlighter-rouge">select somecolumn,count(*) as n from table group by somecolumn having n &gt; 1</code> is a wonderful tool to stick in the tool belt)

After all this is done, we had to import the content again. It’s about 25MB of an atom file — 5,000+ pages of content dating back to last september. Our standard processes of trying to pull this data in with a HTTP GET takes too long to run with the HTTP timeouts in the libraries we use — so a long time ago I modified our code to read the data from a file when needed.

Well, when a contractor modified the code to stop using the FeedTools library and just do some simplified parsing for our internal purposes they took out the “read from file” functionality and didn’t replace it. Which generated some more head scratching and cursing. So that had to go back in to get all the content back into and corrected.

A simple problem of content not being updated highlighted 4 different problems: wrong key for the content, no unique enforcement for any keys, wrong collation on the column, and data import from files missing.

We could have stopped early on by just killing the duplicated content with the wrong URL, updating it, and reimporting the latest changes. But we didn’t. The application we fixed didn’t matter for public use — but our fixes prevented some future problems.

I guess we shaved a few yaks that day. And proved yet again how important it is to get to the root of problems. And how painful it is later when you have to go back in behind yourself and others because it wasn’t done originally.

 [1]: http://www.theonion.com/content/
 [2]: http://joi.ito.com/archives/2007/04/12/mindfulness_and_deferred_yak_shaving.html
 [3]: http://joi.ito.com/archives/2005/03/05/yak_shaving.html
 [4]: http://en.wikipedia.org/w/index.php?title=Yak_shaving&oldid=122457857
 [5]: http://alexandrasamuel.com/blog/?p=38
 [6]: http://catb.org/jargon/html/Y/yak-shaving.html
 [7]: http://dev.mysql.com/doc/refman/5.0/en/charset-general.html
 [8]: http://en.wikipedia.org/w/index.php?title=Swedish_Chef&oldid=122090634