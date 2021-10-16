---
title: Designing Content for the Web
author: jay
type: post
date: 2007-04-14T14:45:53+00:00
url: /2007/04/14/designing-content-for-the-web/
categories:
  - development
  - Reflections
  - Uncategorized
tags:
  - software

---
Shelly Powers [resurrected a post a few days ago][1] on javascript “widgets” (without much thought you could extend this to any blob of javascript doing http requests and fun little rendering things with local and server data without refreshing the page).

It’s a long piece, that I think boils down to “web designers should use them responsibly”

I’m going to extend this in another way. Shelly said something in particular that I want to point out:

> The same person who wrote the comment about widgets also mentioned how browsers load top to bottom, left to right. It’s been a long established policy to make your web pages more accessible to screen readers by putting the changing material first in the page layout, and then the more static elements. In a weblog, this means putting the content first, and then the sidebars. The bars may appear to the left, but in the actual physical layout design, they should physically exist after the content, so that the content is always first.

You can’t design content for the web unless you know how the web works. I mean at least at a high level — about the fact that browser software uses HTTP to request data, web server(s) return that data, and the browser software is responsible for beginning to parse that data as soon as it arrives back from the web server(s), and follow its instructions — either make more requests, start rendering text and graphics in the data, or start running code embedded in the data in whatever code parser/compiler the browser supports. And add on top of that how other software (xml clients/”feed readers”, embedded browsers, screen readers, the code that browsers execute, other web servers even) also will request your data and follow its instructions.

Well, I mean you really can design content for the web without knowing any of this — but if and only if you trust the guidance of the people that do.

[_Updated: The more I read and re-read my original post, the more I realized that it was one big long “duh” So I just decided to edit the thing and get to the heart of the point I wanted to make._]

 [1]: http://burningbird.net/learning-javascript/widget-kungfu/