---
title: Say, Say, Say
author: jay
type: post
date: 2005-03-07T10:00:52+00:00
url: /2005/03/07/say-say-say/
categories:
  - Uncategorized
tags:
  - sysadmin

---
No, not the song (which thankfully isn’t in the iTunes Music Store, but sadly I do own a copy of via a Paul McCartney greatest hits CD) — but the [OS X command][1]

I mentioned my little [baseball drafting application earlier][2], but what I didn’t mention was that it was made possible by OS X and [Fink][3] — which let me run Apache, PHP, and MySQL pretty easily on a laptop. (okay, okay, I’ve done this on Windows too).

Well, on a lark, I added a simple exec(‘/usr/bin/say’) call to the “Draft this Player” feature of my application.

Say is a command line interface into the OS X speech engine. Allowing you to speak or output to a .aiff file whatever string or input you pass to it.

And draft day was spent with the computer generated echoes of “The Cleveland Indians select…”

What a great little feature. I love OS X.

(bonus for the Macintosh using readers — for grins and giggles try “say Ricky Bottalico” from your shell and explain that one to me)

 [1]: //developer.apple.com/documentation/Darwin/Reference/ManPages/man1/say.1.html"
 [2]: //people.engr.ncsu.edu/jayoung/site/pages/-fdbc6630071891aca1f4f7e3127d9963"
 [3]: //fink.sourceforge.net"