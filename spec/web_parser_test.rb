#encoding: utf-8
require 'spec_helper'

#url = 'http://www.amazon.cn/s?url=search-alias=stripbooks&field-keywords=第五项修炼'
#puts books =  WebParser.extract_from_url(url,'amazon_search.template')

#url = 'http://www.amazon.cn/NLP%E8%87%AA%E6%88%91%E9%87%8D%E5%A1%91%E8%AE%A1%E5%88%92-21%E5%A4%A9%E5%A1%91%E9%80%A0%E5%85%A8%E6%96%B0%E8%87%AA%E6%88%91-%E6%9F%A5%E5%B0%94%E6%96%AF%C2%B7%E7%A6%8F%E5%85%8B%E7%BA%B3/dp/B001B666KA/ref=sr_1_1?s=books&ie=UTF8&qid=1309611401&sr=1-1'

#puts books =  WebParser.extract_from_url(url,'amazon.template')

#value = '作　　者：王迪诗 著'

#value = '（日）园田裕贵　著，丁明，吕嘉　译'

reg = /著[，]*((\xe4[\xb8-\xbf][\x80-\xbf]|[\xe5-\xe8][\x80-\xbf][\x80-\xbf]|\xe9[\x80-\xbd][\x80-\xbf]|\xe9\xbe[\x80-\xa5]|[a-zA-Z0-9_]|，|（|）)+).*译/

#puts reg.match(value)[1]

#=begin
url = 'http://product.dangdang.com/product.aspx?product_id=20176448'
result =  WebParser.extract_from_url(url,'product.template')

book = result['book']
product = result['product']
customer_purchased,vistor_readed,vistor_purchased = result['customer_purchased'],result['vistor_readed'],result['vistor_purchased']

[product,book].each do |item|
  puts "======================================================================="
  item.each do |k,v|
    puts "#{k}:#{v}"
  end
end

[customer_purchased,vistor_readed,vistor_purchased].each do |list|
  puts "======================================================================="
  list.each do |item|
    item.each do |k,v|
      puts "#{k}:#{v}"
    end
  end
end
#=end
