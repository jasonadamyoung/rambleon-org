---
title: Jabber, Aaaaaaugh
author: jay
type: post
date: 2004-11-17T10:15:38+00:00
url: /2004/11/17/jabber-aaaaaaugh/
categories:
  - Uncategorized
tags:
  - sysadmin

---
I spent a great deal of time this past Friday trying to debug what appeared to be a problem with AdiumX (really, libgaim) and our jabber server. I went way deeper than I should have, and ended up with absolutely no resolution to the problem. It basically turned out that somehow jabber’s “DIGEST-MD5” hash didn’t match AdiumX/libgaim’s DIGEST-MD5 hash and things just didn’t work, for me at least. Peeler and Billy, two of my co-workers worked fine. Oh well, I learned a lot about the Jabber server. Enough to be a backup for Josh.

( funny, AdiumX 0.72 came out today (er, yesterday) which includes libgaim 1.03 which includes a “Jabber Authentication Fix” — if it’s this one, it well may have been the problem I spent incredible amounts of time trying to track down, at least I learned a few things )

After trying this out after midnight and re-enabling sasl, either 1) this isn’t my problem or 2) its still broke or 3) I had some other problem, and testing with the 0.72beta — which had a debug menu that I needed — meant that it wasn’t broken before 0.72(beta) and is broken now.

Sigh.