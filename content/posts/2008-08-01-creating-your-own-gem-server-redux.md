---
title: Creating your own Gem Server, redux
author: jay
type: post
date: 2008-08-01T21:44:35+00:00
url: /2008/08/01/creating-your-own-gem-server-redux/
tags:
  - ruby
  - rubygems
  - systems administration

---
One of the most popular landing pages for rambleon.org (which isn’t saying much) &#8211; is [a post I put together in April, 2007 about running your own gem server][1].

Unfortunately it’s outdated. Set let me revisit it for those landing on the old page and looking to put together their own gem server. The nice thing is, gem has (almost) all the tools you need.

### Setting up your server {#setting-up-your-server}

  1. You need a web server. (yes I know you can run gem_server, but get a real one). You are on your own for that one. You also need a rubygems install on that box. You are also on your own for bootstrapping rubygems on that box and any other ones.
  2. Decide where you will put your gems (say in a “mycoolgems” directory off the docroot for your webserver)
  3. <code class="highlighter-rouge">$ mkdir [docroot]/mycoolgems/gems</code>
  4. Copy your .gem files that you want to host to <code class="highlighter-rouge">$ [docroot]/mycoolgems/gems</code>
  5. The gem suite of commands includes a <code class="highlighter-rouge">generate_index</code> command to generate a yaml-based index of your gems, and other supporting files. See <code class="highlighter-rouge">gem help generate_index</code> for more information

### Pointing your systems to your own server {#pointing-your-systems-to-your-own-server}

This used to be a complete PITA that involved rebuilding the <code class="highlighter-rouge">sources</code> gem. No more! After you install rubygems &#8211; just make sure to do a:

<code class="highlighter-rouge">gem sources --remove http://gems.rubyforge.org</code>

and a

<code class="highlighter-rouge">gem sources --add http://yourwaycool.gem.source</code>

### That’s All Folks (probably) {#thats-all-folks-probably}

Voila! You just managed to point your server to your own gem server! Install away.

It’s good to keep one box pointed to http://gems.rubyforge.org &#8211; and take advantage of the new “gem outdated” command to keep track of changes in your installed gems that have been deployed to rubyforge.

 [1]: /2007/04/19/creating-your-own-gem-server/