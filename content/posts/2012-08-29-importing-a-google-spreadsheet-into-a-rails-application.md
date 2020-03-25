---
title: Importing A Google Spreadsheet Into A Rails Application
author: jay
type: post
date: 2012-08-29T02:51:00+00:00
url: /2012/08/29/importing-a-google-spreadsheet-into-a-rails-application/
categories:
  - Reflections

---
Recently at work I have been [updating an application][1] that provides a [listing service for Extension professional development opportunities][2] in order to facilitate some of the application’s features to be used for our [upcoming conference][3] (the application is typically geared toward interactive online sessions).

I work best in applications when I have real data to work with, and not a bunch of automatically generated “Lorem Ipsum” data. That’s why, as part of my development, I operate on copies of live data for pretty much every application I work with (which fortunately, other than a few transmogrifications like dumping passwords, we can do with our data). I even [added an option][4] to the [tool a colleague and I wrote][5] to post our deploys to a [central deployment monitor][6] to facilitate the data download.

So, I wanted real data to work with for our sessions. Fortunately, a few days ago, one of my colleagues sent out the sessions in a spreadsheet, which I spent a few hours reformatting and dumping to a csv &#8211; and then [importing that data][7] into the application.

But after doing all that work, on data that wasn’t yet fully complete (I didn’t yet have descriptions, or all the presenters in the data) &#8211; I realized that was going to be a continued pain in the ass to keep updating my translation of that data, dumping to csv, adding to the seeds, or wherever I would do a File.open on it &#8211; to keep it updated to when this actually gets deployed in production (after which it can just be updated in the application).

To be sure, there has to be a better way™ (I’m hereby trademarking this phrase because it is the muse for every podunk Dev/Ops/DevOps innovation ever, and should be a repeated mantra for all of us).

And it turns out there is. [Publishing Google Spreadsheets to the web][8].

By publishing [my import spreadsheet][9] to the web &#8211; and using the csv output:

![image][10]

I can then [import it][11] at will (if you look close, you’ll see it’s only a one time thing, there’s no provision for a unique key in this particular data set to do a find\_or\_create on import &#8211; but the source data on this is only 4MB &#8211; so I’m constantly doing a <code class="highlighter-rouge">capatross getdata</code> <code class="highlighter-rouge">rake db:migrate</code> <code class="highlighter-rouge">ruby importer.rb nexc_import</code>) as needed.

In theory, updating the spreadsheet can now be crowdsourced among our staff. In practicality &#8211; probably not, but at least I can stop exporting, committing, and then running scripts on it any time a change is made.

 [1]: https://github.com/extension/learn/commits/development
 [2]: http://learn.extension.org/
 [3]: http://nexc2012.extension.org/
 [4]: https://github.com/extension/capatross/commit/4478c14d10ceec6898214bce1df6b158bd005bc2
 [5]: https://github.com/extension/capatross
 [6]: https://github.com/extension/albatross
 [7]: https://github.com/extension/learn/blob/development/app/models/conference.rb#L101
 [8]: http://support.google.com/docs/bin/answer.py?hl=en&answer=37579
 [9]: https://docs.google.com/a/extension.org/spreadsheet/pub?key=0AiKHgDf9UwV6dEd4WW5fb2tpc0paV3h5bmJ2TkV2Mmc&single=true&gid=0&output=html
 [10]: https://photos.smugmug.com/photos/i-cdhQtfn/0/L/i-cdhQtfn-L.jpg
 [11]: https://github.com/extension/learn/blob/development/script/importer.rb