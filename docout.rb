#encoding: utf-8
require 'open-uri'
require 'nokogiri'

#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_31992&amp;ks=00101&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26202&amp;ks=00101&amp;key2="
#uri =  "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_26093&amp;ks=00101&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_28954&amp;ks=00101&amp;key2="
uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_27288&amp;ks=00102&amp;key2="
#uri = "https://vu8.sfc.keio.ac.jp/course2007/summary/syll_view.cgi?yc=2012_27375&amp;ks=00101&amp;key2="
doc = Nokogiri::HTML(open(uri),nil,"EUC-JP")
doc.css(".summary").each do |td|
    puts td.text
end
