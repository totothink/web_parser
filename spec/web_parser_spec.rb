# -*- encoding: utf-8 -*-
require 'spec_helper'

describe WebParser do
  it '指定有效的url和模板应该返回提取信息' do
    url = URI.escape('http://www.amazon.cn/Ruby-语言入门-园田裕贵/dp/B003L21YJA')
    WebParser.extract_from_url(url,'amazon.template').should be_a_instance_of(Hash)
  end

  it '可以从xhtml文件中提取信息' do
    WebParser.extract_from_file('amazon.html','amazon.template').should be_a_instance_of(Hash)
  end

  it 'gb2312格式的文件能正常提取信息' do
    WebParser.extract_from_file('dangdang.html','product.template').should be_a_instance_of(Hash)
  end

  it '指定有效的头部参数，应该返回提取信息' do
    url = URI.escape('http://www.amazon.cn/Ruby-语言入门-园田裕贵/dp/B003L21YJA')
    options = {'Cookie' => "session-id=478-2475059-0859041; ubid-acbcn=480-2057666-9756625; session-token=9Ny9/S+ZSraEq4tmdtT8hvyVmHxCc9+st0wiyIUinLhDNBfG6vTanMqh7TPbdxQrgFmaluE8DlrbP0ahMnbuzmr3PoakqF5HBd9k4sYYYqLBnG2xA1GN6sG1QzP5R3kxIxgV88kqoB1tDXx7cukohzkpTEVrm+jcrYkd27HLbe2C3UrMJ/Y7bJVucqjjB0oHiEMHhkKGMTSd2+u5iS24PgpAfwD/1VSukugVn6h/gQM=;"}
    WebParser.extract_from_url(url,'amazon.template').should be_a_instance_of(Hash)
  end
end
