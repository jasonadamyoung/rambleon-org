---
title: Ants, Pixar, and Macintosh stupidity
author: jay
type: post
date: 2006-07-28T23:57:38+00:00
url: /2006/07/28/ants-pixar-and-macintosh-stupidity/
categories:
  - Reflections

---
It was because of the ants.

The ants returned to the kitchen today, I guess exploring to escape the sweltering furnace that was Raleigh, North Carolina today. But they came, noticed by the brown-eyed girl about to leave to go to the wedding shower this weekend.

I despise the ants. No, I absolutely loathe the little critters once they enter my abode. Outside they may have their life, and more than once, I have hiked up in the mountains of North Carolina, sat in a grassy meadow taking in the wonder of creation, and watched the ants go about their business. Try not to disturb them or their homes.

But once they enter mine, it’s a death sentence. I will immediately go to the store to go get whatever rancid poisons I can find, mostly likely because I emptied the last bottle of toxicity the last time they appeared.

So I go to Target. Pick up whatever bottle of poison that indicates things like “MAXX!” and “KILLS THEM DEAD!”

and then I make the mistake of entering the software aisle. I’m a Macintosh user. I’m immune to the Target and the Best Buy and the software aisle of everywhere but the Apple Store. But it’s fun to look at what kind of crap is being foisted on the Windows Weenies of the World.

That’s when I spied it. The Win/Mac CDROM version of _Cars_. I don’t really play computer games. I can’t really win any of them. I own enigmo, and iconquer, and I played the remake of Choplifter like it was going out of style for like two days. But eventually I just give up on them.

But I had downloaded the demo for Cars and thought it was cute, made for 10 year olds, and playable by 30 years olds, about as simple as Pong. Right up my alley. And the brown-eyed girl is out of town, and I’m set for a weekend of work and boredom Why not waste hours on a 10 year old’s game while waiting for the ants to die?

So, seduced by the $15 Target exclusive pricing, I buy the game, kill the ants, and dutifully place the game in the drive.

It spins, whirs, chunks. the system.log starts spitting out:

<div class="highlighter-rouge">
  <pre class="highlight"><code>kernel[0]: SAM Multimedia: READ or WRITE failed, ASC = 0x11, ASCQ = 0x05kernel[0]: SAM Multimedia: READ or WRITE failed, ASC = 0x11, ASCQ = 0x05kernel[0]: SAM Multimedia: READ or WRITE failed, ASC = 0x11, ASCQ = 0x05kernel[0]: SAM Multimedia: READ or WRITE failed, ASC = 0x11, ASCQ = 0x05...</code></pre>
</div>

ad nauseum.

And the disk refuses to eject.

I fire up disk utility.

<div class="highlighter-rouge">
  <pre class="highlight"><code>kernel[0]: disk2s1s2: I/O error.kernel[0]: IOATAController device blocking bus.kernel[0]: IOATAController device blocking bus.kernel[0]: IOATAController device blocking bus....</code></pre>
</div>

The only hope is to reboot, and hold the mouse button down.

Then, oh then, I get the bright idea to use the brown-eyed girl’s laptop. It won’t run on intel macs, but maybe, maybe the laptop will read the disk.

No luck. Same error, I reboot the laptop, and it chunks, whirs, and refuses to eject the cdrom after what seems to be decades of seconds. Oh my, the game has killed the girl’s treasured laptop. Finish of having to hang my shame at the genius bar dance in my head. Why didn’t I use the work laptop?

I turn it off, connect it in firewire target mode, same deal, until it finally, finally, gives up the ghost of the cd.

And to think, it was Dreamworks that did _Antz_

So the CD’s are in the trash, and I’m never, ever, buying a pixar game again.

( and what kind of stupid operating system chokes on an unreadable CD? )