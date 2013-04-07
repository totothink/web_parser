# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Template do
  it '有效的模板文件，应该加载成功' do
    Template.load_template('product.template').should be_a_instance_of(Hash)
  end

  it '模板文件应该能被生成' do
    template = Template.load_template('product.template')
    Template.dump_template(template,'dangdang.template').should be_true
  end
end
