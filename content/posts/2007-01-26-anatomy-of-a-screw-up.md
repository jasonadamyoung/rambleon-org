---
title: Anatomy of a screw up
author: jay
type: post
date: 2007-01-26T18:06:56+00:00
url: /2007/01/26/anatomy-of-a-screw-up/
tags:
  - ruby
  - software
  - sysadmin

---
So, because you’ll learn far more from screwing up, then getting it always right — here’s the latest screw up from yours truly. Documented for all the world to see 🙂

So, I have been making slow progress the last few weeks in updating our account registration application to be a bit more normalized, and collect a few data elements that we weren’t previously collecting. This took surprisingly far longer than it should have taken.

(it actually turns out to be a bigger pain in the ass to implement a selection form with a defined set of options — and include “other field” and have that other field create new, user defined option and have that live properly across submits, than I thought, but I digress)

A lot of the work went into doing things like changing object names from “University” to “Institution” because well, we are associating folks with groups that aren’t Universities, and maintaining the University names makes the app semantically incorrect. Of course, that then creates a fairly healthy rename nightmare, that search and replace doesn’t really fix. I managed to handle that okay.

And I managed to handle the infamous Rails “nil-error-in-views” problem. For those that aren’t familiar with this, inevitably you will run into a situation where you are going to print out something like <code class="highlighter-rouge">user.county</code> — where <code class="highlighter-rouge">.county</code> is the automagic accessor created for the county field in your user database. Well, when you start normalizing county to actually be a reference to an entry in the county db, and not a copied string — you have to start doing things like <code class="highlighter-rouge">user.county.name</code> — where .county is the automagic accessor created to get at the county object that associated through a <code class="highlighter-rouge">belongs_to:</code> or similar — and then name is the accessor for the name column in the county db for the county associated with the user.

The dreaded nil error is that you have to make sure that “county” is an instantiated object. If the user doesn’t have a county — when you go to access <code class="highlighter-rouge">user.county.name</code> — county might be <code class="highlighter-rouge">nil</code> and Rails goes “Ooops!” I’m sure there’s a highly elegant idiomatic way to solve this, but if statements normally work for me. As long as I use them.

I managed to check most of all the <code class="highlighter-rouge">nil</code> places in my views. Where I missed it though is in the XML response to a third-party authentication request. Our other rails applications and our wiki environments proxy-authenticate via a POST to our account application and get back success/failure and profile data in a xml stub block.

I sort of tested this. I tested one application against it, and watched it authenticate just fine. However, **I never checked the local log**. As a system administrator first, I should know better. **always, always, always check the logs**. But I didn’t. I would have know the thing was oopsing then.

Well maybe. Test screw-up #2 was the fact that in order to test the new data elements — I actually put myself in a county. So for my test account, there was no oops — county existed and wasn’t <code class="highlighter-rouge">nil</code>. For a good portion of any of the users that would be migrated, they were going to be missing a county. But noooooooo, I didn’t test that.

So armed with what looked to be a highly functioning application — I deployed. And I tested all the authenticating apps right after deployment. With a valid county. “Works for me!” “Whoo!”

Five minutes later — I get an IM, from the director. Who couldn’t login.

I look at the logs that are in-app. hmmmm…. seems to login in just fine. logins from the rails apps work for folks. I hadn’t yet seen the application errors emails that we email ourselves when our Rails apps go Ooops! (yay for exception notifiable) (mistake #3) I go and look at exactly what the auth code is doing from the wikis and it dawns on me at that moment that I left the IF statements out of the <code class="highlighter-rouge">.rxml</code> I knew it was the dreaded <code class="highlighter-rouge">nil</code>

I can’t remember at that moment if I said “Oh shit!” or not. But I did change my IM status to “Yes I know. Yes I’m working on it”

Then I see the app error emails and see that they confirmed the nil. And 5 minutes after that, James pipes up and says “just ignore the passwords”

(the passwords? yeah, apparently there’s a second bug that was highlighted, our auth code had a debugging feature left over that included the necessary POST params in the querystring. When the wiki auth occurs, it was passing those in addition to the POST. So when the exception mails were sent, while the POST passwords were filtered, the query string really can’t be. Whooops. At that point I definitely said “Oh shit”)

Mistake #4 was ignoring the logs on that one for the last several weeks, which now my web access logs have all kinds of passwords in them — thankfully that’s restricted access to just me (and they are going to get a gigantic search and replace soon).

Well, anyway. Being system administrator has its privileges. So I managed to fix the problem, create a test environment to test the fix, deploy the fix (twice), touch base with Rafe about fixing the discovered wiki authplugin feature — who gets it checked in PDQ, and I got that deployed too.

Report, to fix, to test, to deployment, to fix side effect bug, to the emails to the staff, to recommendations for the group that triggered the exception notifications to change their passwords — 40 minutes. **That** is definitely the silver lining in this. It’s really hard to be more responsive and faster than that.

The summary?

  * check the logs
  * watch your rails nils
  * check the logs
  * test with missing data
  * test from everywhere
  * check the logs
  * clean up debugging code
  * check the logs
  * know your code so dang well, that you can fix it faster than butter on the morning toast