---
title: lazy man’s piped command of the day
author: jay
type: post
date: 2007-02-14T18:52:29+00:00
url: /2007/02/14/lazy-mans-piped-command-of-the-day/
categories:
  - Uncategorized
tags:
  - sysadmin
  - work

---
I’m upgrading mediawiki — can you tell?

<code class="highlighter-rouge">svn status | grep ! | awk '{ print $2 }' | xargs -I '{}' svn rm '{}'</code>

I’m sure there’s a better way.