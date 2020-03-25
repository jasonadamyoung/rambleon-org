---
title: This blog is now a 10x blog
author: jay
type: post
date: 2019-08-19T02:23:26+00:00
url: /2019/08/18/this-blog-is-now-a-10x-blog/
categories:
  - Reflections

---
So, as you might completely expect from a &#8220;blog&#8221; in 2019 &#8211; but in what seems an aberration for one called &#8220;RambleOn&#8221; &#8211; it&#8217;s been almost a year since I&#8217;ve written anything here.

To make up for it, like the proud lineage of 10x engineers that have come before it (obligatory reference: [this twitter thread][1] &#8211; and more importantly its replies, go ahead and gawk, I&#8217;ll be here when you get back) &#8211; this blog is now a 10x blog.

That is to say it&#8217;s costing me 10x to run it now (actually, really, 13x) and it&#8217;s been quite the adventure (read: pain in the ass) setting it up, and well maybe I learned something from it, in the same way that you learn things by grabbing an electric fence surrounding a cow pasture. Which I did at least three times as a child. Because you know once wasn&#8217;t enough.

(This really explains a lot about how I became a sysadmin/devops/developer/full stack yak shaver &#8211; also [recursive delete][2] )

This blog was running WordPress on a $5 a month Ubuntu VPS that ran perfectly fine – and it&#8217;s now running on – you guessed it&#8230;

Help me out Wilford Brimley:<figure class="wp-block-image">

<img src="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png" alt="" class="wp-image-1419" srcset="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png 1024w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-300x180.png 300w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-768x461.png 768w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1200x720.png 1200w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus.png 2000w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" /><figcaption>Wilford Brimley, as America&#8217;s favorite grandpa, pronouncing &#8220;Kubernetes&#8221; really should end, once and for all, any debate about whether &#8220;kubectl&#8221; is pronounced &#8220;kube-cuddle&#8221; </figcaption></figure> <figure class="wp-block-image"><img src="https://i0.wp.com/rambleon.org/wp-content/uploads/2019/08/kubernetes-horizontal-color.png?fit=840%2C181&ssl=1" alt="" class="wp-image-1420" srcset="https://cdn.rambleon.org/migrate/2019/08/kubernetes-horizontal-color.png 1727w, https://cdn.rambleon.org/migrate/2019/08/kubernetes-horizontal-color-300x65.png 300w, https://cdn.rambleon.org/migrate/2019/08/kubernetes-horizontal-color-768x166.png 768w, https://cdn.rambleon.org/migrate/2019/08/kubernetes-horizontal-color-1024x221.png 1024w, https://cdn.rambleon.org/migrate/2019/08/kubernetes-horizontal-color-1200x259.png 1200w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" /></figure>

Yes, that&#8217;s right &#8220;Kubernetes&#8221; &#8211; $65 monthly for infrastructure components &#8211; that aren&#8217;t even at the recommended configuration for high availability &#8211; to run a $5 VPS blog(*)

<p class="has-small-font-size">
  ( * and some other things )
</p>

It really is pretty much as bad as it sounds. Though when you add the part about &#8220;and some other things.&#8221; it simultaneously gets a whole lot worse. And a whole lot better. Maybe somewhat like [bluegrass][3] _[Gangnam Style][3]_

Outside the hyperbole: Kubernetes is one phenomenal collection of software components. I&#8217;m serious about how it&#8217;s worse, but I&#8217;m super serious about how it&#8217;s better. I think I&#8217;ll let an expert say it best:

<blockquote class="wp-block-quote twitter-tweet">
  <p>
    In essence, Kubernetes is the sum of all the bash scripts and best practices that most system administrators would cobble together over time, presented as a single system behind a declarative set of APIs.
  </p>

  <cite><em>Kelsey Hightower (@kelseyhightower) </em><a href="https://twitter.com/kelseyhightower/status/1125440400355782657?ref_src=twsrc%5Etfw">May 6, 2019</a></cite>
</blockquote>

Why would I do this? Well, because maybe finally after almost a year (yes, I know, a year, there&#8217;s a story or three coming &#8211; one even involves an ER visit) I can almost, but not quite, understand what I&#8217;m doing enough to actually run the blog (and other things) using kubernetes, and really, the important part, fix it when it inevitably breaks.

Like knowing that the electric fence hurts, but wondering if you can grab it differently and whether it hurts differently that way.

So basically, _because I can_. And that is pretty phenomenal too, and worth sharing. And if I can help others with that fence, that&#8217;s really the most important part.

So that&#8217;s maybe the teaser to leave this at &#8211; a random pronouncement after almost year of silence that the blog is back and some vague promise to write more in it.

Which, really, sounds like blogging and Rambleon both.

<p class="has-medium-font-size">
  Welcome to 2019 my 2003 live journal self!
</p>

_Colophon: In case you&#8217;re wondering &#8211; this is all hosted at Digital Ocean. It&#8217;s a 3GB/1vCPU control host that&#8217;s running_ [_Rancher_][4] _and an NFS server. It&#8217;s managing a three node Rancher-installed cluster: a 2GB/1vCPU etcd/control plane node and two 4GB/2vCPU worker nodes. All are Ubuntu 18.04 nodes, mainly because there are some Digital Ocean block storage things I originally wanted to do that wouldn&#8217;t work on RancherOS. I&#8217;ll save the rest of the sordid details to the future posts._

 [1]: https://twitter.com/skirani/status/1149302828420067328
 [2]: https://rambleon.org/2008/12/19/what-did-it-for-you/
 [3]: https://www.youtube.com/watch?v=Z9s57UBMWdk
 [4]: https://rancher.com/