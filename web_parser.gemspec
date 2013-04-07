# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'web-parser'
  s.version     = '0.2.0'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Aaron']
  s.email       = ['Aaron@nonobo.com']
  s.homepage    = ''
  s.summary     = %q{a tool for extract web information }
  s.description = %q{a tool for extract web information.}

  s.rubyforge_project = ''

  s.add_dependency('nokogiri', '~> 1')
  s.add_dependency('rspec','~> 2')
  s.add_dependency('bundler','>=1.0.5')

  s.files         = [
    'init.rb',
    'README',
    'TEMPLATE_SPEC',
    'TODO',
    'web_parser.gemspec',
    'lib/web_parser.rb',
    'lib/web_parser/template.rb',
    'lib/web_parser/web_agent.rb',
    'lib/web_parser/web_parser.rb',
    'spec/amazon.html',
    'spec/amazon.template',
    'spec/dangdang.html',
    'spec/product.template',
    'spec/spec_helper.rb',
    'spec/template_spec.rb',
    'spec/web_parser_spec.rb'
  ]
  s.require_paths = ['lib']
end
