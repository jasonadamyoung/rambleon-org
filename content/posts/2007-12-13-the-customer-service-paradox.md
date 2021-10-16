---
title: The Customer Service Paradox
author: jay
type: post
date: 2007-12-13T13:54:13+00:00
url: /2007/12/13/the-customer-service-paradox/
categories:
  - Reflections

---
My colleague, [Ben MacNeill][1] recently del.icio.us bookmarked [a blog post from Jeff Atwood][2] who in turn, was quoting Werner Vogels at Amazon — and their policy of having the developers have to spend some time doing customer service for the products they develop.

I do agree with the premise 100%. A good portion of my career has been spent in some form of customer service. Admittedly, it’s a different form of customer service, I have not yet been in the role of developing a commercial product that paying customers are calling or emailing support questions. But I’ve done plenty of university help desk support, student and faculty support, and peer IT support — from just general computing assistance to support of the systems I build, to the software and web sites that I’ve developed.

As a manager, for a time, I implemented a policy of the “Systems staff” sitting on the helpdesk too. For two reasons: the helpdesk was staffed by students, and it was a mentoring activity, and because it provided some perspective on the the ways that the systems staff could make things easier for the users of the system (or easier for those supporting the users of the system, which usually has the associative property of being ‘easier for the users’).

Throughout the years, some my most satisfying experiences have been doing user support. There’s a certain satisfaction to being able to visualize a problem being described, particularly over the phone, and to solve that problem. And there’s an almost nirvana of getting to the question that the person is really asking, rather than the one they asked. Over time, and particularly because I often developed or integrated the systems they were using, you can seemingly read the user’s mind.

Again I’m a HUGE believer in this idea. Even now, I do a fair amount of support — even though my job is to be the sysadmin, a developer, and a systems architect. My initiative has no help desk, and it has had no person in the organization charged with being the customer advocate. So support is spread out, although somewhat unevenly, throughout the whole group. A few of my colleagues that deal with content issues pick up a whole lot of the content development support (and often a fair amount of computing support too, and they deal with more phone support). I pick up a lot of the email support, although we spread some of it around, particularly the tool-related support, to each of the developers/designers responsible for the given app. My colleagues certainly do their share — more than their fair share at times.

But one thing that developers and others that are not customer support folks will certainly take away from the experiences is a HUGE amount of frustration.

It’s not really frustration about not being able to think through the application, or what appears to be lack of the wherewithall to perform simple operations. Both of these are usually the fault of the application developer and/or the system integrator (e.g. us), and “simple” is most certainly relative.

No, I think it centers on the issue that the problem reporting is terrible. Which creates all kinds of round trip delays in trying to resolve problems. [Good problem reports][3] are the exception, not the norm. And maybe I’m getting less patient with this as I get older, or the novelty and challenge of trying to read someone’s mind has worn off through the years, but I do get more frustrated with it.

In one of my many examples of this, just this past week, there was a bug in a web app that I wrote that had to do with passing an empty array into an associations delete method — and that failing because either a single object, or array of objects was expected. It’s something that changed somewhere across a rails release (probably because it was never supposed to work).

For the user, this manifested in the inability to select groups that you would be interested in if you hadn’t already indicated an interest in one (the empty array). I had actually already fixed this in a dev copy after discovering it locally — but had forgotten about fixing it in the deployed code.

The first problem report that came in was:

> “server would not allow me to select [bob] as a group”

That’s it. Subject line was [bob].

The followup to find out what “server” meant wasn’t any better. And we were stuck in a round trip to try to get more details.

The second problem report that came in:

> “Tried to update my profile several times and failed.”

Finally, the third, with a subject line of “Error indicating an interest in [foo]”

> In my profile I selected [foo] as an interest and clicked Save, then received the error:

Status: 500 Internal Server Error Content-Type: text/html

Hallelujah! With just one more sentence, this is the problem report that immediately had me knowing was the problem was. A simple “I did this” and “here’s the error” Unfortunately, it’s quite rare that I get the latter problem report without 2 or 3 round trip emails.

(Aside: I probably get more frustrated with this than I normally would in normal customer support, mainly because these are usually faculty reporting these problems, and I know with certainty they wouldn’t for one minute allow inaccurate problem reporting like this from their students asking questions and inquiring about problems. )

This perhaps isn’t completely germane to the original subject of having developers and systems admins staff the customer service lines for their applications. The problem reports are going to frustrate the customer service people as much as the devs and systems folks pulling their shift. But I think it’s things like this that can have an almost negative impact on the value of having folks do support that ordinarily wouldn’t.

Or maybe not, maybe it has a another benefit. I know that I myself have had some real gems of problem reports through the years. Engineering/IT people are some of the worst about problem reporting ourselves. After this latest round of customer support these last few years on this project, I am far more mindful of my own problem reports.

Additionally another surprise benefit of this is that devs that sit on support are also much more likely to build more logging into their applications. I can’t tell you enough how logging has highlighted what the user actually did, rather than what they say they did. I’ve built a ton of logging options after realizing that I didn’t have enough visibility into the user actions based solely on the problem reports.

Perhaps that’s the paradox. Doing customer support doesn’t necessarily make better apps and systems, maybe it makes us better users.

 [1]: http://trixieupdate.com
 [2]: http://www.codinghorror.com/blog/archives/001013.html
 [3]: https://rambleon.org/2006/07/07/good-problem-reports/