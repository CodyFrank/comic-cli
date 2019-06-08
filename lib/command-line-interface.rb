#responsible for making a class to run the cli 

class CommandLineInterface
  
  def start 
    input = ""
    self.intro
    Scraper.scrape_books
    until input.downcase == "exit"
      self.list_comics
      puts "\n choose a number from (1 - #{Comic.all.length}) to see more info about.\n\n\n"
      input = gets.to_i
      if input > 0 && input < Comic.all.length+1
      self.description(input-1)
    end
    end
  end
  
  
  def intro 
    puts "Welcome to comics cli where you can see the latest in Marvel\n" 
    puts "Remember you can always type /'exit/' to back out\n"
    puts "\n\n\n Lets check out whats new in Marvel comics this week!\n\n\n"
  end
  
  def list_comics
    Comic.all.each_with_index do|issue, index|
      puts "\n#{index + 1}. #{issue.title}\n"
    end
  end
  
  def description(index)
    
    binding.pry
  end
  
  
end
