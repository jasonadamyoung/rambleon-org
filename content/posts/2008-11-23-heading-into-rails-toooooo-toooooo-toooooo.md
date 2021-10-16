---
title: Heading into Rails TOOOOOO-TOOOOOO-TOOOOOO!
author: jay
type: post
date: 2008-11-23T21:12:07+00:00
url: /2008/11/23/heading-into-rails-toooooo-toooooo-toooooo/
tags:
  - rails
  - rails2.2
  - ruby
  - rubyonrails

---
When I played little league baseball we had announcers for the game, one of which was some nice old guy in a ramshackle shelter behind home plate that was the “booth” — and every time there’d be two outs, two strikes and two balls — he’d croon “TOOOOO-TOOOOO-TOOOO”. Which of course, has little to do with this post other than version numbers.

Rails 2.2 was [just released][1] — so of course, I’m taking the most critical application we have (well, maybe the second critical, and that’s really only because other apps depend on it, it’s not critical in terms of features) — and upgrading it first, because, well, that’s how system administrators roll.

The [release notes][2] are great. Seriously. Really great. So great I shouldn’t even be writing this post. Which I am anyway — because here are some of the highlights of what I had to change to make my app work.

### NoMethodError for Association Methods {#nomethoderror-for-association-methods}

Getting exceptions when you go to Rails 2.2.2 that don’t say anything more than <code class="highlighter-rouge">NoMethodError</code> when you know good and damn well the method that it’s saying no method on exists? Yeah, me too. And I bet it’s a method in an associated model. And if it is, you probably should be ashamed of yourself.

Rails 2.2 now [enforces privacy on private methods called through associations][3]. So in my case, I had two issues, 1) I was calling “update” on an associated model in some code I blindly copied and pasted a long time ago, and 2) I have a few of my own SQL queries that I’m not entirely sure how to do using Rails associations and named scopes, and I was cheating by calling <code class="highlighter-rouge">self.connection.sanitize_limit</code> to take advantage of Rails’ own function for cleaning up provided “LIMIT” params. And <code class="highlighter-rouge">sanitize_limit</code>, like the instance method <code class="highlighter-rouge">update</code> is private.

### Update Rails Footnotes {#update-rails-footnotes}

If you use [Rails footnotes][4] in development mode — you’ll want to update [for this change][5] for Rails 2.2 compatibility.

### Aside… Piston 1.9.5 {#aside-piston-195}

A great way to stay current with Rails plugins is to use [Piston][6] — which has a new 1.9.5 release. You can [build your own][7].

### “quoted\_table\_name” and Has Many Polymorphs {#quoted_table_name-and-has-many-polymorphs}

If you start getting some error about <code class="highlighter-rouge">undefined method </code>quoted\_table\_name’\` and you use [has\_many\_polymorphs][8] — you’ll [want this change][9].

I don’t use the plugin, I use the gem. So I built my own has\_many\_polymorphs 2.12.1 gem — by doing: \` gem install echoe git clone git://github.com/fauna/has\_many\_polymorphs.git cd has\_many\_polymorphs \`

edit CHANGELOG with a “v2.12.1 line” (e.g. v2.12.1. Cloned GitHub project and rebuilt gem for our nefarious purposes.)

 <code class="highlighter-rouge">rake manifest rake package rake install </code>

### add_joins! and Has Many Polymorphs (or anything else for that matter) {#add_joins-and-has-many-polymorphs-or-anything-else-for-that-matter}

HMP includes a ‘tagged\_with’ method for finding collections ‘tagged\_with’ a set of tags. I use a heavily modified version of that. The method supports custom scopes, in theory. (well, probably more than theory, I’ve just never tried it). While, I don’t have any scopes on models that call my functions — I still had some of the private ActiveRecord method calls in mine — particularly <code class="highlighter-rouge">add_joins!</code>.

Well, [this change][10] changed the params for the method to make sure that the scoped joins were merged, and not overwritten — which changes calls into it. If you are calling it with your own <code class="highlighter-rouge">options</code> use <code class="highlighter-rouge">options[:joins]</code>. My code doesn’t use the scopes in combination with my <code class="highlighter-rouge">tagged_with</code> method, so I just pulled them.

### And…. thankfully that’s it {#and-thankfully-thats-it}

Other than cleaning up deprecations like <code class="highlighter-rouge">number_with_precision</code> now preferring <code class="highlighter-rouge">(number, :precision =&gt; myprecision)</code> instead of <code class="highlighter-rouge">(number, myprecision)</code> — and <code class="highlighter-rouge">ActiveRecord::Base.verification_timeout</code> no longer valid, and <code class="highlighter-rouge">mb_chars</code> being preferred over <code class="highlighter-rouge">chars</code> — we seem to be good to go for Rails 2.2. I still need to test some crons, but I imagine that our app will go production as 2.2 shortly.

TOOOOOO-TOOOOOO-TOOOOOO!

 [1]: http://weblog.rubyonrails.org/2008/11/21/rails-2-2-i18n-http-validators-thread-safety-jruby-1-9-compatibility-docs
 [2]: http://guides.rubyonrails.org/2_2_release_notes.html
 [3]: http://afreshcup.com/2008/10/24/rails-22-change-private-methods-on-association-proxies-are-private/
 [4]: http://github.com/drnic/rails-footnotes/tree/master
 [5]: http://github.com/drnic/rails-footnotes/commit/6ff63f1526c761ba98c146c5846649761b1f2d36
 [6]: http://github.com/francois/piston/tree/master
 [7]: http://github.com/francois/piston/wikis
 [8]: http://github.com/fauna/has_many_polymorphs/tree/master
 [9]: http://github.com/fauna/has_many_polymorphs/commit/e11df9eaec1bc529e05816476d87c76c54755fb2
 [10]: http://github.com/rails/rails/commit/db22c89543f45d7f27847003af949afa21cb6fa1#diff-1