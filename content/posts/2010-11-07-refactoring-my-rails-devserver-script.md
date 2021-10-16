---
title: Refactoring my Rails devserver script
author: jay
type: post
date: 2010-11-07T21:21:50+00:00
url: /2010/11/07/refactoring-my-rails-devserver-script/
categories:
  - development
tags:
  - passenger
  - rails
  - ruby
  - trollop

---
So with the [last post][1] — after I found out (while writing the post) that with the changes to Passenger 3 standalone — it ([understandably][2]) doesn’t support a debugger option — I needed a backup, like say, [thin][3].

So, I [refactored rewrote my script][4]

This one will now run your choice of server (where your choice is passenger, thin, or mongrel, but it could be extended to anything. Since passenger doesn’t support –debug/–debugger — it will use one of the others.

I pulled the “–daemonize” option — because that doesn’t make a whole lot of sense for a devserver environment — and I haven’t used it yet since I’ve switched away from my Cocoa-based launcher. If you want another terminal for tailing the development log (passenger will pipe the development log to stdout for you), or running memcached, just open one.

One thing I’ve wanted to do for a while is get away from using “getoptlong” and over to something else for command-line option parsing. There’s where [trollop][5] comes in. I like trollop (and love the built-in –help, which I never write with getoptlong) — the only thing I don’t like very much is that because its “opt” method takes a block as the third parameter — so I can’t do something like opt(:setting,’description’,:default => @config[:setting]) — because that @config gets passed as part of a block and gets evaluated inside trollop’s library when it’s creating dynamic methods for the options. This would be fine if I had a set of hardcoded defaults that I wanted to override, but I want to read those from a config file as well as get overrides from the command line. That’s the reason for all the local variable assignments for the defaults. I’m sure there’s a better way of handling that, I’m just not sure what.

**Update: 2011/01/07** The script has [become its own gem][6]

 [1]: /2010/11/07/creating-a-rails-development-environment-on-mac-os-x/
 [2]: http://stackoverflow.com/questions/4085123/passenger-3-0-and-debugger
 [3]: http://code.macournoyer.com/thin/
 [4]: https://github.com/jasonadamyoung/dmbdraft/blob/bd71d4486a27ef931e36acdde098c08ffc49f04f/script/devserver
 [5]: http://trollop.rubyforge.org/
 [6]: https://github.com/jasonadamyoung/devserver