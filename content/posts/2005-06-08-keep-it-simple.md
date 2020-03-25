---
title: Keep It Simple
author: jay
type: post
date: 2005-06-08T00:05:29+00:00
url: /2005/06/08/keep-it-simple/
categories:
  - Reflections

---
This week I was helping an Engineering department setup a new computer. I don’t do this much anymore, most of that is done by part-time staff, or other full-time staff in our group, but it was a Macintosh, and I’m probably the best one to assist there. Besides, I like it, it makes me feel young(er) again and like I’m actually being productive.

Well, in this person’s office, there were two activated ports, one of which was just a foot or two from her computer. The other was across the room, near an old thin-wire connector that had previously been her connection to the network. This person had a old 10MB/s thin-wire to twisted-pair converter/hub that was previously providing the network connection to her Macintosh (the Macintosh doesn’t have a thin-wire interface, therefore it needed a converter/hub of some kind previously)

![][1]

When some of our part-time staff went through and hooked up everyone’s new ports, all they did in this person’s office was run a Cat-6 cable to the hub!

![][2]

The staff did not check to see if the port two feet from the Macintosh was enabled, nor did they even check to see if the long cable coming from the Macintosh was long enough to go directly in to the new wall port).

Among other things, this is taking a 100MB connection and dropping it to at least 10MB. Worse, it’s adding unnecessary complexity to the situation, complicating troubleshooting, and very likely introducing a source for problems or errors into the network.

One of our full-time staff has mentioned that he’s also found this in at least one other place in the building, which actually turned out to be causing problems for one of our Administrative users.

I wrote the full-time and part-time staff a note that described the situation and keying with the sentence:

> Folks, we have to do better than this.

It’s a small thing. The network worked, but it was not setup like it should be. I told the part-time staff:

> You **have** to ask yourself when going into a situation: Does this seem right? Is there a simpler solution? Is there a better solution? And then take that to a full-time staff member. The answer is that sometimes there are going to be kluges, but it’s fine and good and outright encouraged to ask questions about it.

I told the full-time staff:

> The same goes for you. You should be asking the same exact questions and talking to your peers about it, and you should be providing better oversight for the part-time staff.

And I told fellow management that:

> This kind of thing is ultimately our fault. I’d like to strongly encourage you to make sure that your full-time and part-time staff members are thinking through problems and opportunities, and that you encourage them, even in times that we are under pressure to solve something “right now” to solve it “right”. “It works” is by no means a indication that a problem was solved in the correct manner.
> 
> Even if time does not allow “the right fix” (which sometimes it doesn’t), please strongly encourage them to reflect on whether or not they think there’s a better solution, to make note of it, to tell you, or their peers, and then maybe we can go back and get it right once the time pressures are relieved.
> 
> For this particular situation and others like it, I leave you with the wisdom of Leonardo Da Vinci, taken from the Franciscan friar, William of Ockham:
> 
> “Simplicity is the ultimate sophistication.”

Maybe in a way it’s not the right thing to say or do. Our full-time and part-time staff, on average, do good work, even great work. They do the things right thing more often than not. And heaven knows, I probably sound like I’m preaching (and not in a good way). But the little things like this **do** actually matter. And staying on the little things does matter. Because if we don’t, one day we’ll end up in situations like [this one, described at “The Daily WTF”][3] that happened to remind me of what happens when simplicity, design, and asking the right questions doesn’t happen.

 [1]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-404cb4f17d930568a2f3d1996630c7ee/networkbefore.jpg"
 [2]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-404cb4f17d930568a2f3d1996630c7ee/networkafter.jpg"
 [3]: //www.thedailywtf.com/forums/35748/ShowPost.aspx"