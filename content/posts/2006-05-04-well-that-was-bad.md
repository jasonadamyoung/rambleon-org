---
title: Well that was bad
author: jay
type: post
date: 2006-05-04T14:18:42+00:00
url: /2006/05/04/well-that-was-bad/
categories:
  - Reflections

---
My Macintosh at home did a rare thing this morning and locked up. Spinning beach ball on each application, no hope but to hit the power button.

Yeah, that made things really unhappy. Macintosh reboots, goes trough the verbose startup messages(*) and never shows a login prompt or logs in (my Macintosh at home **was** set to autologin).

(* I am a unix geek &#8211; so I like watching the verbose startup messages: <code class="highlighter-rouge">sudo nvram boot-args='-v'</code> )

Uh-oh. Do the power button salute again, maybe it’s just a transient thing. Again, no login &#8211; and I can’t get in via ssh.

So I boot into single user mode (Command+S as it boots) &#8211; run fsck per the instructions. fsck fixes something, and I run it again, everything’s kosher.

Reboot. No login.

Power off, boot into single user &#8211; mount the drive. Take a look at /var/log/system.log and /var/log/asl.log

Well, there’s the culprit:

<code class="highlighter-rouge">DirectoryService[50]: Failed Authentication return is being delayed due to over five recent auth failures for username: jayoung.</code>

<code class="highlighter-rouge">[Sender SecurityAgent] [PID 78] [Message Autologin user authenticated.] [Sender com.apple.SecurityServer] [PID -1] [Message authinternal failed to authenticate user jayoung.]</code>

Somehow, the thing is completely foobar’d trying to autologin. (You’d think it’d fall back to a login screen &#8211; maybe it does eventually &#8211; I gave the thing several minutes on one of the reboots, but alas, no prompt).

I finally figured out how to delete the autologin preference from the command line in single-user mode

<code class="highlighter-rouge">defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser rm (or better, srm) /etc/kcpassword</code>

voila! finally a login prompt.

I’m still figuring out how to justify to myself that I can use this as an excuse to go buy a new Macintosh. It’s a very, very, very good thing that I have two conference presentations to finish and no time to go to the Apple Store and buy and install a new Macintosh before I leave for the conference.