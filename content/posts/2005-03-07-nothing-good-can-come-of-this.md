---
title: Nothing Good Can Come of This
author: jay
type: post
date: 2005-03-07T09:24:31+00:00
url: /2005/03/07/nothing-good-can-come-of-this/
categories:
  - Reflections

---
So I received both a phone call and an email from an Intellectual Property Lawyer asking me about the first time that [AFS][1] and a [RAID][2] were used together. And if I didn’t know that, what was the first time that one was used at NC State?

It also looks like [I wasn’t the only one he asked][3].

My response:

> Admittedly, I’m not completely comfortable responding to an Intellectual Property Lawyer that both calls and emails me out of the blue 😉 But I’ll tell you what I know — which isn’t much.
> 
> If you Google for AFS and RAID, you’re likely to find an info-afs mailing list thread that seems to indicate that SAS was running an AFS server with a RAID array attached to it in 1992.
> 
> There was a lot of misinformation regarding AFS and RAID arrays for some time — since most hardware-based RAIDs look just like a single big disk (or set of disks) — the AFS file server doesn’t care — it’s just writing to the Unix filesystem. If the host OS can use/see/read/write the RAID array, then the AFS processes can. There’s no special support, no unique software, no magical incantations needed (beyond the standard rubber chicken needed for system administration). Once the OS drivers for the RAID controllers for the various operating systems became stable (early 90’s I guess) — then it just worked.
> 
> The reason people ended up asking questions on mailing lists is that most quality RAID arrays cost a lot of money at the time the question was asked — and everyone was hedging their bets. A better question would have been “what RAID controllers do you like with Solaris/HPUX/whatever”. AFS turned out to be an irrelevant part of that question.
> 
> I don’t know when NC State started using RAID arrays with our AFS servers. Whenever University groups started being able to afford them — it was after 1997. The College of Engineering didn’t do it until 2001/2002 — when we bought a SUN Raid Array that we knew worked fine with Solaris.
> 
> I do have to ask, to what purpose is this question being posed?

He didn’t respond to my question.

So one thing that stands out is the fact that I really am a little nervous giving any kind of answer to a lawyer. Pretty sad state of affairs huh?

One thing is for sure, I’d bet that he made far more money asking the question than I did answering it.

One part of the story that I didn’t say (mostly because I had forgotten until now) that I saw first hand the the very first “burn-in” tests of several RAID units back in 1997. In my first week on the job, since I had an MCSE and was supposed to be a “Windows person” — I stayed after work to help Bobby Pham with some kind of Windows problem. Bobby had several demo units in of RAID arrays that the then Computing Center systems group was going to purchase.

I still haven’t figured out what the big deal was.

 [1]: //www.openafs.org"
 [2]: //en.wikipedia.org/wiki/RAID"
 [3]: //lists.openafs.org/pipermail/openafs-info/2005-March/016843.html"