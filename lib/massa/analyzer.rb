require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'ostruct'
require 'yaml'

module Massa
  class Analyzier
    attr_reader :verbose
    alias :verbose? :verbose

    def self.run!(options)
      new(options).run!
    end

    def initialize(verbose: false)
      @verbose = verbose
    end

    def run!
      Massa::Tool.list.each do |tool|
        Massa::CLI.colorize :blue, "➙ #{tool.description}"

        next unless gem_installed?(tool.gem_name, required: tool.required)

        execute(tool)
      end

      Massa::CLI.colorize :green, "~(‾▿‾)~ All good!"
    end

    def gem_installed?(name, required:)
      return true if `gem query -i #{name}`.chomp == 'true'

      Massa::CLI.colorize :yellow, "༼ つ ◕_◕ ༽つ '#{name}' is not installed"

      required ? exit(1) : false
    end

    def execute(tool)
      command_output = ''

      if verbose?
        system(tool.command)
      else
        IO.popen(tool.command, err: [:child, :out]) { |io| command_output = io.read }
      end

      unless $?.success?
        Massa::CLI.colorize :red, "¯\\_(ツ)_/¯ #{tool.description} failed."
        puts command_output if command_output.to_s != ''

        exit 1 if tool.required
      end
    end
  end
end
