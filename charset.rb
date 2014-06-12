# -*- coding: utf-8 -*-
require 'open-uri'
require 'nokogiri'

def before(url)
	io = URI.parse(url).read
	Nokogiri(io)
end

def after(url)
	io = URI.parse(url).read
	charset = io.scan(/charset="?([^\s"]*)/i).flatten.inject(Hash.new{0}){|a, b|
		a[b]+=1
		a
	}.to_a.sort_by{|a|
		a[1]
	}.reverse.first[0]
	Nokogiri(io, url, charset)
end

puts 'before'
p before('http://www.nicovideo.jp/watch/1297306177').at('title').content

puts 'after'
p after('http://www.nicovideo.jp/watch/1297306177').at('title').content
