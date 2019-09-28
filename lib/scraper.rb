require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    doc.css("div.student-card").each {|student|
      student = Student.new
      student.name = student.css("h4.student-name").text
      student.location = student.css("p.student-location").text
      student.profile_url = student.css("a").href
    }
  end

  def self.scrape_profile_page(profile_url)

  end

end
