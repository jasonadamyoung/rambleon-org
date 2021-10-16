---
title: Can’t we all just get along?
author: jay
type: post
date: 2006-02-18T03:49:45+00:00
url: /2006/02/18/cant-we-all-just-get-along/
categories:
  - Reflections

---
Email services have been quite the bugaboo for me this week. While I know that the SMTP spec certainly doesn’t guarrantee timely deliver of email, it’s something I’ve come to expect. Most email gets from there to here and here to there almost as fast as an IM, and when it doesn’t — you certainly notice it.

Such is the case with Apple’s [.Mac][1] service the last two weeks. I noticed it first with an email from a freind that uses RoadRunner:

> <code class="highlighter-rouge">Received: from ms-smtp-03-eri0.southeast.rr.com (ms-smtp-03-lbl.southeast.rr.com [24.25.9.102]) by mac.com (Xserve/smtpin25/MantshX 4.0) with ESMTP id k11CmNJo004297for [...] Wed, 01 Feb 2006 04:48:24 -0800 (PST) Received: from [client workstation] by ms-smtp-03-eri0.southeast.rr.com (8.13.4/8.13.4) with SMTP id k0UK6Eed016167; Mon, 30 Jan 2006 15:06:15 -0500 (EST)</code>

Delays of 37 hours aren’t exactly normal. But RoadRunner and .Mac have been in pissing contests before about mail delivery. To which the customers (me) say “shut up and get along”

But now Yahoo is getting into the act with .Mac too, with their own .Mac delays:

> <code class="highlighter-rouge">Received: from web51515.mail.yahoo.com (web51515.mail.yahoo.com [206.190.39.161]) by mac.com (Xserve/smtpin32/MantshX 4.0) with SMTP id k1HLp1Vw026258for [...] Fri, 17 Feb 2006 13:51:02 -0800 (PST) Received: (qmail 27411 invoked by uid 60001); Fri, 17 Feb 2006 14:44:15 +0000 Received: from [client host] by web51515.mail.yahoo.com via HTTP; Fri, 17 Feb 2006 06:44:15 -0800 (PST)</code>

Is this Yahoo’s fault? .Mac’s fault? Who the heck knows and cares — I just want the email to go through.

However at least it eventually does, which is more than I can say for the University of Kentucky — whose Exchange administrators decided to blanket block all email coming from Gmail, Yahoo, Paypal, MSN, AOL, Earthlink, and others where the domain of the From: address does not match the domain of the upstream sending email server. While I appreciate their attempts to stem the flow of spam, and more, phishing emails, from coming into their system — this has had the side effect of blocking legitimate emails coming from aliasing services. e.g. user@yahoo.com sends mail to user@extension.org — who receives the mail, and then turns around and sends it to uky — who uncermoniously drops it because it’s not coming from a host within yahoo’s sending domain.

I certainly don’t envy the job they have — but this is just dumb in my admittedly biased opinion. Because it breaks legitimate email. I guess the cost savings in the spam are worth dropping legitimate mail — I sure hope there was some debate on this for weeks and months.

All that caused me to publicly thank the email administrators at NCSU this week for

> “doing everything they can to keep the campus email system open, in spite of often overwhelming demands to close it off because of spam and virus issues. I know that’s not easy to do. But avoiding a reactive stance to those demands has been a unsung, unappreciated benefit for NCSU users, and IT staff.”

Of course I said that in about 4 other paragraphs — but if it’s worth saying it’s worth saying in long confusing sentences, that’s what I always say, often 😉

So maybe the most important thing about email delays and breaks is that it goes to show that even stubborn pigheaded complainers like me can find something to cheer about every once in awhile (in the meantime, .Mac, Yahoo, and RoadRunner — get your crap together and deliver the mail on time — the uky folks might need some alternatives 🙂 )

 [1]: http://www.mac.com