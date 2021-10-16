---
title: Don’t Do That
author: jay
type: post
date: 2007-04-05T19:57:47+00:00
url: /2007/04/05/dont-do-that/
categories:
  - Uncategorized
tags:
  - ruby
  - rubyonrails
  - sysadmin

---
So… maybe you are coding up your totally way rad awesome application in Rails — and you are thinking to yourself.

“Self, I really would like to set my own created\_at and updated\_at timestamps. Look — [there’s even a way to do that in the Rails documentation][1]”

>  <code class="highlighter-rouge">class Feed &lt; ActiveRecord::Base self.record_timestamps = false # ... end </code>

At this point you need to back away from the keyboard. Quickly. If you don’t, pretty soon, somewhere in your application — you are going to run into this error:

> <code class="highlighter-rouge">Mysql::Error: Column 'created_at' cannot be null</code>

Or ALL KINDS OF OTHER FUN SIDE EFFECTS (FUN is actually a euphemism here for various four letter words)

See, record_timestamps is a _class variable_ for <code class="highlighter-rouge">ActiveRecord::Base</code> created with the rails :cattr_accessor — maybe the <code class="highlighter-rouge">self.record_timestamps</code> should have tipped us all off — maybe not (there’s also a class\_inheritable\_accessor — I’m not sure where all that gets used though)

Even experienced developers not all that fluent in ruby minutiae (I think class variables count as minutiae) cut-and-paste first and figure out how it works second (yeah, don’t do that either).

So — anyway — once you change record_timestamps once — you change it for all descendants of <code class="highlighter-rouge">ActiveRecord::Base</code>

There’s a bit of discussion this on a separate, but related problem at [Evan Weaver’s blog][2] (pay special attention to that threading issue for those playing along with the home game). And of course, your friendly neighborhood reminder of what happens with class variables at [Nic Williams’ blog][3] (I recommend reading that twice and breaking out the home game version of irb)

So the moral of the story? <code class="highlighter-rouge">self.record_timestamps</code> — Don’t Do That.

p.s. Production of this blog entry was made possible through various grants and assessments, and with some moans, groans, sighs, and “what tha–?” from my colleagues [James Robinson][4] and Aaron Hundley (doesn’t have a blog, he needs to get with the program) 🙂

p.p.s edited to change “you chance it for all descendants…” to “you change it for all descendants” — I think the first one is quite _apropos_ however

 [1]: http://api.rubyonrails.org/classes/ActiveRecord/Timestamp.html
 [2]: http://blog.evanweaver.com/articles/2006/12/26/hacking-activerecords-automatic-timestamps
 [3]: http://drnicwilliams.com/2006/08/27/so-cattr_accessor-doesnt-work-like-it-should/
 [4]: http://blog.robinsonhouse.com/