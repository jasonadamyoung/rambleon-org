---
title: Earthlink and Port 25
author: jay
type: post
date: 2005-07-23T00:31:10+00:00
url: /2005/07/23/earthlink-and-port-25/
categories:
  - Reflections

---
Based on some conversations with the NC State “NAG” (network administrators group) this week about problems I was having using our NC State outgoing mail server from home and whether or not Earthlink was blocking Port 25 access &#8211; it seems that they are, for most domains at least, and at least for their DSL customers (or maybe just me, there is a ongoing running joke about the “Jason filter”)

I had the chance to test this a few nights ago. One of the ways to test SMTP connectivity is to use the tried and true “telnet” command to try and connect to Port 25 on a host.

e.g.

<code class="highlighter-rouge">jason-mac:~ jayoung$ telnet smtp.ncsu.edu 25  Trying 152.1.1.164...  Connected to smtp.ncsu.edu.  Escape character is '^]'.  220 uni01mr.unity.ncsu.edu ESMTP Sendmail 8.13.4/8.13.3/N.20050331.02; Fri, 22 Jul 2005 16:21:26 -0400 (EDT)</code>

well, from Earthlink, this results in a “connection refused” for all of the hosts that smtp.ncsu.edu resolves too (hint: try a “nslookup smtp.ncsu.edu”). Watching communication using tcpdump showed a:

<code class="highlighter-rouge">IP user-#######.dsl.mindspring.com &gt; 10.0.1.2: icmp 36: host uni01mr.unity.ncsu.edu unreachable - admin prohibited filter</code>

message coming back. That, in addition to [this knowledge base article][1] and [this other kb article][2], pretty much leads me to believe that Earthlink is blocking port 25. The article seems oriented to dialup customers, but I’m betting that the DSL customers are similar.

This went back and forth on the nag a bit, because Earthlink doesn’t apparently block the RTP cable customers and most of the NAG folks are cable users, so they weren’t having any problems with (authenticated) SMTP to smtp.ncsu.edu.

Interestingly, Earthlink doesn’t block port 25 access to smtp.mac.com (thankfully).

(I haven’t emailed earthlink customer support about it, I’m likely to get told to reboot my DSL “modem” or the computer, and I’m not sure I’ll reach someone who actually knows which sets of customers they do or don’t block.)

This all led me to writing up instructions for [using SSH tunnels][3] (oriented to the Macintosh users, but the concepts are the same) &#8211; and also [writing up instructions for using SSHKeychain to do SSH key-based access][4] (which may only work for a subset of the NCSU population that manage their own local accounts on their work systems).

 [1]: //kb.earthlink.net/case.asp?article=4015"
 [2]: //kb.earthlink.net/case.asp?article=4575"
 [3]: //people.engr.ncsu.edu/jayoung/site/pages/default/ssh-tunnels"
 [4]: //people.engr.ncsu.edu/jayoung/site/pages/default/ssh-keys-with-sshkeychain"