---
title: Lightroom Direct Positive
author: jay
type: post
date: 2007-02-23T00:34:19+00:00
url: /2007/02/23/lightroom-direct-positive/
categories:
  - photography
tags:
  - lightroom

---
I had the opportunity to go to lunch with [Ben][1] and [James][2] earlier this week and for the first time in recent memory, our lunch conversation was actually _not_ about work. Instead we talked for a bit about Photography.

There was curiosity about what the “Direct Positive” settings did that I mentioned for this photo:

![][3]

We talked for a little bit about post-processed manipulation and similar. I did more post-processing (which consisted of mainly playing with Lightroom’s develop settings) than I think I ever really have. I was basically just playing — but I liked how the “Direct Positive” effect looked on that particular photo.

I wasn’t exactly sure what all it did — here’s the original: ![][4]

It’s underexposed because of the -1EV setting — and a bit washed out — so that’s probably why the saturation settings took so well. I’ve see shots that look like the “Direct Positive” shot before online and in a number of magazines. I’m not exactly how you’d ever pull that off in camera. So I assume there was also some manipulation of things.

Here’s a shot of the Before/After split in Lightroom: ![][5]

And for the curious — you can actually see the EXACT settings that the preset does (this is so cool for the software geek in me). I’ve seen mention that Lightroom uses [Lua][6] for it’s interface — so I’m guessing this might be a Lua structure/hash.

From: <code class="highlighter-rouge">~/Library/Application Support/Adobe/Lightroom/Develop Presets/Direct Positive.lrtemplate</code>

<div class="highlighter-rouge">
  <pre class="highlight"><code>s = {       title = ZSTR "$$$/AgDevelopModule/Templates/DirectPositive=Direct Positive",       internalName = "DirectPositive",       type = "Develop",       value = {               settings = {                       AutoBrightness = false,                       AutoContrast = false,                       AutoExposure = false,                       AutoShadows = false,                       AutoTone = false,                       Brightness = 0,                       Contrast = 0,                       ConvertToGrayscale = false,                       Exposure = 1.15,                       FillLight = 0,                       HighlightRecovery = 25,                       HueAdjustmentBlues = 0,                       HueAdjustmentCyans = 0,                       HueAdjustmentGreens = 0,                       HueAdjustmentMagentas = 0,                       HueAdjustmentReds = 0,                       HueAdjustmentYellows = 0,                       LuminanceAdjustmentBlues = 0,                       LuminanceAdjustmentCyans = 0,                       LuminanceAdjustmentGreens = 0,                       LuminanceAdjustmentMagentas = 0,                       LuminanceAdjustmentReds = 0,                       LuminanceAdjustmentYellows = 0,                       Saturation = 0,                       SaturationAdjustmentBlues = 55,                       SaturationAdjustmentCyans = 75,                       SaturationAdjustmentGreens = 0,                       SaturationAdjustmentMagentas = 0,                       SaturationAdjustmentReds = 0,                       SaturationAdjustmentYellows = 25,                       Shadows = 14,                       SplitToningHighlightHue = 0,                       SplitToningHighlightSaturation = 0,                       SplitToningShadowHue = 0,                       SplitToningShadowSaturation = 0,                       ToneCurve = {                               0,                               0,                               255,                               255,                       },                       ParametricDarks = -20,                       ParametricHighlightSplit = 75,                       ParametricHighlights = 60,                       ParametricLights = 10,                       ParametricMidtoneSplit = 50,                       ParametricShadowSplit = 25,                       ParametricShadows = -60,                       Vibrance = 0,                       WhiteBalance = "As Shot",               },               uuid = "5410FFE9-3355-4A55-A1A5-582782F72BC5",       },       version = 3,}</code></pre>
</div>

Basically — a kick up of the exposure and highlight recovery — and a lot of saturation settings (plus a change in the tone curve). This is a really cool way to pass around and apply settings.

 [1]: http://www.trixieupdate.com/
 [2]: http://robinsonhouse.com
 [3]: https://photos.smugmug.com/photos/826594004_Cd9yB-O.jpg
 [4]: https://photos.smugmug.com/photos/826594016_TyuSY-O.jpg
 [5]: https://photos.smugmug.com/photos/826594032_F8XoK-O.jpg
 [6]: http://en.wikipedia.org/wiki/Lua_%28programming_language%29