---
title: Pardon The Dust
author: jay
type: post
date: 2012-01-16T03:38:00+00:00
url: /2012/01/16/pardon-the-dust/
categories:
  - Reflections

---
I’ve decided to do what all the cool kids are doing and bake my blog (with <del>butter</del> [octopress][1] ).

Like [Matt Gemmell][2] — I didn’t need all the features that wordpress provided, and while I’m not sure that it was all that opaque–the fewer moving parts I have to maintain, the better.

Moving was relatively straightforward. I had to modify [exitwp][3] to use html2text_file instead of html2text to stop html2text from wrapping–and breaking–strings over 80 characters (thanks to [this comment][4] from James Ward). I also needed to convert double newlines to double br’s (all…the…way) in order for the paragraphs to be there–I had always let wordpress convert double newlines to paragraphs (pointer also thanks to James Ward). And I had to run it all on Ubuntu, because OS X wasn’t all that happy about things. But once that was all done, it was a piece of cake to get set up.

I apache alias’d my old wp-content uploads, and rewrite the /feed urls to /atom.xml — but other than that, it seems to be a drop-in replacement.

<del>I’m using comments through <a href="http://disqus.com">disqus</a> — but the comment to post ratio is pretty low, so I don’t know that I’ll keep them — but all the old comments have been imported there for now.</del>

So there might be some things that don’t look right, or aren’t linked right. I’ll fix them eventually. So if you see something, say something.

[Update] Comments. meh. Send me a tweet, or google plus, or email, I think that will work out best

 [1]: http://octopress.org
 [2]: http://mattgemmell.com/2011/09/12/blogging-with-octopress/
 [3]: https://github.com/thomasf/exitwp
 [4]: https://github.com/thomasf/exitwp/issues/6#issuecomment-3103262