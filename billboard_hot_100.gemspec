# A sample Gemfile
source "https://rubygems.org"

gem 'pry'
gem 'nokogiri', '1.6.6.2'
gem 'rspec'

require_relative './lib/billboard_hot_100/version'

Gem::Specification.new do |s|
  s.name        = 'billboard_hot_100'
  s.version     = BillboardHot100::VERSION
  s.date        = '2019-03-26'
  s.summary     = "Billboard Hot 100"
  s.description = "Provides the current weeks Billboard Hot 100"
  s.authors     = ["Stephen Olson"]
  s.email       = 'stephenolson@gmail.com'
  s.files       = Dir["{bin,lib}/**/*"]
  s.homepage    = 'http://rubygems.org/'
  s.license     = 'MIT'
  s.executables << 'billboard_hot_100'

  s.add_development_dependency "bundler", "~> 1.10"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end