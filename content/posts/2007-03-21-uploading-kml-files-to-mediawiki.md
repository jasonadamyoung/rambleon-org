---
title: Uploading KML files to MediaWiki
author: jay
type: post
date: 2007-03-21T15:55:44+00:00
url: /2007/03/21/uploading-kml-files-to-mediawiki/
categories:
  - Uncategorized
tags:
  - sysadmin

---
So you want to upload [KML][1] files to your MediaWiki install? Simple as putting ‘kml’ in your allowed file extensions right?

Wrong.

Through the almighty power of a string match that’s not actually a regular expression, but instead a <code class="highlighter-rouge">strpos</code> match in the <code class="highlighter-rouge">SpecialUpload:detectScript</code> function (yes, that’s right, a <code class="highlighter-rouge">strpos</code> match, not a <code class="highlighter-rouge">stripos</code> match — but a strtolower takes care of that a few lines before — that’s probably faster anyway).

The <code class="highlighter-rouge">strpos</code> looks for <code class="highlighter-rouge">&lt;head</code> in the chunk o’ text that’s in the uploaded file — which of course matches the KML [heading][2] tag — producing a detectScript match

Yes, one could modify the function in MediaWiki to handle KML file uploads — pulling <code class="highlighter-rouge">&lt;head</code> out of the following code block:

<div class="highlighter-rouge">
  <pre class="highlight"><code>		$tags = array(			'&lt;span class="nt">&lt;body&lt;/span>&lt;span class="err">',&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">head&lt;/span>&lt;span class="err">',&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">html&lt;/span>&lt;span class="err">',&lt;/span>   &lt;span class="err">#&lt;/span>&lt;span class="na">also&lt;/span> &lt;span class="na">in&lt;/span> &lt;span class="na">safari&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">img&lt;/span>&lt;span class="err">',&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">pre&lt;/span>&lt;span class="err">',&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">script&lt;/span>&lt;span class="err">',&lt;/span> &lt;span class="err">#&lt;/span>&lt;span class="na">also&lt;/span> &lt;span class="na">in&lt;/span> &lt;span class="na">safari&lt;/span>			&lt;span class="err">'&lt;&lt;/span>&lt;span class="na">table&lt;/span>&lt;span class="err">'&lt;/span>			&lt;span class="err">);&lt;/span>		&lt;span class="na">if&lt;/span>&lt;span class="err">(&lt;/span> &lt;span class="err">!&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">wgAllowTitlesInSVG&lt;/span> &lt;span class="err">&&&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">extension&lt;/span> &lt;span class="err">!==&lt;/span> &lt;span class="err">'&lt;/span>&lt;span class="na">svg&lt;/span>&lt;span class="err">'&lt;/span> &lt;span class="err">&&&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">mime&lt;/span> &lt;span class="err">!==&lt;/span> &lt;span class="err">'&lt;/span>&lt;span class="na">image&lt;/span>&lt;span class="err">/&lt;/span>&lt;span class="na">svg&lt;/span>&lt;span class="err">'&lt;/span> &lt;span class="err">)&lt;/span> &lt;span class="err">{&lt;/span>			&lt;span class="err">$&lt;/span>&lt;span class="na">tags&lt;/span>&lt;span class="err">[]&lt;/span> &lt;span class="err">=&lt;/span> &lt;span class="err">'&lt;&lt;/span>&lt;span class="na">title&lt;/span>&lt;span class="err">';&lt;/span>		&lt;span class="err">}&lt;/span>    		&lt;span class="na">foreach&lt;/span>&lt;span class="err">(&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">tags&lt;/span> &lt;span class="na">as&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">tag&lt;/span> &lt;span class="err">)&lt;/span> &lt;span class="err">{&lt;/span>			&lt;span class="na">if&lt;/span>&lt;span class="err">(&lt;/span> &lt;span class="na">false&lt;/span> &lt;span class="err">!==&lt;/span> &lt;span class="na">strpos&lt;/span>&lt;span class="err">(&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">chunk&lt;/span>&lt;span class="err">,&lt;/span> &lt;span class="err">$&lt;/span>&lt;span class="na">tag&lt;/span> &lt;span class="err">)&lt;/span> &lt;span class="err">)&lt;/span> &lt;span class="err">{&lt;/span>				&lt;span class="na">return&lt;/span> &lt;span class="na">true&lt;/span>&lt;span class="err">;&lt;/span>			&lt;span class="err">}&lt;/span>		&lt;span class="err">}&lt;/span></code></pre>
</div>

And then writing a regex to match <code class="highlighter-rouge">&lt;head</code> and not <code class="highlighter-rouge">&lt;heading</code>

Which is certainly do-able due to the beauty of open-source software(*) But thankfully (very thankfully) there’s a [KMZ][3] (scroll down) format. Which should upload just fine with just a file extension addition. (And the bonus is that it’s far more feature-rich to use.)

(* which, of course, making custom local modifications to your open-source software packages that don’t merit patch submissions back to the package authors is a whole other discussion topic, look for the future post and/or Conversations with Plastic Dinosaurs about being on the hook to maintain custom changes change for any and all future updates to the open-source software packages you use, which inevitably, you’ll forget you made, and then you’ll upgrade, and you’ll break expected functionality, which won’t be noticed for months after you’ve forgotten you ever even upgraded, at which point someone will complain, memos will be written, you’ll get blamed, you’ll bitch about getting blamed, everyone but you, given that you actually do the work, will promise not to forget about it again, which you’ll promptly do six months and thousands of tasks later on the next upgrade. Lather, Rinse, Repeat. )

 [1]: http://en.wikipedia.org/wiki/Keyhole_Markup_Language
 [2]: http://earth.google.com/kml/kml_tags_21.html#heading
 [3]: http://earth.google.com/kml/kml_21tutorial.html#models