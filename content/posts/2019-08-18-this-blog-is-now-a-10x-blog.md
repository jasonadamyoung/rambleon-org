---
title: This blog is now a 10x blog
author: jay
type: post
date: 2019-08-19T02:23:26+00:00
url: /2019/08/18/this-blog-is-now-a-10x-blog/
categories:
  - Reflections

---
So, as you might completely expect from a "blog" in 2019 — but in what seems an aberration for one called "RambleOn" — it's been almost a year since I've written anything here.

To make up for it, like the proud lineage of 10x engineers that have come before it (obligatory reference: [this twitter thread][1] — and more importantly its replies, go ahead and gawk, I'll be here when you get back) — this blog is now a 10x blog.

That is to say it's costing me 10x to run it now (actually, really, 13x) and it's been quite the adventure (read: pain in the ass) setting it up, and well maybe I learned something from it, in the same way that you learn things by grabbing an electric fence surrounding a cow pasture. Which I did at least three times as a child. Because you know once wasn't enough.

(This really explains a lot about how I became a sysadmin/devops/developer/full stack yak shaver — also [recursive delete][2] )

This blog was running WordPress on a $5 a month Ubuntu VPS that ran perfectly fine – and it's now running on – you guessed it&#8230;

Help me out Wilford Brimley:<figure class="wp-block-image">

<img src="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png" alt="" class="wp-image-1419" srcset="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png 1024w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-300x180.png 300w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-768x461.png 768w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1200x720.png 1200w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus.png 2000w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" /><figcaption>Wilford Brimley, as America's favorite grandpa, pronouncing "Kubernetes" really should end, once and for all, any debate about whether "kubectl" is pronounced "kube-cuddle" </figcaption></figure>

Yes, that's right "Kubernetes" — $65 monthly for infrastructure components — that aren't even at the recommended configuration for high availability — to run a $5 VPS blog(*)

<p class="has-small-font-size">
  ( * and some other things )
</p>

It really is pretty much as bad as it sounds. Though when you add the part about "and some other things." it simultaneously gets a whole lot worse. And a whole lot better. Maybe somewhat like [bluegrass][3] _[Gangnam Style][3]_

Outside the hyperbole: Kubernetes is one phenomenal collection of software components. I'm serious about how it's worse, but I'm super serious about how it's better. I think I'll let an expert say it best:

<blockquote class="wp-block-quote twitter-tweet">
  <p>
    In essence, Kubernetes is the sum of all the bash scripts and best practices that most system administrators would cobble together over time, presented as a single system behind a declarative set of APIs.
  </p>

  <cite><em>Kelsey Hightower (@kelseyhightower) </em><a href="https://twitter.com/kelseyhightower/status/1125440400355782657?ref_src=twsrc%5Etfw">May 6, 2019</a></cite>
</blockquote>

Why would I do this? Well, because maybe finally after almost a year (yes, I know, a year, there's a story or three coming — one even involves an ER visit) I can almost, but not quite, understand what I'm doing enough to actually run the blog (and other things) using kubernetes, and really, the important part, fix it when it inevitably breaks.

Like knowing that the electric fence hurts, but wondering if you can grab it differently and whether it hurts differently that way.

So basically, _because I can_. And that is pretty phenomenal too, and worth sharing. And if I can help others with that fence, that's really the most important part.

So that's maybe the teaser to leave this at — a random pronouncement after almost year of silence that the blog is back and some vague promise to write more in it.

Which, really, sounds like blogging and Rambleon both.

<p class="has-medium-font-size">
  Welcome to 2019 my 2003 live journal self!
</p>

_Colophon: In case you're wondering — this is all hosted at Digital Ocean. It's a 3GB/1vCPU control host that's running_ [_Rancher_][4] _and an NFS server. It's managing a three node Rancher-installed cluster: a 2GB/1vCPU etcd/control plane node and two 4GB/2vCPU worker nodes. All are Ubuntu 18.04 nodes, mainly because there are some Digital Ocean block storage things I originally wanted to do that wouldn't work on RancherOS. I'll save the rest of the sordid details to the future posts._

 [1]: https://twitter.com/skirani/status/1149302828420067328
 [2]: https://rambleon.org/2008/12/19/what-did-it-for-you/
 [3]: https://www.youtube.com/watch?v=Z9s57UBMWdk
 [4]: https://rancher.com/