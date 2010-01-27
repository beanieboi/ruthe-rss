#!/usr/bin/env ruby

require 'rss/maker'

version = "2.0" # ["0.9", "1.0", "2.0"]
destination = "~/public_html/ruthe.xml" # local file to write
stats_file = "~/skripte/ruthe/ruthe_bilder.txt"

content = RSS::Maker.make(version) do |m|
  m.channel.title = "Ruthe Bilder"
  m.channel.link = "http://www.ruthe.de"
  m.channel.description = "Ruthe Cartoon"
  m.items.do_sort = true # sort items by date

  file = File.open(stats_file)
  bilder = file.readlines

  bilder.reverse.first(20).each do |bild|
    time = bild.split("|").first.to_i
    cartoon_number = bild.split("|").last.to_i

    i = m.items.new_item
    i.title = "Ruthe #{cartoon_number}"
    i.link = "http://www.ruthe.de/"
    i.date = Time.at(time)
    i.content_encoded = "<img src='http://ruthe.de/frontend/cartoons/strip_#{cartoon_number}.jpg'>";
  end
end

File.open(destination,"w") do |f|
  f.write(content)
end
