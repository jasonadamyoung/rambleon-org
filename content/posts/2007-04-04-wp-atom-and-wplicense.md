---
title: wp-atom and wpLicense
author: jay
type: post
date: 2007-04-04T01:05:28+00:00
url: /2007/04/04/wp-atom-and-wplicense/
categories:
  - development
  - Reflections
  - Uncategorized
tags:
  - linkblog

---
Thanks to a couple of line changes in the [wpLicense plugin][1] — namely after line 384 — adding:

<code class="highlighter-rouge">add_action('atom10_head', 'cc_atom_head');</code>

and because of what is likely an output buffering issue somewhere — I had to change line 84 from:

<code class="highlighter-rouge">link rel="license" type="text/html" href="'.licenseUri().'"</code>

to:

<code class="highlighter-rouge">link rel="license" type="text/html" href="'.get_option('cc_content_license_uri').'"</code>

(yes, I need to debug this — it’s kind of a hack)

I now have the [wpLicense plugin][1] working with Benjamin Smedberg’s [atom 1.0 plugin][2]

All this so that [Conversations with Plastic Dinosaurs][3] is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 3.0][4] license.

 [1]: http://wiki.creativecommons.org/WpLicense
 [2]: http://benjamin.smedbergs.us/wordpress-atom-1.0/
 [3]: http://conversationswithplasticdinosaurs.com
 [4]: http://creativecommons.org/licenses/by-nc-sa/3.0/