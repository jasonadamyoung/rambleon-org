---
title: Capistrano Campout
author: jay
type: post
date: 2012-04-10T18:18:00+00:00
url: /2012/04/10/capistrano-campout/
categories:
  - Reflections

---
I’ve become a huge fan of [Campfire][1] as a group communication tool over the last six months, in both teams that I was part of during that time, and I’ve seen how incredibly useful it can be as a hub to track automated pieces of information as well, like GitHub’s commit integration with campfire.

So if I have GitHub commits &#8211; what about capistrano deployments? I’ve had capistrano integrated with email in my own coding projects, but email is a bit limited &#8211; having a real-time posting to capistrano would be even better.

So, inspired by the already existing and excellent projects: [capistrano-mountaintop][2] and [capfire][3]. I’ve married and extended the ideas in both with [capistrano-campout][4].

Campout will post/speak a configurable message to a campfire room as the capistrano deploy task starts &#8211; and utilizing the EngineYard [eycap][5] logger routine, will capture the capistrano logger output to a file, and parse it for success/failure &#8211; and will post a configurable message on post-deployment success or a different message on post-deployment failure, as well as following the capistrano-mountaintop model of pasting the log to the room as well.

You can also specify sounds to <del>amaze</del> annoy your co-workers.

Campout includes a generator to generate the configuration files for your project as well, and includes support for loading from a campout.yml and/or a campout.local.yml ( ala [rails_config][6] ) &#8211; so that you can have shared and/or personal settings, as well as a built-in mechanism for keeping the campfire token out of open repositories.

I’m not sure that campout fits anyone’s needs other than my own, but if you use capistrano and campfire &#8211; you may want to give it, or one of the other projects a try &#8211; having deployment notifications in campfire can be incredibly useful, especially paired with other events.

 [1]: http://campfirenow.com/
 [2]: https://github.com/technicalpickles/capistrano-mountaintop
 [3]: https://github.com/pjaspers/capfire
 [4]: https://github.com/jasonadamyoung/capistrano-campout
 [5]: https://github.com/engineyard/eycap
 [6]: https://github.com/railsjedi/rails_config