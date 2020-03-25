---
title: It should be noted…
author: jay
type: post
date: 2005-03-31T20:03:46+00:00
url: /2005/03/31/it-should-be-noted/
categories:
  - Reflections

---
It should be noted that:

<code class="highlighter-rouge">$catstring = preg_replace("#[^a-zA-Z0-9s/-_]#",'',$catstring);</code>

does not equal:

<code class="highlighter-rouge">$catstring = preg_replace("#[^a-zA-Z0-9s/-_]#",'',$catstring);</code>

especially if it’s important to maintain the “-“ character in a string.

Funny how a single unescaped pattern match can break all kinds of navigation in one’s web application.