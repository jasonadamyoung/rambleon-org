---
title: Do not forget the screwdriver
author: jay
type: post
date: 2006-07-14T01:45:57+00:00
url: /2006/07/14/do-not-forget-the-screwdriver/
categories:
  - Reflections

---
A modern day allegory.

[cue ominous music, and sweeping panoramas of man’s finest engineering projects through the ages]

So last week, I [lost a drive][1] in what was my primary database server, and as I went to replace the drives that day, I forgot my phillips head screwdriver.

The tiniest mistake that less than a week later, would result in multiple wasted hours of time.

[cue thunderclaps, and grainy film of the [tacoma narrows bridge][2], 1950’s rocket tests, and other engineering failures]

The server room with the failed drives is just a few miles as the crow flies from my office, but it’s a royal pain in the arse with traffic to get there some days, over one of the roads-that-most-needs-paving-in-Raleigh (hillsborough street for those keeping score). And then there’s the parking issue. I would be digressing, but I’m not. For my cautionary tale involves my complete avoidance of this.

So I go to replace the drives, carrying the spare drives, and the Dell drive carriers for my server, minus screwdriver. I get there, and have no way of attaching the drives to the carriers, something pretty much necessary in order to hot swap the drives.

But wait, (Lo!) there’s a cordless drill there with phillips bit, left by another group, and I figure that it wouldn’t be a big deal to use the cordless drill with phillips bit in order to attach my carrier(s) &#8211; it’s just 8 little screws for two drives! And of course I don’t want to have to drive all the way back just for a screwdriver.

Well, one of the spares turns out to be bad, which I find out after trying to make it a hot spare so I can rebuild the Raid. But one of them works fine, so it goes in the server.

Fast forward a few business days. I’ve got a replacement for the replacement. I start to unscrew the carrier from the failed replacement. And of course, you know what comes next, I can’t get the carrier off, the drill applied too much torque, and while trying, I strip the screw enough that there’s no way it’s coming out manually. eXtension doesn’t have a cordless drill.

So I think “I’ll go back to the server room and see if the drill is still there” &#8211; I go, it’s still there! But unfortunately, you guessed it, it’s out of power.

So the only recourse I have is to drive all the way home, get my own cordless drill, unscrew the carrier, and carry back the carrier to place on the good replacement drive.

Net time lost? Oh, about 4 hours. All because I forgot a screwdriver, and (importantly now, pay attention) &#8211; under the first time pressure, made an ill-formed decision to use the drill in the first place.

So what’s the moral of the story?

  * do not forget the screwdriver \* do not make a ill-thought out decision under duress to avoid doing the work you know you really should do \* given (a) and (b) &#8211; you are going to pay dearly for it in the end, redoing your system, or your code, or losing a few screws

Today’s Electric Company moment brought to you by the letter “J” and the number “3”

 [1]: http://systems.extension.org/blog/2006/07/06/database-server-degradation/
 [2]: http://en.wikipedia.org/wiki/Tacoma_Narrows_Bridge_Collapse