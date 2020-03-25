---
title: A power tale told by an idiot
author: jay
type: post
date: 2006-05-10T13:52:45+00:00
url: /2006/05/10/a-power-tale-told-by-an-idiot/
categories:
  - Reflections

---
I’m a power idiot. I had years of physics drill into my head the whole “V = IR” deal &#8211; and the only thing I think I practically have retained from that is that my brain must be pretty resistant to any current understanding of power.

Ok, so my jokes aren’t any better.

My extent of dealing with the power issue has consisted of “does this plug fit?” And “do I have enough plugs.” I sort of delegated everything having to do with power when I managed a systems group before to the Electrical Engineering majors &#8211; because to be sure, they knew more than I did. And they did, but we all practically did that “does this plug fit” and “do we have enough plugs” thing.

A few years ago, my first real power issue came whenever the facilities staff would buff the floor &#8211; the floor buffers would be plugged into circuits that were shared by the server room, which would trip the breaker, and take out the server room, because usually we had a failed UPS of some kind. Well, did I take that lesson and learn about power? Of course not, we just ran a dedicated panel for the server room, and made sure that our UPS’s were updated and checked.

A year or two ago, the second power issue came in another server room, in a room with plenty of power, but only 15A breakers and of course, we co-located our servers with another group on campus, and had too much equipment off one or two circuits and tripped the breakers.

Did I learn about power then? No, of course not. The lesson was “don’t trip the breaker.”

So when I started looking about the power feeds for a server cage &#8211; I went out to try to learn a little more. And I got the general feel that the consensus for power a full rack of equipment was to up your voltage, because with that old standby equation volts x amps = watts, and upping the volts gave your more watts to your rack, and that you might be pushing it with a full rack of equipment &#8211; especially if you start looking at any blade server infrastructures. I went and read an APC whitepaper about [“Rack Powering Options for High Density”][1] &#8211; and that talking about doing 208V to your racks. And it was all about using 20A circuits. Well, mainly because they were pushing their own PDU solution. But I ignored that. And the idea of 20A+208V stuck in my head. And it was reinforced by the layout of a peer group on campus that built a “cage” environment &#8211; but mainly for network equipment &#8211; and they were using NEMA L6-**20** receptacles in the rack.

So that’s what I spec’d out. A whole room of 208V+20A circuits, with L6-20 receptacles.

And when I went to buy the [APC UPS’s][2] for the racks &#8211; and when they mentioned L6-30 plugs. I really didn’t think much about it. Of course it’ll work! Right? I mean &#8211; even the tiny little web graphics looked the same.

APC Picture of an L6-20R: ![conn_L6-20R_sm.gif][3]

APC Picture of an L6-30R: ![conn_L6-30R_sm.gif][4]

So, if you are following along still. You should be laughing now. Trust me. And pointing. Guffawing even.

And I didn’t have the faintest clue that this would be a problem. Until of course, the worst possible time. I come in over the weekend, all jazzed up about getting a head start and racking up the UPS’s (p.s. 100+ lb. UPS’s are much easier to rack when you pull the batteries out 😉 ). I pull the plug through the top of the rack &#8211; and attempt to plug in the L6-30P into the L6-20R &#8211; and…

Well, of course it doesn’t work. You know, those standards have different numbers for reasons. Good thing too, I’d be tripping out the breakers all the time. (Well maybe, probably).

And there’s not really a UPS product that uses a 208V 20A plug. So what do you do? Well, you re-wire your room to do 30A and L6-30R outlets. $3000 and (worse) two weeks delay. All because I really don’t grok power.

(and as you can tell, this whole note is still not inspiring much confidence that I even know now what I’m talking about &#8211; I don’t. But I do know the different between the plugs now! Small moves! )

 [1]: http://www.apcmedia.com/salestools/NRAN-5TDSPN_R4_EN.pdf
 [2]: http://www.apc.com/resource/include/techspec_index.cfm?base_sku=SURT3000RMXLT
 [3]: https://cdn.rambleon.org/migrate/2006/05/conn_L6-20R_sm.gif
 [4]: https://cdn.rambleon.org/migrate/2006/05/conn_L6-30R_sm.gif