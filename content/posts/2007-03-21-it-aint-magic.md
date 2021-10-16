---
title: It ain’t magic
author: jay
type: post
date: 2007-03-21T14:48:56+00:00
url: /2007/03/21/it-aint-magic/
categories:
  - Reflections
  - Uncategorized
tags:
  - sysadmin

---
Dealing with magic, magic.mime, and mime.types on Red Hat Enterprise Linux and with PHP, FileInfo, and MediaWiki is a serious pain in the ass.

Who in hell came up with this mess? Apache has a magic file, the os has a magic file, FileInfo complains that it can’t find /usr/share/misc/magic — when it’s really looking for /usr/share/misc/magic**.mime**. There’s about twenty billion mime.types files — including the one that MediaWiki has itself. And there’s that many symlinks from hell trying to link some of these together.

What a freakin’ cluster-you-know-what.