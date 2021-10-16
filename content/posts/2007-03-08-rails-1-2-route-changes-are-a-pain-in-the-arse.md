---
title: Rails 1.2 Route Changes Are a Pain in the Arse
author: jay
type: post
date: 2007-03-08T02:33:40+00:00
url: /2007/03/08/rails-1-2-route-changes-are-a-pain-in-the-arse/
categories:
  - Uncategorized
tags:
  - rails
  - ruby

---
So, the rails routing changes that have apparently happened in Rails 1.2? Yeah — not a fan.

Thankfully, last night, the night before we plan a production transition to Rails 1.2, we got spidered by crawlers looking for old, vulnerable copies of phpMyAdmin — they hit a systems testing server.

I don’t think I’ve ever said “thankfully” with regard to a spider ever. This is a first.

That generated well over a hundred emails — where Rails oops with:

<div class="highlighter-rouge">
  <pre class="highlight"><code>A ActionController::RoutingError occurred in application#index:      no route found to match "/whatever" with {:method=&gt;:get}</code></pre>
</div>

We were able to find some information about using a catchall route at the bottom of routes.rb:

<code class="highlighter-rouge">map.connect '*path', :controller =&gt; 'application', :action =&gt; 'show404', :requirements =&gt; { :path =&gt; /.*/ }</code>

With a happy little trees show404 method to show a 404.rhtml and return a 404.

This really isn’t the annoying part, I like the routes idea, I like how easy it is to fix this.

What I don’t like is that between Rails 1.1.6 (or even the “edge rails” for 1.2) and 1.2.x — the routing changed such that requests to URLs that are not handled with a default route (e.g. :controller/:action/:id) result, not in a nice, happy, proper “404 — Not Found” but the “500 Internal Error”

I’m sure that this can all devolve into semantics, but if the URL isn’t handled — return not found, don’t crash.