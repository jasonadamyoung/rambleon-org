---
title: Speeding up Rake and Rails in Ruby 1.9.2
author: jay
type: post
date: 2011-09-07T02:12:09+00:00
url: /2011/09/07/speeding-up-rake-and-rails-in-ruby-1-9-2/
tags:
  - performance
  - rails
  - ruby

---
Our team at work is currently in the beginning stages of a new project, that we started on Ruby 1.9.2 and Rails 3.1.  Most of our previous work was all Ruby 1.8.7 (Ruby Enterprise Edition) and Rails 2, though I have worked on a couple of REE 1.8.7 + Rails 3.0 apps.

I’ve also jumped with both feet (and not in the fun, fancy, parkour sense, in the 37-year old, flat arched, off a perfectly good one-story building onto concrete sense) into testing, and tenuously into TDD — and I think my first comment was “man, these tests are hella slow.”.  Only it’s not the tests that are slow (yet) — it’s _rake_.  That was my second comment — “what the hell is wrong with rake?”  My co-workers even looked at me a little funny when I brought it up.

As we were getting started last month, Rails 3.1 was still in RC status — and I would spend time browsing the Rails issues keeping track of the progress — and I remember reading this issue [about Rails 3.1 boot performance][1] — and reading the comment about the “require issue”.   That led me via Google to [this stack overflow post][2] and [this rubyonrails core post][3] — which I basically chalked up “core problem, it’ll be fixed one day”

Well that “one day” is now, because **I can’t take it anymore.**

This is the rails console startup in REE-1.8.7/Rails 2.3.14

<div class="highlighter-rouge">
  <pre class="highlight"><code>rubydev:darmok (ree-1.8.7@extension_production)$ time script/consoleLoading development environment (Rails 2.3.14)&gt;&gt; exit    real	0m5.820suser	0m4.847ssys	0m0.787s</code></pre>
</div>

This is the rails console startup in 1.9.2/Rails 3.1

<div class="highlighter-rouge">
  <pre class="highlight"><code>rubydev:knappsack (ruby-1.9.2@exrails31)$ time rails consoleLoading development environment (Rails 3.1.0)&gt;&gt; exit    real	0m18.766suser	0m17.020ssys	0m1.444s</code></pre>
</div>

Just a flat out “rake –tasks” takes over 9 seconds in 1.9.2/Rails 3.1!

So thankfully, google, the internet, and other irritated developers to the rescue. Thanks to [this blog post from Xavier Shay][4] (via: [Peter Cooper at Ruby Inside][5], that I missed in my feeds the first time because “1.9.3” is not on my radar) — and especially this [gist from Todd Fisher][6] — and I have a glimmer of relief.

The quick instructions for the above:

1) grab the patch from the gist

<div class="highlighter-rouge">
  <pre class="highlight"><code>curl https://raw.github.com/gist/1008945/4edd1e1dcc1f0db52d4816843a9d1e6b60661122/ruby-1.9.2p290.patch &gt; load.patch</code></pre>
</div>

2) patch ruby

<div class="highlighter-rouge">
  <pre class="highlight"><code>$ rvm cleanup all; rvm install 1.9.2 --patch ./load.patch -n patched</code></pre>
</div>

3) copy my gemset(s) over

<div class="highlighter-rouge">
  <pre class="highlight"><code>rvm gemset copy 1.9.2@exrails31 1.9.2-p290-patched@exrails31</code></pre>
</div>

4) change my .rvmrc for the project…and voila!

<div class="highlighter-rouge">
  <pre class="highlight"><code>rubydev:knappsack (ruby-1.9.2@exrails31)$ time rails consoleLoading development environment (Rails 3.1.0)&gt;&gt; exit    real	0m9.722suser	0m8.607ssys	0m1.081s</code></pre>
</div>

rake –tasks is now 6 seconds instead of 9, and test initialization is correspondingly faster as well.

It’s not REE 1.8.7/Rails 2 — but I’ll take any speedup I can get.

 [1]: https://github.com/rails/rails/issues/734
 [2]: http://stackoverflow.com/questions/4789248/rails-3-initializes-extremely-slow-on-ruby-1-9-2
 [3]: https://groups.google.com/forum/#!topic/rubyonrails-core/iFGe9aUwiKE
 [4]: http://rhnh.net/2011/05/28/speeding-up-rails-startup-time
 [5]: http://www.rubyinside.com/ruby-1-9-3-faster-loading-times-require-4927.html
 [6]: https://gist.github.com/1008945