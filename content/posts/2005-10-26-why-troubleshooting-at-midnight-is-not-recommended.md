---
title: Why Troubleshooting at midnight is not recommended
author: jay
type: post
date: 2005-10-26T04:42:26+00:00
url: /2005/10/26/why-troubleshooting-at-midnight-is-not-recommended/
categories:
  - Reflections

---
Note to self:

When switching your smtp service from sendmail to postfix, shutdown sendmail.

It’s rather helpful to do so. Else you’ll spend the next hour trying to figure out why postfix isn’t accepting connections. Especially when you ignore the output of ‘netstat -tlp’ and that the banner for the sendmail service locally lists sendmail and not postfix.