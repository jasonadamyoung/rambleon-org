---
title: A shout-out to Adobe
author: jay
type: post
date: 2009-05-17T18:12:56+00:00
url: /2009/05/17/a-shout-out-to-adobe/
tags:
  - adobe
  - apple preview bugs
  - pdf
  - process

---
I had a [couple of additional comments from Adobe staff][1] on the last blog post about the fun with Adobe Reader, etc.

On the borderline humorous note — I still think “now you see it, now you don’t” deserves some dance-beat slap-chop action.

My core point with the original post wasn’t supposed to be complaining about Adobe. Although, I ended up doing that. The core point that I originally set out to make is that there’s a lot of moving parts in these pieces of software. Problems manifest themselves in unexpected ways. And it’s frustrating all the way around — from the developers that write this stuff, to folks like me that have a fairly long history using tools like these, and doing my own development, to peers that are still supporting a user base that uses these tools. This time just happened to be a pretty dramatic visual indicator that was fun to poke fun at.

On the serious note, while the problem manifests itself within Acrobat and Adobe Reader — I think it’s safe to say that this is an Apple problem, not an Adobe problem. Maybe underneath there’s some missed email or missed technical meeting, or missed communication, or whatever that excuses what is most likely an incomplete Apple implementation, or maybe not — Apple got to the point it was “good enough for them” and shipped. I say this both from the comments from the John and Leonard, combined with being a long time OS X user, and I know how this goes.

To recount and add a better problem description (as John was right to point out : [“…descriptions of things that were done can sometimes obscure the question.”][2] ). I’m going to totally put words in John’s mouth and say my original problem description sucked. (In slight defense, I wasn’t reporting a problem, just the manifestation, but that’s not really germane).

The PDF file with the interactive forms, from what I can tell from the properties, was originally produced in [Adobe LifeCycle Designer 8.0][3] (which btw, I had never really heard of, I don’t run in the Adobe Enterprise software circles anymore, if I ever did). The file I received was likely “saved as” from Apple Preview. (The document properties show the PDF Producer as Mac OS 10.5.7 Quartz PDFContext). I’m still not real sure which of the modified options impacts the error message that I’ll need Acrobat (or Pro/Extended) to save the form with the fields filled in — but the save from Preview certainly impacts the original document properties on the PDF file. Going and finding an original, that wasn’t “saved as” from Preview and opening it in Reader doesn’t give an error that I can’t save the PDF with the forms filled in.

Original properties: ![Original PDF properties][4]

Modifed properties: ![Modified PDF Properties from Preview][5]

(p.s. Adobe — one nitpick — I don’t know how you coded that dialog box, but screen capturing that was a harder than it should have been, It was modal over every Reader window, and SnapzPro couldn’t get a handle on the window to just capture the dialog itself).

I’m going to completely accept [Leonard’s comment][6] as the basis for the “now you see it, now you don’t” error.

The bottom line seems to be this: If you expect in your organization to be able to produce, fill in, save, and roundtrip PDF files with interactive forms? **Do not use Apple’s Preview application.**

I really appreciate the Adobe staff for taking the time to comment on these posts. I know that getting the flack for what is most likely Somebody Else’s Problem here is frustrating. And I probably shouldn’t have reporting anything without really digging into the problem (again, I didn’t really care about the problem in and of itself).

Your comments say a lot about you, and what Adobe is encouraging here, and it makes advocates out of the rest of us for your process and your products. I certainly wanted to highlight that and set the record straight from my end.

 [1]: https://rambleon.org/2009/05/16/adobe-i-love-you-and-all-but-reader-not-so-much/#comments
 [2]: https://rambleon.org/2009/05/16/adobe-i-love-you-and-all-but-reader-not-so-much/#comment-348
 [3]: http://www.adobe.com/products/livecycle/designer/
 [4]: https://files.rambleon.org/images/2009/05/adobe-readerscreensnapz005.png (Original PDF properties)
 [5]: https://files.rambleon.org/images/2009/05/adobe-readerscreensnapz006.png (Modified PDF Properties from Preview)
 [6]: https://rambleon.org/2009/05/16/adobe-i-love-you-and-all-but-reader-not-so-much/#comment-350