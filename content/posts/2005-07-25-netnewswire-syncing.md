---
title: NetNewsWire Syncing
author: jay
type: post
date: 2005-07-25T21:40:03+00:00
url: /2005/07/25/netnewswire-syncing/
categories:
  - Reflections

---
I absolutely love [NetNewsWire][1].

(for the record, I really think [Pulp Fiction][2] is great too, but I already owned NetNewsWire, starting early on).

What I don’t love is NetNewsWire syncing &#8211; I have never gotten it to work right. And I’ve never had/made time to troubleshoot all the problems (lockups while syncing, .Mac errors, unread items not being marked correctly, and most likely my own expectations of it) I’ve had with it to properly report those problems to Brent Simmons, the developer of NetNewsWire (syncing is a non-trivial feature to get right, so I have no significant expectations of it that it should do what I think it should do).

However, I have an even better synchronization method. My largely unused 2nd-generation iPod. I don’t use the iPod, because it’s a little too bulky for me and while I love music, I don’t find myself able to really listen to it much if I’m not already on the computer where my music collection is anyway. I’ve basically killed the battery because I never used it much.

But it turns out that the iPod is a fantastic 10GB portable firewire hard drive.

So my synchronization method consists of initially copying my ~/Library/Application Support/NetNewsWire folder to a folder on my iPod and then doing a:

<code class="highlighter-rouge">ln -s /Volumes/walkingtunes/ApplicationData/NetNewsWire ~/Library/Application Support/NetNewsWire</code>

to create a symlink in /Library/Application Support/ to the NetNewsWire directory on the iPod.

This works absolutely beautifully carrying my NetNewsWire data between my home and work machine (with an occasional copy of the data to either machine as a backup). The iPod is fast enough to perform adequately in direct access mode (unlike most USB keys), and it’s easy to copy to the laptop in the event that I want to browse my subscriptions there.

 [1]: //ranchero.com/netnewswire/"
 [2]: //freshsqueeze.com/products/pulpfiction/"