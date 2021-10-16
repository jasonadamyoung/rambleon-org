---
title: My First Applescript
author: jay
type: post
date: 2004-10-25T20:47:44+00:00
url: /2004/10/25/my-first-applescript/
categories:
  - Reflections

---
I end up downloading a lot of “stuff” — documents from various places on campus, trial utilities, software updates, etc.

While I save the downloads to /Users/me/Downloads instead of the desktop, I often get lost in the leftover download detritus of stuff I still want to get to, but haven’t. So I’ve been wanting some kind of rudimentary ability to file my downloads to some appropriate directory.

Hence my first Applescript — taking advantage of the really cool [folder actions][1] feature in Macintosh OS X (Panther).

<div class="highlighter-rouge">
  <pre class="highlight"><code>on adding folder items to this_folder after receiving these_items     set theDate to current date     set folderName to the date string of theDate     tell application "Finder"        if not (exists folder folderName of this_folder) then           make new folder at this_folder with properties {name:folderName}        end if     end tell     repeat with i from 1 to number of items in these_items        set this_item to item i of these_items        tell application "Finder"           move file this_item to folder folderName of this_folder        end tell     end repeat  end adding folder items to</code></pre>
</div>

I’m not sure I like Applescript all that much (like compared to Perl or PHP) — but it’ll do.

 [1]: //www.apple.com/applescript/folderactions/index.html"