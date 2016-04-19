# frozen_string_literal: true

module Massa
  class Tool
    attr_reader :name, :description, :gem, :command, :required

    def initialize(name, attributes)
      @name        = name
      @description = attributes['description']
      @gem         = attributes['gem'].nil? ? true : attributes['gem']
      @command     = attributes['command']
      @required    = attributes['required'].nil? ? true : attributes['required']
    end

    alias required? required
    alias gem?      gem

    class << self
      def list
        tools = custom_tools.any? ? custom_tools : default_tools

        tools.map { |name, attributes| new(name, attributes) }
      end

      private

      def default_tools
        @default_tools ||= YAML.load_file(config_file_from_gem)
      end

      def custom_tools
        # Returns an empty hash if config file is empty
        @custom_tools ||= YAML.load_file(config_file_from_project) || {}

      # When there is no config file in the project
      rescue Errno::ENOENT
        {}
      end

      def config_file_from_gem
        File.expand_path('../../../config/default_tools.yml', __FILE__)
      end

      def config_file_from_project
        "#{Dir.pwd}/config/massa.yml"
      end
    end
  end
end
