---
title: Good Grief People, stop with the local gems
author: jay
type: post
date: 2007-03-27T13:39:25+00:00
url: /2007/03/27/good-grief-people-stop-with-the-local-gems/
categories:
  - Uncategorized
tags:
  - ruby
  - sysadmin

---
From [Err The Blog: Vendor Everything][1]

For hosted environments? sure.

But if you are responsible for the application AND the server? (or your shop is?)

No.

Not just no. But HELL No. And I’d really like to write “HELL No” in an `<h1>` but I’m going to avoid that for the sake of sanity

I’ve yet to figure out why the rails community has this inbred desire to cause harm to their reputation in organizations that aren’t pure dev shops. I’m not even talking about the enterprise, I’m talking about small business, non-profits, companies they contract with, academic shops…

I don’t disagree with Chris’s reason here for using vendor for WayCoolFunkyGemThatYouThinkIsTheBeesKnees (WCFGTYTITBK) and not being “That Person” for breaking the build (and your peeps) is laudable. But really &#8211; I don’t buy it. If you are small Rails shop and you plan on using test/spec or any other WCFGTYTITBK &#8211; for goodness sake you communicate that with the rest of your team (hello? IM? email? even that ringy thing on the hip or desk we all hate to use?)

If you think that someone else’s code is so great that it ought to be in your application &#8211; well then it ought to be in everyone’s install too. Go get up and install it for them (take the train if you can’t fly there) That’s what good developers do. They have sane development environments set up and they are completely proficient at “gem install blah” &#8211; and makes them completely aware that a brand-new third-party dependency just showed up in the application. I dare say that “gem install blah” is a lot less intrusive than “why in the sam heck did 1000 lines of crap just show up in vendor &#8211; I evaluated that third-party code last month and it was crap then and is crap now”

Local copies of every gem is madness &#8211; especially gems that are core to your application (and would break builds) It creates situations where the whole team (and often the people that run the servers and are ultimately responsible for the application) is not fully aware of the dependency needs of the application. Let me repeat that again &#8211; EVERY DEVELOPER ON A SMALL TEAM SHOULD KNOW EXACTLY WHAT AN APPLICATION DEPENDS ON, WHAT VERSION, AND SHOULD TASK THEMSELVES WITH CHECKING UP ON THOSE VERSIONS.

One app? not a big deal either way. 5 or 6 apps running in the same environment? It’s a Big deal. (of course it’s probably a complete architectural failure to have your 5 person team working on 5 or 6 apps at the same time &#8211; but that’s another post)

We had pinned rails in our applications &#8211; at least until the “Upgrade Your Rails NOW NOW NOW” event &#8211; and going through multiple applications on multiple staging servers and multiple versions was a complete pain in the ass. Okay, so that’s a little hyperbolic &#8211; but it was more trouble than it needed to be. You upgrade the server &#8211; when you control the server and your application &#8211; and you know that that the dependencies are handled.

I had these arguments a few months ago with a developer that was contracting with us &#8211; and it was like imposing a little (certainly not anything like some waterfall corporate development shop) structure on the process (“Hey &#8211; tell us exactly why you are using edge rails so that we all understand the issues”) was like we were impeding progress (“no, we are trying to make sure we understand what you’ve done when you get bored with us”). I know that new software introductions are disruptive. But that’s what developers (and I’m counting myself here for the sake of that sentence) do. Things break, we tell others, and we fix them. (and some of my other colleagues think WE are the lack of planning ones &#8211; you have no idea)

While every application should have a definite lifecycle &#8211; you know, and I know, and everyone else knows that in many, many, many environments apps get written, and they live well beyond the developers, the systems people, and everyone else that every had any responsibility for it &#8211; and local copies of everything creates a maze of having to upgrade the third-party dependencies all over the place when some script kiddie decides to take advantage of that 2-year old failure to sanity check POST.

Rails developers have to start figuring out that someone beyond them is going to be responsible for inheriting what they’ve done &#8211; and they have to start thinking more seriously about dependencies, third-party code, add-ons, and the lifecycle of what they do. It’s like two-bytes for the year value all over again. Seriously people, no amount of “unit tests,” “syntactic sugar,” and vendor kung-foo will ever trump communication and documentation (I don’t mean constantly out-of-date systems analyst documentation &#8211; I mean documentation about decisions and why something was done, or why it was added, etc.)

 [1]: http://errtheblog.com/post/2120