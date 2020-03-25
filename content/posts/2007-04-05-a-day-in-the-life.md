---
title: A Day In the Life
author: jay
type: post
date: 2007-04-05T22:29:23+00:00
url: /2007/04/05/a-day-in-the-life/
categories:
  - Reflections
tags:
  - sysadmin

---
Most days when I get to the end of the day, I can’t remember half of what I did that day. When people ask me what I did &#8211; I can’t really tell them. This, of course, is horribly demoralizing because I begin to doubt whether I actually did anything, or maybe I just zoned out doing my TPS reports.

This isn’t some “woe is me, I’m soooo busy” statement. Or some arrogant “I’m so important, I do all kinds of things” statement. I’m not relatively busier than anyone else in similar positions (or in dissimilar positions in our specific team) &#8211; and my importance is like the Dilbert carton that showed up a few months ago where Dilbert had a choice between doing an important anonymous activity &#8211; or doing something useless that looked like an accomplishment and then attended meetings until he couldn’t appreciate the difference.

Nope, not remembering is more a natural function of most system administration positions &#8211; there’s a number of clearly distinct, interrupt-oriented tasks that don’t lend themselves to spending any quality, concentrated study time (which most technical tasks really need) &#8211; and add to that the information overload of aggregated feeds, twitters, IM’s that I let myself indulge in and whammo! there goes the memory.

I can’t figure out whether the current position is worse for the amnesia or my last position (more management oriented) was. The current one has more distinctly separate technology pieces, but the last one involved way too many meetings and a lot of EDS-esque cat herding. I think the current one is, maybe because I’ve gotten older, or maybe because our project is trying to tackle too many completely different scopes at the same time.

Anyway, I actually remembered what I did yesterday. (well, almost, I remembered the two or three big things &#8211; and went back through my email and IM and console logs for the others) And the more I thought about it &#8211; the more that yesterday was a completely typical day in my Life as a Grant-Sponsored University Systems Manager. So I present to you &#8211; a day in the life (maybe will start a meme. I doubt it though).

### Arrive at work &#8211; 7:51 am {#arrive-at-work---751-am}

Run mail.app. Run Adium.

I review my overnight email, trash the spam, make sure the expected email that comes from some of the overnight processes that indicate they completed is there. Check all the shared folders and make sure all those mails came in from the overnight processes. Some days this is a “gut feel” check &#8211; I make sure what’s supposed to be there is there, and is about the right size. Some mornings I read each of the emails. It depends on what’s going on. I usually catch up with everything by the end of the week when I don’t read all of them every day. Yesterday I read about half of them because I started IM’ing with [James][1] about some [changes I made][2] to our pubsite application the day before to fix issues we were having with underscores, plusses, and %20 characters all being treated as spaces and the side effects of that.

We also talked about one of us trying to explore the [mediawiki python bot][3] to see if it could do anything to help our colleagues do any mass changes to categories in our mediawiki acting as a CMS for our public website.

Sadly, I volunteer to do this 🙂

### 8:30am {#830am}

I download the python wikipedia bot. I respond to some comments on one of my flickr photos, go through anything that looks incredibly interesting in Google Reader and Del.icio.us. Decide to go ahead and update the three wordpress installs to WordPress 2.1.3 and [put it in the blog][4]

### 8:55 {#855}

Start IM’ing with Daniel &#8211; who works with me part-time. He’s trying out the custom Locomotive Bundle I put together to our own gem server. And I remember that I need to open the conf rules on that to allow folks at home to point to our gem repo instead of limiting that to campus. So I make the change, check it into svn, update the server’s conf, and restart Apache

### 9:15 {#915}

Got an IM that a mistake was made in deploying a bug fix to our public site application, and some other code that hadn’t cleared through all our internal discussions got deployed &#8211; along with db migrations that make it impossible to revert the change. Whoops. Big Whoops. Huge Whoops. And the content needs to be refreshed for the site because some bug fixes were also in that code that make it necessary to reimport content to make sure the timestamps are right. I put the site in maintenancemode and got to that.

### 9:30 {#930}

Help another staff member debug a problem with Google Reader and the feeds for some of our applications.

Chatted with [Ben][5] about some user interface things that could help ease the transition of the code change we just made and how putting in certain changes just might exacerbate trying to describe to folks how it really works.

### 9:45am {#945am}

Return to the python mediawiki bot. Get the CVS directories yanked out of it, turn the .cvsignore’s into svn:ignore &#8211; and check it into our deployment repository. Create the account for the bot. Start reading all the instructions for configuring the thing.

Start cursing.

Problem #1: the bot doesn’t understand our redirection on login to https:// I don’t know python. But I know enough ruby and perl and php to hack &#8211; so I hack. I figure out where in the world in the login script for the bot to change it to understand SSL. But I don’t have much hope that it’s going to work. I change httplib.HTTPConnection to httplib.HTTPSConnection and pray that it works &#8211; and wow, wonders upon wonders that it does. I begin to praise Guido van Rossum and temporarily overlook that the language requires proper indentation.

Problem #2: the bot really hates that we eschew wiki style and allow category (and page) names that start with lower case letters. I begin cursing again, because this one is really buried, and my debug-by-print attempts are throwing syntax errors because of the indentation issues.

James tries to help, because he actually likes python. I curse James for liking python.

I fix that problem, and feel proud and smug because I actually made it a configuration option. I give up while I’m ahead and go have lunch with the wife.

### 11:30am {#1130am}

Lunch with the wife. Best part of the whole day.

### 1:10pm {#110pm}

Get back to the python mediawiki bot. It doesn’t appear to work at all for editing the content in the test wiki. Waste the next hour and half of my life running python interactively, importing the bot libraries, creating my own site and page objects, and trying to figure out what’s wrong &#8211; and why then page content was blank, and traipsing through the code to figure out how the thing parses the edit page to get at the content (it parses for the textareas)

And then come to find out, an add-on to mediawiki written by our colleagues to try to make it a little easier to pick images and templates for an article is full of a bunch of hidden javascript-presented blocks with &#8211; you guessed it &#8211; a bunch of textareas. Turn off the plugin for a bit, and voila! the bot works.

### 2:45pm {#245pm}

Start talking with James about whether or not this is ever going to work at all. (the bot, not the project) We don’t really resolve out whether or not the bot is going to be useful. But we now have enough information to run with if it does come up again

### 3:00pm {#300pm}

Go traipsing through the shared mailboxes &#8211; including the inbound and outbound mail out of our support system. See that a colleague has entered a support call about how article summaries aren’t showing any markup. Go looking through our code to figure out how the summaries are created and how the tags are stripped to make sure that the summary truncation doesn’t break things due to dangling tags. IM my colleague and explain what was going on with the summary thing and ask her thoughts on trying to actually do anything with it. (begin to contemplate how in the world to even do that, probably white listing em and strong tags and making sure they are closed. groan thinking about the regexes)

### 3:20pm {#320pm}

Read through the staff list mails about some of the issues that resulted from the morning’s premature deployment. Write up some explanations about how the mediawiki include functionality works (the mediawiki includes are used in some of the content preparation to reproduce content nav blocks in pages that eventually display on our public site). Try to clarify some additional confusion that results from how we look for specific category tags to display specific content pages (like in a sidebar &#8211; it’s very blog like)

### 3:45pm {#345pm}

Talk with James for a bit about ongoing issues and group priorities

### 4:00pm {#400pm}

Talk with the wife for a bit in IM. Catch up on the day’s Google Reader.

### 4:15pm {#415pm}

Start figuring out again the find command to let me grep a string in all the files created in the last day. Settle on <code class="highlighter-rouge">find . -ctime -1 -print -exec grep -i jason {} ;</code>

The goal, because I have 75,000+ spam emails sent to our server in the last three months and because it was choking up Mail.app so bad to occasionally browse through that looking for any false positives &#8211; that I pulled the account out of Mail.app and went to the server side to poke through the spam folders looking for that.

### 4:45pm {#445pm}

Run that in the wrong directory. Whoops!

### 5:10pm {#510pm}

Start reviewing the meeting items posted for the all-staff meeting the next day. Send [Kevin][6] some questions on e-commerce and what was discussed at the meeting retreat the previous week.

### 5:30pm {#530pm}

Leave for the day. Head home trying to figure out someway, somehow to ask questions in our staff meeting about our focus and direction.

* * *

Pretty typical actually. (usually less time spent on one problem like the python bot problem) Some days are a little longer. Some days have more Google Reader 😉 Some days are more systems, less dev, some days more dev, less systems.

And that folks, was the way it was, April 4 2007 🙂 A day in the life of this systems manager.

 [1]: http://blog.robinsonhouse.com
 [2]: https://sourcecode.extension.org/wsvn/pubsite/?rev=823&sc=1
 [3]: http://meta.wikimedia.org/wiki/Using_the_python_wikipediabot
 [4]: http://systems.extension.org/blog/2007/04/04/wordpress-upgrades-6/
 [5]: http://www.trixieupdate.com
 [6]: http://blog.k1v1n.com