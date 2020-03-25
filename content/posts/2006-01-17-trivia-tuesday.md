---
title: Trivia Tuesday
author: jay
type: post
date: 2006-01-17T05:55:57+00:00
url: /2006/01/17/trivia-tuesday/
categories:
  - Reflections

---
So, because I want to ask both the PackMug and the extension system IT folks about their own naming schemes – this week’s trivia question (and the inagural one of I hope a continuing series) is:

**What do you name your computers?** (for system admins both servers, desktops, &#8211; but especially your own machine)

**Servers**

I’ve [already mentioned my current server naming scheme][1] (in my last job, we did boring things like engr##[id] where [id] was a type of server, e.g a webserver was “ws” &#8211; and ## an increasing count for the number of servers of that [id]).

Once thing I didn’t mention in the the previous post was that I name virtual ip addresses (additional ip’s assigned to a server interface) as machinename-virtual-hexcode (all NCSU main campus ip’s are 152.1.something &#8211; so I convert the last two octets to a hex code and use that as part of the A record &#8211; e.g. a virual IP for the host “gehrig” might be “gehrig-virtual-AABB”).

**Desktops**

I don’t support enough desktops to care about a naming scheme &#8211; so I ask the peer staff what they want &#8211; if I “own” a supported box, I use baseball names like the servers.

**My own computers**

I usually avoid anthropomorphizing any personal computers and tend to go with song names that I identify with. My desktop at home is named “copperline” after the James Taylor song of the same name and my laptop is named “walkingman” also after the James Taylor song of the same name, because I am fond of and identify with both songs. My desktop at work is named “rambleon” – because that is pretty indicative of what I do ;-). It’s a name loosely inspired by the Allman Brothers song “Ramblin’ Man”

**I’m not Crazy, really**

I also learned today that there is [whole wiki of naming schemes][2] and not one, but two RFC’s ([RFC1178][3], and [RFC2100][4]) on the matter. There you go.

 [1]: https://rambleon.org/2005/12/19/new-server-names/
 [2]: http://namingschemes.com/index.php/Main_Page
 [3]: http://www.faqs.org/rfcs/rfc1178.html
 [4]: http://www.faqs.org/rfcs/rfc2100.html