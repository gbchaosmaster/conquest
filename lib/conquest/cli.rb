require "conquest/data"
require "conquest/parser"

require "nutella"

module Conquest
  class CLI
    def self.start
      print "Downloading data..."
      parser = Parser.new DATA_URL
      puts "\nFinished!"
      puts

      puts <<-EOS.heredoc
        Please enter where you would like to save your files.
        Enter paths relative to the current directory.
      EOS
      print "Hex List: "
      save_hex_list = STDIN.gets.strip
      print "ARDS Code: "
      save_ards_code = STDIN.gets.strip

      File.open(save_hex_list, "w") { |f| f << parser.hex_list }
      File.open(save_ards_code, "w") { |f| f << parser.ards_code }

      puts
      puts <<-EOS.heredoc
        2 files written:
        #{save_hex_list}
        #{save_ards_code}
      EOS
    end
  end
end
