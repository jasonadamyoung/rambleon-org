---
title: A tag similarity algorithm
author: jay
type: post
date: 2008-03-06T21:24:29+00:00
url: /2008/03/06/a-tag-similarity-algorithm/
tags:
  - algorithms
  - applicationdesign
  - communities
  - tags

---
In addition to being a systems manager (and customer support, and a manager, and an information architect, and all the other hats most of all of wear in small engineering teams at Universities and startups). I sometimes do development — currently almost all rubyonrails. The core application I’m responsible for is our “Identity” application — basically the user registration app for our internal tools (and an openid provider for internal users).

One of the things it’s about to do is let folks create and join communities. This isn’t as exciting as it sounds yet, or any time soon, it’s mostly an accounting feature of a reflection of existing communities (essentially committee assignments of a sort). It’ll be used to generate mailing lists, and it will probably grow to actually seeding into real networking tools to help facilitate actual virtual communities. But for right now, it’s really only accounting (which may mean it doesn’t get used all that much, that’s okay, some of this is really building block code for other applications).

One of the things that’s about to be added are user tags, both to begin to capture available interests and expertise, and to get folks used to tagging. (we do have tagging in our FAQ authoring application too).

So the actual point of the post — I’m going to use those tags to generate community recommendations.

To start, communities will have tags — not from people actively tagging them, but as an aggregation of the personal/self tags of the people that are interested in and/or members (we have potentially two roles, long story, we’ll just refer to those combined as “members”) of that community.

[Ben][1] and I decided not to have folks actually actively tag communities, figuring it was enough to begin with to get them to tag themselves.

## “Community Tags” {#community-tags}

So, Communities will have a set of tags, from its members. e.g. If [Ben][1] has tagged himself:

> designer html ilovemarkup ruby

And if [James][2] has tagged himself:

> ilovecoffeeandchickens ruby coder html

And if [Aaron][3] has tagged himself:

> ilovenascar ruby coder

And they are all in the “engineering group” — then the engineering group will have the union of those tags:

> designer html ruby coder ilovemarkup ilovecoffeeandchickens ilovenascar

However, practically, I think we’ll only ever display tags on communities that are an intersection between two members in the community (<code class="highlighter-rouge">get tags where tag count &gt;= 2</code>) — and I think it’s probably safe to keep that match going — only ever dealing with the tags on a community where at least two people in the community have those tags.

> html ruby coder

## Matching users to communities {#matching-users-to-communities}

Say that [Kevin][4] has the tags:

> [wheresmyiphone][5] html ruby thoughtleader ilovemarkup

Would the engineering group be a good match for him based on the tags of its members and interested users?

There’s a veritable cornucopia (okay, crapton) of [correlation functions][6] out there, most of which go over my head (even after years of math, I honestly have to spend a lot of time staring at the greek letters in symbolic math to understand it again, often turning it into pseudocode believe or not). One simple correlation function is called the “[binary overlap][7]” — which essentially boils down to calculating the intersection of Kevin’s tags, with the engineering groups’ tags, divided by the minimum of either tag set.

The idea being that if a community’s tags and Kevin’s tags completely overlap in one direction or the other — it’s a 100% match. There are other algorithms that take into account more about “different tags” — which would negatively impact the correlation (more different tags than same tags) — but I think those correlations would only be valid if people were actively picking tags for the community — and we needed to take into account how the community had different meanings for different people — based on them actively tagging their communities.

So with the simple overlap/positive correlation. In this case: (again, dealing with ONLY those tags where the count is 2 or more) — Using the simple overlap match, Kevin has a correlation to the engineering group of:

> Intersection of Kevin’s Tags with the engineering Community Tags == 2 (html, ruby) Minimum of Kevin’s Tags or engineering Community Tags == 3 (from the engineering community) 2/3 = .67

If Kevin also tags himself “coder” — he’d have a correlation of “1”

All well and good right? Well, I’m not sure the simple binary overlap is the best way to go here.

## Modified Matching {#modified-matching}

I feel like we have to take into account a more majority intersection of the members of the community — but without weighting the results of a match toward larger communities (in fact, the opposite, letting folks find smaller communities more easily). That is, if a designer community has 100 members — and 90 of those members have the ‘html’ tag — but only 2 of those members of the community have the ‘ilovemarkup’ tag. My match to the community should be weighted more by the ‘html’ tag than the ‘ilovemarkup’ tag. But it has to be a percentage base, I think. If the engineering group has 10 members — and nine members of the community have the ‘html’ tag — that’s as good a match as the designer community (for that tag and person)

So — what’s the implementation of this? Well essentially the intersection in the simple binary overlap is the summation of the matching tags, where each match is given the value of “1” — so in order to take into account the relative weight of the tags, you add the percentages of the members of the community having said tag.

Again, I’m sure there’s some fancy name for this — and this idea is in [that huge list][6] (or it’s completely flawed and not in someone’s list). But I’m not sure, my eyes starting glazing over at 11pm trying to read the details of “Levenshtein Distance” and I couldn’t make it any further 🙂

Anyway, back to our original example, engineering tags (>= 2, frequency listed)

> html(2) ruby(3) coder(2)

Kevin tags:

> [wheresmyiphone][5] html ruby thoughtleader ilovemarkup

Correlation:

> html (.67) + ruby (1) / min tag count (3) = .56

If Kevin tags himself “coder” then the correlation is:

> html(.67) + ruby (1) + coder(.67) / 3 = .78

Probably a pretty good match. What about a designer community of 100 people with the following tags?

> html(90) designer(100) ilovehaml(5) thoughtleader(80)

With a straight binary overlap, Kevin would have a .75 correlation (matching 3 of the community’s 4 tags) — but with the weighted correlation, he’d have a correlation of (.44) Which seems more accurate within the context of all of the members of the community.

So, essentially, the algorithm seems to reward:

  * homogeneity of the tags of the membership — at least clustered around a set of core tags
  * smaller groups (or at least more diversity with smaller groups)

Which seems to generally be the right thing to do when pulling groups of people together, smaller teams function better than larger teams. Although, the real science is later trying to deal with tag clusters and trying to get some heterogeneity around core connecting members (or a member interest in this case). But that’s beyond my simple positive correlation recommendation here.

Anyway, if you made it this far? How does this sound for you? Better options? Too complex? Really not complex enough?

 [1]: http://twitter.com/chillnc
 [2]: http://blog.robinsonhouse.com/
 [3]: http://twitter.com/ahundley
 [4]: http://blog.k1v1n.com
 [5]: http://twitter.com/k1v1n/statuses/766262281
 [6]: http://www.dcs.shef.ac.uk/~sam/stringmetrics.html
 [7]: http://www.dcs.shef.ac.uk/~sam/stringmetrics.html#overlap