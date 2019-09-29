require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/")
    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.student-card").each {|person|
      person = Student.new
      person.name = student.css("h4.student-name").text
      person.location = student.css("p.student-location").text
      person.profile_url = student.css("a").href
    }
  end

  def self.scrape_profile_page(profile_url)

  end

end
