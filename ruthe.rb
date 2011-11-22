#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

class RutheCartoon
  attr_reader :stats_file

  def initialize
    @stats_file = "./ruthe_bilder.txt"
  end

  def id
    url.split(".").first.split("_").last.to_i
  end

  def write
    line = "#{Time.now.tv_sec}|#{id}\n"
    last_line = last = File.open(@stats_file) { |f| f.extend(Enumerable).inject { |_,ln| ln } }
    last_number = last_line.split("|").last.to_i
    File.open(@stats_file, 'a') { |f| f.write(line) } if id != last_number
  end

  def url
    @url ||= doc.xpath("//img[@alt='Cartoon']").first.attributes['src'].value
  end

  def doc
    @doc ||= Nokogiri::HTML(open("http://ruthe.de/"))
  end
end

rc = RutheCartoon.new
rc.write