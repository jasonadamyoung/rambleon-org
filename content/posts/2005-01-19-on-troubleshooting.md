---
title: On Troubleshooting
author: jay
type: post
date: 2005-01-19T05:34:13+00:00
url: /2005/01/19/on-troubleshooting/
categories:
  - Reflections

---
I’ve spent a lot of time over the last several years wondering how one can teach _troubleshooting_. That is, how does one develop the set of skills necessary to recognize computing problems, quickly coming to an idea of what likely root cause is (and what is not), testing that assumption, and then reaching a solution or returning back to square zero based on that test (or even evaluating the validity of the test).

I’m not sure if troubleshooting skills are gifts, some function of IQ level, learned, developed, sharpened, I don’t know. Some people seem to have them and some don’t.

But the ever-hopeful educator in me would like to think they can be tuned and developed over time, or in some way, the fundamentals could be taught &#8211; much like the fundamentals in baseball or other endeavors.

One of those fundamentals is making observations about system events and learning to recognize “out of the ordinary” events or errors. Some errors are normal (or expected) and some aren’t. Figuring out the root causes of these is one of the keys to troubleshooting

Case in point:

I make it a habit to check my system log often looking for anomalies, software errors, failed login attempts (like the 2820 login attempts as ‘root’ today from some IP address in Japan &#8211; stop it already, will ya?).

Last week I had a bunch of errors that looked like this:

<div class="highlighter-rouge">
  <pre class="highlight"><code>rambleon kernel: arplookup 152.1.68.245 failed: host is not on local network</code></pre>
</div>

Which is a little out of the ordinary. Looking a little closer showed the messages to be occurring about every hour. So there are two questions here:

  1. Why are the messages appearing in the first place?
  2. Why are they appearing every hour?

The second question is what trips up a lot of folks. They either focus solely on the second issue &#8211; “how does this error keep occurring?” And solving that, they never progress to really getting to the “why” of the error &#8211; they’ll just stop whatever is causing the display of the error. Or they discount it as immaterial to the matter at hand “who cares how many times the error occurs, it is still an error”

The second question is really the key for discovering more information &#8211; it gives us the glimpse that the problem is _repeatable_ &#8211; that is, if we can discover what is causing the error to display, we then can control its display ourselves, and set up a test to get to the root cause

152.1.68.245 is the IP address of one of our webservers. In fact, it’s the address for the [www.itecs.ncsu.edu][1] “virtual host.” It’s plausible that my desktop machine could be talking any of our servers every hour, but most web traffic is “bursty” &#8211; you read some pages, do some things, read some more pages, do some other things. It’s not really periodic &#8211; unless my desktop machine was running some kind of status check every hour for some reason. This is when it helps one to know _exactly_ what is running on one’s desktop as much as possible. In this case, it was my copy of [NetNewsWire][2] &#8211; checking the RSS feeds for [the ITECS/Systems][3] home page. To test that, I’d get the error every time I forced NetNewsWire to check the NCSU feeds

So now, I had a tested source of the repeating errors &#8211; but why are they occurring? That’s the part of troubleshooting where experience and knowledge does come back in. I do know what an ARP is and the basics of IP networking and address resolution. But not having that knowledge wouldn’t have prevented me from solving the problem. If I didn’t know what ARP was, I could have [easily looked it up][4] and keyed on what the difference was between a [local and non-local][5] network host/address. The biggest part of troubleshooting is that I recognized the patterns and knew something was up &#8211; “every time my computer checks the webserver’s feed &#8211; it prints this error”. And probably the only reason I know anything about ARP and Subnets is the fact that something like this has come up in the 10+ years that I’ve been doing System Administration.

My “gut instinct” was to immediately check the network configuration on my desktop. For some reason, like an incorrect **subnet mask** &#8211; my computer thought that 152.1.68.245 was local &#8211; and not actually on the other side of the default router from my desktop computer. Sure enough I had a typo in my subnet mask. Correcting that has happily made all the messages go away.

 [1]: http://www.itecs.ncsu.edu
 [2]: http://ranchero.com/netnewswire/
 [3]: http://www.itecs.ncsu.edu/systems
 [4]: http://en.wikipedia.org/wiki/Address_Resolution_Protocol
 [5]: http://en.wikipedia.org/wiki/Subnetwork