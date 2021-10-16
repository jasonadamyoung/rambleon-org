---
title: Sigh Perfectionism Sigh
author: jay
type: post
date: 2006-07-18T18:51:25+00:00
url: /2006/07/18/sigh-perfectionism-sigh/
categories:
  - Uncategorized
tags:
  - sysadmin

---
So, when your perl script that came with your mod-log-sql distribution that dumps your database out in combined log format managed to put the remote_user value (which is usually only valid for a handful of internal sites anyway) in the wrong log field meaning that your multiple hour process that created your historical awstats process that ran all night last night produced data that looks like:

address user — [date]

instead of

address — user [date]

what do you do? You fix the perl script, and run the whole damn process over again.

Sigh.

p.s. yay again for screen