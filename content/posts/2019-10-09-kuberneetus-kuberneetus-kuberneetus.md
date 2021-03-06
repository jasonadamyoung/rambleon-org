---
title: Kuberneetus, Kuberneetus, Kuberneetus
author: jay
type: post
date: 2019-10-10T01:35:41+00:00
url: /2019/10/09/kuberneetus-kuberneetus-kuberneetus/
categories:
  - Reflections

---
Well, clearly, writing about writing doesn't make writing happen. So maybe if I just write a _third_ blog post where I utter the word "kuberneetus" — Wilford Brimley's ghost will appear out of nowhere and write up my blog post for me.<figure class="wp-block-image">

<img src="https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs-1024x571.png" alt="" class="wp-image-1470" srcset="https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs-1024x571.png 1024w, https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs-300x167.png 300w, https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs-768x429.png 768w, https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs-1200x670.png 1200w, https://files.rambleon.org/images/2019/10/kuberneetle%C3%BCs.png 2000w" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" /></figure>

Well, close.

In my last post, I wrote that the fundamental reason that I have a kubernetes cluster running this blog was that: "I needed to port an application that I developed from the ground up — and understand the end-to-end experience as both developer, cluster support, and sysadmin."

So I set out to take [an app I have developed over the last several years][1] and that was rebuilt this past year that helps some friends of mine manage a simulation baseball league (and then for good measure the previous version, which conducts the yearly draft ) and deploy it to the kubernetes cluster.

My secondary goal was when I did a "git push" I wanted the application to automatically update.

And that's what I have, and I'll be exploring in a series of posts over the next few weeks (months, years? undead lifetimes?) — but here's the summary statement:

I've worked out a GitLab CI/CD (emphasis on the **CD** and not the **CI**) automated (using Ansible) deployment of a Ruby on Rails application with persistent storage to a Rancher-based kubernetes cluster. And it's all (besides the passwords) [openly available][1] (and [open source][3] for that matter).

And while it's worth exploring, and there are some useful ideas for how to go about containerizing an application and deploying it, it's definitely not a route that I'd actually recommend. It was useful for me to get it working as a first step, and it was a useful learning exercise. But it's a lot of custom (and for that, it might be a good exercise for legacy monolithic applications and setups that actually need custom).

I had already developed a working docker-based local development process for the application in the last year, replacing a rvm and puma-dev based process that I had in place (well using pow.cx) for years — based on work that I did for my previous job [way back in 2012][4] (and that maybe deserves its own post in this series). And that I think is where things break down. I was able to do this because I had already invested in docker for that purpose — and my deployment automation builds on years of Ansible knowledge.

There are much better alternatives emerging. From [OpenFaaS][5] to [Rio][6] (or any of a whole other set of PaaS frameworks being built on kubernetes) — there's a much better future ahead.

But first, ku ber neetle üs. It's showtime!

 [1]: https://gitlab.com/busterleague/busterleague
 [3]: https://gitlab.com/busterleague/busterleague/blob/production/LICENSE
 [4]: https://rambleon.org/2012/07/23/notes-on-development-installs/
 [5]: https://docs.openfaas.com/
 [6]: https://github.com/rancher/rio