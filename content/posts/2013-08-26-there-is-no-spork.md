---
title: There is no Spork
author: jay
type: post
date: 2013-08-26T14:27:00+00:00
url: /2013/08/26/there-is-no-spork/
categories:
  - Reflections

---
Portmanteau is a funny word.

And by “funny” — I mean fun to say, fun to pronounce, and fun to drop with pomp and circumstance into a conversation, but with a twinkle in your eye that belies the fact that you aren’t really completely full of yourself.

But I’m not writing to expound about portmanteaux. I’m writing to talk about DevOps and this war with Eurasia.

“DevOps” is a funny portmanteau.

And by “funny” – I mean to say “strange”.

And what I mean by strange, is that it’s kind of a strange idea to me. And by that I mean strange that our profession feels the need to label it the way it has.

And even stranger is the desire of some ( looking at you [Puppet Labs][1] ) to say it’s some how some new thing, practiced and perfected only by some single tech-savvy region.

I’ve spent most of my career at NC State University. I’ve worn a lot of hats, but the one that I have historically most often identified with is “[sysadmin][2]”.

Inconceivably, I kept using that word – “sysadmin” – and maybe, at least outside the university, it doesn’t mean what I kept thinking it meant. Maybe it’s a bit like “scale” or “client/server” — words that get redefined by everyone and their marketing department.

At NC State, systems work – particularly on the academic and research sides – has always been development work.

I started my career at the university adapting work from Notre Dame, writing C/Win32 API-based custom logins for Windows NT. I wrote CGI tools in Perl to manage downloads for anti-virus software. I wrote wiki/blog software in PHP before WordPress existed (but not B2). I guided systems staff that did the same, sometimes less or more depending on who was more oriented to what.

It wasn’t until about 8 years ago, when I ended up working with a long-time developer that hadn’t worked at a university that I learned about the war.

I think week one on the job, during some back and forth about developer environments, he told me “The developer is the natural enemy of the sysadmin”.

That’s such bullshit. Then and now.

I’m not naïve, maybe we’ve always been at war with Eastasia.

Perhaps custom application development in university computing environments (again, particularly on the academic side) are _different_. The scope is different, even if the scale is not. Our products are different, our process no where near as (historically) formal. The release cycle/process is (I perceive) very, very different, at least when compared to organizations with the same kind of scale that we operate at.

And as such, the specialization that a lot of shops seem to form (this “developer vs. “systems” bifurcation) may not have the same conditions to grow in.

But I don’t know how you run effective systems – particularly systems that undergird custom applications – without knowing the languages, the tools, and the processes of “the developers”.

And I damn sure don’t know how you can truly effectively develop software without understanding the building blocks that you are using, and an idea of how the systems architecture ties them all together.

I learned ruby by writing ruby-based systems management tools on top of subversion so that I could support our “developers” that were writing “Rails apps”.

I learned Rails when I wrote a Rails-based identity management/directory tool because I was responsible for the security and the authentication in the systems.

And over the years, as the needs in the organization evolved, I’ve spent more time developing than administering systems. I’ve [written an awful lot of the code in our applications][3]. Enough to know that true wisdom is being able to answer both questions: “Who’s the best programmer you ever saw” and “Who’s the worst programmer you ever saw” with “You’re looking at him” and your best Gordo Cooper grin.

But every new application I’ve ever written has always combined “development” and “systems”. I’m not sure how you’d even draw the line between them. It’s about solving problems. Having been a sysadmin made me a better developer. Being a developer made me a better problem solver.

By far, the best developers and the best sysadmins I’ve ever known, and particularly the ones that started the computing revolution can’t really be classified as one or the other. I’ve tried to spend my career emulating their example. And I’m by no means unique in doing that.

I greatly appreciate those that do care deeply about finding best practices in how we develop and deploy systems for trying to find touchstone terms that we can agree on and for walking back these ridiculous silos that never work out well for us in computing.

If we call that “DevOps” then that’s okay. I understand why.

But I’m calling it “spork” And I’m here to say there is no spork. It’s made up world that we created, and more than a little pretentious and funny.

Like a portmanteau.

 [1]: http://puppetlabs.com/blog/devops-everytown-usa
 [2]: http://xkcd.com/705/
 [3]: https://github.com/jasonadamyoung