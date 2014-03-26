# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require 'east/version'

Gem::Specification.new do |s|
  s.name                  = 'east'
  s.version               = East::VERSION
  s.date                  = Time.now.strftime('%Y-%m-%d')
  s.homepage              = 'https://github.com/ericluo/east'
  s.summary               = 'East system administrater'
  s.email                 = 'eric.wenbl@gmail.com'
  s.authors               = ['Eric Luo']

  s.files                 = `git ls-files`.split($/).reject{ |f| f =~ /^examples/ }
  s.executables           = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths         = ["lib"]
  s.required_ruby_version = '>= 2.0.0'

  s.extra_rdoc_files      = [ "LICENSE.txt", "CHANGELOG.md", "README.md", "CONTRIBUTING.md" ]
  s.rdoc_options          = ["--charset=UTF-8"]

  s.description           = %q{East-related system management tools}

  s.add_dependency "resque"
  # s.add_development_dependency "mock_redis", " ~> 0.7.0"
end
