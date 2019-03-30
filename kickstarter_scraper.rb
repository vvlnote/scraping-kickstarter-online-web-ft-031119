# require libraries/modules here
require "nokogiri"

def create_project_hash
  # write your code here
  html = File.read("fixtures/kickstarter.html")
  kickstarter = Nokogiri::HTML(html)
  #puts kickstarter.css('li.project.grid_4')[0]
  projects = {}
  kickstarter.css('li.project.grid_4').collect do |project|
    title = project.css("h2.bbcard_name strong a").text
    #puts "title = #{title}"
    projects[title][:image_link] => project.css("div.project-thumbnail a img").attribute("src").value
    project[title][:description] => project.css("p.bbcard_blurb").text
    project[title][:location] => 
  end
end