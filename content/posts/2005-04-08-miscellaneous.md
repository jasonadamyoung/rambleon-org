---
title: Miscellaneous
author: jay
type: post
date: 2005-04-08T06:32:55+00:00
url: /2005/04/08/miscellaneous/
categories:
  - Reflections

---
I was browsing this evening and came across this article: [Fewer Permissions Are Key to Longhorn Security][1], to which I had an almost audible exclamation of “Yes! Yes! Yes!”

Our **number one** IT problem is poorly-written Engineering software applications on Windows that require administrator access to install and/or execute. To quote the article:

> Application developers who log on to their development machines as administrators when they write code create programs that assume that level of privilege but have trouble when run by a user with reduced permissions, according to [Brown’s work][2], which estimated that 90 percent of Windows software can’t be installed without administrator access to Windows, and that 70 percent won’t run properly unless the user is an administrator.

This has been kicking our collective tails for some time.

The only problem with fixing it is that the software vendors are going to be slow to adopt a Least-Privileged User Account model — which means years of broken software and patchwork-duct tape mixed XP/Longhorn lab platforms because the faculty are going to demand access to the crappy software packages because they (rightfully and understandably) don’t get the IT problems and don’t want to tell the vendors to stick their software where the compiler doesn’t parse.

Hey, sounds like the status quo.

* * *

I decided to read [this Linux Kernel thread][3] this evening — after reading the news reports (okay Slashdot) that BitKeeper + the Linux Kernel are to be no more. I thought I might glean some glimmer of understanding about the state of source code management, because Josh Thompson and I need to sit down and get a sane source code repository and workflow setup for our group, and I am thinking about using [Subversion][4] instead of CVS.

And you know what — I understood **nothing** of what the LKML discussion was talking about. I haven’t the faintest clue about distributed patch management and development trees and that whole world of doing source management on something of any significant size.

I think that any computing person should have to read LKML or a Windows development list or something similar every so often just to sit down and be humbled about what they don’t know. This is why I usually audibly laugh every time I hear someone on campus say they “know” an operating system or far worse, call themselves a “guru” at something in computing. I’ve refused to hire people that have said that in interviews that I’ve been in.

* * *

In more light-hearted news, I have said it before and I’ll say it again. Crazy Apple Rumors has the [best articles][5]

 [1]: //www.pcworld.com/news/article/0,aid,120314,00.asp"
 [2]: //msdn.microsoft.com/library/default.asp?url=/library/en-us/dnlong/html/leastprivlh.asp"
 [3]: //thread.gmane.org/gmane.linux.kernel/293914"
 [4]: //subversion.tigris.org/"
 [5]: //www.crazyapplerumors.com/archives/000438.html"