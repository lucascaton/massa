# frozen_string_literal: true

module Massa
  class CLI
    class << self
      def colorize(*args)
        print "\n"
        args.each_slice(2) { |color, string| print "\e[#{code(color)}m#{string}\e[0m" }
        print "\n"
      end

      def code(color)
        { red: 31, green: 32, yellow: 33, blue: 34, pink: 35, light_blue: 36 }[color] || 0
      end
    end
  end
end
