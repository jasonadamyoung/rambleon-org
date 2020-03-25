---
title: It’s about the details
author: jay
type: post
date: 2007-11-08T16:46:06+00:00
url: /2007/11/08/its-about-the-details/
categories:
  - development
  - Uncategorized

---
My default feed yesterday switch back to RSS 2 from Atom ([and a huge thanks to Sam for pointing this out][1]) because of a upgrade to WordPress 2.3.1.

It was another reminder of how things fail because of a cascade of missed details.

The immediate detail, was that I completely forgot [my own quick hack to WordPress 2.3][2] to force the Atom default. That’s the danger in making “one-off” changes to software that you use. Quick one-offs don’t become part of one’s standard workflow, they are too easily missed later, and upgrades will usually wipe out one’s changes. The old axiom applies here &#8211; “just because you can, doesn’t mean you do, because it will bite you in the rear later”

If I’m going to make changes like this, I probably should do what I do with MediaWiki at work, and [pull things from Subversion][3] and merge them into my own trunk. But that’s just flat out silly for a few lines of changed code.

The second mistake is that I should have &#8211; at the least &#8211; [taken Mark Pilgrim’s advice][4] and put together the two liner plugin to remove the rss2 action.

That’s just complete laziness on my part. I had it working and I didn’t bother it again &#8211; I wanted to spend more time investigating how the whole “actions” thing works in WordPress, and had grand dreams of extending that idea into a plugin that could be configured from WordPress itself. Then I decided I’d [rather play with the dog][5].

There’s this continuum of solving problems that starts with hacks and goes to solutions. And the problem is, solutions take a lot of work. So the happy medium is somewhere in between. My change was hack that bit me in the rear later. Mark’s change is something that will likely work across upgrades. And that’s what I should have done right then, and I absolutely knew better than to continue with my own podunk modification. There’s another axiom there “just because it works, doesn’t mean it’s right, especially if isn’t going to work later”

So, the default feed format changing is completely my fault. If I care, and I do, I have to make sure that the things I really care about keep working. There’s an ongoing maintenance cost to my commitment.

But the third detail in this, not that it excuses my mistakes in not being diligent about my details, is that this really should be part of the core of WordPress. It really doesn’t make sense that the Atom feeds are there now, but the software is so bent on making RSS2 the default and not letting folks change it easily. There’s really no excuse going forward, especially given the [patches][6] available.

(and yes, it works just fine, as my own patch -p0 and plugin drop-in can attest to &#8211; that I’ll have to do again for 2.3.2 &#8211; Mark’s plugin is there as a backup this time 🙂

I’ve been on the WordPress dev’s case about this a long time. Always in this blog, and I’ve never put code where my mouth is. I should have put up or shut up. Sam and Mark, and dozens of others thankfully have, with WordPress, and in dozens of other places that matter.

But even if I should have shut up already &#8211; there is something core that I’ll repeat here. I know that the users don’t care. I know that it doesn’t make a dang bit of difference to Aunt Millie whether things are RSS 2.0 or Atom. But RSS 2.0 is the IE 6 of data interchange. WordPress’s continued traction on making it easier to allow the software’s users to make the Atom feed the default is like continuing to excuse IE 6. Sure, we have to put up with it, but we don’t have to keep making it hard to choose other things.

As developers, we have the ultimate responsibility to make sure that we are laying the foundation for how we ship data around &#8211; now, and 5 years from now. I sure hope that the WordPress core devs run with the patch this time. It really does matter. You’ll still have a successful business model without it, but don’t make us continue routing around the damage.

[ed. note &#8211; I read this again after Sam added his second paragraph about the patch and my own post was a little unclear, so it was edited slightly for my actual intent. While I don’t think that RSS2 should be the default &#8211; I get not making the change right now, just stop making it hard to make a choice with the feed format]

 [1]: http://intertwingly.net/blog/2007/11/08/Pluggable-Feed-Format
 [2]: https://rambleon.org/2007/09/25/absolutely-astounding/
 [3]: http://codex.wordpress.org/Installing/Updating_WordPress_with_Subversion
 [4]: https://rambleon.org/2007/09/25/absolutely-astounding/#comment-34511
 [5]: http://www.flickr.com/photos/rambleon/sets/72157602423203146/
 [6]: http://trac.wordpress.org/ticket/5328