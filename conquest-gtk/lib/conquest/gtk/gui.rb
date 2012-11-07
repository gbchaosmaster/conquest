require "conquest/gtk/version"

require "gtk2"
require "clipboard"

module Conquest
  class GUI < Gtk::Window
    def initialize
      super

      init_ui
      init_signals

      set_title "Conquest GTK #{Conquest::GUI_VERSION}"
      set_default_size 500, 350
      set_window_position Gtk::Window::POS_CENTER
      set_border_width 5
    end

    def init_ui
      hbox_main = Gtk::HBox.new false, 5

################################################################################

      # vbox_hex_list contains the hex list and its copy button.

      vbox_hex_list = Gtk::VBox.new false, 5

      # Both text views are directly in vbox_main.

      scr_txt_hex_list = Gtk::ScrolledWindow.new
      @txt_hex_list = Gtk::TextView.new
      scr_txt_hex_list.add_with_viewport @txt_hex_list

      @btn_copy_hex_list = Gtk::Button.new "Copy Hex List"

      vbox_hex_list.pack_start scr_txt_hex_list
      vbox_hex_list.pack_start @btn_copy_hex_list, false

################################################################################

      # vbox_ards_code contains the ARDS code and its copy button.

      vbox_ards_code = Gtk::VBox.new false, 5

      scr_txt_ards_code = Gtk::ScrolledWindow.new
      @txt_ards_code = Gtk::TextView.new
      scr_txt_ards_code.add_with_viewport @txt_ards_code

      @btn_copy_ards_code = Gtk::Button.new "Copy ARDS Code"

      vbox_ards_code.pack_start scr_txt_ards_code
      vbox_ards_code.pack_start @btn_copy_ards_code, false

################################################################################

      # Automatic scrollbars on both text views.
      [scr_txt_hex_list, scr_txt_ards_code].map! do |scr|
        scr.set_policy *[Gtk::POLICY_AUTOMATIC] * 2
      end

      hbox_main.pack_start vbox_hex_list, true
      hbox_main.pack_start vbox_ards_code, true

      add hbox_main
    end

    def init_signals
      signal_connect "destroy" do
        Gtk.main_quit
      end

      @btn_copy_hex_list.signal_connect "clicked" do
        Clipboard.copy @txt_hex_list.buffer.text
      end

      @btn_copy_ards_code.signal_connect "clicked" do
        Clipboard.copy @txt_ards_code.buffer.text
      end
    end

    def set_outputs(hex_list, ards_code)
      @txt_hex_list.buffer.text = hex_list
      @txt_ards_code.buffer.text = ards_code
    end
  end
end
