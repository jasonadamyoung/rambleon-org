---
title: Creating Your Own Gem Server
author: jay
type: post
date: 2007-04-19T14:31:08+00:00
url: /2007/04/19/creating-your-own-gem-server/
categories:
  - Reflections

---
## Update &#8211; August 1, 2008 {#update---august-1-2008}

This page remains one of my most active pages for Google Searches. A number of folks want to run their own gem server, and for good reason.

Unfortunately it’s outdated and has been for a while, and I’ve been too lazy to update it.

I also hate for you to leave with outdated information &#8211; so please [check out the updated information][1] about the commands that are now built into gem and available for facilitating running your own gem distribution site.

* * *

I’ve been hand updating gems for too long on my servers, but I have been hesitant to do anything more automated as long as my systems were updating against <http://gems.rubyforge.org>. Rubyforge has been down more than once when I really needed to update something, and I don’t want to create an automated dependency on a third-party service

So before I automate things, I needed a way to point to my own gem server. Which thankfully, it turns out, that it’s not all that hard to do so (it’s harder than it has to be, and man oh man is the gem cache a pain in the rear). This all assumes that you already had rubygems installed on the boxes that you are moving over to point to your own server. (This also assumes that you use a Linux/Unix server, I’m sure all this works on a Windows server, but I haven’t tested one and honestly don’t care).

### Setting up your server {#setting-up-your-server}

  1. You need a web server. (yes I know you can run gem_server, but get a real one). You are on your own for that one. You also need a rubygems install on that box. You are also on your own for bootstrapping rubygems on that box and any other ones.
  2. Decide where you will put your gems (say in a “mycoolgems” directory off the docroot for your webserver)
  3. <code class="highlighter-rouge">$ mkdir [docroot]/mycoolgems/gems</code>
  4. Copy your .gem files that you want to host to <code class="highlighter-rouge">$ [docroot]/mycoolgems/gems</code>
  5. Rubygems installed a <code class="highlighter-rouge">"index_gem_repository.rb"</code> ruby script in your path. (well probably in your path, it’s in /usr/bin on my systems). You want to run this to generate a yaml-based index of your gems. (appropriately named “yaml” &#8211; and a compressed yaml.Z) e.g. <code class="highlighter-rouge">index_gem_repository.rb -d [docroot]/mycoolgems</code>

### Pointing your systems to your own server {#pointing-your-systems-to-your-own-server}

Setting up the server is the easy part. The harder part is pointing all your boxes to your own server. And only your own server. You’d think that one neat thing about the 0.9.2 rubygems release is that it includes a “gem sources” command to theoretically add and remove gem sources that your boxes would look at, but you’d be wrong. Because you can’t get rid of the base source of http://gems.rubyforge.org without modifying the sources gem or the sources distribution on your own box. You can theoretically modify <code class="highlighter-rouge">[lib/ruby]/gems/1.8/gems/sources-0.0.1/lib/sources.rb</code> and change:

<div class="highlighter-rouge">
  <pre class="highlight"><code>module Gem  @sources = ["http://gems.rubyforge.org"]  def self.sources    @sources  endend</code></pre>
</div>

to

 <code class="highlighter-rouge">@sources = ["http://yourserver.yourdomain"] </code>

However, that customization is likely going to get blown away the next time you update rubygems with a <code class="highlighter-rouge">gem update --system</code> &#8211; because the <code class="highlighter-rouge">sources</code> gem is built by the rubygems update. So what do you do? Build your own gem update.

  1. Download the [RubyGems source][2]
  2. Edit <code class="highlighter-rouge">pkgs/sources/lib/sources.rb</code> to point to your own server
  3. Rebuild the gem by issuing a <code class="highlighter-rouge">rake package</code> &#8211; which will build the rubygems update gem with your source changes (in <code class="highlighter-rouge">pkg/</code> &#8211; in my case <code class="highlighter-rouge">pkg/rubygems-update-0.9.2.gem</code>)
  4. Copy this gem to your gem server’s gems directories (and rebuild the yaml index as appropriate)
  5. On your other servers &#8211; clear out <code class="highlighter-rouge">[lib/ruby]/gems/1.8/cache</code>
  6. Remove the <code class="highlighter-rouge">[lib/ruby]/gems/1.8/source_cache</code>
  7. Run <code class="highlighter-rouge">gem update --system --source http://yourserver.yourdomain</code>

### That’s All Folks (probably) {#thats-all-folks-probably}

Voila! You just managed to point your server to your own gem server! Install away.

It’s good to keep one box pointed to http://gems.rubyforge.org &#8211; and take advantage of the new “gem outdated” command to keep track of changes in your installed gems that have been deployed to rubyforge.

**[Updated: April 19, 2007** Thanks to [Jim Weirich][3] for pointing out that the index script should actually be index\_gem\_repository.rb and **NOT** generate\_yaml\_index.rb. generate\_yaml\_index.rb is a holdover from earlier rubygems versions]

 [1]: /2008/08/01/creating-your-own-gem-server-redux/
 [2]: http://rubyforge.org/frs/?group_id=126&release_id=9501
 [3]: http://onestepback.org/