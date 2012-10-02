require "conquest/pkmn_info"

require "nokogiri"
require "open-uri"
require "nutella"

module Conquest
  class Parser
    def initialize(url)
      # Grab all of the rows from the table containing all of the Pokemon.
      # Drop the first two because they just have header data.
      @pkmn = Nokogiri::HTML(open(url)).css("table.tab > tr").drop(1).map do |p|
        PkmnInfo.new p.children[0].text[1..-1].to_i, p.children[4].text
      end
    end

    def hex_list
      @pkmn.each_with_index.
        map { |p, i| "%03d - %.2X - %s" % [p.id, i, p.name] }.
        join "\n"
    end

    def ards_code
      @pkmn.each_with_index.map do |p, i|
        <<-EOS.heredoc % i
          ::#{p.name}
          52045804 E2431001
          02045808 E3A060%.2X
          D2000000 00000000
        EOS
      end.join "\n"
    end
  end
end
