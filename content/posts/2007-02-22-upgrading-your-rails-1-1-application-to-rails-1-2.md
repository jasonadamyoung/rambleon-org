---
title: Upgrading your Rails 1.1 application to Rails 1.2
author: jay
type: post
date: 2007-02-22T15:37:46+00:00
url: /2007/02/22/upgrading-your-rails-1-1-application-to-rails-1-2/
categories:
  - Uncategorized
tags:
  - ruby

---
So, I’m in the process of getting our servers upgraded to Rails 1.2.

( We don’t freeze rails, because [contrary to the cult of Rails][1], freezing is not the way to go in small, controlled shops with multiple applications. If say, you have to [upgrade your Rails, NOW NOW NOW][2] &#8211; it’s much better to upgrade the system, and not every copy of your application everywhere, but I digress)

That process, of course, involves making sure our applications work with Rails 1.2 and [eating my own dog food][3] &#8211; this is what a cursory run through of the application that I’m responsible for had me running into:

### Deprecations {#deprecations}

The biggest issue &#8211; which really isn’t an issue, which was cool &#8211; seems to be the [deprecations coming in Rails 2.0][4]. But for anyone playing along with the home game &#8211; **deprecations are errors**. (maybe I should start a “Cult of the Clean Log”).

The deprecations I had:

  * multiple references to @request, @params, @session…
  * references to @flash, including a really odd error that resulted from the fact that I had a partial named “_flash.rhtml”. Thankfully [I wasn’t the only person that ran into that][5]
  * a lot of start\_form\_tag and end\_form\_tag references. And while I to this day get a little squicked out by phrases like “syntactic sugar/vinegar” &#8211; I do very, very much like the [block form][6] for <code class="highlighter-rouge">&lt;% form_tag(:action =&gt; :blah) do %&gt; ... &lt;% end %&gt;</code>

### Aggressive Unloading {#aggressive-unloading}

In the famous words of [Keith Jackson][7]:

_“Whoa, Nellie!”_

So we are probably doing something incredibly stupid and against every known convention of Ruby and Rails &#8211; but, hey, it works. We have an [class for application configuration][8] that we use a class variable to store persistent configuration information (with a default set of values, merged with values loaded from a configuration file where appropriate). Prior to now, we’ve happily loaded this up on application startup in environment.rb to load the configuration &#8211; and even in development mode, the class stayed loaded throughout the lifetime of the mongrel process.

Well, apparently in development mode in Rails 1.2 &#8211; the automagic dependency management has significantly changed (ob. ref. [Jonathan Weiss][9] and [the RoR weblog][10]. That’s cool, it’s probably what it should be, and what I’m doing in this application probably isn’t “the right thing.” But the AppConfig class would unload, and be reloaded and because the load_config method was only called in environment.rb, it was Oops’ing all over the place. My hack was to load the config within the body of the class, so it would do it when the class was loaded (loaded might not be the right word here). If I continue with this AppConfig thing &#8211; what it probably should be doing on accessing the configtable is to have checks that when it’s nil &#8211; reload the config. I’ll solve that one later, thankfully for now, it works again.

If any Rails person that actually reads this has any kind of visceral &#8211; “why the heck do you guys do that?!?” &#8211; reaction &#8211; and know a better way of doing this (the whole persistent configuration-defined-at-run-time-not-in-code-or-the-db problem) please do share.

A HUGE “thanks!” to the Rails team for including <code class="highlighter-rouge">Dependencies.log_activity = true</code> as part of dependencies.rb. That helped **a lot** &#8211; and helped provide a glimpse into the automagic dependency management of Rails too.

 [1]: http://weblog.rubyonrails.org/2006/3/31/freeze-is-cool-so-freeze-for-goodness-sake
 [2]: http://weblog.rubyonrails.org/2006/8/9/rails-1-1-5-mandatory-security-patch-and-other-tidbits
 [3]: https://rambleon.org/2007/02/21/quote-of-the-day-6/
 [4]: http://www.railtie.net/articles/2006/11/02/deprecations-in-rails-1-2
 [5]: http://dev.rubyonrails.org/ticket/7553
 [6]: http://www.loudthinking.com/arc/2006_10.html
 [7]: http://en.wikipedia.org/wiki/Keith_Jackson
 [8]: https://sourcecode.extension.org/wsvn/identity/trunk/app/models/app_config.rb
 [9]: http://blog.innerewut.de/articles/2006/12/04/rails-1-2-and-reloading-classes
 [10]: http://weblog.rubyonrails.org/2006/8/11/reloading-revamped