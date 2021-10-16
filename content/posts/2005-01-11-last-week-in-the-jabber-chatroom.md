---
title: Last week in the Jabber chatroom
author: jay
type: post
date: 2005-01-11T03:31:38+00:00
url: /2005/01/11/last-week-in-the-jabber-chatroom/
categories:
  - Reflections

---
I think I’m a little, well, _anal_ sometimes.

But there’s probably a silver lining to that. Being investigatively anal makes one a bit better troubleshooter. I’ve been stressing that repeatedly with the staff lately.

e.g. a server goes down: what do you do first? fix the problem? well, yeah, but what if the problem is going to take longer than say, 5 minutes, to fix? keep fixing it?

well, there’s a point in there that you have to stop long enough to ask yourself “who needs to know about this? what does XYZ server failing affect? what’s my recovery strategy?” I think most people just want to fix the problem immediately. But if no one knows what’s going on — that usually causes more problems than its worth, we waste _a great deal_ of time on this campus because computing staff start troubleshooting problems that folks are having because they don’t know that the problem is being caused somewhere upstream.

Asking those questions sometimes highlights other projects: i.e. building _something_ to facilitate quick access to the information of “what is afffected” or “who do I need to tell” The best system admins are lazy ones — they build things to help them answer those questions more easily (and learn new skills in the process).

But none of this is yet about me being anal.

Well, our illustrious jabber chat room became pretty noisy (and informative) last week — at one point, Josh took advantage of the [chatbot][1]’s built in dice rolling program to help decide a discussion between three of us.

But two of us tied, and Josh mentioned he didn’t expect that.

Well, should Josh have expected it? Part of that is a social question, but I’m not a sociologist, I’m a ex-Computer Scientist. So that’s a math problem, so “Should Josh have expected a tie?” becomes “What’s the probability of two dice having a tie when you roll three dice?”

And for the life of me, I can’t answer that question. Nor could any of my peers (but I really was the only one that cared).

I still can’t answer that question mathematically. So much for the **A** in my Probability and Statistics course. (to be fair, I took that course _11 years_ ago this spring).

So I finally wrote a Perl Script to solve it:

<div class="highlighter-rouge">
  <pre class="highlight"><code>4:41:26 jayoung@jabber.eos.ncsu.edu: this is why I'm a CSC major4:41:28 jayoung@jabber.eos.ncsu.edu: for($d=1; $d&lt;=6; $d++) {    for($c=1; $c&lt;=6; $c++) {        for($y=1; $y&lt;=6; $y++) {            $roll++;            print "$d,$c,$y";            if(($d==$c) or ($d==$y) or ($y==$c)) {                print "(tie)n";                $tie++;            }            else {                print "n";            }        }    }}print "Rolls = $rolln";print "Ties = $tien";4:41:40 jayoung@jabber.eos.ncsu.edu: 96/2164:42:01 jayoung@jabber.eos.ncsu.edu: or 4 in 94:43:31 jayoung@jabber.eos.ncsu.edu: more descriptive:4:43:32 jayoung@jabber.eos.ncsu.edu: for($d=1; $d&lt;=6; $d++) {    for($c=1; $c&lt;=6; $c++) {        for($y=1; $y&lt;=6; $y++) {            $outcome++;            print "$d,$c,$y";            if(($d==$c) or ($d==$y) or ($y==$c)) {                print "(tie)n";                $tie++;            }            else {                print "n";            }        }    }}print "Outcomes = $outcomen";print "Ties = $tien";4:44:25 jayoung@jabber.eos.ncsu.edu: 1,1,1(tie)1,1,2(tie)1,1,3(tie)1,1,4(tie)1,1,5(tie)1,1,6(tie)1,2,1(tie)1,2,2(tie)1,2,31,2,41,2,51,2,61,3,1(tie)...</code></pre>
</div>

I’m not sure if it’s more anal that I did that in the first place, or that I changed the script to say “Outcomes”

This of course resulted in:

<div class="highlighter-rouge">
  <pre class="highlight"><code>4:48:51 Billy: Back away from the keyboard.</code></pre>
</div>

(and this is why our internal jabber project is one of my favorite initiatives for the whole year)

 [1]: //www.jabber.org/chatbot/"