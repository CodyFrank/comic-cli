#responsible for making a class to run the cli 

class CommandLineInterface
  
  def start 
    self.intro
    Scraper.scrape_books
    self.list_comics
  end
  
  def intro 
    puts "Welcome, check out whats new in Marvel comics this week!"
  end
  
  def list_comics
    Comic.all.each {|issue| puts issue.title}
  end
  
  
end