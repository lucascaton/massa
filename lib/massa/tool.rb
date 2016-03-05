# frozen_string_literal: true

module Massa
  class Tool
    class << self
      def list
        YAML.load_file(config_file_from_gem).merge YAML.load_file(config_file_from_project)
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
