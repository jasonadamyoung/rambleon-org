---
title: I bet the arms of those electrons are tired
author: jay
type: post
date: 2008-06-09T13:40:24+00:00
url: /2008/06/09/i-bet-the-arms-of-those-electrons-are-tired/
tags:
  - networking
  - system administration

---
I use a combination of monit process monitoring, simple icmp checks, and a lot of log checking to monitor most of our [extension.org][1] systems infrastructure. It isn’t fancy, and it’s not quite the visibility I want, but it’s good enough for where things are at right now. Most of proper monitoring isn’t about getting data about things as they are, but things that have _changed_ from what they just were prior.

C is for cookie, and icmp’s good enough for me, or something like that.

Anyway, ping checks to the hosted server last night from the NC State monitoring box started failing last night &#8211; which is pretty much unheard of in normal operation. And in shelling into the box (a shell into NC State from Road Runner and then over to the hosted server) &#8211; showed the box was just fine itself, but the shell session was either dropping packets, or the latency was really, really bad because it was next to unusable. HTTP seemed ok. But I didn’t spend a lot of time browsing to see if it was affected all that much.

I broke out traceroute, not because it’s all that great of a troubleshooting tool, but it at least gives a relative glimpse if the echo times go up somewhere in the middle. From NC State to the hosted server &#8211; things looked, well, a little odd (some times left out to fit it in my content div for the blog)

<div class="highlighter-rouge">
  <pre class="highlight"><code>traceroute to www.extension.org (206.252.150.82)1  152.1.215.1 (152.1.215.1)  0.643 ms2  vl2942-cmdfcore.ncstate.net (152.1.6.165)  0.512 ms3  ncsugw2-gi2-1.ncstate.net (152.1.6.78)  0.592 ms4  rtp7600-gw-to-ncsu-gw-2.ncren.net (128.109.70.45)  2.064 ms5  rtp11-gw-to-rtp7600-gw-sec.ncren.net (128.109.70.121)  1.932 ms6  ge-6-24.car2.Raleigh1.Level3.net (64.158.228.1)  3.291 ms7  ae-6-6.ebr2.Washington1.Level3.net (4.69.132.178)  9.107 ms8  ae-62-62.csw1.Washington1.Level3.net (4.69.134.146)  9.227 msae-72-72.csw2.Washington1.Level3.net (4.69.134.150)  12.561 msae-82-82.csw3.Washington1.Level3.net (4.69.134.154)  16.460 ms9  ae-4-99.edge2.Washington3.Level3.net (4.68.17.204)  9.987 msae-2-79.edge2.Washington3.Level3.net (4.68.17.76)  9.948 msae-3-89.edge2.Washington3.Level3.net (4.68.17.140)  9.909 ms10  * * *11  so-4-0-0.mpr1.iad2.us.above.net (64.125.30.118)  95.598 ms12  so-4-0-0.mpr2.iad1.us.above.net (64.125.29.133)  95.853 ms13  so-2-0-0.mpr2.dca2.us.above.net (64.125.28.129)  99.993 ms14  so-0-1-0.mpr2.lga5.us.above.net (64.125.26.106)  106.443 ms15  209.133.17.94.available.above.net (209.133.17.94)  104.147 ms16  above1-colo1-cr-4-g1-0-25.core.logicworks.net (206.252.139.214)  103.555 ms17  extension-fw-pri-eth0.complex.logicworks.net (209.73.6.34)  103.962 ms18 * * *</code></pre>
</div>

I’ve never actually seen multiple servers on a single line (lines #8 and #9) &#8211; but it’s not like I live in traceroute. Combined with line #10 &#8211; something looks a little weird at the edge between level3 and above.net. echo times go up 10 fold, and there’s some oddities there.

Things get really weird on the return trip:

<div class="highlighter-rouge">
  <pre class="highlight"><code>traceroute to systems.extension.org (152.1.217.221)1  * * *2  209.73.6.33 (209.73.6.33)  0.460 ms3  above1-er-1-g1-5.core.logicworks.net (206.252.139.209)  0.350 ms4  above1-er-2-ge-1-ec1-2.core.logicworks.net (206.252.140.146)  0.445 ms5  142.ge-1-3-8.mpr2.lga5.us.above.net (209.133.17.91)  0.425 ms6  so-1-3-0.mpr1.lhr3.uk.above.net (64.125.31.181)  86.449 ms7  pos-8-1.mpr2.cdg2.fr.above.net (64.125.23.26)  100.880 ms8  level3.cdg2.fr.above.net (84.207.21.10)  104.975 ms * *9  * ae-32-52.ebr2.Paris1.Level3.net (4.68.109.62)  104.307 ms *10  ae-44.ebr2.Washington1.Level3.net (4.69.137.62)  107.609 msae-41.ebr2.Washington1.Level3.net (4.69.137.50)  114.159 ms11  ae-6-6.car2.Raleigh1.Level3.net (4.69.132.177)  104.059 ms12  ae-11-11.car1.Raleigh1.Level3.net (4.69.132.173)  105.263 ms13  * MCNC.car1.Raleigh1.Level3.net (64.158.236.2)  114.115 ms14  rtp7600-gw-to-rtp1-gw-sec.ncren.net (128.109.70.82)  235.562 ms15  ncsu-gw-2-to-rtp7600-gw.ncren.net (128.109.70.46)  107.384 ms16  itcore-x-ncsugw2.ncstate.net (152.1.6.249)  114.190 ms17  vl2941-mmdfhub-6509-1.ncstate.net (152.1.6.146)  114.431 ms18  exvm-217-221.ces.ncsu.edu (152.1.217.221)  115.972 ms</code></pre>
</div>

So if I’m reading those hostnames right &#8211; and they are an accurate reflection of geographic location &#8211; it sure ain’t Paris Texas. Traceroute got routed from New York to the UK to France, and back to D.C.

WEIRD.

Last night, I thought this was above.net’s problem, today I’m not so sure, I’m thinking it was Level3’s. I wonder if stuff like this actually gets reported anywhere.

Today, things look like you’d expect.

 [1]: http://systems.extension.org/docs/Main_Page