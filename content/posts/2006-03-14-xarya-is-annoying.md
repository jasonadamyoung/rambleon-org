---
title: xarya is annoying
author: jay
type: post
date: 2006-03-14T17:11:19+00:00
url: /2006/03/14/xarya-is-annoying/
categories:
  - Reflections

---
What kind of content management system hardcodes the path in the file entries in the db? Shouldn’t you think it should be, oh, I don’t know, RELATIVE to the CONFIGURATION SETTING for the file management module?

I’m so glad we aren’t using this thing anymore (obviously a heeeYOOOGE part of my complaint is I don’t know squat about Xarya).

At any rate, this post serves to highlight, via my [co-worker James][1] &#8211; comes the greatest mysql query statement ever (this week at least) &#8211; to search out and replace stringA with stringB in a mysql column.

> UPDATE table SET field = REPLACE(field,’search’,’replace’)

which let me replace one hard-coded path with another. Which I’m sure I’ll need again &#8211; thereby the post for posteriety

 [1]: http://www.robinsonhouse.com/