---
title: Goodbye conventional wisdom
author: jay
type: post
date: 2006-11-16T04:42:22+00:00
url: /2006/11/16/goodbye-conventional-wisdom/
categories:
  - development
  - Reflections
  - Uncategorized

---
For years, it’s been the conventional wisdom in userid/password based authentication systems that the system provide the same error message for an invalid userid and/or invalid password. The idea being that you don’t want to let on to the “bad guys” that they guessed a valid userid and then proceed to repeatedly try passwords with the valid userid.

Well poppycock.

I watch the logs. And it turns out that while I’d really, really love for people to learn how to remember not one, but a combination of two, not-random strings, they often don’t. Or do, just the wrong combination for that particular tool.

userid/password authentication schemes are already bad from a security perspective &#8211; it’s not like obfuscating the result of mistyping a not-random string improves upon that much at all, and by golly, it should would save the users some time “did I mistype my password? did I forgot my password? WHAT DO YOU MEAN INVALID ID?”

So from now on, goodbye conventional wisdom, I’m actually going to start telling people in every uid/pass dialog I write which string they got wrong.