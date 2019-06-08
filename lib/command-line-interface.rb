#responsible for making a class to run the cli 

class CommandLineInterface
  
  def start 
    self.intro
    Scraper.scrape_books
    self.list_comics
    self.description
  end
  
  def intro 
    puts "\n\n\n Welcome check out whats new in Marvel comics this week!\n\n\n"
  end
  
  def list_comics
    Comic.all.each_with_index do|issue, index|
      puts "\n#{index + 1}. #{issue.title}\n"
    end
  end
  
  def description
    puts "\n choose a number (1 - #{Comic.all.length}) to see more info about.\n\n\n"
  end
end
