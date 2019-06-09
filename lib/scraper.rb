#this file will be responsible for scrapping https://www.marvel.com/comics?&options%5Boffset%5D=0&totalcount=12 for the latest release section
#and scrapping https://www.marvel.com/comics/issue/77259/war_of_the_realms_new_agents_of_atlas_2019_3 (the links) for details about each comic release this week



class Scraper
  
  BASE_URL = "https://www.marvel.com/comics?byZone=marvel_site_zone&options[offset]=12&offset=0&options[limit]=12&options[formatType]=issue&options[noVariants]=true&options[dateDescriptor]=thisWeek&options[orderBy][0]=issues.onsale_date+DESC&options[orderBy][1]=issues.id+DESC&contentType=comic_issue&method=fetchByReleaseDate&options%5Boffset%5D=0&totalcount=24"
  
  def self.scrape_books
    html = open(BASE_URL)
    doc = Nokogiri::HTML(html)
    parsed_issues = doc.css("h2:contains('New Releases ')~div.JCMultiRow>div.row-item")
    parsed_issues.each do|book|
      title = book.css("h5").text.strip
      #info_url = book.css("a.meta-title").attr("href")
      url = book.css("a.meta-title").map{|x| x["href"]}[0]
      info_url = "https:" + url
      Comic.new(title, info_url)
    end
  end
  
  def self.scrape_info(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    parsed_info = doc.css(".featured-item-text")
    parsed_info.each {|data| binding.pry}
  end
end