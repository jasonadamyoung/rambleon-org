---
title: Removing the Invisibility Cloak
author: jay
type: post
date: 2005-10-03T02:54:23+00:00
url: /2005/10/03/removing-the-invisibility-cloak/
categories:
  - Reflections

---
One of my work colleagues asked me a few weeks ago what it took to make /etc show up in the Finder on the Macintosh.

I knew it was some kind of HFS+ invisibility setting &#8211; but I honestly had no clue how to change that setting. About the only thing I knew to say was suggest doing a “open /etc” from a terminal window.

Well, thanks to [this article at TUAW][1] I learned about the [“SetFile”][2] command from the developer tools.

For reasons I don’t completely I can’t seem to get it to work on /etc (which is a symlink to /private/etc in OS X &#8211; and /private/etc is already technically visible and the ‘v’ visibility parameter is only a folder attribute according to the SetFile man page) &#8211; but I can get a:

<div class="highlighter-rouge">
  <pre class="highlight"><code>/Developer/Tools/SetFile -a v private</code></pre>
</div>

to work, executed in a sudo’d shell. And then at some seemingly random point (facilitated perhaps by removing /.DS_Store) the Finder realizes it can see /private

For the record [GetFileInfo][3] shows the HFS+ attributes.

(obviously the developer tools should be installed, which you should be doing by default if you are reading this blog and own a Macintosh)

 [1]: http://www.tuaw.com/2005/10/01/terminal-tips-uninvisible-the-invisible-files-on-your-ipod/
 [2]: http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/SetFile.1.html
 [3]: http://developer.apple.com/documentation/Darwin/Reference/ManPages/man1/GetFileInfo.1.html