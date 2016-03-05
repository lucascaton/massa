# frozen_string_literal: true

module Massa
  class Tool
    class << self
      def list
        default_tools.each_with_object({}) do |(tool, options), hash|
          hash[tool] = options.merge(custom_tools[tool] || {})
          hash
        end
      end

      private

      def default_tools
        YAML.load_file(config_file_from_gem)
      end

      def custom_tools
        # Returns an empty hash if config file is empty
        YAML.load_file(config_file_from_project) || {}

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
