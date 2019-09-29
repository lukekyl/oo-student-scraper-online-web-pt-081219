require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/")
    students = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.student-card").each {|person|
      student = Student.new
      student.name = person.css("h4.student-name").text
      student.location = person.css("p.student-location").text
      student.profile_url = person.css("a").attribute("href").value
      p "#{student.name} #{student.location} #{student.profile_url}"
    }
  end

  def self.scrape_profile_page(profile_url)

  end

end
