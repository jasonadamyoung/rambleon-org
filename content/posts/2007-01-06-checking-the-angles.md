---
title: Checking the angles
author: jay
type: post
date: 2007-01-06T02:34:03+00:00
url: /2007/01/06/checking-the-angles/
categories:
  - development
  - Uncategorized
tags:
  - sysadmin

---
I’m not sure if the systems background that I have or that I am a perfectionist or that I’m just flat-out pedantic — but one of the things I’ve noticed in my approach to creating code that I haven’t seen in people that I’ve worked with that have come up through the developer (not support, not IT/systems) ranks is that I’m far more likely to do two things. One, I’m far more likely to clean up after myself. I’ll remove unused code blocks and/or re-factor as I go, and if I find a better/different way (or pending deprecation) of doing something — I go back and clean up/change most or all the places that aren’t using the new way to be consistent Two, I seem far more likely to mentally consider more of the input edge cases and handle them.

Maybe it’s just the style of those that I’ve been around — or maybe it’s endemic — I don’t know. Maybe I have a systems mentality and a development training that come of age in the functional and waterfall years (but thank heavens those are over). But even with current developer discussions that tend toward design patterns, talk about unit testing, code coverage, which are certainly good and useful things — when not used as a trendy buzzword — nothing seems to beat old-fashioned coding sweat. Good variable names, the occasional comment, cleaning up after oneself, and sanity checking input.

Anyway, I’m just reminded of this today, possibly out of guilt. I recently combined a bunch of shell scripts that were handling my apache log analysis process for the 30+ vhosts we have into two vhosts. The shell scripts were working perfectly fine, but were heavily dependent on hard-coded strings and were a bear to extend (in the current “Don’t Repeat Yourself” mantra of the Rails crowd — they were like a needle on a scratched 33 1/3rd LP on a 78 rpm roundtable). I did a relatively straight port for round one, with some useful loops, and then after I left out a few calls to awstats that broke daily stats — I went back and cleaned it up some more and added parameters to deal with dates. I split things out into a few methods to make it cleaner — and of course had to rename all the variables because they were no longer semantically valid.

One of the things the scripts do is during awstats report production — they create convenience symlinks for the html reports for the “currentmonth” and “currentyear” and “yesterday” — which is slightly better than having to walk web directories for year/month and year/month/day (I’m using index walking for report browsing — it probably needs a front end app to ease browsing, but other priorities first). Well, those symlinks assume the natural scheduled running of the application. It runs early in the morning — based on the logs and data generated up through “yesterday”. However, when you pass dates in to re-run reports if necessary (a very rare thing that’s not likely to occur again for months) — generating those symlinks is worthless if the date you gave the script is not the “currentmonth” or the “currentyear” or “yesterday”

So of course, I had to add code to check for that. Pedantic isn’t it? Especially for something that rarely, if ever, will occur again — so what if the symlinks are temporarily broken until I run the standard process again (either scheduled or by hand). But date comparisons I added.

The guilt that I have, of course, happens on the first of the month. Given that the scheduled job that runs on the first of the month — and only processes yesterday’s data (the last day of the prior month) — well that invalidates the semantic meaning of “currentmonth” (or “currentyear” for Jan 1). Before I didn’t bother — I just created the symlinks even though “currentmonth” really means “lastmonth” on the 1st.

But code that I added keeps the symlink from being created if the month of “yesterday” doesn’t equal the month of “today”. Oh well.

Of course, it also prevents removal of the previous symlink. So in the end its a wash 😉

This story brought to you by the number 3 and the word “anal”

* * *

postscript:

While I was writing this, I looked at my code to double-check when the symlinks would get created. In order to create date-based directory names in places — I end up doing:

 <code class="highlighter-rouge">reportday = timevalue.day reportmonth = timevalue.month reportyear = timevalue.year </code>

(I do need the distinct values for those things as opposed to doing to producing a yyyy/mm/dd string)

My month comparison code just copied that model — and so I was doing:

 <code class="highlighter-rouge"># is currentmonth? todaytime = Time.now todaymonth = todaytime.month todayyear = todaytime.year reportmonthdate = Date.parse("#{reportyear}/#{reportmonth}/01") todaymonthdate = Date.parse("#{todayyear}/#{todaymonth}/01") iscurrentmonth = (reportmonthdate == todaymonthdate) </code> Totally inefficient right? _While writing this article_ I ended up re-factoring it 🙂 \` # is currentmonth? reportmonthdate = Date.parse(“#{reportyear}/#{reportmonth}/01”) todaymonthdate = Date.parse(“#{Date.today.year}/#{Date.today.month}/01”) iscurrentmonth = (reportmonthdate == todaymonthdate) \`

(which could be collapsed to one line — but the above is slightly more readable to me)