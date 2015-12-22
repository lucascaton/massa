require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rake'
require 'jeweler'
require './lib/massa/version'

Jeweler::Tasks.new do |gem|
  gem.name        = 'massa'
  gem.homepage    = 'http://github.com/lucascaton/massa'
  gem.license     = 'MIT'
  gem.summary     = %q{Keep the quality, good practices and security of Rails projects.}
  gem.description = %q{Keep the quality, good practices and security of Rails projects.}
  gem.authors     = ['Lucas Caton']
  gem.version     = Massa::VERSION
end

Jeweler::RubygemsDotOrgTasks.new
