require 'spec_helper'

url = 'http://www.amazon.cn/s?url=search-alias=stripbooks&field-keywords=第五项修炼'
puts books =  WebParser.extract_from_url(url,'amazon_search.template')

#url = 'http://www.amazon.cn/NLP%E8%87%AA%E6%88%91%E9%87%8D%E5%A1%91%E8%AE%A1%E5%88%92-21%E5%A4%A9%E5%A1%91%E9%80%A0%E5%85%A8%E6%96%B0%E8%87%AA%E6%88%91-%E6%9F%A5%E5%B0%94%E6%96%AF%C2%B7%E7%A6%8F%E5%85%8B%E7%BA%B3/dp/B001B666KA/ref=sr_1_1?s=books&ie=UTF8&qid=1309611401&sr=1-1'

#puts books =  WebParser.extract_from_url(url,'amazon.template')
