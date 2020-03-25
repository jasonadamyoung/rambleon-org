---
title: Your own gem server and Ruby 1.8.5
author: jay
type: post
date: 2007-12-03T23:18:33+00:00
url: /2007/12/03/your-own-gem-server-and-ruby-1-8-5/
tags:
  - redhatenterpriselinux
  - ruby
  - rubygems

---
A while back, I wrote about [creating your own gem server][1] &#8211; which basically consisted of custom building a <code class="highlighter-rouge">sources</code> gem. Mainly because <code class="highlighter-rouge">gem sources --remove</code> at the time wouldn’t let you remove rubyforge from the sources list.

Thankfully, <code class="highlighter-rouge">gem sources --remove</code> now works great. And with RubyGems 0.9.5 &#8211; they’ve included a new <code class="highlighter-rouge">gem generate_index</code> command that will generate the indexes for you. So now &#8211; if you want to create your own gem server, you can run the web server software of your choice and use the <code class="highlighter-rouge">gem generate_indixe -d [docroot]/mycoolgems</code> command to build the indexes.

(If you do update the rubygems-update gem on your “client” systems, make sure to do a <code class="highlighter-rouge">gem sources --add http://yourgemserver</code> and a <code class="highlighter-rouge">gem sources --remove http://gems.rubyforge.org</code> from your sources. Or continue building your own sources gem.)

Unfortunately, through no fault of the RubyGems devs, this might not work on a system running Ruby 1.8.5 &#8211; like, say, Red Hat Enterprise Linux, version 5. The fault lies in Ruby itself. <code class="highlighter-rouge">gem generate_index</code> builds its index in /tmp &#8211; and uses [FileUtils][2] to move it out of /tmp and into the place you specified as the target directory (or ‘.’). If your servers are like mine, /tmp and your web server directories are on different partitions, and unfortunately FileUtils in Ruby 1.8.5 has a bug moving directories across partitions.

The bug was fixed, I think with this [revision in March 2007][3] &#8211; and it’s in Ruby 1.8.6 (at least as of p110/111) &#8211; but it’s not in Red Hat’s 1.8.5 packages &#8211; and I’m not sure it qualifies as a security bug, so I doubt it will get backported.

Anyway, I went the configure/make/make install route (package purists, feel free to cringe, but I don’t want to make RPM’s and this is core enough for me to stay on top of). Your mileage may vary.

 [1]: https://rambleon.org/2007/04/19/creating-your-own-gem-server/
 [2]: http://ruby-doc.org/core/classes/FileUtils.html
 [3]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=11974