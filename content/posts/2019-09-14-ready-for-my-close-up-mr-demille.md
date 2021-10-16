---
title: Ready for my close up, Mr. DeMille
author: jay
type: post
date: 2019-09-14T17:17:32+00:00
url: /2019/09/14/ready-for-my-close-up-mr-demille/
categories:
  - Reflections

---
So, apparently when I called this blog a 10x blog, I really wasn't joking.

Just like a 10x engineer, the blog disappears for a month, over-engineers the hell out of something without telling anyone, comes back and can't explain what it did, and expects an award or something.

I'm going going to blame&#8230; yeah that's right&#8230; you know it:<figure class="wp-block-image">

<img src="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png" alt="" class="wp-image-1419" srcset="https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1024x614.png 1024w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-300x180.png 300w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-768x461.png 768w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus-1200x720.png 1200w, https://cdn.rambleon.org/migrate/2019/08/kuberneetus.png 2000w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" /><figcaption>Ku Ber Neet Us</figcaption></figure>

So, a month later; $500 of hardware for the home lab and $95 a month in hosting charges; and at least three complete reinstalls of two separate Rancher-based clusters — this blog (and other things) are back running in an over-engineered infrastructure, maybe again _<s>because I can</s>_ because it's there.

Really the fundamental reason I did all this was that I realized in order to understand the kubernetes ecosystem more, and really to support it better in my current day job (a part of which is helping to run Red Hat's OpenShift product for UNC Chapel Hill) — I needed to port an application that I developed from the ground up — and understand the end-to-end experience as both developer, cluster support, and sysadmin.

WordPress is one thing, custom code is another. So the cluster is really for those "other things".

It's interesting how a whole bunch of us in this business are on this same path of simultaneous discovery (and following along from others that have made this mistake/taken this path previously) As I have been doing this this past month, Christine Dodrill [wrote up a far better technical and process description of her experience][1].

I'm not really sure I agree with her twitter respondents that Kubernetes is a cult. It _is_ complex. And I think lot of that complexity is really unnecessary.

But despite the complexity, and despite even the overkill nature of an entire control plane and monitoring stack to manage a wordpress blog and a rails application, trading the overhead of the additional resources to run those has given me a chance to experiment (I'm also running jupyterhub as well). And do so in a way that I can build up and tear down things a lot faster than I could cobbling all this together with shell scripts (or ansible, e.g. shell scripts on steroids) on my own.

So now that the other things are running, that's next. How I got started, and how I went about accomplishing building a local development and <s>CI</s>/CD auto-deployment workflow for [my rails application][2] — and maybe it won't take me a month to write it.<figure class="wp-block-image">

<img src="https://cdn.rambleon.org/migrate/2019/09/TheCoffeePant-CowGroverMrJohnson-2012.png" alt="" class="wp-image-1453" srcset="https://cdn.rambleon.org/migrate/2019/09/TheCoffeePant-CowGroverMrJohnson-2012.png 640w, https://cdn.rambleon.org/migrate/2019/09/TheCoffeePant-CowGroverMrJohnson-2012-300x169.png 300w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 984px) 61vw, (max-width: 1362px) 45vw, 600px" /><figcaption>My Rancher Cluster, ready for its closeup</figcaption></figure>

 [1]: https://christine.website/blog/the-cult-of-kubernetes-2019-09-07
 [2]: https://gitlab.com/busterleague/busterleague