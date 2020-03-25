---
title: Mail.app AND Search Annoyances
author: jay
type: post
date: 2005-09-14T01:24:03+00:00
url: /2005/09/14/mail-app-and-search-annoyances/
categories:
  - Uncategorized
tags:
  - sysadmin

---
I am rather frustrated with Mail.app &#8211; in fact, I’m pretty close to running Entourage (not really) just to get this feature:

![][1]

That is, the ability to search mail with different criteria &#8211; e.g. messages to/from a given person containing some term in the message body.

Mail’s spotlight search only lets you search on the Entire Message OR From OR To OR subject. Which is pretty annoying.

You **CAN** get multi-criteria searching by creating a “Smart Mailbox”

![][2]

But that’s not all that convenient in an Ad-Hoc search.

* * *

One nice thing that I did learn from searching in the Mail Help for, well, “searching” was that Spotlight in Mail (and Spotlight elsewhere) supports Boolean searches. However &#8211; the help is wrong &#8211; it references using the literal terms “and”, “or”, “not” And that’s wrong.

Apparently, at least with my limited testing “and” is assumed:

jason verbose => would find all messages matching the criteria selected containing “jason” AND “verbose”

<table>
  <tr>
    <td>
      jason
    </td>
    
    <td>
      verbose => would find all messages matching “jason” OR “verbose”
    </td>
  </tr>
</table>

jason &#8211; verbose = > would find all messages matching “jason” but NOT “verbose” (obviously an empty set)

I assume complex queries can be built with paranthesis.

The only confirmation of this I’ve found is a comment and link from [the Wikipedia Article on Spotlight][3]

It’s apparently undocumented from Apple.

 [1]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-f1668bf13b83926d3e2aca80348b0faf/entourage.png"
 [2]: //people.engr.ncsu.edu/jayoung/eweImages/binarypage/-f1668bf13b83926d3e2aca80348b0faf/smart.png"
 [3]: //en.wikipedia.org/wiki/Spotlight_(software)"