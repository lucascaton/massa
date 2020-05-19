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
      new(**options).run!
    end

    def initialize(verbose: false)
      @verbose = verbose
    end

    def run!
      Massa::Tool.list.each do |tool|
        Massa::CLI.colorize :blue, "➙ #{tool.description}"

        next if tool.gem? && !gem_installed?(tool)

        execute(tool)
      end

      Massa::CLI.colorize :green, '~(‾▿‾)~ All good!'
    end

    def gem_installed?(tool)
      return true if `gem query -i #{tool.name}`.chomp == 'true'

      Massa::CLI.colorize :yellow, "༼ つ ◕_◕ ༽つ '#{tool.name}' gem is not installed"

      tool.required? ? exit(1) : false
    end

    def execute(tool)
      command_output = ''

      if verbose?
        system(tool.command)
      else
        IO.popen(tool.command, err: %i[child out]) { |io| command_output = io.read }
      end

      return if $CHILD_STATUS.success?

      Massa::CLI.colorize :red, "¯\\_(ツ)_/¯ #{tool.description} failed:"
      Massa::CLI.colorize :yellow, "$ #{tool.command}"

      puts command_output if command_output.to_s != ''

      exit 1 if tool.required?
    end
  end
end
