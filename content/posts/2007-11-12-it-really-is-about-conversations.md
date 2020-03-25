---
title: It really is about conversations
author: jay
type: post
date: 2007-11-12T01:07:17+00:00
url: /2007/11/12/it-really-is-about-conversations/
tags:
  - macintosh
  - marketing101
  - parallels
  - vmwarefusion

---
VMWare developer [Ben Gertzfield][1] did a really awesome thing a few days ago, [he commented][2] on my blog. What’s so cool about this is that Ben is a VMWare Fusion developer &#8211; and I had a seemingly throw-away line in that post that “VMWare fusion is not as user friendly as Parallels” &#8211; and Ben asked about how they could improve VMWare Fusion.

That’s INCREDIBLY cool. The man is doing Google Blog searches or has an Alert set up, or whatever it might &#8211; and he’s actually going out and asking real questions about how to make the product better. That’s awesome. My colleague [Ben MacNeill][3] does the same thing and I’ve always been impressed by it (and thankful to be working with Ben because of it). Along the same lines &#8211; I received [a comment from Marc Hedlund][4] (or someone helping Marc do this), one of Wesabe’s founders about using Wesabe. I’m still a little squicked out by doing my combined finances in a web application &#8211; but marketing like Marc/Wesabe did with that comment goes a long way to influencing me to trying it out. It’s about reaching your customers where _they_ are.

It’s an old saw, but marketing like this turns customers or potential customers into fans. Like [Kevin says][5] you have to be the ball.

Ben, VMWare Fusion was already a great product, I’ve had zero problems with it running it the last few days, using both Windows XP and Ubuntu. I’m a longtime VMWare user on other platforms, and I’ve used Parallels since just after it came out &#8211; and I’ve been happy with it too. But that single comment, combined with the energy that you really show for the product in your blog (even if it was setup for that express purpose), helped cement my continued use of Fusion for a long time (okay, just don’t like the product turn to crap 🙂 ).

Ben asked for a few observations about the usability &#8211; and I spent a fair amount of time with both products yesterday and today trying to figure out some specifics about my throw-away line. I’m probably a terrible poster child for usability &#8211; I couldn’t design a good UI if I wanted to &#8211; and there are some things I am too nerdy about to judge other UI either.

This is also done using the Fusion 1.1 Release Candidate. I think that’s fair to evaluate, but it isn’t an official release, so those reading this should keep that in mind.

My take-away is that the settings interface is really at the core of my “user-friendly” comment.

The first general impression I have is completely subjective. But I like the way that Parallels handles the vm “object” (for lack of a better term) &#8211; I don’t like the Parallels “picker” &#8211; but once a VM is picked &#8211; I get a window with the state that the VM is in &#8211; and a list of settings and controls:

![parallels-vm.png][6]

It’s not real clear from the Parallels window that I can click on the configuration and make changes, but if I do &#8211; I get what I consider to be a better interface for browsing those settings:

![parallels-vmsettings.png][7]

If I click on “Settings” for the VM in Fusion, it will bring the display window for the VM &#8211; and show the settings as a property sheet.

![fusion-settings.png][8]

This is really subjective &#8211; but I think the Parallels way of doing it is more understandable &#8211; and better “information at a glance” &#8211; I shouldn’t have to have a display window (which is black if the OS in the VM is “off”) pop up to manipulate the settings for the VM &#8211; and the summary views are nicer I think.

To be fair, I hate property sheets. So that’s part of it I think. And whether this qualifies as “User Friendly” probably depends on the user.

Something that I don’t think is as subjective &#8211; shows up when changing the settings for something like the Shared Folders &#8211; this is where the Parallels dialog has an advantage (p.s. that drag and drop of files between fusion and the finder is FANTASTIC, really great implementation). I think shared folders in general needs some work &#8211; I actually had some trouble with the text of .hostShared Folders and trying to figure out what that really meant in terms of getting access to resources. Focusing on the UI though, this:

![parallels-folders.png][9]

is preferable to this:

![fusion-folders.png][10]

I actually had to go to the help to figure this out. I completely ignored the “+/-“ controls on the left because they didn’t make contextual sense to me. Having them there implies that I’m going to click them to add a new “setting category”- not a sub item for the categories &#8211; placing them on the right, and limiting the list to the context of whatever I’m focused on would seem better to me.

I also would like to see all my shared folders at a glance on the right rather than having to click each one on the left.

(actually I kind of like how Parallels does it by default &#8211; mapping a volume on the Macintosh side to the entire disk for the VM &#8211; although that seems broken in Leopard &#8211; perhaps due to some issue with the version of MacFuse that it uses, at least from the messages in my console log)

These were some of the things I focused on. I think there are little things like this elsewhere in the settings, and in the menu layouts. Having a general usability walk through of the settings sheet in particular by someone that that is a real usability wonk would do wonders I think. The settings work &#8211; I was able to go through and setup up what I wanted (actually for shared files &#8211; I’ll just drag and drop &#8211; man that was great that it worked so well) Virtualization is naturally a bit geeky to begin with, but cleaning this up could help a bit, and probably cut down on support requests. I know that a lot of faculty that I work with will be trying this out, and I know they are going to get lost in these properties if they try to set them (most will just take the defaults, which do work well).

Anyway, that’s my $.02 &#8211; I’m sure there are a lot better reviews out there to come on this subject. Most of all, I really, really appreciate the fact that Ben is asking.

 [1]: http://infusion.vox.com/
 [2]: https://rambleon.org/2007/11/09/no-longer-waiting/#comment-34781
 [3]: http://www.trixietracker.com
 [4]: https://rambleon.org/2007/11/07/nice-upgrade/#comment-34771
 [5]: http://blog.k1v1n.com
 [6]: https://cdn.rambleon.org/migrate/2007/11/parallels-vm.png
 [7]: https://cdn.rambleon.org/migrate/2007/11/parallels-vmsettings.png
 [8]: https://cdn.rambleon.org/migrate/2007/11/fusion-settings.png
 [9]: https://cdn.rambleon.org/migrate/2007/11/parallels-folders.png
 [10]: https://cdn.rambleon.org/migrate/2007/11/fusion-folders.png