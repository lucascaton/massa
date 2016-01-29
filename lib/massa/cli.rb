module Massa
  class CLI
    class << self
      def colorize(color, string)
        puts "\n\e[#{code(color)}m#{string}\e[0m\n"
      end

      def code(color)
        { red: 31, green: 32, yellow: 33, blue: 34, pink: 35, light_blue: 36 }[color] || 0
      end
    end
  end
end
