---
title: These numbers aren’t right
author: jay
type: post
date: 2009-03-22T21:02:17+00:00
url: /2009/03/22/these-numbers-arent-right/
tags:
  - accounting
  - critical thinking
  - finance
  - numbes
  - programming
  - work

---
I was close to releasing the code — and that’s when I looked at the numbers. And that proceeded to change my whole sunday morning.

In early 2000, I bought my first home — through a mortgage broker, who promptly sold the loan to Wells Fargo. And somewhere along the way there was an error. When Wells Fargo sent my first statement, the interest was normal, the principal was normal, the PMI was normal, but the property tax escrow was close to 10 times what was needed. My tax bill was supposed to be about $1,500 (Wake County + Garner tax rates were a little over %1 at the time)- and instead of taking the ~$125, they were billing me $1,300.

I called Wells Fargo, got the front-line support, and the first representative told “Well, we collect your property tax for escrow and it’s based on your local tax rates”

Yes, I know that. But it’s a 10 times more than it’s supposed to be. That’s when I got the killer response — that I remember verbatim to this day:

“Well, this is what it says on my screen. We’ll have to put in a research request, that will take up to 6 weeks.”

_It says this on my screen_

I asked for supervisor escalation, and get a very polite supervisor that is saying the same thing. “it’s based on your tax rate… we’ll have to research it”. And I’m like “Ma’am — There is NO place in the entire United States with a Property Tax rate that high. It’s kinda of interesting that it’s approximately 10 times more. Do you think that the decimal place is off? “Well, so it does seem to be. Let me check on that and be back with you shortly”

And without a research request, without up to six weeks, when the brain finally engaged — I got the issue corrected.

See that’s what happens. Somehow all the brains get turned off with what the “computer says” — and then suddenly when the faith in the almighty computer is shaken, it affects the whole system — because no one gets the technology. It’s magic somehow (and the IT staffs are well to blame for this, because we think the magic helps keep a segment of our ranks employed).

Two weeks ago, I was merging some code that I had been writing for reports and number summaries back into the code base for our directory/workstreaming application, and was looking at the published item and edit counts for our applications (summarized out of the activity streams). And the numbers were good, great, through the roof.

And not right.

Not that we won’t have those numbers, but it just didn’t make sense. And it turned out that I had logic errors in the code that forgot about passing object variables around in Ruby and just because it wasn’t in the object didn’t mean it wasn’t being passed by reference. And a few hours later that Sunday morning, I had the problems fixed — before the numbers got out there, and before others started trusting was on their screens.

My lesson — and the ongoing lesson for all us in systems administration, programming — **finance** and anyone using tools we put together.

You have to have a feel for the numbers and whether the numbers are right. You have to question how they got there — _especially_ when the numbers confirm your own opinions.

And when the numbers aren’t right — you have to check the numbers.

And that makes all the difference.