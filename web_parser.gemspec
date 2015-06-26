# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'web_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "web_parser"
  spec.version       = WebParser::VERSION
  spec.authors       = ["aaron"]
  spec.email         = ["aaron@nonobo.com"]
  spec.summary     = %q{a tool for extract web information }
  spec.description = %q{a tool for extract web information.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 2"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency('nokogiri', '~> 1')
  spec.add_dependency('rest-client', '~> 1')
  spec.add_dependency('iconv', '~> 1.0')
end
