---
title: Week Notes – Updates, Updates, Updates
author: jay
type: post
date: 2019-10-15T01:07:55+00:00
url: /2019/10/14/week-notes-updates-updates-updates/
categories:
  - WeekNotes

---
_In which I don&#8217;t talk about Kuberneetus like the last three posts to avoid writing up things about kubernetes &#8211; I just avoid writing up things about kubernetes, well mostly._

  
[Simon Willison][1] is one of the developers that I&#8217;ve admired for years, and have followed his work off and mostly on every since I came across his work on pingback and xml-rpc back when I did PHP (way, way back in the early aught&#8217;s). I&#8217;ve got a stack of stars about a mile long in my feed reader starring all his work with sqlite tools and especially [Datasette][2] &#8211; which is something that I haven&#8217;t been able to integrate into my day job(s) &#8211; and I keep wanting to clear the decks to make time for in the hobby space.

A few weeks ago, Simon did another thing that I am going to try to emulate &#8211; [he&#8217;s started writing weeknotes][3] (he links to [more information here][4] )

It&#8217;s just a great idea, if only for myself, to be able to look back and see some progression (or regression) in the work that I do.

I didn&#8217;t start a post of notes last week, so this first one of mine is going to be a bit stilted most likely, but we&#8217;ll see how it goes.

<hr class="wp-block-separator" />

I hold a lot of stress/tension in my neck, which comes up and haunts me sometimes, I ended up getting a fairly severe muscle cramp (what I would have called/do call &#8220;pulling a muscle&#8221; before I learned better) &#8211; enough that it knocked me out of the commute into work. I was able to work from home that day though, and worked on a Bash script. That might not be the best idea for a cure for a muscle cramp 😉

One of our WordPress multisite platforms is available for students and organizations and has been self-serve for years, and has built up somewhere north of 15,000 idle blogs/sites. My colleagues that do the actual WordPress work (I am responsible for the web platforms themselves) are cleaning those out, and worked on a process to identify and flag those blogs as deleted (WordPress has a deleted flag that will 404 the site, but leave all the tables and content). We have a Jenkins platform already in place that&#8217;s running some scripts (typically all Bash) that deploy the site and do things like run the `wp-cli` tool to rewrite urls when needed. Since that&#8217;s the model, I went with it, and ended up writing a Jenkins-executed Bash script to use `wp-cli` to query the database for all the blogs flagged as deleted, dump them to a file and loop over them at 2,000 an hour to remove.

In between Google Searches and Bash Heredoc games, I upgraded my personal iMac to Catalina. I think it would have been straightforward if I had better than 6.0Mbps DSL and a slow 2TB spinning disk in the iMac, it was pretty rough around the edges for sure. But it eventually settled out.

I upgraded my work Macbook to Catalina the next day without much event other than all the Windows Vista-esque permission prompts for Documents, Downloads and notification access.

Sometime last month, we had some accounts get created in our GitLab platform(s) with the wrong UID &#8211; so I spent some time trying to debug where that might have gone off the rails. We implemented signed/encrypted SAML &#8211; so I can&#8217;t get the attributes that were returned from Shibboleth in the logs easily. While [OneLogin has a SAML decryptor][5] tool &#8211; it&#8217;s online only, and well, no private keys are getting pasted there, so I looked into what it would take to write a (non-Java, preferably python) tool to do it locally &#8211; with some leads, but no end-success other than to realize the labor effort probably isn&#8217;t worth it, and I just need to spend some time with a non-encrypted dev box to work out where things went wrong with the uid value.

In kubernetes news, [Rancher 2.3 was released][6] &#8211; so both my homelab cluster and my Kuberneetus/Kuberneetleüs cluster were updated. And it just worked (which is definitely more than I can say for every OpenShift upgrade I&#8217;ve watched, or the ones I attempted last fall in the homelab)

Friday I ended up needing to take a leave day and go out of town for a bit &#8211; so there wasn&#8217;t anything work or hobby wise that came up then, but on the way back, I did on a spur of the moment suddenly decide that it was time to upgrade my iPhone &#8211; so I swung by the Apple store, and worked through that, where again the curse of 6.0Mbps DSL in trying to download a 3.2GB iOS update, and some untold gigabytes of app re-downloads stretched that whole process over 5 hours. But the low-light photo options are pretty amazing.

So, yeah a bit stilted &#8211; but maybe that&#8217;s appropriate for update week.  
  
I&#8217;ve got better notes to start this week on &#8211; and it&#8217;s likely going to be all about &#8220;JupyterHub&#8221; this week, which honestly I&#8217;m fairly excited about.

 [1]: https://simonwillison.net
 [2]: https://datasette.readthedocs.io/en/stable/
 [3]: https://simonwillison.net/2019/Sep/13/weeknotestwitter-sqlite-datasette-rure/
 [4]: https://weeknot.es/what-on-earth-are-weeknotes-a81874c5cef9) )
 [5]: https://www.samltool.com/decrypt.php
 [6]: https://github.com/rancher/rancher/releases/tag/v2.3.0