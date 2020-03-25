---
title: On the Hump
author: jay
type: post
date: 2005-08-17T17:22:54+00:00
url: /2005/08/17/on-the-hump/
categories:
  - Reflections

---
Because I’m in a bit of a dead spot at work (we are largely in “startup” mode &#8211; and the funding to get the hardware we need to begin to ramp up and create new services is there, but it is still caught up in the bureacracy between the various contracts and grants groups, and the people to help create those new services aren’t here yet either) &#8211; it’s given me a chance to chip away at the mile long “Flagged Items” list in NetNewsWire.

Everyone and their mother’s brother’s cousin is linking to the trampling and all-around mayhem that was the Henrico County iBook sale. So I won’t link to it. Okay, I will &#8211; but only to [Dave Barry’s link to it][1] which is rather appropriate.

Sometimes security through obscurity is not a bad thing.

Via [Chuq Von Rospach][2]: a great list of recommend software for your macintosh. All of the linking to it apparently killed the site. All the more reason to get cracking on updating [my own list][3] today.

I’ve switched from Safari to Firefox again (I really missed type-ahead-find) but it was driving me nuts to switch between tabs with the mouse because I got used to CMD+Left Arrow and CMD+Right Arrow to switch between tabs. Thanks to the [Firefox Keyboard Shortcuts list][4], I’m less frustrated, but still want to figure out how to change CTRL+TAB to CTRL+Right Arrow.

Switching to Firefox meant that I needed a way to synchronize my bookmarks between three Macs. Thanks to the [Bookmarks Synchronizer][5]. I can do that. And because I didn’t want to stick my .Mac password in the configuration for that synchronizer. I needed to setup both WebDav and SSL to go along with my Apache2 install on my Macintosh.

Setting up a SSL Certificate Authority and a signed certificate is a royal PITA, and something that I’m really not looking forward to writing up as a companion to my Apache2 article. Which is why finding this lovely menu item:

![][6]

which produces this dialog:

![][7]

seems to hold a tremendous amount of promise. Knowing what’s going on with a thousand obscure openssl commands is great &#8211; but if there’s a GUI to make that easier? All over it. I’ll hopefully figure out whether that dialog is actually useful or not today.

!["binarypage][8]Speaking of updates. Another tutorial that needs to be finished is how to install Subversion via Fink. Which in turn will let me update EWE. One of the first things I’m doing is going to change every mention of RSS to “FEED” and likely add Atom support. [Asa Dotzler is right][9] RSS is a silly name. And I’m honestly tired of the internet Jerry Springer rants surrounding the whole thing, web feeds make a lot of sense to me. (The funniest commentary I read about that was [this one, about Dave Winer living in a van…. by the river][10]). I also need to build a few more wiki-friendly features in it &#8211; and I think I’m going to call the ewe categories what they really are &#8211; tags.

Most likely, I’ll end up screwing up the regular expression matching &#8211; so this [Redet Software][11] will come in handy. At the very least, it’s the best list of other regex tools I’ve seen so far.

I think all that will keep me occupied for a bit.

 [1]: //blogs.herald.com/dave_barrys_blog/2005/08/department_of_r.html"
 [2]: //chuqui.typepad.com/teal_sunglasses/2005/08/nosce_te_ipsum_.html"
 [3]: //people.engr.ncsu.edu/jayoung/site/pages/default/recommended-macintosh-applications"
 [4]: //www.mozilla.org/support/firefox/keyboard"
 [5]: //addons.mozilla.org/extensions/moreinfo.php?id=14&vid=946"
 [6]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-81379baacbcfea5a66807d795a85b894/certassistmenu.png"
 [7]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-81379baacbcfea5a66807d795a85b894/certassistdialog.png"
 [8]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-81379baacbcfea5a66807d795a85b894/feed.png"
 [9]: //weblogs.mozillazine.org/asa/archives/008708.html"
 [10]: //www.makeyougohmm.com/20050816/2244/"
 [11]: //www.billposer.org/Software/redet.html"