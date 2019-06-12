#this file will be responsible for scrapping https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12 for the latest release section
#and scrapping https://www.marvel.com/comics/issue/77259/war_of_the_realms_new_agents_of_atlas_2019_3 (the links) for details about each comic release this week



class Scraper
  
  BASE_URL = "https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12"
  
  def self.scrape_books
    html = open(BASE_URL)
    doc = Nokogiri::HTML(html)
    parsed_issues = doc.css("h2:contains('New Releases ')~div.JCMultiRow>div.row-item")
    parsed_issues.each do|book|
      title = book.css("h5").text.strip
      url = book.css("a.meta-title").map{|x| x["href"]}[0]
      info_url = "https:" + url
      Comic.new(title, info_url)
    end
  end
  
  def self.scrape_info(comic)
    url = comic.info_url
    html = open(url)
    doc = Nokogiri::HTML(html)
    parsed_info = doc.css(".featured-item-meta")
    parsed_info.each do|data|
      description = data.css("+ div>p:first-child").text
      published_date = data.css(">div:nth-child(2)").text
      comic.description = description.strip
      comic.published_date = published_date.strip
    end
  end
end