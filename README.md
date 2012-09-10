Create RSS-Feed for Ruthe.de
============================

ruthe.rb
--------

Fetches and parses Ruthe.de website and stores timestamp
and current comic number in a state file

ruthe_rss.rb
------------

Reads state file and generates RSS feed out of it.

By default, the RSS feed is written to `ruthe.xml`.

### Commandline Options

* `-o <filename>`: Write RSS feed to `<filename>` instead of `ruthe.xml`

* `-o -`: Write RSS feed to standard output instead of
  `ruthe.xml`. Useful when called by RSS feed readers which can read
  feeds by calling scripts like Liferea.

* `-f`: Fetch data from website before generating the RSS feed.

ruthe_bilder.txt
----------------

State file

ruthe.xml
---------

Default name for the generated RSS feed.


Requirements
============

* Ruby
  * Nokogiri
  * RSS Maker

Usage with Liferea
==================

I suggest to create a subdirectory `scripts` in your `.liferea_…`
folder to store feed generating scripts like this. Examples below for
Liferea 1.8. Adapt version number in paths as necessary.

   mkdir ~/.liferea_1.8/scripts
   cd ~/.liferea_1.8/scripts
   git clone git://github.com/xtaran/ruthe-rss.git

Then create a new subscription in Liferea with the source type "command". Enter

    ~/.liferea_1.8/scripts/ruthe_rss.rb -o - -f

as command. Liferea should show today's comics as sole entry for the feed.
