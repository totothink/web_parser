require 'spec_helper'

url = 'http://www.amazon.cn/gp/search/ref=sr_nr_n_35?rh=n%3A658390051%2Cn%3A%21658391051%2Cn%3A658429051&bbn=658391051&sort=salesrank&ie=UTF8&qid=1310370136&rnid=658391051'

result =  WebAgent.get(url)
puts result.body
