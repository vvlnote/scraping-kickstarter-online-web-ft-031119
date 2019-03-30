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
  kickstarter.css('li.project.grid_4').each do |project|
    #puts "proejct = #{project}"
    #puts 
    title = project.css("h2.bbcard_name strong a").text
    #puts "title = #{title}"
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("span.location_name").text,
      :percent_funded => project.css("ul.project-stats li.first funded strong").text.gsub("%","").to_i
      
    }
    #puts "projects"
  end
  projects
end