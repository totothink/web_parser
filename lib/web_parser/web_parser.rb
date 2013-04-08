# -*- encoding: utf-8 -*-
# web_parser.rb - 网页文档解析器
#   web_parser是专门用于解析网页的工具，它通过指定解析模板提取模板中指定需要提取的相关信息。
#
# == 从指定xhtml文档提取信息
#   WebParser.extract(xhtml,template)
#   * +xhtml+ - xhtml结构的字符串
#   * +template+ - 解析xhtml结构的模板，允许为模板哈希或模板文件   
#
# == 从指定url提取信息
#   WebParser.extract_from_url(url,template,options={})
#   * +url+  - 网页的url
#   * +template+ - 解析url指定网页的模板，允许为模板哈希或模板文件
#   * +options+ - 请求url时的头部参数
#
# == 从指定网页文件提取信息
#   WebParser.extract_from_file(web_file,template)
#   * +web_file+ - 网页文件名
#   * +template+ - 解析网页文件的模板，允许为模板哈希或模板文件
#
# 返回结果为哈希值，例如：
#   {'products'=>[{'title'=>'如何阅读一本书','authors'=>'莫提默·J.艾德勒'},{'title'=>'如何听如何说','authors'=>'莫提默·J.艾德勒'}],'catalog'=>'图书'}
#

require 'nokogiri'
require 'iconv'
module WebParser
  DEFAULT_OPTIONS = {
    'max_workers'=>5,
    'queue'=>{
      'server'=>'127.0.0.1:22122',
      'in_queue' => 'in_queue',
			'out_queue' => 'out_queue',
			'wait_time' => 1
      }
  }

  class << self
    def extract(xhtml,template)
      template = Template.load_template(template) unless template.instance_of?(Hash)  # 如果给定的template不是哈希，则认为是模板文件进行加载
      dom = xhtml_to_dom(xhtml)
      objects = template.inject({}) do |result,object|
        object_name,object_attributes = object[0],object[1]
        object_result = case object_attributes['type']
          when 'single'
            extract_single(dom,object_attributes)           
          when 'list'
            extract_list(dom,object_attributes)
          when 'special'
            extract_special(dom,object_attributes)
          else
            nil
        end
        result.merge!(object_name=>object_result)
      end
    end

    def extract_from_url(url,template,options={})
      doc = get_doc_from_url(url,options)
      extract(doc,template)
    end

    def extract_from_file(web_file,template,options={})
      doc = get_doc_from_file(web_file,options)
      extract(doc,template)
    end

    private

      def get_doc_from_url(url,options={})
        doc = request_doc_from_url(url,options)
        doc && convert_to_utf8(doc,options)
      end

      def request_doc_from_url(url,options={})
        res = WebAgent.get(url,options)
        res && res.body 
      end

      def get_doc_from_file(web_file,options={})
        doc = nil
        File.open(web_file){|f| doc = f.read}
        doc && convert_to_utf8(doc,options)
      end

      # 将网页从其他字符集转换成为utf8格式
      # 如果网页中没有指定字符集，则默认为utf-8格式进行处理
      def convert_to_utf8(doc,options={})
        doc.match(/charset=[\"]?([a-zA-Z\-\d]*)[\"]?/)     
        doc_charset = $1
        doc_charset ||= options[:charset] || options['charset']
        if doc_charset && doc_charset.downcase != 'utf-8'        
          doc = Iconv.iconv('UTF-8//IGNORE',"#{doc_charset}//IGNORE",doc)[0].to_s
          doc.sub!("charset=#{doc_charset}",'charset=utf-8')
        end
        doc
      end

      def xhtml_to_dom(xhtml)
        Nokogiri::HTML(xhtml)
      end

      def extract_single(dom,attributes)
        xpath,attrs = attributes['xpath'],attributes['attributes']
        dom_node = dom.search(xpath)[0]
        return nil if dom_node.nil?
        extract_object_from_node(dom_node,attrs)
      end

      def extract_list(dom,attributes)
        xpath,attrs = attributes['xpath'],attributes['attributes']
        dom_nodes = dom.search(xpath)
        return [] if dom_nodes.empty?
        
        dom_nodes.inject([]) do |result,node|
          result << extract_object_from_node(node,attrs)
        end
      end

      def extract_special(dom,attributes)
        get_attr_value_by(dom,attributes)
      end

      def extract_object_from_node(node,attributes)
        attributes.inject({}) do |result,attribute|
          attr_name,attr_params = attribute[0],attribute[1]
          result.merge!(attr_name=>get_attr_value_by(node,attr_params))
        end
      end

      def get_attr_value_by(dom,params)
        attr_node = dom.search(params['xpath'])[0]
        return nil unless attr_node
        value = case 
          when params['attr'] && params['transform_rules']
            get_value_by_attr_and_transform_rules(attr_node,params['attr'],params['transform_rules'])
          when params['attr']
            get_vaule_by_attr(attr_node,params['attr'])
          when params['transform_rules']
            get_vaule_by_transform_rules(attr_node,params['transform_rules'])
          else
            nil
        end      
      end

      def get_value_by_attr_and_transform_rules(object,attribute,transform_rules)
        value = get_vaule_by_attr(object,attribute)
        get_vaule_by_transform_rules(value,transform_rules)
      end
    
      def get_vaule_by_attr(object,attribute)
        attribute == 'content' ? object.content : object[attribute]
        rescue Exception => message
          raise "object:#{object};attribute:#{attribute}.#{message}"
      end

      def get_vaule_by_transform_rules(object,transform_rules)
        create_proc_by(transform_rules).call(object)
        rescue Exception => message
          raise "object:#{object};transform_rules:#{transform_rules}.#{message}"
      end

      def create_proc_by(transform_rules)
        proc_code = "Proc.new#{transform_rules}"
        eval(proc_code)
      end
  end
end
