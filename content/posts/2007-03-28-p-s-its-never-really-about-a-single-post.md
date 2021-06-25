---
title: p.s. it’s never really about a single post
author: jay
type: post
date: 2007-03-28T03:49:17+00:00
url: /2007/03/28/p-s-its-never-really-about-a-single-post/
categories:
  - Uncategorized
tags:
  - ruby
  - sysadmin

---
so I went into [snarky overdrive][1] with my vendor dependencies post. it wasn’t quite as funny as [last year when I went off on the people that can’t unsubscribe from lists][2] either. Nor was it as funny as some [other commentary on Rails I’ve snarkily made][3]

I really do love [the err.the.blog guys][4] &#8211; &#8211; they have the best rails blog &#8211; bar none &#8211; that I’ve ever found &#8211; I even have their [toolbox post][5] burned into my retina I think.

They really know their stuff. Rails needs devs like this &#8211; and they do a great service educating other folks about the framework.

But I don’t agree (obviously) with packaging up all the dependencies with an application. I get all the reasons for doing so. It just sets a really dangerous precedent for the people that are going to take it as the gospel and never think about the ramifications of what packaging up everything with your application means. (like simple things &#8211; remind me to tell the inode story sometime. 20 capistrano delivered copies of edge rails might not kill your storage but it dang sure can eat some inodes)

But hell, you can’t really trust the system administrators to get it right either about not breaking dozens of rails apps that _they_ don’t have a clue about. I, um, er, have known some sysadmins to do that (more than once even).

p.p.s Oh, man, I forgot about the sponsorship link. This post sponsored by the Static Linking Historical Society. And support also comes from Microsoft Corporation. Proud facilitators of DLL Hell for all the static linkers that decided to go dynamic, but distributed their own libraries.

 [1]: https://rambleon.org/2007/03/27/good-grief-people-stop-with-the-local-gems/
 [2]: https://rambleon.org/2006/01/26/how-to-unsubscribe-from-ncsu-lists/
 [3]: https://rambleon.org/2007/03/21/railsians/
 [4]: http://errtheblog.com/
 [5]: http://errtheblog.com/posts/33-my-rails-toolbox