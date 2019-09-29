require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/")
    students = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css("div.student-card").each {|person|
      student = {}
      student[:name] = person.css("h4.student-name").text
      student[:location] = person.css("p.student-location").text
      student[:profile_url] = person.css("a").attribute("href").value
      students << student
    }
    students
  end

  def self.scrape_profile_page(profile_url)
    profiles = []
    doc = Nokogiri::HTML(open(profile_url))
    doc.css("div.vitals-container").each {|student|
      profile = {}
      #profile[:twitter] = student.css("a").attribute("href").value a[href*="w3schools"]
      profile[:twitter] = student.css('a[href*="w3schools"]')
      p profile
      profiles << profile
    }
    profiles
  end

end
