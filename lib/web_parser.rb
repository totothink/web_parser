$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'web_parser/web_parser'
require 'web_parser/web_agent'
require 'web_parser/template'
require "web_parser/version"

module WebParser
  # Your code goes here...
end
