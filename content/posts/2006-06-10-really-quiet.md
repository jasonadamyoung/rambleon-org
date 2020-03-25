---
title: Really Quiet
author: jay
type: post
date: 2006-06-10T18:26:40+00:00
url: /2006/06/10/really-quiet/
categories:
  - Reflections

---
It’s been exceedingly quiet around here for a few weeks. There’s a lot that’s going on at work ( and outside of work, exactly three months until  [there’s some iTunes music store account merging][1] 😉 ).

The biggest issue at work has been diving into VMWare and trying to figure out something, anything better than Apache CGI for delivering our Rails-based [eXtension Applications][2]. Lighttpd is one of the current darlings of the Rails community &#8211; because its FastCGI support, well, works. But with an already [large list][3] of software we are dealing with, I have been really, really, really loathe to deal with Spawn FCGI issues and processes and proxying Apache with Lighttpd. I wanted simple, simple for me, simple to fit into the model of Apache hosts that we already have with MediaWiki, and simple for the developers deploying their Rails apps.

Enter [Mongrel][4]. We haven’t tested it yet, but from a setup perspective, I couldn’t be happier. (I have tested a svn co’d version of [Heureka][5] &#8211; our custom developed [FAQ tool][6] and it works &#8211; and that actually says something for web applications &#8211; they usually just work or absolutely don’t 😉 )

I’m confident enough in Mongrel that I’m breaking every tenet I hold for not running pre-release software &#8211; and I’ve deployed the latest stuff (to be “release” tomorrow though 🙂 ) along with the latest [Mongrel Cluster][7] release from [Bradley Taylor][8].

Apache happily proxies to Mongrel, Mongrel happily runs in daemon mode (need to start monitoring the processes though!), and I can give the devs the ability to sudo -u mongrel mongrel_rails cluster::stop/start and it will run their applications happily proxied back through Apache. At some point we can even play some other games with Apache and make sure it delivers _something_ static back to the user if the mongrel daemon goes belly up.

For the first time in two weeks I felt a bit of actual peace at where we go with this Rails deployment thing. Of course Friday afternoon, a Dell RAC card decided to fail (I think) in the server-to-be-a-DB-server. My karmic punishment I guess for having the audacity to be at peace for a time. No peace ever for the Systems Manager 😉

 [1]: https://rambleon.org/2006/02/12/so-this-is-sort-of-a-hardware-post/
 [2]: http://about.extension.org/wiki/eXtension_Application_Notes
 [3]: http://about.extension.org/wiki/Software
 [4]: http://mongrel.rubyforge.org/index.html
 [5]: http://about.extension.org/wiki/Heureka
 [6]: http://about.extension.org/wiki/Frequently_Asked_Questions
 [7]: http://mongrel.rubyforge.org/docs/mongrel_cluster.html
 [8]: http://fluxura.com/