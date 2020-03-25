---
title: And this is what you changed your ticker to?
author: jay
type: post
date: 2007-09-04T15:37:31+00:00
url: /2007/09/04/and-this-is-what-you-changed-your-ticker-to/
tags:
  - software
  - sysadmin

---
This is one of the reasons I absolutely loathe java. And it has nothing to do with the language. It has to do with the _culture_.

There are a few services that we run that are java-based. History shows that most of these seem to run happier using the JVM from Sun &#8211; so every so often as I reinstall systems or move the services around &#8211; I need to install the Sun Java software.

However, Sun makes getting Java the biggest pain in the arse out of most of the software packages I need to obtain for our services.

One, because it’s not open-sourced &#8211; at least not in any semblance of open-source like most of the other language environments &#8211; and because of whatever technology politics between Sun and RedHat &#8211; Sun’s Java doesn’t come in the set of packages distributed with my Red Hat Enterprise Linux Systems. Fine, there’s a lot that Red Hat doesn’t provide.

However, it’s not in any add-on repositories either &#8211; again, because Sun doesn’t allow for redistribution. I can’t manage Sun’s Java through my standard OS package management utils. Fine, that’s life, other software is the same way.

And Lo, Sun provides an RPM install right?

Yeah right. First, I can’t just wget the thing to the system(s) I need to install it on. Why? Because I need to accept the damn license agreement for the software. I could partially understand this, if not for what comes later.

BTW, the damn license agreement is some time-sensitive based token. My acceptance goes away if I close the browser or navigate away from the download page. I have to accept the license agreement each and every visit to the page.

And the download URL after license agreement looks like this:

> …/ECom/EComTicketServlet/BEGIN5FC6679326C19D083B94612B83494088 /-2147483648/2329383831/1/838358/838202/2329383831/2ts+/westCoastFSEND /jdk-6u2-oth-JPR/jdk-6u2-oth-JPR:3/jdk-6u2-linux-i586-rpm.bin

You’d freakin think that somewhere in that that encoded token that I could use it from another browser just for a time to download the software so I could save myself some data transfer steps. But nope.

I get that. I get that I’m downloading precious cargo and you want to make it a complete pain in the arse to download the software that YOU NAMED YOUR COMPANY’S TICKER SYMBOL AFTER.

Second, it’s not really an RPM, it’s a shell-script wrapped rpm that guess what it does when I execute it? &#8211; that’s right folks IT MAKES ME ACCEPT THE DAMN LICENSE AGREEMENT AGAIN.

I won’t get started on the other problems &#8211; like where the RPM sticks all it’s files. But that’s fine, I don’t expect that the company that changed its ticker symbol to match it’s flagship product would actually spend engineering time on making sure that the flagship product conforms to the operating system standards of all the platforms they want that flagship product on.

Dear Sun. Please get a clue. [Use the Schwartz in a way that matters][1]

 [1]: http://comic.conversationswithplasticdinosaurs.com/2007/08/javaballs.html