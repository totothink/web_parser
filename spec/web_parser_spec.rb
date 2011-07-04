require 'spec_helper'

describe WebParser do
  it '指定有效的url和模板应该返回提取信息' do
    url = 'http://www.amazon.cn/Ruby-语言入门-园田裕贵/dp/B003L21YJA'
    WebParser.extract_from_url(url,'amazon.template').should be_a_instance_of(Hash)
  end

  it '可以从xhtml文件中提取信息' do
    WebParser.extract_from_file('amazon.html','amazon.template').should be_a_instance_of(Hash)
  end

  it 'gb2312格式的文件能正常提取信息' do
    WebParser.extract_from_file('dangdang.html','product.template').should be_a_instance_of(Hash)
  end
end
