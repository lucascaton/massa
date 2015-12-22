module Massa
  class Tool
    class << self
      def list
        YAML.load_file(tools_yaml_file).map { |tool| OpenStruct.new(tool) }
      end

      def tools_yaml_file
        "#{Gem::Specification.find_by_name('massa').gem_dir}/lib/massa/default_tools.yml"
      rescue Gem::LoadError
        Massa::CLI.colorize :red, "¯\\_(ツ)_/¯ 'massa' gem is not in your Gemfile."
        exit 1
      end
    end
  end
end
