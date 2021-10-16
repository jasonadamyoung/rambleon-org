---
title: Man, I like good framworks
author: jay
type: post
date: 2007-01-10T03:17:52+00:00
url: /2007/01/10/man-i-like-good-framworks/
categories:
  - Uncategorized
tags:
  - ruby

---
In the end it’s all code — but this is the first time I’ve done this and I just think this is the coolest thing that I don’t have to futz with this.

(and by the way, being able to test this in a _console_ — great stuff)

 <code class="highlighter-rouge">$ script/console Loading development environment. &gt;&gt; newposition = Position.new =&gt; #&lt;Position:0x25489f8 @attributes={"name"=&gt;"", "entrytype"=&gt;0}, @new_record=true&gt; &gt;&gt; getuser = User.find_by_login("jayoung") =&gt; #&lt;User:0x2540668 @attributes={_...da-da-da..._}&gt; &gt;&gt; getuser.position = newposition =&gt; #&lt;Position:0x25489f8 @attributes={"name"=&gt;"", "entrytype"=&gt;0}, @new_record=true&gt; &gt;&gt; getuser.save =&gt; true </code>

And the fact that it saves newposition too. This is good stuff