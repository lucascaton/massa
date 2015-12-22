module Massa
  class CLI
    def self.colorize(color, string)
      color_code = case color
         when :red        then 31
         when :green      then 32
         when :yellow     then 33
         when :blue       then 34
         when :pink       then 35
         when :light_blue then 36
         else 0
       end

      puts "\n\e[#{color_code}m#{string}\e[0m\n"
    end
  end
end
