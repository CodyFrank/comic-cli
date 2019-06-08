#this file will be responsible for scrapping https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12 for the latest release section
#and scrapping https://www.marvel.com/comics/issue/77259/war_of_the_realms_new_agents_of_atlas_2019_3 (the links) for details about each comic release this week



class Scraper
  
  BASE_URL = "https://www.marvel.com/comics"
  
  def self.scrape_books
    html = open(BASE_URL)
    binding.pry
  end
end