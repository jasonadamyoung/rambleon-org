---
title: I sooooooooooo need the Rubber Chicken
author: jay
type: post
date: 2006-06-28T21:21:21+00:00
url: /2006/06/28/i-sooooooooooo-need-the-rubber-chicken/
categories:
  - Reflections

---
So I have been extraordinarily aggressive on keeping the rails and related ruby gems updated on our servers. I mean updates the same day or the next of when they are released. It’s part of trying to be bleeding edge in our deployment and because, well, I’m pedantic about that. (I have a VersionTracker subscription and keep every software package on my machine updated weekly, and keep fink and darwin ports packages updated weekly, whether it needs it or not).

That aggressiveness almost killed me today.

This morning I updated [mongrel][1] to the latest bug fix release on a production rails box. And without paying attention to the clock, 10 minutes before a major demo of our internal FAQ tool, I tried to update Rails to the latest security/bug fix. I mean, even I had been paying attention to the clock, every last one of these have been seamless so far.

The keyword is “so far.”

gem apparently got foobar’d at some point and kept issuing a syntax error on every install or update operation. the error text kicked out had something to do with mongrel — so I thought the mongrel update caused the problem. So I remove the last version of mongrel.

Nope. So the I remove mongrel. and try to install.

Nope, still some kind of gem syntax error. I look at the clock, it’s 12:55pm. Everyone’s at lunch right?

Then it dawned on me.

There’s a demo at 1pm. A major demo of the FAQ tool. I just broke the FAQ tool.

**OH SHIT**

Think, Jay, Think. Okay, I’ll im the boss, shell into a working box, and copy the Mongrel gem over to the broken box that I can’t install mongrel on via gem itself. **oh for the love of all that is my sanity, I hope that works**

For the first time in my career that I can remember, my hands are shaking. I’ve pulled more all-nighters at work than I ever did in College. I’ve broken, fixed, broken, fixed hundreds, maybe even thousands of computers and applications. I do have a propensity for panic. But I don’t remember ever having my hands shake.

It worked. Downtime maybe 2 minutes.

And Gem works now.

 [1]: http://mongrel.rubyforge.org/