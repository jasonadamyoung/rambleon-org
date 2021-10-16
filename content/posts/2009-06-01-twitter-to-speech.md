---
title: Twitter to speech
author: jay
type: post
date: 2009-06-01T17:38:40+00:00
url: /2009/06/01/twitter-to-speech/
categories:
  - Reflections

---
It all started when my colleague Joe Z. twittered:

> NETC filler session idea: hear me read my tweets, in order, from day one on Twitter. Feel free to steal this.

Which of course, had to be done:

<code class="highlighter-rouge">curl -s twitter.com/statuses/user_timeline/711063.xml | sed -ne '/&lt;text/s/&lt;/*text&gt;//gp' | say -o twitter.aiff</code>

And a quick run through Audacity (because I don’t have a command line lame install) yields an mp3 — thanks to ‘Alex’ the Macintosh voice — though James Earl Jones would have been much better.

[twitter][1]

 [1]: https://cdn.rambleon.org/migrate/2009/06/twitter.mp3