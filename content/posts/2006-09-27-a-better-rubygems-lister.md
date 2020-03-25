---
title: A better rubygems lister
author: jay
type: post
date: 2006-09-27T03:31:38+00:00
url: /2006/09/27/a-better-rubygems-lister/
categories:
  - Uncategorized
tags:
  - ruby
  - sysadmin

---
I’m in the process of teaching myself ruby &#8211; first by dealing with the language core and stdlib by just writing ruby (no frameworks) to replace my myriad of crappy shell scripts that I’m using for various things. I can do a lot more quickly in a ruby (or perl or even php) than I can in any of the shell languages. And it’s a great way to learn ruby.

One of the first things I’m doing is fixing a huge annoyance I have with [rubygems][1] &#8211; namely that the

<div class="highlighter-rouge">
  <pre class="highlight"><code>gem list</code></pre>
</div>

command has no terse output. A standard gem list gives you something like:

<div class="highlighter-rouge">
  <pre class="highlight"><code>*** LOCAL GEMS ***    actionmailer (1.2.5)    Service layer for easy email delivery and testing.    actionpack (1.12.5)    Web-flow and rendering framework putting the VC in MVC.    actionwebservice (1.1.6)    Web service support for Action Pack....</code></pre>
</div>

And I could give a flying rip what each does after I’ve read the descriptions the first time. So I’m taking advantage of a cool thing in rubygems &#8211; that it’s a modular library implemented as a rubygem itself &#8211; and reverse-engineering things a bit with it to give me something like:

<div class="highlighter-rouge">
  <pre class="highlight"><code>$ ./gemver.rbactionmailer: 1.2.5actionpack: 1.12.5actionwebservice: 1.1.6...</code></pre>
</div>

Here’s what I ended up with:

<div class="highlighter-rouge">
  <pre class="highlight"><code>require 'rubygems'    if ARGV[0] then  @searchgem = ARGV[0]else  @searchgem = ''end    # get full local list of gems@gemversions = {}searchresult = Gem::cache.search(@searchgem)    # walk through returned gemspecs and build a hash of found gems and version(s) in GEM::Version formatsearchresult.each{  |gemspec|  if @gemversions.key?(gemspec.name) then    @gemversions[gemspec.name].push(gemspec.version)  else    @gemversions[gemspec.name] = [gemspec.version]  end}    # walk through the hash and print out the results@gemlist = @gemversions.keys.sort@gemlist.each{|gemname|  if @gemversions[gemname].size &lt;= 1 then    print "#{gemname}: ",@gemversions[gemname][0].to_s,"n"  else    # for gems with multiple versions, sort the versions in reverse order, GEM::Version implements a sort_by method    print "#{gemname}(multiple): "    versionsarray = @gemversions[gemname].sort_by { |arrayitem| arrayitem.version }.reverse    printlist = []    versionsarray.each{|eachversion| printlist.push(eachversion.to_s)}    print printlist.join(",")    print "n"  end}</code></pre>
</div>

Not completely bad for only my third day or so poking at ruby for replacing my system/service scripts (I’m actually using this in a comprehensive script to mail me periodic information about the configuration for each of my servers. This is actually an offshoot of a script to compare installed gems with a expected list of gems and versions &#8211; which I’ll post later)

 [1]: http://rubygems.org/