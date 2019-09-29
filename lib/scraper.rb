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
    doc.css("div.profile").each {|student|
      profile = {}
      profile[:profile_quote] = student.css('div.profile-quote').text
      profile[:bio] =student.css('div.description-holder p').text

      profile.css("div.main-wrapper.profile .social-icon-container a").each { |link|
      if link.attribute("href").value.include?("twitter")
        profile[:twitter] = link.attribute("href").value if student.css('a[href*="twitter"]')
      elsif link.attribute("href").value.include?("linkedin")
        profile[:linkedin] = link.attribute("href").value if student.css('a[href*="linkedin"]')
      elsif link.attribute("href").value.include?("github")
        profile[:github] = link.attribute("href").value if student.css('a[href*="github"]')
      else
        profile[:blog] = link.attribute("href").value
      end
      }
      p profile
      profiles << profile
    }
    profiles
  end

end
