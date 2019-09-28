require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
  doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))

  def self.scrape_index_page(index_url)

  end

  def self.scrape_profile_page(profile_url)

  end

end
