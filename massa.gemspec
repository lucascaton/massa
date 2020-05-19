# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'massa/version'

Gem::Specification.new do |spec|
  spec.name          = 'massa'
  spec.version       = Massa::VERSION
  spec.authors       = ['Lucas Caton']

  spec.summary       = 'Keep the quality, good practices and security of Rails projects.'
  spec.description   = 'Keep the quality, good practices and security of Rails projects.'
  spec.homepage      = 'https://github.com/lucascaton/massa'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(readme|spec)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  # spec.add_development_dependency 'simplecov'
end
