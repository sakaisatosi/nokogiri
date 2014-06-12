#encoding: utf-8
require 'json'
require 'open-uri'
require 'nokogiri'

f = open("syllabus.json","r")
fr = f.read
hash = JSON.parse(fr)
uri = []
for i in 0..180 do
    uri[i] = hash[i]["syllabus_url"]
    #p uri[i]
end

#p uri

=begin
uri.each{|var|
    uri = var
    p uri
}
=end

uri.each{|var|
    url = var
    p doc = Nokogiri::HTML(open(url),nil,"EUC-JP")
#    doc.css(".summary").each do |td|
#	puts td.txt
#    end
}

#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_31992&amp;ks=00101&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26737&amp;ks=00102&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26283&amp;ks=00102&amp;key2="

#datafile = ARGV[0]
#df = open(datafile,"r")
#i = 0

=begin
while line = df.gets 
    uri = line
    doc = Nokogiri::HTML(open(uri),nil,"EUC-JP")
    doc.css(".summary").each do |td|
	puts td.txt
    end
    #p line
    #i += 1
end
df.close
=end

=begin
doc = Nokogiri::HTML(open(uri),nil,"EUC-JP")
doc.css(".summary").each do |td|
    puts td.text
end
=end
