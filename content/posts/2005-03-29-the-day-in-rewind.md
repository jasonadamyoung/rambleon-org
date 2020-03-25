---
title: The Day in Rewind
author: jay
type: post
date: 2005-03-29T10:09:24+00:00
url: /2005/03/29/the-day-in-rewind/
categories:
  - Reflections

---
Herewith a collection of random bits and comments from today.

## Web development is hard {#web-development-is-hard}

I have to echo [Jeremy Zawodny’s post][1] about having respect for web developers. I have done my fair share of php, php+mysql, and perl, but none of what I (or we) do comes close to the kind of stuff that’s going on at [Google Maps][2], [Flickr][3] and other sites using advanced javascript and DHTML. I have written a few javascript routines, and honestly hated it. Almost as much as batch file programming or programming in Unix shell languages.

Even the simple stuff is hard to get correct. Today, while taking a survey about why/how we run our own mail server in my group for a campus subcommittee looking into a campus-wide email/calendaring solution &#8211; it turns out that it was broken in Firefox. I was able to complete the survey in Safari, but in an effort to figure out what was causing the problem (and share that with the survey developers) &#8211; there was this snippet of html in the source:

<div class="highlighter-rouge">
  <pre class="highlight"><code>  &lt;p&gt;      &lt;label&gt;3. Is this resource comprised of a single person or a group of people?&lt;br&gt;      &lt;input name="staffing_numbers" type="radio" value="single"&gt;      Single&lt;br&gt;      &lt;input name="staffing_numbers" type="radio" value="multiple"&gt;      Multiple&lt;/label&gt;    &lt;/p&gt;</code></pre>
</div>

Hey &#8211; it works fine in IE! and it works fine in Safari! However, it’s not up to [spec][4]:

> “The LABEL element may be used to attach information to controls. Each LABEL element is associated with exactly one form control.”

The whole validation/specification/works here/doesn’t work here is maddening &#8211; and this is just the simple stuff. This isn’t [“Ajax”][5]

* * *

## Man it’s hard to keep good people {#man-its-hard-to-keep-good-people}

So our systems part-timer today came in to tell me he has a job at SAS for the summer. Converting some vbscript to C#. He’s good, really good, one of a rare breed of very competent, but-doesn’t-they-they-know-everything and willing-to-try-fail-and-learn students. But he’ll get good experience at SAS and make way more money. My group is a hard group to recruit for, not because the work we do isn’t really interesting (it definitely is) &#8211; and not because I can’t sell a position (I can make our group sound like the greatest IT position ever) &#8211; but doing either brings a whole lot of people out of the woodwork, and not many of them the kinds of personalities you want in a student-based system administrator position. Good system administrators have good “IT genes” and are grown &#8211; rarely found. Oh well, back to the drawing board for the summer.

(one day I’ll have to tell the story of how the very first day I started as a manager, I had someone turn in their resignation, and another employee barely show up to work for my first month, before resigning too. After that trial-by-fire, dealing with part-timer turnover has been relatively easier 😉

* * *

## Where in the World is Page Hall {#where-in-the-world-is-page-hall}

After [reading Robert Scoble’s post][6] about [BlogMap][7] &#8211; I decided to add mine. That led me to read up a little on ICBM / geo.position tags (which I decided not to add to EWE) &#8211; and led this evening to playing with [TerraServer][8]

After looking for [Page Hall][9] on the aerial map:

![][10]

I was reminded again of my ongoing theory that the reason [Bragaw Hall][11] is shaped as an “X” is a University-Governmental conspiratorial decree to have a reference point at NCSU for satellite/aerial photography.

![][12]

Try it &#8211; you look at the [aerial image for raleigh closely][13] &#8211; and see if Bragaw doesn’t show up rather easily.

_[update: &#8211; just in case it isn’t clear from how I write &#8211; the idea that this is conspiratorial is largely tongue-in-cheek on my part. Stranger things have happened, but I wouldn’t care one way or the other]_

* * *

And all this is why this website is aptly named “Rambles of a University System Administrator” 😉

 [1]: //jeremy.zawodny.com/blog/archives/004373.html"
 [2]: //maps.google.com/"
 [3]: //flickr.com/"
 [4]: //www.w3.org/TR/html401/interact/forms.html#h-17.9.1"
 [5]: //www.adaptivepath.com/publications/essays/archives/000385.php"
 [6]: //radio.weblogs.com/0001011/2005/03/20.html#a9690"
 [7]: //www.feedmap.net/BlogMap/"
 [8]: //terraserver.microsoft.com/"
 [9]: //www.ncsu.edu/facilities/buildings/page.html"
 [10]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-9419a7d543767d4ae80fd22cc8d33239/pagehallaerial.jpg"
 [11]: //www.ncsu.edu/facilities/buildings/bragaw.html"
 [12]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-9419a7d543767d4ae80fd22cc8d33239/raleighaerial.jpg"
 [13]: //terraserver.microsoft.com/image.aspx?T=4&S=14&Z=17&X=222&Y=1238&W=3&qs=%7craleigh%7cnc%7c"