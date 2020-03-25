---
title: Notes on Development Installs
author: jay
type: post
date: 2012-07-23T01:31:00+00:00
url: /2012/07/23/notes-on-development-installs/
categories:
  - Reflections

---
Most of my colleagues and I on our engineering team for our initiative at work (a designer, software developer, sysadmin, and me &#8211; the wildcard draw four) just received new laptops last week, and Daniel (the sysadmin) and I have been putting together some instructions on setting up the development environment and software. We get to finally get them off Snow Leopard and onto Lion. Just in time for Mountain Lion.

I’ve been using my personal laptop for work ever since I started back, and that one had been done via a migration, so there’s years of built up tools and apps, so starting new gave me a chance to document all the apps I use for work (either free apps or ones I’ve bought)

## A note about our development {#a-note-about-our-development}

We are a primarily a Ruby on Rails shop for all our development &#8211; though we have a few WordPress/WordpresMU installs, and a Drupal install that is used as a content creation system for published content to www.extension.org (a Ruby on Rails app) and a content management system for administrative documents. You can see all our [projects in GitHub][1].

We follow a “develop local” model, all our apps have to work locally (this seems old hat now, but we were doing it before it was fashionable, and you’d be surprised/saddened at how many higher education shops develop “on the server”). We use [Pow][2] for serving the rails apps, and with one exception (me), most use [MAMP][3] for serving PHP and using MySQL. We are considering using [vagrant][4] and setting up an Ubuntu VM to match our server configuration, but aren’t there yet.

We deploy to either a demo or development server, and depending on the app, we may have a staging server as well. We use capistrano for deployment, even for our Drupal and WordPress deploys. We log deploys and announce them in our [campfire][5] chat room using an [add-on to capistrano][6] we wrote.

We use RVM to manage rubies and gemsets. I tried rbenv, and maybe it’s the sysadmin in me, but I didn’t like it as much &#8211; while I know there’s an add-on that does “gemsets” for rbenv, I like the native gemset support. I still think RVM is easier to get setup and going in a team, and [Jewelry Box][7] can make it even easier. Still, I’m definitely looking forward to [Tokaido][8].

That’s us in a snapshot, here’s our checklist for the system installs:

## Lion Notes {#lion-notes}

  * FileVault (full disk encryption) should be enabled, totally the right thing to do.
  * Natural scrolling is the default: you probably want to change this.
  * Apple doesn’t include Flash, which is a good thing for the most part, but you’ll probably need to install it for some things, like auto-tuned Dale Jr. videos

## SSH Notes {#ssh-notes}

Make sure to get your ssh keys (~/.ssh/id\_rsa and ~/.ssh/id\_rsa.pub) off your old macintosh (and copy the ssh key password from the keychain on your old Macintosh)

Add the following to your ~/.ssh/config file &#8211; this will help keep ssh connections open on remote networks, particularly wireless networks:

<div class="highlighter-rouge">
  <pre class="highlight"><code>Host *   ServerAliveInterval 120   ServerAliveCountMax 3  </code></pre>
</div>

## Getting your compile on {#getting-your-compile-on}

(steps numbered because order matters)

  1. [Download the OSX GCC Installer][9] (Prebuilt, 10.7 Lion)
  2. Install Xcode tools (version 4.3 from the Macintosh App Store) 
      * Install command line tools inside of Xcode

## Homebrew {#homebrew}

[Installation information][10]

Install the following (brew install _blah_)

  * wget
  * libxml2
  * libxslt
  * imagemagick
  * mysql

other optional installs

  * git
  * pv (useful for database refresh scripts)
  * r (will need gfortran)

## Getting your git on {#getting-your-git-on}

  * Use Apple’s distribution or install via brew
  * [Setup (GitHub’s instructions)][11]
  * [GitHub’s great GUI][12]

## RVM {#rvm}

[Installation information][13]

  * Need to have 1.9.3 and REE
  * per-app gemsets (<code class="highlighter-rouge">rvm use rubyversion@appname --create</code>)
  * create .rvmrc file in app directory (<code class="highlighter-rouge">rvm use rubyversion@appname --create</code>)
  * install bundler (unless you add it to the global gem set)
  * install powder (if not in the development block of the Gemfile already, which it should be)
  * Setup a proper build for nokogiri: <code class="highlighter-rouge">bundle config build.nokogiri --with-xml2-include=/usr/local/Cellar/libxml2/2.8.0/include/libxml2 --with-xml2-lib=/usr/local/Cellar/libxml2/2.8.0/lib --with-xslt-dir=/usr/local/Cellar/libxslt/1.1.26</code>
  * <code class="highlighter-rouge">bundle install</code>
  * [Jewelry Box][7] (gui for RVM)

## MAMP {#mamp}

[Download][3]

if using MAMP, use custom my.cnf (Applications/MAMP/conf/) to allow importinglarge db’s (darmok, create). Note: you will have to create this file, it doesnot already exist. Sample my.cnf and instructions on how to modify apache config to only listen on localhost &#8211; [Daniel’s gist][14]

Install the timezone tables:

<code class="highlighter-rouge">/Applications/MAMP/Library/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo/ | /Applications/MAMP/Library/bin/mysql -uroot -p mysql</code>

### Optional/Advanced: Brew MySQL Install {#optionaladvanced-brew-mysql-install}

Please note: means you have to do your own PHP environment somehow, alsodoesn’t include a database management tool &#8211; you’ll want something like[Querious][15] or [MySQL workbench][16]

  * <code class="highlighter-rouge">sudo mysql_install_db --verbose --user=_mysql --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp</code>
  * See [Superuser Thread for using the MySQL preference pane][17] with the brew install
  * Jason’s my.cnf for homebrew: <https://gist.github.com/3099049>
  * /usr/local/var/log/mysql/ and /usr/local/var/run/mysql/ need to be created and chown’d to _mysql

## POW {#pow}

[Installation information][2]

  * use powder gem to link the app (see RVM above)
  * powder open will open the default browser with “http://appname.dev”
  * Pow 0.4 now includes [an option][18] for accessing the app from other systems. (not yet explored by Jason and Daniel)

## Applications {#applications}

  * [Textmate][19]: Get license from Daniel 
      * Might want to go ahead and start with [Textmate 2.0][20]
  * [Skype][21]
  * Browsers 
      * [Chrome][22] (not yet optimized for Retina display)
      * [Firefox][23]
      * [Opera][24]
  * Browser plugins (please share your recommendations!): 
      * Safari: [Click to Plugin][25] (run #%@^^# flash on your own terms)
      * Safari/Chrome: Google [voice/video plugin for hangouts][26]
  * Microsoft Office &#8211; downloadable from NC State if you actually need it

## Jason’s List of other Useful Applications {#jasons-list-of-other-useful-applications}

### Macintosh App Store (MAS) {#macintosh-app-store-mas}

  * [Evernote][27]: (free &#8211; yearly service subscription available)
  * [Skitch][28]: (free)
  * [Patterns][29]: regex tool ($2.99)
  * [Growl][30]: ($1.99)
  * [HTTPClient][31]: debug HTTP requests in a GUI ($1.99)
  * [Reeder][32]: GREAT google reader “client” &#8211; also available for iOS ($4.99)
  * [Meme Generator][33]: (free)
  * [Pixelmator][34]: nice alternative to Photoshop ($$$) for simple things ($14.99)

### Other applications (may be available in MAS as well) {#other-applications-may-be-available-in-mas-as-well}

  * [Mailplane][35]: GREAT front-end for gmail ($24.99) (also in MAS)
  * [Alfred][36]: App Launcher (free, has $ addon) (also in MAS)
  * [Adium][37]: IM client (free) &#8211; see also [Xtras][38]
  * [Propane][39]: nice campfire client ($20)
  * [1Password][40]: GREAT password manager ($49.99) (also in MAS) particularly useful when combined with [Dropbox][41]
  * [Querious][15]: nice mysql management tool ($29)
  * [Tower][42]: nice git gui ($59 &#8211; I got it on sale, not sure I’d have leaped in at $59)
  * [Fluid][43]: create site-specific browsers (free/$4.99 gets extra features)
  * [RStudio][44]: GREAT front-end to R (makes using R approachable) (free) 
      * Note: if using brew version of r: <code class="highlighter-rouge">ln -s "/usr/local/Cellar/r/2.15.1/R.framework" /Library/Frameworks</code>

### Other tools {#other-tools}

  * Zsh (using “[Oh My Zsh][45]”)
  * [Pry][46]
  * Linking to dotfiles in dropbox

 [1]: https://github.com/extension
 [2]: http://pow.cx/
 [3]: http://www.mamp.info/en/index.html
 [4]: http://vagrantup.com/
 [5]: http://campfirenow.com/
 [6]: https://github.com/extension/capatross
 [7]: http://unfiniti.com/software/mac/jewelrybox/
 [8]: http://www.kickstarter.com/projects/1397300529/railsapp
 [9]: https://github.com/kennethreitz/osx-gcc-installer
 [10]: https://github.com/mxcl/homebrew/wiki/installation
 [11]: https://help.github.com/articles/set-up-git
 [12]: http://mac.github.com/
 [13]: https://rvm.io//rvm/install/
 [14]: https://gist.github.com/44b14d3602f05ff91760/9efa244f97c0eae2f093616026125ee807d909ab
 [15]: http://www.araelium.com/querious/
 [16]: http://www.mysql.com/products/workbench/
 [17]: http://superuser.com/questions/289491/mysql-preference-pane-control-for-mysql-installed-via-homebrew
 [18]: http://pow.cx/manual.html#section_2.1.5
 [19]: http://macromates.com/
 [20]: http://blog.macromates.com/2011/textmate-2-0-alpha/
 [21]: http://skype.com
 [22]: https://www.google.com/intl/en/chrome/
 [23]: http://www.mozilla.org/en-US/firefox/new/
 [24]: http://www.opera.com/
 [25]: http://hoyois.github.com/safariextensions/clicktoplugin/
 [26]: http://www.google.com/tools/dlpage/res/talkvideo/hangouts/
 [27]: http://itunes.apple.com/app/evernote/id406056744?mt=12
 [28]: http://itunes.apple.com/app/skitch/id425955336?mt=12
 [29]: http://itunes.apple.com/us/app/patterns-the-regex-app/id429449079?mt=12
 [30]: http://itunes.apple.com/us/app/growl/id467939042?mt=12&ign-mpt=uo%3D4
 [31]: http://itunes.apple.com/us/app/http-client/id418138339?mt=12
 [32]: http://itunes.apple.com/us/app/reeder/id439845554?mt=12&ls=1
 [33]: http://itunes.apple.com/app/meme-generator/id483350546?mt=12
 [34]: http://itunes.apple.com/us/app/pixelmator/id407963104?mt=12&ls=1
 [35]: http://mailplaneapp.com/
 [36]: http://www.alfredapp.com/
 [37]: http://adium.im/
 [38]: http://xtras.adium.im/
 [39]: http://propaneapp.com/
 [40]: https://agilebits.com/onepassword
 [41]: https://www.dropbox.com/
 [42]: http://www.git-tower.com/
 [43]: http://fluidapp.com/
 [44]: http://www.rstudio.org/
 [45]: https://github.com/robbyrussell/oh-my-zsh/
 [46]: http://pryrepl.org/