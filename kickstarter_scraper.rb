# require libraries/modules here
require "nokogiri"

def create_project_hash
  # write your code here
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  puts kickstarter.css('li.project.grid_4')[0]
end