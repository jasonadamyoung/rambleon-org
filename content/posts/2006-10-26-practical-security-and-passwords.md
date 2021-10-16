---
title: Practical Security and passwords
author: jay
type: post
date: 2006-10-26T16:13:30+00:00
url: /2006/10/26/practical-security-and-passwords/
categories:
  - Reflections

---
I have a classic IT dilemma for your consideration and discussion, concerning (pseudo) “single sign on” and password security.

The question is driven by a real-life example — but do keep in mind that the question is bigger than the example.

We have an account registration and sign-up system in eXtension. The eXtensionID and password is used for most of all of our tools that require authentication in order to prevent a proliferation of accounts and passwords and improve the user experience with authentication. All our apps take a login/password themselves. Our Ruby on Rails apps use a key-based http-post-with-xml-response to a authentication application (sort of an XML RPC mechanism, but not standard). Other applications use an LDAP bind (mediawiki, jabber, and some PHP-based apps).

This, as you know, is “pseudo single sign-on” As you also know, most of the real single sign-on products are limited to a specific platform, language, or similar restrictive scope, or are rather complex. There’s hope with things like OpenID — but that’s as much about identity management as account management and while I think we are going there, it’s going to be a long time before each application catches up and supports OpenID — so you still have to have some passwords.

Single sign-on is a hard (really hard) problem, which is why nobody really does it. (not in environments like ours)

However, pseudo-single sign-on is easier, but creates the problem that a password is going to be jeopardized in some way. This “password jeopardy” actually prevents services from being rolled out out of security concerns. When I was in the College of Engineering at NCSU, we didn’t tie jabber and subversion to the campus Unity password for that very reason, which naturally kept those services from growing beyond a small group of people that could handle and track having more than one account and password. My limited understanding is that this has also been a concern about rolling out a campus-wide chat service at NCSU — because it would likely mean that a whole lot of users are suddenly saving their Unity password in their chat clients — and that’s a pretty big risk.

And while we have that problem in eXtension too (saving passwords in a chat client) — with our userbase, it was worth the risk. However, the “problem example” is that there are cool third-party services for chat — like the web-based Meebo application — which is a fantastic tool. But to use it means that the person is turning over his/her password to a third-party. And that is a security risk that I’m not sure is worth the pseudo single sign-on. How big of one is dependent on what the “account” can do and how good your tracking and audit systems are.

So given that kind of example (again treat it generically) here’s the discussion question.

I’ve personally always believed that the solution for this, given that single sign-on solutions don’t practically exist — is creating throw-away passwords for those services — managed centrally. You have a master password that in turn provides access to a tool that lets you manage a list of passwords (and usernames) for each service.

  * Wearing my security hat. I like it because it limits the scope of jeopardy. Getting the chat password only jeopardizes the chat service, etc. This also lets us roll out new services that don’t necessarily have to be “bulletproof” security-wise, because they aren’t having to take a master password Of course, I know that most would use the same password for everything. But at least I gave them a chance.

  * Wearing my support hat — this idea brings bad memories of multiple passwords and usernames. And of course, I know they are going to use the same password for everything, except for a handful that “get it” and possibly another handful that “try it” and get so completely confused they the create such a support burden that I would curse myself for ever trying it to begin with.

So — what do you think?