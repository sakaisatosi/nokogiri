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

re = /.+2012_(\d{5})/
uid = []
j = 0
uri.each{|var|
    url = var
    
    if url =~ re
	uid[j] = $1
    end
    
    doc = Nokogiri::HTML(open(url),nil,"EUC-JP")

    outFileName = uid[j].to_s + ".txt"
    File.open(outFileName,"w"){|f|
	doc.css(".summary").each do |td|
	    f.write td.text
        end
    }
    j += 1
}


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
