---
title: Frustrating UX Design At Twitter
author: jay
type: post
date: 2012-08-29T03:55:00+00:00
url: /2012/08/29/frustrating-ux-design-at-twitter/
categories:
  - Reflections

---
Like any self-respecting web developer, I’m pretty pissed at Twitter right now.

No, it’s not about that whole API thing where they are intent on becoming the next Compuserve.

It’s about what has to be the most idiotic settings page user experience I’ve had in a long, long time. (I’m just going to ignore that checkbox in my own application that didn’t do anything for about 3 years that I discovered last week)

About a week and half ago, in a bit of snit, I decided to “protect my tweets”

Through no fault of Twitter’s — I’m using 1Password for my twitter password. When you change your twitter settings, — it presents a javascript modal to provide your password. Unfortunately, the by-product of this was to enter my username in the email field which was then submitted along with the “checkbox” for Protect My Tweets, which then submitted the email as “jasonadamyoung” — which came back from Twitter as “This email is invalid” — but then Twitter in their UX brilliance, didn’t show “jasonadamyoung” in the email field (which it would have dawned on me as invalid) — it showed me my email address.

I took this as some Fail Whale event on twitter’s part at the time. I ended up working around it by managing to change my email to another email address and then cancel the confirmation of changing it.

Tonight, I decide to change the setting back, and finally — after multiple “this email is invalid” — both from the AJAX email lookup — plus the form submissions, managed to realize that 1Password was the likely culprit.

Only now, I want to check the setting off on my Twitter stream — and WHILE NOT CHANGING ANY OTHER SETTTING — I get this:

![image][1]

or “Sorry, but you’ve reached your limit on email updates for now.”

And I can’t change a single setting.

Clearly, I understand they’ve implemented the settings as a “change ALL THE THINGS” kind of deal. I pretty sure I have more than one of these in my own apps with far worse error messages. But I’m not Twitter, I’m not raking in millions in revenue, I’m not hundreds of employees strong. I’m not what is like thousands and tens of thousands of settings changes a day.

And while I probably should take some solace that even the bigco’s get it wrong too? I don’t. I just want to change a single setting, and it makes me curse Twitter like you wouldn’t believe. Okay, you’d probably believe it.

 [1]: https://photos.smugmug.com/photos/i-VkpgJqC/0/L/i-VkpgJqC-L.jpg