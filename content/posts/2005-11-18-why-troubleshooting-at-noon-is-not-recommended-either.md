---
title: Why Troubleshooting at Noon is not recommended either
author: jay
type: post
date: 2005-11-18T19:52:58+00:00
url: /2005/11/18/why-troubleshooting-at-noon-is-not-recommended-either/
categories:
  - Reflections
  - Uncategorized
tags:
  - sysadmin

---
So I just spent about 15 minutes trying to troubleshoot why my fledgling jabber2 install wasn’t working. Even to the point of breaking out ethereal to sniff the traffic and triple checking my iptables rules.

Then it dawned on that I failed to move the CNAME I was using to the server that jabber2 was actually installed on.

Stewpid.