---
title: Leopard and X11.app
author: jay
type: post
date: 2007-11-09T19:46:34+00:00
url: /2007/11/09/leopard-and-x11-app/
tags:
  - macintosh
  - unixgeekery
  - x11

---
[This is a really nice post][1] from Ben Byer at Apple on the changes to X11 in Leopard.

I found it after going to look for the solution to the same annoyance that others were having, namely that my ~/.xinitrc seemed to be ignored and launching X11.app would create unwanted xterms (have I mentioned that I really _HATE_ xterms?)

Anyway, the new launchd implementation of X11 is great for me. In order to use terminal.app or iTerm with X11 in Tiger I had this whole block of an if statement in my bash profile that would open /Applications/Utilities/X11.app &#8211; and then run osacript to bring the focus back to the Terminal, but only do it for console terminals, not ssh terminals, and set $DISPLAY right, and…. and it was just a kludge.

I love the fact that I can ssh -X now and it just works.

 [1]: http://lists.apple.com/archives/x11-users/2007/Oct/msg00065.html