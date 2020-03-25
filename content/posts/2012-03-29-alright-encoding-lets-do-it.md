---
title: Alright Encoding, Let’s Do It
author: jay
type: post
date: 2012-03-29T01:30:00+00:00
url: /2012/03/29/alright-encoding-lets-do-it/
categories:
  - Reflections

---
My former colleagues ran into an issue recently with a Rails 3.1 application when they upgraded to the latest versions of several gems where text stored in a serialized field suddenly started showing the bytecodes for accented quotes e.g. I don’t suddenly turned into I donâu0080u0099t

Let’s pause for station identification (here, [watch this duel][1] for some cinematic flavor) and write up a few terms for google to find to save others this headache: Problem. Encoding. YAML. Serialized. Rails. Delayed Job. Upgrade. Syck. Pysch. Characters look funny. Display Issues. Latin1 is the root of all evil. UNHOLY TEXT CRAPTASM.

They resolved it with some phpmyadmin text field editing. But I thought I had beat down this encoding mess once and for all with a great big utf-8 mysql push years ago, and heading into the promised land that was Ruby 1.9 with regard to string handling. So I wanted to know the root cause.

What went wrong?

I had [this yaml file of stock questions][2] that I used to [seed the database][3]. Unfortunately I paid no attention to what was actually being stored in the database.

Let’s observe &#8211; I can’t paste the “right single quotation mark” (which the Mac OSX character viewer gleefully reports as Unicode: U+2019, UTF-8: E2 80 99) into IRB, but I can cheat:

<div class="highlighter-rouge">
  <pre class="highlight"><code>% echo "I’m your huckleberry." &gt; test.yml% rails consoleLoading development environment (Rails 3.1.3)&gt;&gt; string = YAML.load(File.open('test.yml'))=&gt; "I’m your huckleberry."</code></pre>
</div>

And when we convert that to yaml as Rails does when serializing it (by default):

<div class="highlighter-rouge">
  <pre class="highlight"><code>&gt;&gt; string.to_yaml=&gt; "--- "I\xE2\x80\x99m your huckleberry."n"</code></pre>
</div>

Doh! But then de-yamling it seems okay:

<div class="highlighter-rouge">
  <pre class="highlight"><code>&gt;&gt; newstring = YAML.load(string.to_yaml)=&gt; "I’m your huckleberry."</code></pre>
</div>

Which is why I never noticed. I mean, how often do you look at a man’s shoes? er. I mean, in the database. Sorry, mixing the movie metaphors.

But that was until after the gem upgrade &#8211; which we’ll simulate here with a hint of foreshadowing:

<div class="highlighter-rouge">
  <pre class="highlight"><code>&gt;&gt; yamlstring = string.to_yaml=&gt; "--- "I\xE2\x80\x99m your huckleberry."n"&gt;&gt; YAML::ENGINE.yamler = 'psych'=&gt; "psych"&gt;&gt; newstring = YAML.load(yamlstring)=&gt; "Iâu0080u0099m your huckleberry."</code></pre>
</div>

Doh! And all I wanted was an normal encoding-free life.

So after observing the problem in its native form, I turn to google &#8211; which turns up [this stackoverflow post][4] &#8211; and yep:

<div class="highlighter-rouge">
  <pre class="highlight"><code>% rails consoleLoading development environment (Rails 3.1.3)&gt;&gt; YAML::ENGINE.yamler =&gt; "syck"</code></pre>
</div>

We have the culprit! But not where it’s coming from.

At first, I blame rails, because that’s usually the easiest thing to do right? Surely they changed something between 3.1 and 3.2? But searching the source code, and grepping the log indicates that rails got some pysch tenderlove a long time ago.

<div class="highlighter-rouge">
  <pre class="highlight"><code>% git log | grep 'psych'c29eef7 [1 year, 2 months ago] (Aaron Patterson) load psych by default if possible59f3218 [1 year, 2 months ago] (Aaron Patterson) load and prefer psych as the YAML parser when it is available</code></pre>
</div>

So them I do a grep on the gems:

<div class="highlighter-rouge">
  <pre class="highlight"><code>% grep -ir 'syck' .[...]./delayed_job-2.1.4/lib/delayed/yaml_ext.rb:YAML::ENGINE.yamler = "syck" if defined?(YAML::ENGINE)</code></pre>
</div>

And there we have it and [here’s why][5] (Note Aaron Patterson’s prophetic warning) &#8211; Delayed Job 3 doesn’t force ‘syck’ anymore, so it fell back to ‘psych’.

<div class="highlighter-rouge">
  <pre class="highlight"><code>% rails console                                              Loading development environment (Rails 3.2.2)&gt;&gt; YAML::ENGINE.yamler =&gt; "psych"&gt;&gt; string = YAML.load(File.open('test.yml'))=&gt; "I’m your huckleberry."&gt;&gt; string.to_yaml=&gt; "--- I’m your huckleberry.n...n"</code></pre>
</div>

There’s still the issue of cleaning up the old data, and while it’s a little late for my colleagues, an easy fix (though you may want to turn off timestamping) for our serialized fields (at least for the stock questions) could have been:

<div class="highlighter-rouge">
  <pre class="highlight"><code>&gt;&gt; YAML::ENGINE.yamler = 'syck'&gt;&gt; all_responses = {}&gt;&gt; StockQuestion.all.map{|sq| all_responses[sq.id] = sq.responses}&gt;&gt; YAML::ENGINE.yamler = 'psych'&gt;&gt; StockQuestion.all.each do |sq|&gt;&gt; sq.responses = all_responses[sq.id]&gt;&gt; sq.save!&gt;&gt; end</code></pre>
</div>

I’m sure I’ll meet up with encoding again. Then we’ll have us another reckoning.

p.s. [syck must have the most unique dual license ever][6]

 [1]: http://www.youtube.com/watch?v=JGpajGj07BU&feature=youtu.be&t=1m3s
 [2]: https://github.com/extension/learn/blob/667b5cc96c263ce54f669087e5d4e69632a1e8d6/db/sensemaking_questions.yml
 [3]: https://github.com/extension/learn/blob/667b5cc96c263ce54f669087e5d4e69632a1e8d6/db/seeds.rb#L293
 [4]: http://stackoverflow.com/questions/8558101/rails-encoding-woes-with-serialized-hashes-despite-utf8
 [5]: https://github.com/collectiveidea/delayed_job/commit/cbb4060c8dad886f59d77deab444c94ad61e09a9#lib/delayed/yaml_ext.rb
 [6]: https://github.com/indeyets/syck/blob/master/COPYING