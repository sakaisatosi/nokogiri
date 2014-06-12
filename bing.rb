#encoding:utf-8
require 'nokogiri'
require 'open-uri'
require 'readline'

#p "検索したい語を入力してください"

#key = Readline.readline

$key='html'

# bingのURL
uri = "http://www.bing.com/search?q=" + $key + "&go=&qs=HS&form=QBLH&filt=all&pq=&sc=8-0&sp=2&sk=HS1"

charset = ""

# リンク先のページを解析する関数
def after(url)
    io = URI.parse(url).read
    charset = io.scan(/charset="?([^\s"]*)"/i).flatten.inject(Hash.new{0}){|a, b|
	a[b] += 1
	a
    }.to_a.sort_by{|a|
	a[1]
    }.reverse.first[0]
    a_doc = Nokogiri(io, url, charset)

    p charset
    p a_doc
=begin
    # 文字コード設定
    case charset.upcase
    when UTF-8 then
	code = u
    when EUC-JP then
	code = e
    when SHIFT-JIS then
	code = s
    else
	p "charset エラー"
    end
=end	



    # 定義文のパターン
    #naihou = /(#{$key}.+?である)/
    naihou = /(#{$key}.+?できる)/
    
#    pattern = Regexp.new("である", nil, "s")

    # パターンとの照合
    if l = naihou.match(a_doc)
	p l[1]
	#p l
    end
end

# bingにあるリンクをたどる
doc = Nokogiri::HTML(open(uri),nil,"utf-8")
doc.css("h3 > a").each do |link|
    a_url = link["href"] # a_urlはbingのページにあるリンク
    after(a_url)
end
