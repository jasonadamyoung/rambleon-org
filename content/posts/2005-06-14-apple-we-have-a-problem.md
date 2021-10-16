---
title: Apple, We have a Problem
author: jay
type: post
date: 2005-06-14T21:40:04+00:00
url: /2005/06/14/apple-we-have-a-problem/
categories:
  - Reflections

---
I love Apple’s products, I really do. And while I don’t really value the company’s secrecy, I do certainly value their innovation, and their product marketing/branding is usually top-notch.

But they aren’t above being absolutely brain-dead stupid.

So I’ve seen hints at this in my RSS reader in the last few weeks, but failed to follow up until today. Today I finally have seen the kicker with regard to QuickTime Player and Full Screen video.

Now, you theoretically have to buy QT Pro to watch movies in “full-screen” mode in QT Player. Some sites have it that you can work around this in iTunes (iTunes allows you to click the “fullscreen” option for movie trailers).

Well today — in a [somewhat related hint at macosxhints.com][1] — all you need is this AppleScript:

<code class="highlighter-rouge">tell application "QuickTime Player"  activate  present the front movie  end tell</code>

load a movie, put that in script editor, click run, voila! full-screen!

This makes the greyed-out menu option for full-screen video even more completely ridiculous. Too bad that great software engineering by the QuickTime team is completely overshadowed by brain-dead product packaging and marketing.

(actually it could be brilliant marketing, forcing customers $30.00 because they think they must shell that out to watch full-screen video, never mind all the other features of the software are worth the licensing fee, however, that certainly doesn’t mean it’s right).

 [1]: //www.macosxhints.com/article.php?story=20050527181101387&lsrc=osxh"