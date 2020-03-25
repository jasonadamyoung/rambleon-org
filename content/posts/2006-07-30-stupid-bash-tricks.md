---
title: Stupid Bash Tricks
author: jay
type: post
date: 2006-07-30T17:40:48+00:00
url: /2006/07/30/stupid-bash-tricks/
categories:
  - Uncategorized
tags:
  - sysadmin

---
So, what do you do when you need to quickly shell script out the running of [day-based reports for 29 different vhosts][1] for every day from March 1st until the present?

You cheat.

You can’t really run a for loop across every month and every day in the month, because every month doesn’t have the same number of days, and it looks really stupid to have a blank report for April 31st. In a scripting language with more date arithmetic, I’d probably start with March 1st, and keep adding a day until date == the day I was running the reports, but it’s been way too long since I’ve written anything of substance in perl or php &#8211; and well, I haven’t sat down to learn Ruby yet &#8211; so all I have is the shell. And I’m not very good at that. But for looping something is certainly better than copy and past for 4 months times <=31days times 29 vhosts.

So, yeah, back to the cheating.

My for loop looked like:

\`

<div class="highlighter-rouge">
  <pre class="highlight"><code>for i in `seq -f %02g 3 7`;do    for j in `seq -f %02g 1 31`    do        dateme="$year/$i/$j"        month=`date --date=$dateme +%m`        day=`date --date=$dateme +%d`</code></pre>
</div>

\`

“date” is smart to treat April 31st and May 1st as the same day, and I get away with this because it’s just static data that overwrites the previous output (the report is ran and output to a $year/$month/$day directory. So I’m just running the May 1st and July 1st report twice. A fair tradeoff for not having to build the date comparison rules into the shell script myself.

 [1]: http://systems.extension.org/blog/2006/07/30/webstats-now-with-daily-stats/