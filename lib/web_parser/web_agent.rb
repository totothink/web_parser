# web_agent.rb - 网页代理
# 网页代理主要负责和网络的通讯
#
require 'uri'
require 'net/http'

module WebAgent
  def self.get(url,opts={})
    opts["User-Agent"] ||= "Mozilla/5.0 (X11; U; Linux i686; zh-CN; rv:1.9.0.15) Gecko/2009102704 Fedora/3.0.15-1.fc10 Firefox/3.0.15"
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host,(uri.port||80))
    res = nil
    http.start do |http|
      req = Net::HTTP::Get.new(url, opts)  
      res = http.request(req) 
    end
    res           
  end
end
