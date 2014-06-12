require 'open-uri'
require 'nokogiri'

datafile = ARGV[0]
df = open(datafile, "r")


#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_31992&amp;ks=00101&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26737&amp;ks=00102&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26283&amp;ks=00102&amp;key2="

#i = 0
while line = df.gets
    uri = line
    doc = Nokogiri::HTML(open(uri),nil,"euc-jp")
    doc.css(".summary").each do |td|
	puts td.text
    end
end

df.close
