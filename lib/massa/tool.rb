# frozen_string_literal: true

module Massa
  class Tool
    class << self
      def list
        default_tools = YAML.load_file(config_file_from_gem)

        if File.exist?(config_file_from_project)
          default_tools.merge YAML.load_file(config_file_from_project)
        else
          default_tools
        end
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
