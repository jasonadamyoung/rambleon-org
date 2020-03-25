---
title: My, my those deprecation warnings are annoying
author: jay
type: post
date: 2007-01-24T22:20:24+00:00
url: /2007/01/24/my-my-those-deprecation-warnings-are-annoying/
categories:
  - Uncategorized
tags:
  - ruby

---
Sometimes the interpreted language equivalent of “compiler warnings” get really quite annoying (this might explain why subconsciously I have always been incredibly pedantic about compiler warnings).

Anyway, with advent of RubyGems 0.9.0, the [“require gem” command is deprecated][1].

And as of 0.9.1 of RubyGems (to which you might want to update [because of a security hole][2]) &#8211; you know get lovely little warnings scattered all over the place

<code class="highlighter-rouge">Warning: require_gem is obsolete. Use gem instead.</code>

And of course things like the mongrel\_rails command include “require\_gem” &#8211; as does feed_tools &#8211; which of course is kicked off by cron jobs in our environment, and is now happily filling my root mail with the warning messages.

Sigh.

 [1]: http://redhanded.hobix.com/inspect/autorequireIsBasicallyGoneEveryone.html
 [2]: http://rubyforge.org/forum/forum.php?forum_id=11657