---
title: 'Followup: A Programming Puzzle'
author: jay
type: post
date: 2005-03-07T07:49:14+00:00
url: /2005/03/07/followup-a-programming-puzzle/
categories:
  - Uncategorized
tags:
  - sysadmin

---
I was actually pleasantly surprised by the followups that I received to my [“Programming Puzzle”][1] query the other day.

It’s a simple problem, but it does take a little bit of thinking.

My original answer that I did was:

<div class="highlighter-rouge">
  <pre class="highlight"><code>function calculateDraftRoundAndTeamNum($numTeams,$draftPosition,&$round,&$teamNumber) {   $round = ceil(($draftPosition / $numTeams));       if($round % 2) {      $teamNumber = ($draftPosition % $numTeams);      if($teamNumber == 0) $teamNumber = $numTeams;   }   else {      $relativePosition = ( $draftPosition % $numTeams);      if($relativePosition == 0) $teamNumber = 1;      else {          $teamNumber = ($numTeams+1-$relativePosition);      }   }}</code></pre>
</div>

Basically, reverse the index into one’s array by determining which round you were in, handling the edge cases of a “0” remainder from using the MODulus operator to be the last team or the first team. Like most of my emails, my answer is a little verbose I think.

Which is why I really liked Charles Brabec’s [Perl-based answer][2]. By kicking up the number of teams internal within the logic, you obviate having to test for the edge cases. Nice.

He also did a [Postscript answer][3]. I told him he was just showing off :-). But it’s really interesting, and interesting to remember that Postscript is actually a programming language.

Charles also provided a test case with his code, which is important to help verify the results. One of the folks that submitted a PHP example would have benefited by running through their function through a test suite. It looked good until you got around the picks that rolled back around.

Professor Jeff Joines did the following in Matlab:

<div class="highlighter-rouge">
  <pre class="highlight"><code>function [rnd, teamindex]=jeff(numteam,draftpos)rnd=ceil(draftpos/numteam);re = draftpos-(rnd-1)*numteam;if mod(rnd,2) == 0    teamindex = numteam+1-re;else    teamindex = re;endend</code></pre>
</div>

Getting around the edge case check by not using a modulus to compute the relative position.

Doug Goodall did the following in Python

<div class="highlighter-rouge">
  <pre class="highlight"><code>def draft(draftPosition, draftOrder):    numberOfTeams = len(draftOrder)    currentTeam = ""    draftRound = ( (draftPosition - 1) / numberOfTeams) + 1    if draftRound % 2:        pick = draftPosition - ( (draftRound - 1) * numberOfTeams)    else:        pick = numberOfTeams - (draftPosition - ( (draftRound - 1) * numberOfTeams) ) + 1        for team in draftOrder:        if team[1] == pick:            currentTeam = team[0]        break        return [str(draftRound), currentTeam]</code></pre>
</div>

Doug also calculated the pick position like Jeff did.

One interesting difference between Python and PHP shows up in the round calculation, PHP [returns a float value with division][4] and Python does an [integer division][5].

Billy Beaudoin mixed his languages and provided a PHP example that would work only in Perl. It was unique because it raised -1 to the power of the round within an array reference, basically:

<div class="highlighter-rouge">
  <pre class="highlight"><code>(Remainder - 1) * (-1)^Round)</code></pre>
</div>

The subscripts are off &#8211; but it takes advantage of a neat feature in Perl, negative array indexes index back from the end of the array.

Billy also found the [gmp\_div\_qr()][6] function &#8211; providing quotient and remainder in one fell swoop.

Troy Hurteau also did php:

<div class="highlighter-rouge">
  <pre class="highlight"><code>$round = ceil($position / $totalTeams);$order = $position % $totalTeams;if($order == 0) $order = $totalTeams;//if the round is oddif($round % 2 != 0) $teamNumber = $position - (($round - 1) * $totalTeams);//if the round is evenelse    $teamNumber = ($round * $totalTeams) + 1 - $position;</code></pre>
</div>

one thing Troy did (not shown) was provide lots of error checking for the number of teams against the provided team array, and checking for silly values like 0 teams (which the rest of us really forgot to do).

While I would have loved more responses, having so many different code examples was great.

 [1]: //people.engr.ncsu.edu/jayoung/site/pages/-fdbc6630071891aca1f4f7e3127d9963"
 [2]: //people.engr.ncsu.edu/jayoung/site/viewcomment/34280b263367a46550fc210abeec12c9"
 [3]: //people.engr.ncsu.edu/jayoung/site/viewcomment/7958c201e7bba2d43079c1a2a9a93a4a"
 [4]: //us4.php.net/manual/en/language.operators.arithmetic.php"
 [5]: Python_Operators#Division_and_Type_Conversion"
 [6]: //us4.php.net/manual/en/function.gmp-div-qr.php"