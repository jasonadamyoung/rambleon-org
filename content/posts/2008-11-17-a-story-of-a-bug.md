---
title: A Story of a Bug
author: jay
type: post
date: 2008-11-17T04:05:42+00:00
url: /2008/11/17/a-story-of-a-bug/
tags:
  - bug
  - code
  - mysql
  - redhat
  - ruby
  - sysadmin
  - system administration

---
It started, as it should, with the belief that it was my own bug.

I’ve been working for the last few days to generate [daily summaries][1] of the activity flowing through our tools. It’s nothing earth shattering, but it’s been a stepping stone to understand a little bit more about the Rails framework &#8211; and gave me the chance to begin experimenting with the Google Visualization API. Toward the latter part of the week, there was something a little odd with the “total valid” numbers with the [daily account creations][2] &#8211; I had made data changes to make sure I had some idea when accounts were vouched for and when they had been retired &#8211; so I naturally assumed it was something I did. I [even went back and modified][3] the model to make it more consitent with it’s peer models. And kept running the script that produced the daily stats in the Einstein-esque insanity of the doing the same thing twice and expecting different results. After about a dozen combinations of DATE(date_column) comparisons &#8211; I went to google, because I knew by then I was either going crazy or this was a legitimate “it’s not my problem” bug.

Which led me to [this mysql bug][4]. Reported July 19, 2007. Apparently introduced in MySQL 5.0.42 (May 2007) when the DATE comparison changed from strings to ints. Fixed within two days as part of 5.0.48 (Released August 2007).

But guess which mysql package Red Hat EL 5 (well, RHEL5 update 2) provides? &#8211; right, in between. It’s MySQL 5.0.45. And the [forthcoming RHEL5 update 3][5] release [doesn’t update MySQL][6] either.

Development and System Administration is a weird, weird world. I use RHEL, not for support (I’m not even sure we have support with the University contract), but to have some degree of patch level stability that’s slightly longer than the fedora releases (and at the time I went to RHEL, Fedora was still dealing with it’s Red Hat transition) &#8211; but that stability comes with the price of things like this. I already use my own Ruby to get beyond the base install, but configure, make, make install for one piece of core software is a little different than dealing with it (or MySQL-supplied RPMs) for other software.

I’m glad the open source world gives me that choice, but open source + my labor + thousands of moving parts does give provide the reality that even when a bug is fixed two days later, in the open, patchable by everyone &#8211; that sometimes you can find yourself over a year later modifying your own DATE queries so that they don’t include nulls.

So that’s the overall summary of the post I guess &#8211; part of it to go into google that if you are getting odd MySQL DATE function results on MySQL 5.0.45 on Red Hat Enterprise Linux (RHEL 5) &#8211; it’s a bug. And it’s fixed. But not included in RHEL 5. And if you aren’t getting odd results with DATE comparisons &#8211; you probably don’t know that you are.

And maybe one part as a lament to that inevitable ongoing intersection of thousands of moving parts in every environment, not the least of which ours. And you trade off replacing mysql on multiple servers and just [turn nulls into zeros][7] (which then [breaks your signup form that desparately needs an overhaul][8]) &#8211; well, because it seemed to make sense at the time.

And people say you don’t use probability after college.

 [1]: https://people.extension.org/numbers/dailysummary
 [2]: https://people.extension.org/numbers/dailyaccounts
 [3]: http://justcode.extension.org/repositories/diff/identity/trunk/app/models/daily_account.rb?rev=1115
 [4]: http://bugs.mysql.com/bug.php?id=29898
 [5]: https://www.redhat.com/archives/rhelv5-announce/2008-October/msg00000.html
 [6]: https://bugzilla.redhat.com/show_bug.cgi?id=453156
 [7]: http://justcode.extension.org/repositories/diff/identity?rev=1119
 [8]: http://justcode.extension.org/repositories/diff/identity?rev=1128