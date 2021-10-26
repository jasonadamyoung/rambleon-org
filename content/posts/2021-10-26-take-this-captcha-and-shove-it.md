---
title: "Take This Captcha and Shove It"
date: 2021-10-26T12:39:10-04:00
author: jay
type: post
url: /2021/10/26/take-this-captcha-and-shove-it/
categories:
  - Reflections
---

This is my 40th month that I've been hosting my hobby websites at Digital Ocean.

It's also my last.

I've actually had an account with them for 8 _years_ now - but consolidated my hobby sites from various places around the internet and began hosting with them in earnest in July of 2018.  

Two thousand, four-hundred twelve dollars and twenty-three cents ($2,412.23) later, an average of $60 a month to run a rails application and a blog in Kubernetes because I could. Not that I should, but I could. And I learned a lot.

I also learned that there comes a time that you have to take a principled stand - even sometimes over the silliest of things - and vote with your dollars.

The service was great. I have no complaints at all about the hosting at all. Performance was fine, the uptime was great, the management console was well done.

If, that is, I could login to the management console.

For over two years, every... single... time... I tried to login to the management console - I got hit with **The Captcha**.

As I titled my support message to Digital Ocean Support in September, for the third time, **The miserable, horrible, no-good experience of the Digital Ocean Cloudflare Captcha.**

For the better part of that two years - my login experience went as follows:

Go to management console ( https://cloud.digitalocean.com/login )

![An unknown error has occurred](https://files.rambleon.org/images/2021/miserable-horrible-no-good-captcha.png "Getting ready for the miserable, horrible, no-good Digital Ocean Captcha")

1. Attempt to login with email/password.
2. Get an error: An unknown error has occurred. Please try your request again. If the problem persists contact support.
3. Get redirected to: https://cloud.digitalocean.com/graphql/public/test?challenge=/login
4. Get presented with the Cloudflare hCaptcha
5. Solve the captcha (matching of a bus, truck, boat or plane)
6. Solve the second captcha
7. Get redirected back to another captcha presentation
8. Solve the captcha
9. Solve the second captcha
10. Get redirected back to login, where I can sign in with password and 2FA code

Every Single Time - Firefox, Safari, and Chrome all.

I've sent three very vociferously whiny support tickets in since December of 2019, with all the Cloudflare Ray ID's and HAR files and all the troubleshooting steps that Support asked about - and it hasn't really gone anywhere. Support tried to help. But this is an Engineering decision. And Engineering didn't care. In the last whiny message, I asked that they make the CTO and CISO do this every time, and see how long that lasted. At least, I hope that made someone laugh.

The last mitigation was to install [Privacy Pass](https://privacypass.github.io/) which mitigated the issue the last 4 times (drawing "passes" down) - I avoided the Captcha but had to login twice.

My last support ticket 6 days I asked Support not to troubleshoot - but merely to tell Engineering that I was gone. Not that it mattered, but the Captcha drove this customer away.

I empathize with Digital Ocean Engineering and Security here. Web login security is hard. And **The miserable, horrible, no-good Digital Ocean Cloudflare Captcha** has a place to reduce the login security threat of automated bots trying to crack login accounts. I get it.

But not every login, not four times every login, and double the logins.

Even Cloudflare is [please stop using this (and buy this other service we have)](https://blog.cloudflare.com/introducing-cryptographic-attestation-of-personhood/).

So I'm gone. I took two days, moved DNS, and moved all the hosting elsewhere ([Vultr](https://www.vultr.com) for the curious).

Goodbye Digital Ocean, it really wasn't me. It was definitely you (and Cloudflare).
