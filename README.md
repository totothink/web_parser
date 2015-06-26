= WebParser 
  Web Parser是一款页面信息提取工具，它通过用户给定的xhtml文档以及解析文档所使用的模板返回用户希望从xhtml文档中获取模板中指定的相关信息。Web parser的目标是让信息提取更加简单，降低人工处理重复信息的劳动强度。

## 安装

Add this line to your application's Gemfile:

```ruby
gem 'web_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install web_parser

== 使用

== 从指定的URL提取信息
  result = WebParser.extract_from_url(url,'nonobo.template')

== 从xhtml结构文档提取信息
  result = WebParser.extract(xhtml_doc,'nonobo.template')

== 从xhtml文件提取信息
  result = WebParser.extract_from_file(file,'nonobo.template')

== 加载模板文件
  template = Template.load_template('nonobo.template')

== 生成模板文件
  Template.dump_template(template,'nonobo.template')
  
== 模板说明
  详细参见TEMPLATE_SPEC文件  

## Contributing

1. Fork it ( https://github.com/[my-github-username]/web_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
