---
title: Virtually RHEL
author: jay
type: post
date: 2005-09-20T18:55:09+00:00
url: /2005/09/20/virtually-rhel/
categories:
  - Reflections

---
Every attempt to try and install RHEL WS 4.0 (the University has a site license) that I’ve tried with a ISO boot cd has resulted in a “An unrecoverable processor error has been encountered” message.

![][1]

This occurs when the linux boot image tries to load the kernel.

At the moment, given that I don’t know enough to get more detailed troubleshooting — either out of the RHEL WS boot cd or virtual PC (7.02) — I can only conclude that it’s not possible to install RHEL WS 4 under Virtual PC 7.02 for the Macintosh.

However, Fedora Core 4 is happily — though really, really sloooooowly installing as I type this.

**[update]**: I spoke too soon, Fedora Core installed, but also produces the above error. Sigh.

 [1]: http://people.engr.ncsu.edu/jayoung/eweImages/binarypage/-a87176fde04c4a60c08180e4e34c22b4/virtual_pcscreensnapz002.jpg