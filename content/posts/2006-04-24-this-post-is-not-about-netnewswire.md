---
title: This post is not about NetNewsWire
author: jay
type: post
date: 2006-04-24T23:02:55+00:00
url: /2006/04/24/this-post-is-not-about-netnewswire/
categories:
  - Reflections

---
So until today, my synchronization method to keep NetNewsWire in sync between my home computer and office computer was to symlink ~/Library/Application Support/NetNewsWire to a NetNewsWire directory on my 2nd Generation iPod that I only use as a portable 10GB HDD.

Which, by the way, is starting to make noise, so maybe what’s coming now is fortuitious.

I started using my free Newsgator subscription that comes with being a registered user of NetNewsWire in 2.1b32 of the aggregator. So I’ll give that a go. I think it will work out, but it annoys me that some subscriptions won’t update immediately. I think for the eXtension feeds, I’ll end up putting those in reblog or something. But I digress.

I started this before I left work today and managed to leave my iPod connected at work instead of bringing it home. So I didn’t have my iPod with me. Since I logged out at work &#8211; the iPod volume was unmounted at logout.

Never fear, we have command line administration: Step one &#8211; diskutil list to get the disk device. Step two, run diskutil mountDisk /dev/diskdevice. Step Three cd /Volumes/NameOfVolumeIWant, get the data. Step four diskutil unmountDisk /dev/diskdevice.

Yay for command line tools. and SSH