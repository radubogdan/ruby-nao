require "nao/version"
require "mechanize"

module Nao
  class << self
    def parse name
      agent = Mechanize.new
      page = agent.get "http://alt.org/nethack/player-all-xlog.php?player=#{name}"
      res = page.search('//div[@class="body"]/pre').text.split("\n")
      res.map { |s| Hash[*s.split(/[=|:]/)] }
    end
  end
end
