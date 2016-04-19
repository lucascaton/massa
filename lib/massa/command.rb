# frozen_string_literal: true
module Massa
  class Command
    attr_reader :description, :command

    def initialize(yaml)
      @description = yaml['description']
      @required    = yaml['required']
      @gem         = yaml['gem']
      @command     = yaml['command']
    end

    def required?
      @required.nil? ? true : @required
    end

    def gem?
      @gem.nil? ? true : @gem
    end
  end
end
