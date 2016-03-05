require 'spec_helper'

RSpec.describe 'bin/massa' do
  %w(-h --help).each do |option|
    describe(option) do
      it 'displays massa help' do
        output = `#{File.expand_path('../../../bin/massa', __FILE__)} #{option}`.chomp
        expect(output).to eql("Usage: massa [options]
    -g, --generate-config            Generate config file
    -h, --help                       Display this help
    -v, --version                    Display version
    -V, --verbose                    Run verbosely

You can read the official documentation here:
https://github.com/lucascaton/massa#massa
")
      end
    end
  end

  %w(-v --version).each do |option|
    describe(option) do
      it 'displays massa version' do
        output = `#{File.expand_path('../../../bin/massa', __FILE__)} #{option}`.chomp
        expect(output).to eql(Massa::VERSION)
      end
    end
  end
end
