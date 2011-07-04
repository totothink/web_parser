# template.rb - 网页解析器模板模块
#   template是管理网页解析器(Web Parser)模板的工具。主要进行模板的加载、生成以及校验等
#
# == 加载模板
#   Template.load_template(template_file)
#
#   * +template_file+ - 模板文件名
#
# == 生成模板
#   Template.dump_template(template,templiate_file)
#
#   * +template+ - 模板
#   * +template_file+ - 模板文件名
#
# == 校验模板
#   Template.valid?(template_file)
#
#   * +template_file+ - 模板文件名
#
require 'yaml'

module Template

  def self.load_template(template_file)
    YAML.load_file(template_file)
  end

  def self.dump_template(template,template_file)
    File.open(template_file,'wb'){|f| f.write YAML.dump(template)}
  end
  
  def self.valid?(template_file)
    # TODO    
  end

end
