---
title: Beware the Ides of March
author: jay
type: post
date: 2008-03-27T02:03:46+00:00
url: /2008/03/27/beware-the-ides-of-march/
tags:
  - sysadmin
  - talesfromtheserverroom
  - uphillbothwaysinthesnow

---
So on March 15th (well, March 16th UTC **and** EDT) &#8211; the public facing website that I share in the responsibility for suffered an outage.

It’s a _classic_ example of a cascaded failure &#8211; particularly a failure of human judgement (mine). I spend a lot of my time in my job trying to anticipate and either prevent, or to mitigate, cascade effects &#8211; so it’s great to review from them when they happen. You don’t get enough stories like this on the web, mostly because failures &#8211; particularly judgement failures &#8211; don’t get public exposure. That’s probably a lot out of fear, embarrassment, trade secrets, whatever. Which is a shame really, because you can’t learn unless you screw up. And even after 15+ years of doing this day in and day out, and a confidence that I can solve and work through any computing problem before me. I still do it, and it’s not the least bit ironic.

So I’ll write about mine &#8211; so you don’t have to 🙂

I wrote this up as an email on the 16th for my peers in my engineering team &#8211; and I got a lot of response back saying “thanks for the hard work” &#8211; which kind of embarrassed me really. I didn’t write it up for that. I wrote it up for edification about cascade effects of both technical and judgement errors. So I wrote up another note with the followup &#8211; and it’s a great summary of what follows:

  * Logic errors in code, triggered by a somewhat rude web spider, generated well over 10,000 error emails.
  * That email volume overwhelmed our mail server (for reasons I don’t completely understand, it’s weathered things like this prior. I blame Brutus) Which caused email delays that were measured in hours
  * Which was taken at face value, and used as a basis for an flawed solution to a no-longer existing problem
  * The implementation of the flawed solution, actually caused an outage to the site, when the original problem never did

Plus a whole lot of little things in between.

I wrote “It’s a completely fascinating study about a series of decisions, errors, and failure in due-diligence, combined with on-the-spot judgement errors based on flawed (and not sanity-checked) information can lead to cascade problems &#8211; and problems made worse.”

Like the _Titanic_, only without Celine Dion. Okay, nothing like the _Titanic_. More like, _Waterworld_

What follows is an incredibly verbose, but relatively interesting tale.

### Background {#background}

Beginning around 2:03am EDT Saturday morning, March 15th &#8211; and continuing through 1:18pm EDT Saturday afternoon, what appears from Microsoft documentation to be a SharePoint Portal Server running at a peer institiution made 72,306 spider requests to our public website.

Of these requests, 19,814 were to a “feed” URL &#8211; of which ~13,000 (number approximate due to the grep command used to calculate it) of these resulted in an application error within our application. The application error-generating spider requests ran from approximately 2:03am EDT Saturday until 11:10am EDT Saturday, likely generating emails for each and every one of the application crashes (there’s ~9,900 in a shared mailbox, I assume most to all ~13,000 were generated).

Now, those application errors weren’t the spider’s fault. However, when 13,000+ requests result in a “500” error from the site you are spidering? I’d really hope that the spider would stop. I’ve asked the peer institution for some clarification, but never got any. I imagine the person running the site inherited the spider. That’s kind of how it goes in higher education. But, again, the errors weren’t the spider’s problem &#8211; I just expected it to be nicer about it.

### Source of the application error {#source-of-the-application-error}

The application error was the result of a logic error in the application. It determined what object to retrieve for the feed by checking a parameter corresponding to the object type. It’s an either/or check. Either it’s a Article, or it’s assumed to be a Faq. One problem was that the check was case-sensitive &#8211; and the parameter in the URL was not. But the real problem was, instead of doing the smart thing on the assumption, and when assuming it was an Faq &#8211; by hard-coding Faq &#8211; it used the parameter passed to it. So if the parameter had been “wtf” &#8211; the code would have tried to retrieve “wtf” objects (using the rails parlance of “object” that is, it’s just a bunch of rows from a table) Which of course fails pretty miserably in most cases (actually thankfully) The source of this was the application itself, with the apparent production of mixed-cased URLs in the application elsewhere (or the sharepoint server downcasing URLs it was spidering, my bet is the former, but I haven’t searched for the URL-production code yet).

The application error in our application has been mitigated by actually editing code on the server. In a semi-humorous note, both myself and a co-worker implemented very similar mitigations in the trunk (I chose downcase, he chose upcase 🙂 ).

### Real impacts to our public site {#real-impacts-to-our-public-site}

I’m not sure of the real impacts to the public site. I don’t think it ever went down actually. Certainly those ~13,000 failed requests terminated the ruby process that received the request, but it appears that the internal load balancing and the monitoring restarts worked fine. Google Analytics reports 1,940 “visits” on the 15th, compared to 1,945 “visits” Saturday March 8, and 1,676 “visits” on March 1. (yeah, we know, your blog gets more, it’s a work in progress) So I don’t think it it had any impact on the actual user experience to the site itself.

However, what it did do, was to significantly degrade the operation of our mail server. Here’s where the story really gets good.

### Blissfully Unaware {#blissfully-unaware}

Until this incident, I personally had filtered all of the rails-generated application errors to a dedicated subfolder. This has turned out to be problematic. Particularly in this instance.

The reason I do, is that in general the rails generated application errors are benign from an operational perspective. While they usually highlight coding errors &#8211; those coding errors are of varying severity. (this one is pretty serious, but mostly in the academic sense) &#8211; and they rarely represent a true systems-level severity. (which would be: the site itself is inaccessible or the errors are causing impacts to other software in the stack). So I keep them out of my Inbox to reduce the inbound noise, and to focus on real operational emails.

It would be fine to do this in most circumstances &#8211; because I’d see the new message counter on the folder being updated as messages were being filed into it. However, Apple’s mail.app, apparently as part of it’s caching mechanisms, doesn’t always seem to check sub-folders for new messages (particularly sub-folders of sub-folders) &#8211; unless you quit Mail and start it again, or actually click the “Get Mail” button (and sometimes with the latter it doesn’t seem to update). I had been running Mail.app open on both the laptop, and my desktop at home all day, as is usually the case &#8211; and hadn’t noticed anything out of the ordinary.

The combination of the filtering, and Mail.app’s lazy sub-folder updates meant that I was blissfully unaware that thousands of application error emails were being delivered. Probably much to the chagrin of my co-workers as the thousands are application error emails were likely going to their inboxes.

The only indication I had that we had some weird email issues going on was that I noticed that the email that gets sent from our issue tracking system every night to me about “due cases” hadn’t come in (we don’t set due dates on issue tracking cases for support, so the contents of the email never matter any, I just keep it coming to have an indicator that the issue tracker email is still being delivered). I didn’t think anything of that much at the time. Although, I did try to send a test email to myself from Gmail, which also didn’t deliver immediately, which was odd, but I got distracted with dinner and movies at home, and forgot about that.

### Failed Troubleshooting {#failed-troubleshooting}

So just before 10pm, I take the laptop upstairs to hook it up to a charger. and check a few things on the desktop computer before bed. This is when I notice that the IMAP folder that holds the application errors has an unread count of ~4,000 emails, and when I check the folder, even more are coming in. (Remember that the spidering had actually stopped at 1:18pm EDT, and the error-generating retrieval at 11:10am EDT, but I didn’t know that yet)

So, based on the _received_ timestamps for the email. I made a completely inaccurate snap assumption. I think we have a live spidering issue, generating thousands of errors right then, and figured I needed to do two things:

  1. stop the spider
  2. (possibly) fix the source of the application error

Our architecture at our hosting provider consists of a server that acts as a firewall (that we don’t have access to). And our web server/database server (which we do have access to). I figured that I would set a firewall rule on the server we do have access to, to block the spider.

Which I did &#8211; and restarted the firewall process on the server we have access to.

This is when a completely side issue that was really, really unfortunate happened. My shell connection to the box froze. Shell access to the hosted server is accomplished by shelling into a box on campus, then shelling to the hosted server (which remember, is behind a firewall). This cascaded shell access seems to exacerbate any network conditions that might temporarily impact the SSH process, and it’s possible that iptables restarts on any of the boxes, which normally don’t terminate or freeze a shell if the ssh ports aren’t blocked, will temporarily do so with this cascaded setup. I’m not totally sure. I really haven’t diagnosed what’s happening here. I just work around it.

So the shell froze. and I think to myself “OMG What did I just do? Did I typo the firewall rule somehow? And block all access to the machine?”

And then I tried to load our public site in the browser. It was inaccessible too. And these two pieces of evidence, blocked web access, and a frozen shell connection &#8211; made me leap to the assumption I had typo’ed the firewall rules, and all access to the box was blocked.

This is where the Talking Heads song comes to you in the most unfortunate of moments. “OMG this is not my beautiful server. OMG what have I done.”

I called the hosting provider’s NOC (which I’m sure was quite entertaining to them, not) to get them to reverse the change I just made. They first go to the firewall box (because in their setup, that’s where the firewall rules are). But while they are getting the root password to go into our server, I manage to get in again. I didn’t typo anything. But meanwhile, the mails ARE STILL COMING &#8211; so I figure we are still getting spidered. But the website isn’t working. This all seems very weird.

I ask them to block the spidering box at the firewall itself. Hang up, and continue troubleshooting. The public site is still inaccessible. But the emails keep coming.

I notice that one of my co-workers had been on the machine at around 3pm EDT, so I called him at 10:30pm or so, and asked if he had done any firewall troubleshooting &#8211; in case something else was going on and I needed to know. He hadn’t, he actually had forgotten his root password, and couldn’t make any changes &#8211; he was going to do the same thing I tried :-).

So I hang up with my co-worker, and continue troubleshooting.

All of the website processes are fine. But I shut down the ruby mongrels (and the emails keep coming about the errors! but nothing about my changes to the mongrels and monit! weird!). Then I look to fixing at the code to figure what was generating the errors. Which I fix, and check in (but didn’t get the email about, weird!) &#8211; and then I fixed it on the server &#8211; and restarted all the mongrels and the web server.

But the public site is still down!

Well, when I edited the firewall rules, I hadn’t bothered to look at the rest of the firewall rules that were in the configuration file. Why should I? In theory, those don’t change &#8211; they aren’t part of the files that I use subversion to manage (not for this box) and the site had been accessible earlier. Well, at some point, either from me, or the hosting provider, or the ever-present “Not Me” from Family Circus, the rules that let port 80 and port 443 be open on the box had changed. But the firewall had never been restarted &#8211; until I did it with my attempt to block the spider host. And when it restarted, there was no rule letting in port 80. (it’s a good thing that my co-worker had forgotten his password, he’d have ran into this same problem, although, mid-afternoon troubleshooting is much, much, better than late night troubleshooting).

So I fixed the firewall rules, and finally the public site is back.

But you guessed it, the emails keep coming!

### Have I mentioned the emails? {#have-i-mentioned-the-emails}

At this point, I finally get a clue that there might be a serious problem with the email delivery (uh, duh) The server is fine, the code has changed, there’s nothing in the logs about crashes. There’s nothing in the logs anymore about the spider.

So I connect to the mail server. The management tools show that CPU usage is through the roof and has been for hours on hours. And there’s 8,000+ messages backlogged in the email queue.

I’m not sure what to do. I try restarting the mail processes in the hope that something strange is hung on it.

I stop all inbound email.

I try to use a management tool to delete the thousands of queued application error emails. This turns out to be a huge mistake. Because it locks up the email server for close to 5 minutes. Locking me out of the box entirely AND because the mail server is also the authentication server, it stops SSH access to all our other servers, while SSH tries to connect to the authentication server (even though I don’t use password authentication)

At this point, I’m like “Uh-oh. I don’t have physical access to reboot the thing without waking someone up in one of my peer groups on campus to let me in the building and that server room” (yeah, I don’t have after hours access to this particular box, which is mostly, but not completely my fault).

Finally, the server responds again. But is still processing only about 3-4 emails a second, out of 8,000. I start looking for scripts on the internet that will somehow let me delete queued mail. Probably 4,000 of those are app error mails (the app errors go to the mail server, then to a mailing list server, and then back to our mail server). A few dozen messages are probably legit, and the rest spam. But because of the legit mail, I can’t delete all of it.

So I find some scripts, delete the app error email. But the spam/virus processing scripts are totally messed up, letting in a lot of spam and eating 100% of the CPU. But I’m afraid to reboot, so I let it go on for a few hours, but the pace is just too slow. I cross my fingers, reboot the whole thing, which speeds up the processing.

Finally, at around 2:30am EDT or so, the queue clears finally, I turn on the inbound mail again, and the apperror messages keep coming. The mailing list server still has ~1400 emails in its queue (it’s a secondary list server, used for testing things related to the primary list server, and hosts only engineering staff items, it could be sacrified). So after deleting those, the server (and the system admin) can breathe again.

### The Moral of the Story {#the-moral-of-the-story}

Certainly this isn’t the first set of cascaded errors I’ve dealt with (and contributed to). And it certainly won’t be the last. The whole point of recounting stories is to be able to take a step back, look at things with fresh eyes and figure out what you do better next time.

Did I learn anything? No, not really. All the mistakes I made are things I know better to do already. They are the computational equivalents of “measure twice, cut once” And all the things that caused the problems that led to the mistakes I made, I already know they have the propensity to cause problems. When you look back, you can lots of little things that add up &#8211; many wrong, some right. (It’s almost like playing along with the home game of “spot how many errors are in this picture” 🙂 )

So what then, is the point? The point is &#8211; it’s about what you _don’t_ do. One of the best “servers are down” people that I have ever worked with would go and get dinner (or coffee, or a bagel) before bothering to look at the problem. Sure, it increased downtime 15 minutes. But it gave him the time he needed to take a step back, evaluate the information at hand, and not react. That 15 minutes would often save him 3 hours. I’m not sure I quite have that moment of Zen yet. But I’m getting there. Once you figure out the things that you know to do, it’s beginning to learn the things that you don’t.

And that’s what cascade errors teach you. The wrong screw in the wrong place can weaken buildings. But pulling out that screw before you realize what all is depending on it being there is worse. I’m not sure that human history shows that we ever quite learn that.

But maybe the more stories we tell, the better.