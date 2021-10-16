---
title: Field of Dreams
author: jay
type: post
date: 2010-05-13T03:19:25+00:00
url: /2010/05/13/field-of-dreams/
categories:
  - Reflections

---
> _“The one constant through all the years, Ray, has been baseball. America has rolled by like an army of steamrollers. It’s been erased like a blackboard, rebuilt, and erased again. But baseball has marked the time. This field, this game, is a part of our past, Ray. It reminds us of all that once was good, and that could be again.”_

I used to love baseball. And maybe for one or two glorious years in little league, I was good at baseball. But Babe Ruth league came, and the pitchers got better, and I didn’t. I’d have 2, maybe 3 games at the start that I’d go 2 for 3, or 3 for 4, but then I’d start a game full of piss and vinegar, and come up to bat expecting to hit my customary line drive up the middle or between first and second and I’d strike out.

And the season would go downhill from there, I’d never get the groove back.

Baseball is a strange game. It’s a game where the simplest measure of success for hitters is itself an abysmal failure, its superstars git a hit somewhere around 3 times out of 10. 30% success at the plate (I know it’s not quite that simple, but humor me) but perfection in the field, dead aim in the arm, and sprinter’s speed 90 feet at a time.

In a sense, it was good preparation and a good metaphor for a career in computing.

I’m one of those odd hybrids, a developer that’s a systems administrator, or maybe a systems administrator that’s a developer, I don’t know. I’m pretty good at what I do, which of course means I guess I’m not at the top of the game for either. While many of my colleagues in the field seem to get to focus on one thing or another, I’m the journeyman utility player, trying to keep track of a thousand things at once, and experiencing a continual string of successive failures, while maintaining perfection (or illusion thereof) of error-free service in the field.

Just this week — here’s just a snapshot, what I happen to remember while writing this:

  * trying to work around what appears to be a bug in a release version of OpenSSL after a few hundred SVN operations by using SSH
  * finding out after 5 hours of trying to boot rescue disks through a DRAC that I need a rootdelay of at least 20 in my grub config on my dell server.
  * re-learning NTP configuration for what feels like the 10th time, trying to figure out why I can’t force a lower stratum on the box I need to act as a time server, only to find out we were given the wrong upstream time server
  * realizing that in many cases we are routing traffic through a CISCO ASA when we don’t need to, dropping my throughput by a third routing through my CISCO ASA
  * shelling in at 10pm to mark a notification email as send_error = true, because out of 85,000 emails before it, it’s the first I’ve seen trigger an unknown bug adding an ActionMailer exception message to a serialized data field, which is throwing cron errors every 5 minutes, just happy that I coded a bailout condition in the first place
  * worrying if tomorrow brings more failed emails, that I’ve got to find some contact at the University of Kentucky central campus mail people because they are suddenly blocking our daily notification emails, but only for some of their clients, and none of the others that saw those bounces understand that’s what happened, or if they did, they are hoping that somebody else is going to take care of it
  * to having to put together a presentation on the basics “tagging” because using a string of characters in as a ad-hoc description is a lot scarier to using a string of characters that somebody else defined to describe something, or maybe it’s just because it’s called “tagging”
  * worrying about the fallout from a tagging change that had to be changed to be consistent with all our other tools, because for three years we were developing in individual vacuums, only the fallout is coming up a month after it was released, because it’s the first time anyone has used the application that used it differently before that triggers the problems
  * worrying about colleagues wondering if we shouldn’t re-introduce the inconsistent behavior, even though it was part of a 3 month long development cycle to change to be consistent
  * a contract job where performance problems are plaguing the application so badly that we are now shelling out to php/gd from rails because imagemagick and rmagick are too slow in a VPS environment — or maybe any environment, and once that was licked we are now struggling with 1 second response times on mobile views when we need 500ms response times (and even that is honestly too slow)

And that’s probably a fourth of it this week. All the while, I am getting crap because I am not open and receptive to everybody’s “great ideas” that I already worked through and spec’d last year, and wanted very much to do, but there’s no time to do it, because all of my team is working through new comps, or is out sick or is responding to support email for stuff we did 6 months ago.

I asked for this. I put myself in this postion. Absorbing everything I could about as many areas in my field as possible, finding myself feeling the person that has to step up to everything from systems to code to support to whatever it takes to make it work, jack of all trades, and master of none.

Some days though, you just want the constant failures to stop . To have the opportunity, for just once, to dig in, spend the time, and become a master at just… one… thing. To implement just one of the 100 ideas you’ve had before next year, when 6 months from now, somebody uses your app for the first time and complains about it not having that idea you know it needs. To make the time to do one thing (or a few things) really, really well, and the way you know it should be done.

Some days, I’d just like that walk-off home run in the bottom of the ninth, and not go 0 for 4 in the second game of the doubleheader.

But, I guess it’s as Yogi Berra said, “If the world was perfect, it wouldn’t be.”