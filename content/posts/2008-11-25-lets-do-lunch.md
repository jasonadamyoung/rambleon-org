---
title: Let’s Do Lunch
author: jay
type: post
date: 2008-11-25T03:57:42+00:00
url: /2008/11/25/lets-do-lunch/
tags:
  - analytics
  - data
  - work patterns

---
I was pulling some of the activity data out of one of our applications &#8211; and looking to do some “live activity” and “activity today” views. Our data is stored with UTC timestamps, but we almost exclusively a U.S. shop &#8211; and for that matter, most likely a U.S. Eastern shop &#8211; so I needed to pull the working curve back into the U.S. time zone.

I got a little curious about “working hours” and decided to run a working hour query (relative to EST) &#8211; and rather amused to see the ~20% off morning/afternoon peak during the noon hour:

![][1]

Yep, U.S. Eastern Time, working hour, non [freerange][2] centric. I was smug, “I can’t wait to see mine” I said to myself.

![][3]

Uh. Um. Ok, well &#8211; my job really doesn’t involve editing a lot of content in the tools we track edits in. Maybe my subversion commits are different.

![][4]

Hmph.

Google reader? (reads are in red)

![][5]

Google search?

![][6]

Ok, well, the latter two are a little different. Guess I’m still pretty much “traditional work hour bound” when it comes to production &#8211; although consumption is spread out into the evenings relatively evenly (there are search peaks that correspond to high edit/coding times, which I’d expect).

And clearly, I’m dead to the world midnight to 7am or so.

I love data.

 [1]: http://sysadminrambles.files.wordpress.com/2008/11/edits_by_hour.png (edits_by_hour)
 [2]: http://blog.k1v1n.com/2008/10/defining-freerange-enterprise.html
 [3]: http://sysadminrambles.files.wordpress.com/2008/11/my_edits_by_hour.png (my_edits_by_hour)
 [4]: http://sysadminrambles.files.wordpress.com/2008/11/my_commits_by_hour.png (my_commits_by_hour)
 [5]: http://sysadminrambles.files.wordpress.com/2008/11/googlereader.png (googlereader)
 [6]: http://sysadminrambles.files.wordpress.com/2008/11/google_searches.png (google_searches)