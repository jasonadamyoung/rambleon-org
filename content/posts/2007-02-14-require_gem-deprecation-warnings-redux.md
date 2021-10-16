---
title: require_gem deprecation warnings, redux
author: jay
type: post
date: 2007-02-14T02:06:19+00:00
url: /2007/02/14/require_gem-deprecation-warnings-redux/
categories:
  - Uncategorized
tags:
  - ruby

---
So [I’ve written about this before][1] — and it turns out that a lot of the “require_gem” deprecation warnings come from tasks in your gem builds that build convenience scripts in <code class="highlighter-rouge">/usr/bin</code> (or wherever on your system it places these). So if these convenience scripts (like <code class="highlighter-rouge">/usr/bin/mongrel_rails</code>) are left around from installs with previous versions of rubygems — just reinstall the gem (or change all the <code class="highlighter-rouge">require_gem</code> statements to just “<code class="highlighter-rouge">gem</code>”) yourself.

A <code class="highlighter-rouge">grep require_gem /usr/bin/*</code> is pretty convenient to get an idea for the gems you need to reinstall.

However, [feedtools 0.2.26][2] has a bunch of require_gem statements in <code class="highlighter-rouge">lib/feed_tools.rb</code> (and littering my crons with the deprecation warnings), so I ended up [building and distributing my own replacement][3] with require_gem replaced with gem.

 [1]: https://rambleon.org/2007/01/24/my-my-those-deprecation-warnings-are-annoying/
 [2]: http://sporkmonger.com/projects/feedtools/
 [3]: https://rambleon.org/2007/02/13/creating-your-own-gem-server/