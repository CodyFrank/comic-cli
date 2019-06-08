#responsible for making a class to run the cli 

class CommandLineInterface
  
  def start 
    self.intro
    Scraper.scrape_books
  end
  
  def intro 
    puts "Welcome, check out whats new in Marvel comics this week!"
  end
  
end