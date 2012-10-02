require "conquest/gtk/gui"
require "conquest/data"
require "conquest/parser"

module Conquest
  def self.run_gui
    puts "Running Conquest for GTK, version #{Conquest::GUI_VERSION}."
    print "\nDownloading data... Your GUI will be ready in just a moment."
    parser = Parser.new DATA_URL
    puts "\nFinished, here you go!"

    Gtk.init

    main = GUI.new
    main.set_outputs parser.hex_list, parser.ards_code
    main.show_all

    Gtk.main
  end
end
