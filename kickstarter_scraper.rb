# require libraries/modules here
require "nokogiri"

def create_project_hash
  # write your code here
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  #puts "#{kickstarter.css('li.project.grid_4')}"
  projects = {}
  arr = kickstarter.css('li.project.grid_4')
  #puts "arr = #{arr}"
  arr.each do |project|
    puts "proejct = #{project}"
    #puts 
    title = project.css("h2.bbcard_name strong a").text
    #puts "title = #{title}"
    projects[title][:image_link] = project.css("div.project-thumbnail a img").attribute("src").value
    projects[title][:description] = project.css("p.bbcard_blurb").text
    projects[title][:location] = project.css("span.location_name").text
    projects[title][:percent_funded] = project.css("ul.project-stats li.first funded strong").text
    #puts "projects"
  end
  projects
end