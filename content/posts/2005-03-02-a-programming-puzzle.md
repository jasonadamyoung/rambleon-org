---
title: A programming puzzle
author: jay
type: post
date: 2005-03-02T08:30:49+00:00
url: /2005/03/02/a-programming-puzzle/
categories:
  - Uncategorized
tags:
  - sysadmin

---
One of the things I do outside of work is participate in a baseball simulation league. Part of the pre-season activities for the league is conducting a draft of all of the available players to fill out the rosters for the teams in the league. I’m building a web tool (using PHP and MySQL) to help me keep track of the drafted players (it’s something that helps me keep up with my programming skills and stay up with a few technologies that we offer to folks in the College of Engineering).

Our draft works like most baseball drafts, by reversing the order in each successive rounds. e.g. if our league had three teams:

RoundTeamPosition in RoundOverall Draft Position

1Yankees11

1Cardinals22

1Red Sox33

2Red Sox14

2Cardinals25

2Yankees36

3Yankees17

3Cardinals28

3Red Sox39

(we don’t allow for trading draft picks)

One of the programming tasks I had to figure out tonight was:

given an overall draft position, figure out the:

  * Round (e.g. for a 3 team league, draft position 8 is in Round 3)
  * The Team whose pick that is

While our league has a fixed number of teams (20) &#8211; I wanted a generic function that returned this information for me, whether the league had 20 teams or only 3 teams.

So I offer that challenge to you &#8211; write a function or set of functions that given a draft position, a number of teams in the league, and the first-round draft order for those teams, returns the round of the given draft position, and the team that should be drafting at that time. The function(s) should allow for any arbitrary number of teams in the league.

Here’s an example PHP array for a 20 team league, with team names and their draft position (intentionally alphabetized by team name, feel free to manipulate the array however you want to make it easier to work with &#8211; the built-in [PHP array functions][1] make this easy ):

  <code class="highlighter-rouge">$teamArray = array('Atlanta Braves' =&gt; 18,  'Baltimore Orioles' =&gt; 6,  'Boston Red Sox' =&gt; 16,  'Chicago Cubs' =&gt; 1,  'Chicago White Sox' =&gt; 9,  'Cincinatti Reds' =&gt; 20,  'Cleveland Indians' =&gt; 10,  'Detroit Tigers' =&gt; 12,  'Houston Astros' =&gt; 14,  'Kansas City Royals' =&gt; 2,  'Los Angeles Dodgers' =&gt; 13,  'New York Mets' =&gt; 15,  'New York Yankees' =&gt; 19,  'Oakland Athletics' =&gt; 5,  'Philadelphia Phillies' =&gt; 3,  'Pittsburgh Pirates' =&gt; 11,  'Saint Louis Cardinals' =&gt; 8,  'San Francisco Giants' =&gt; 4,  'Seattle Mariners' =&gt; 17,  'Texas Rangers' =&gt; 7 );  </code>

(this challenge is initially meant for our [Engineering PHP Developer’s group][2] and my reference implementation is done in PHP, but feel free to use any language you like, and convert the array into the language you are using)

For those non-programmers that might be interested in the math of this ( and as a hint to the programmers) &#8211; &#8211; what algebraic expression(s) could you write to figure this out?

I’ll post what I came up with in the next few days.

(_**[update]:** I will temporarily screen comments that have solutions in them &#8211; just to give folks taking a look at the page some opportunity to work through the problem themselves without an answer right in front of them 😉_ )

 [1]: //us2.php.net/manual/en/ref.array.php"
 [2]: //sysadm.eos.ncsu.edu/site/pages/phpdev/default"