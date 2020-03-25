---
title: Creating a Rails Development Environment on Mac OS X
author: jay
type: post
date: 2010-11-07T15:59:45+00:00
url: /2010/11/07/creating-a-rails-development-environment-on-mac-os-x/
categories:
  - development
tags:
  - homebrew
  - macintosh
  - passenger
  - ruby
  - rubyonrails
  - rvm

---
I’ve been writing Ruby on Rails apps for several years now, and both at my day job, and my contract work, I’ve been utilizing a modified version of the [Locomotive Project][1] from [Ryan Raaum][2]. I rebranded it as “MiCodaLoco” for our use, and modified it to be a little more modular for it’s startup environment, moving the MacPorts distribution it used to a central folder and out of the “bundles” it used for each Ruby and RubyGems environments.

It worked out quite nicely for several years. But it was a complete pain to rebuild ruby and rails versions, because I never took the extra steps to automate the bundle building process. I always had grand plans to create a “debug” button as well to launch mongrel (or thin, about the only change I’ve made in the last year has been to start thin instead of mongrel for one of our apps that ran into a problem with Rails 2.3.8 and/or Rack changes and cookies and mongrel) in debugging mode for ruby-debug.

I had poked my way around the Objective-C app, and I understood where to make modifications I needed, but I didn’t really understand how the app was put together (and parts of it were pre-Interface Builder and had code created interface that I still don’t totally grok, even after a week long iPhone training that had enough Obj-C in it to make me dangerous).

Best-laid plans being what they are, I never did update it, and it was time to move on. With a Rails 3 and possibly a Ruby 1.9 update in the next six months to year for all these apps &#8211; I wanted to spend more time on that than learning Cocoa. So I needed something new.

Enter [Homebrew][3], [RVM][4], and [Passenger][5] standalone.

## Homebrew {#homebrew}

So, I’ve been a Fink, then DarwinPorts MacPorts user forever, and would recommend it to anyone to get open source packages (like wget, or wireshark) that don’t come already with OS X. But sometimes suggesting it to your colleagues just to install something to facilitate something else doesn’t always go over well.

Enter [Homebrew][3]. Because Homebrew uses a lot of of what’s already there in OS X instead of installing it’s own versions, it’s faster to get the packages you need (with the risk that something is broken with an OS update, but I haven’t seen something like that in a while with 10.5/10.6 on Intel). And in our case, we only need the mysql client libraries for the mysql gem, and the imagemagick libraries for the rmagick. And wget. Because everyone needs wget.

It’s easy to get started, just follow the [instructions][6] (The system admin in me recommends you look at [the executed ruby script first][7] &#8211; but I know you won’t).

Oh, you need Xcode. You do have Xcode installed right? Even the designers need it for the iPhone emulator. Trust me.

In our case we needed to

<div class="highlighter-rouge">
  <pre class="highlight"><code>brew install mysql</code></pre>
</div>

  * which installs mysql server, but we use MAMP for that, so it’s just for the libraries (in theory, you probably can just link the mysql gem against the MAMP libraries if you use MAMP. But I don’t want some MAMP upgrade where I put it in a different path wreak havoc on that). We also needed to
    
    brew install imagemagick

. And if you are testing your caching code and use memcache,

<div class="highlighter-rouge">
  <pre class="highlight"><code>brew install memcached</code></pre>
</div>

You might need something else installed, but we haven’t as of yet.

## RVM {#rvm}

[RVM][4] is everything I ever wanted doing multiple Locomotive/MiCodaLoco bundles to be, and then some, with the added bonus that somebody else does it.

RVM lets you run multiple rubies and multiple gemsets per ruby installation, making it really convenient to not only switch between them for testing and dev purposes, but also just to have an effective development environment.

RVM’s documentation is very comprehensive, though it can be a little tricky to get started. Here’s what we needed (after [installing RVM][8]):

<div class="highlighter-rouge">
  <pre class="highlight"><code>rvm install ree                           # I use ruby enterprise edition - version 1.8.7 on our, ree is a shortcut string for this version - see "rvm strings" for morervm gemset create busterleague # creates a gemset for a person project of minervm --default ree@busterleague  # sets my default ruby to ree and the default gemset to busterleaguervm use ree@busterleague        # sets up the session to use ree and the busterleague gemsetgem install rails --version=2.3.10  # still at rails 2gem install passenger               # passenger v3gem install ...                           # rest of gems</code></pre>
</div>

As a convenience &#8211; because you like will end up shifting between rubies &#8211; or at least gemsets &#8211; create some bash aliases to make that easier (Locomotive/MiCodaLoco had a “open terminal” command for each project that automatically put one into the right bundle environment and the working directory for the project, these aliases replace that as well).

Here’s mine for my work, contract, and personal projects (I put my working directories in a “dev” subdirectory to my home directory)

<div class="highlighter-rouge">
  <pre class="highlight"><code>alias rubydevprompt='PS1="rubydev:W ($(~/.rvm/bin/rvm-prompt i v g))$ "'alias smallwonder='rubydevprompt && rvm use ree@trixietracker && cd ~/dev/tt/smallwonder'alias darmok='rubydevprompt && rvm use ree@extension_production && cd ~/dev/extension/darmok'alias dega='rubydevprompt && rvm use ree@extension_production&& cd ~/dev/extension/dega'alias busterleague='rubydevprompt && rvm use ree@busterleague && cd ~/dev/personal/dmbdraft'</code></pre>
</div>

I can then switch between them at ease, add more to do things like start passenger (more on that below), or to use development gemsets, like rails 3 (and even add git commands to make sure I’m in the right branch (ala rails 3)

rvm-prompt has a [nice documentation page][9]

## Passenger {#passenger}

Finally, I use [Passenger][5] in standalone mode running on an arbitrary port to deliver the dev versions of our apps (actually I use passenger everywhere, currently running under Apache, it’s made my system admin life much easier than other rails environments).  After installing passenger, just run the “passenger start” command, and it will self-install and configure a version of nginx that it uses to do this.

As a convenience, I’ve created a ruby script that starts passenger with a set of default parameters &#8211; which can be overridden by a yaml configuration file &#8211; or from the command line. I called this “script/devserver” to distinguish it from the rails webrick “script/server” command.

You can see a [version of that devserver script at github][10]

What I probably need to do is go back and have a debugging option that would start webrick, mongrel, or thin in order to use it with ruby-debug (since [Passenger 3 isn’t really setup to support ruby-debug][11])

**[Update]** You probably want [this link to the devserver script][12] &#8211; [here’s why][13].

 [1]: http://sourceforge.net/projects/locomotive/
 [2]: http://www.raaum.org/
 [3]: https://github.com/mxcl/homebrew
 [4]: http://rvm.beginrescueend.com/
 [5]: http://www.modrails.com/
 [6]: https://github.com/mxcl/homebrew/blob/master/README.md
 [7]: https://gist.github.com/raw/323731/install_homebrew.rb
 [8]: http://rvm.beginrescueend.com/rvm/install/
 [9]: http://rvm.beginrescueend.com/workflow/prompt/
 [10]: https://github.com/jasonadamyoung/dmbdraft/blob/4f3616f98d66b2e0541f373f07d30212e545fe49/script/devserver
 [11]: http://stackoverflow.com/questions/4085123/passenger-3-0-and-debugger
 [12]: https://github.com/jasonadamyoung/dmbdraft/blob/bd71d4486a27ef931e36acdde098c08ffc49f04f/script/devserver
 [13]: /2010/11/07/refactoring-my-rails-devserver-script/