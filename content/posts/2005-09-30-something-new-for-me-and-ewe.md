---
title: Something new for me and ewe
author: jay
type: post
date: 2005-09-30T16:25:51+00:00
url: /2005/09/30/something-new-for-me-and-ewe/
categories:
  - Reflections
  - Uncategorized

---
This post marks the close of a chapter in my working career.

For the last several years, I’ve had an on-again, off-again relationship with several thousand lines of PHP code that has served as a personal wiki/weblog tool. I started it as a personal project in 2001, storing and indexing lots of little text files because I wasn’t yet convinced that largely static web delivery should require yet another server process like a database. I used it for personal hosting — and the lessons learned writing it (and a the realization that I needed to get with it and join the rest of the world using MySQL for web applications) and many hundreds of fitfully scattered hours later it became colloquially [“ewe”][1] for the “eos web editor” that ended being used, well, imposed, on several sites for the College of Engineering at NC State.

Like any piece of software that grows out of a hobby and a mission, ewe represented more than a wiki/weblog. I’m sure that Dave Winer would say the same about Radio. Or that Noah Grey would say about Greymatter. Or the Michel Valdrighi would say about b2/cafelog (the software that became WordPress). Not that I or ewe are really in same categories as those, but having watched all of those efforts over the years, there are some shared characteristics — good and bad.

Like a lot of things that I do, ewe was a attempt to wound several flying animals with a single projectile. At face value, It was an learning exercise to learn both PHP and MySQL, and how to develop in the constraints of the Engineering web environment (and to support development within those constraints). It was a way to try and encourage the College of Engineering system administrators to share and collaboratively edit IT documentation. It was a way to get the ITECS Systems group to publish out what we were doing. And it likely was a way to stroke my own ego with a professional weblog.

Deeper down — though it sounds like complete b.s. — ewe was most of all a manifestation of a hope to improve the levels of collaboration and communication in the College of Engineering — and even the campus at large. Unfortunately, my dreams and hopes are bigger than my ability (and time) to develop software.

But I gave it the “college try” — and I piddled away on what became ewe. But now that I’d like to run it on a host that’s not part of Engineering’s infrastructure, I need to give it a new authentication tool (e.g. a username/password table, the form to login, the encryption to protect the password transfer, the code to write the cookie for successful login, yadda, yadda, yadda) — and I want to fix permalinks, and I want to incorporate XMLRPC publishing (or Atom publishing), and I want to clean up the Admin interfaces, and, and, and…. None of which is particularly hard — but it’s all quite time consuming. And when I complete all that — it’s just going to be for my weblog. The sites that are currently using ewe aren’t really going to want to migrate, because try as I might to make that really clean, something is going to change for the people using it. And the sites that are using it aren’t really going to grow, because some of the limitations need to be fixed. So it’s a bit chicken-and-egg with my time in the middle of it.

Add to that, that I have a lot of system administration to do. I’m not a developer, just a [hacker][2] (or maybe just a hack*), and I have other things to hack.

Hence, WordPress. Which while I have some bias with my own code that mine is a whole lot nice internally — WordPress looks great from an administrative perspective. And it works. And there’s a community around it. And I can finally post from Marsedit or ecto. I just picked a temporary theme (albeit a nice one) — and I’ll hack together my own theme soon. The ego stroking lives on.

In the end, ewe served its purpose well. I’m not so sure it got people collaborating any more — but it did facilitate at least a modicum of communication. And working with it let some students pad their resumes and get jobs. And I learned a little here and there about PHP. And those are pretty good things all told.

So welcome to the new rambles, same as the old rambles.

_(* it’s at least a 32-bit hack though, as opposed to a two-bit hack)_

 [1]: http://people.engr.ncsu.edu/jayoung/site/pages/ewe/default
 [2]: http://www.catb.org/~esr/faqs/hacker-howto.html