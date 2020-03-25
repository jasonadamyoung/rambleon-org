---
title: misc tidbits
author: jay
type: post
date: 2006-05-08T04:01:09+00:00
url: /2006/05/08/misc-tidbits/
categories:
  - Reflections

---
So, when you are at a conference &#8211; and the hotel blocks port 25 &#8211; the best thing in the world, is that old standby &#8211; ssh port forwarding.

alias mailshell=’ssh -L 5525:mymailserver.edu:25 username@myserver-with-smtp-access-to-mymailserver.edu’

And then configure my mail client to send to 127.0.0.1:5525

Or use Gmail &#8211; whatever floats your boat

* * *

Of course, you then might run into the fact that the hotel’s NAT seems to timeout your SSH sessions something awful. That’s when adding:

Host * ServerAliveInterval 120

to your .ssh/config file comes in really handy

* * *

bonus tidbit. Sometimes you have to create a set of symlinks for a whole directory. Yay for for loops!

<code class="highlighter-rouge">prompt% for file in </code>ls -A /webserverconfigurationfiles <code class="highlighter-rouge">&gt; do &gt; fullfile=/webserverconfigurationfiles/$file &gt; ln -s $fullfile $file &gt; done</code>

* * *

p.s. Hilton-UF in-room ethernet rocks.