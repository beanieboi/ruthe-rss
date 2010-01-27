#!/usr/bin/env ruby

require 'rubygems'
require 'hpricot'
require 'open-uri'

stats_file = "~/skripte/ruthe/ruthe_bilder.txt"

doc = Hpricot(URI.parse("http://ruthe.de/frontend/index.php").read)

cartoon_url = doc.search("//img[@alt='Cartoon']").first.attributes['src']
cartoon_number = cartoon_url.split(".").first.split("_").last.to_i

line = "#{Time.now.tv_sec}|#{cartoon_number}\n"

last_line = `tail -n 1 #{stats_file}`
last_number = last_line.split("|").last.to_i

File.open(stats_file, 'a') { |f| f.write(line) } if cartoon_number != last_number
