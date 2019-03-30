# require libraries/modules here
require "nokogiri"

def create_project_hash
  # write your code here
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  kickstarter.css('li.project.grid_4').collect do |project|
    title = project.css("h2.bbcard_name strong a").text
    puts "title = #{title}"
  end
end