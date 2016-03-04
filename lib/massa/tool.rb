# frozen_string_literal: true

module Massa
  class Tool
    class << self
      def list
        YAML.load_file(tools_yaml_file).map { |tool| OpenStruct.new(tool) }
      end

      def tools_yaml_file
        "#{Gem::Specification.find_by_name('massa').gem_dir}/config/default_tools.yml"
      end
    end
  end
end
