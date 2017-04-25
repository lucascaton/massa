# 👌 Massa

[![Gem Version](https://badge.fury.io/rb/massa.svg)](https://rubygems.org/gems/massa)
[![Dependency Status](https://gemnasium.com/badges/github.com/lucascaton/massa.svg)](https://gemnasium.com/github.com/lucascaton/massa)
[![Build Status](https://travis-ci.org/lucascaton/massa.svg?branch=master)](https://travis-ci.org/lucascaton/massa)
[![Test Coverage](https://codeclimate.com/github/lucascaton/massa/badges/coverage.svg)](https://codeclimate.com/github/lucascaton/massa/coverage)
[![Code Climate](https://codeclimate.com/github/lucascaton/massa/badges/gpa.svg)](https://codeclimate.com/github/lucascaton/massa)

It's not rare to have Ruby (and Rails) projects becomming hard to maintain and less fun after a while.
This gem helps you to keep or increase the quality, good practices and security of your projects.

**Massa** can run in your CI using different code analyzers tools along with automated tests, instead of running only your automated tests.

Ie.: Instead of:

    $ bundle exec rubocop && bundle exec brakeman -Aqz && bundle exec rails_best_practices && bundle exec rspec && karma start --single-run --browsers PhantomJS && etc

You will only need:

    $ bundle exec massa

You can either use only the [default tools](https://github.com/lucascaton/massa/blob/master/config/default_tools.yml) or define your own by using a [simple config file](https://github.com/lucascaton/massa#usage).

![massa](https://raw.githubusercontent.com/lucascaton/massa/master/readme/massa.gif)

Verbose mode:

![massa-v](https://raw.githubusercontent.com/lucascaton/massa/master/readme/massa-v.gif)

## Installation

Add the following lines to your application's Gemfile:

```ruby
group :development, :test do
  gem 'massa'
end
```

And then execute:

    $ bundle

## Usage

Generate a config file (optional):

    $ bundle exec massa -g

Then, run:

    $ bundle exec massa

It's recommended to use `-V` (or `--verbose`) flag when running it in a CI:

    $ bundle exec massa -V

## About the gem name

**"Massa"** is a 🇧🇷 Portuguese slang which means **"awesome"**, so once you add it to your project, it becomes "massa"!

## Contributing

[Bug reports](https://github.com/lucascaton/massa/issues) and [pull requests](https://github.com/lucascaton/massa/pulls) are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright (c) 2017 Lucas Caton.
