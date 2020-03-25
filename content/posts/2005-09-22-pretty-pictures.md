---
title: Pretty Pictures
author: jay
type: post
date: 2005-09-22T21:57:11+00:00
url: /2005/09/22/pretty-pictures/
categories:
  - Reflections

---
Well, thanks to a comment from [A. J.][1] at UT-Knoxville &#8211; I know that my RHEL/Fedora problems under Virtual PC 7.0 are not only my own.

I have gotten [Ubuntu][2] installed. Only to have the X Configuration go wacky and produce screens that look more like fractals:

![][3]

than Gnome desktops. I’ve played with the /etc/X11/xorg.conf to no avail at the moment. Great abstract art generator though.

But hey &#8211; I’m further along there! (next I’ll try [suse][4])

**[update]** &#8211; Well, while I edited my xorg.conf file to remove the option to do 24 bit color, I failed to changed the “DefaultDepth” parameter (I think it’s a tad silly that you can set the DefaultDepth to an option not in the file, but that’s just me). Changing that gives me a rather happy ubuntu install. I was reminded to look at this from the [ubuntu wiki][5].

![][6]

For the record, the OpenSuse install appears to completely fail, but the only thing I tried there was booting off the cd &#8211; I’m not sure my cd image is even good.

 [1]: http://web.utk.edu/~ajw/
 [2]: http://www.ubuntulinux.org/
 [3]: http://people.engr.ncsu.edu/jayoung/eweImages/binarypage/-16d134aa8b3b1deef52bce5eb5cade6a/fractal_like.jpg
 [4]: http://www.opensuse.org/Welcome_to_openSUSE.org
 [5]: http://wiki.ubuntu.com/HowToConfigureUbuntuForMicrosoftVirtualPC2004
 [6]: http://people.engr.ncsu.edu/jayoung/eweImages/binarypage/-16d134aa8b3b1deef52bce5eb5cade6a/ubuntu.jpg