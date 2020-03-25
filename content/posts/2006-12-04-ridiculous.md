---
title: Ridiculous
author: jay
type: post
date: 2006-12-04T06:38:43+00:00
url: /2006/12/04/ridiculous/
categories:
  - Reflections

---
And I don’t mean the fun little spell from _Harry Potter_.

Note to fellow system admins: the first thing you should do is always check /tmp.

Always.

Did I say always?

So my bug tracking system, FogBugz, was creating empty calls for inbound email tonight. I discovered this, because like an idiot, I checked my email at 9:30pm. And I see there’s a problem, and can I leave it until the next morning? NOOOOOOOO, of course not. (okay, so maybe that’s the real mistake).

So because FogBugz is a finicky little creature, and because I’ve made changes to the mailhandling code in it recently to allow us to mirror outbound email from it for tracking and troubleshooting purposes &#8211; at first I thought it was broken. Which is weird that it just stops working after days of working fine.

Get that, “just stops working” &#8211; which kinds of things make things “just stop work” &#8211; yeah that’s right, filesystems filling up. Did I check that? of course not. I’m an almost 15-year experienced systems manager/administrator and an (immodestly) bad-ass troubleshooter. Of course it had to be something big, BIG I say.

After ruling out FogBugz &#8211; what do I do? I start rebuilding my cyrus-imapd mailboxes. Did that help? of course not.

Then I start testing PHP and IMAP with IMAP test code, figuring that there’s something really wrong there.

I get corrupt headers back from the imap_headers command &#8211; YES! IMAP IS BROKEN! Maybe Cyrus is broken!

I run wireshark to see what’s coming back from the Pop3 requests (Fogbugz uses Pop3, the IMAP lib in PHP can do Pop3, my IMAP server does Pop3). Yes you read that, I’m freakin’ sniffing the wire to figure out what’s wrong. Guess what? That looked great! Which of course means….

Yep, PHP/IMAP is broken! Cyrus is not broken!

OMG! the imap/pop3 test works from another machine

EGADS! my PHP installation has suddenly broken! It’s corrupt! maybe I’ve been hacked!!!

No, the imap.so dates and filesizes are the same machine to machine.

WHAT’S WRONG?!?!?!

I then check the email again. Hmmmm…. my mysqldumps are failing every hour with a “Got error 28 from storage engine (1030)” error

Could that be related? Let’s ask Google…

Hmmm… it says something about the partition being full

$ df … … 100% /tmp …

Which of course resulted in something akin to “damnit” &#8211; though more vociferous and I think I turned red from embarrassment &#8211; though no one saw, because everybody else, is soundly asleep, where I should have been 2 hours ago.

And then sheepishly I clear out /tmp (still need to figure out why it filled up, it’s related to wsvn running on the same machine I think)

The lesson my friends? Sometimes you can completely overthink a problem. So before you break out the packet sniffer, make sure to run df.

The public service message brought to you by the letters I, D, I, O, T &#8211; that would be me.