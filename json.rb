require 'json'
require 'open-uri'
require 'nokogiri'




f = open("syllabus.json","r")
fr = f.read
hash = JSON.parse(fr)

for i in 0..180 do
    p hash[i]["syllabus_url"]#,hash[i]["lecturer"]
end


