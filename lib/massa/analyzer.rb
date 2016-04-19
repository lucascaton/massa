# frozen_string_literal: true

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'ostruct'
require 'yaml'
require 'English'

module Massa
  class Analyzier
    attr_reader :verbose
    alias verbose? verbose

    def self.run!(options)
      new(options).run!
    end

    def initialize(verbose: false)
      @verbose = verbose
    end

    def run!
      Massa::Tool.list.each do |gem_name, tool|
        command = Massa::Command.new(tool)

        Massa::CLI.colorize :blue, "➙ #{command.description}"

        next unless gem_installed?(gem_name, command)

        execute(command)
      end

      Massa::CLI.colorize :green, "~(‾▿‾)~ All good!"
    end

    def gem_installed?(name, command)
      return true unless command.gem?
      return true if `gem query -i #{name}`.chomp == 'true'

      Massa::CLI.colorize :yellow, "༼ つ ◕_◕ ༽つ '#{name}' is not installed"

      command.required? ? exit(1) : false
    end

    def execute(command)
      command_output = ''

      if verbose?
        system(command.command)
      else
        IO.popen(command.command, err: [:child, :out]) { |io| command_output = io.read }
      end

      unless $CHILD_STATUS.success?
        Massa::CLI.colorize :red, "¯\\_(ツ)_/¯ #{command.description} failed:"
        Massa::CLI.colorize :yellow, "$ #{command.command}"

        puts command_output if command_output.to_s != ''

        exit 1 if command.required?
      end
    end
  end
end
