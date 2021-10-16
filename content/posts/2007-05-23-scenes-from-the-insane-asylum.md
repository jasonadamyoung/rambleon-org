---
title: Scenes from the Insane Asylum
author: jay
type: post
date: 2007-05-23T15:56:40+00:00
url: /2007/05/23/scenes-from-the-insane-asylum/
categories:
  - Uncategorized
tags:
  - sysadmin

---
Yet more fun from the ongoing series “This are the days of our lives of a system administrator” — today’s email (edited slightly for the blog):

* * *

Hi all,

Just to provide you far more information than you ever wanted to know about some of the login problems for a few of our services and the source of the @#$%@#%&%^ “500 Internal Server Errors” for our sourcecode repository.

Most of the staff can happily ignore this — and normally I wouldn’t even send this to the whole staff — there’s no impact really outside of just our few developers and possibly a few instant messaging users- but it might be vaguely educational or entertaining.

As you may or may not know, for reasons that seemed like grand ideas at the time (early last year) — our account management application writes usernames/encrypted passwords to two different db tables at the time accounts are created/enabled/passwords changed, etc. — One of these tables is a backend for openldap. openldap connects through a openldap-sql provider which connects through odbc to mysql.

Our sourcecode repository is using subversion which uses Apache for its various operations. In turn, we use the ldap authentication module for apache to authenticate against ldap.

If you are playing along with the whole version of the fairy tale/nursery rhyme home game here — that’s:

sourcecode reppository uses subversion which uses apache which uses mod\_auth\_ldap to connect to openldap which uses openldap-servers-sql which uses odbc which uses the mysql-odbc-connector to connect to mysql which uses a table managed by the account management application.

At this point, please feel free to conjure images of mice, clocks, and houses that Jack built.

All this does, by the way, is to provide for authentication for subversion, openfire (the IM server), and a few one-off applications — I don’t know if those one-off applications are at all used or live anymore — or if there’s an expectation they’ll be used again.

Any way — there seems to be a timeout or failed connections or mice or something somewhere between odbc and mysql.

What this is, I don’t know for sure. Google searches were singularly unhelpful. Most sane people it seems don’t use openldap-servers-sql

Well, according to the release notes for the mysql-odbc-connector there was a change in the mysql libs at some point that made it so it didn’t reconnect on dropped connections — and we may have crossed that maginot, er, mysqlodbc line with the move to Red Hat ELv5 — so there’s an option flag to mysql-odbc-connector to have it reconnect. mysql option flags are bit fields — and so when you enter the integer representation into the odbc configuration file — the magic auto-reconnect line is:

option = 4194304

Which if it works, shall hereafter be a special number, worthy of rewriting the lyrics to “Jenny” (four, six, nine, four three OH four-our-our-our) to sing it’s praises.

That’s the update on possible login issues and a semi-rare glimpse into various inner workings of services that we all would rather happily ignore — myself especially 🙂

p.s. In case you’ve ever wondered why it seems that I’m notoriously hesitant about the number of applications we run, or services we provide, it’s this “number of of moving parts” issue. Every application carries a dependency chain or matrix. Some of them are just normal OS/network dependencies that we all know and love. But many are like this one — chains of multiple independent software packages. Obviously, the more and more moving parts you introduce into a situation — either to patch/mitigate problems — or just “because you can” — the worse and worse it gets for trying to narrow down where problems can be. What just might surprise you is how many moving parts that “good ideas” and seemingly useful services can carry with it.

After you get a fair number of these individual dependency chains well, there are lots of great books written about Engineering disasters in history that are particularly applicable reading

p.p.s We have a lot more of these behind the scenes than anyone might imagine.