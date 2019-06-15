#responsible for making a class to run the cli 

class CommandLineInterface
  # note edge case inop still
  def run 
    input = nil
    self.intro
    Scraper.scrape_books
    
    until input.to_s.downcase == "exit"
      self.list_comics
      input = gets.strip.downcase
        if (1..Comic.all.length).include?(input.to_i)
          input = self.dive(input.to_i-1)
        elsif input == "exit"
          puts "goodbye"
        else
          input = nil
          puts "I do not understand the command. Please type a comic number or exit."
      end
    end
  end
  
  
  def intro 
    puts "Welcome to comics cli where you can see the latest in Marvel Comics\n" 
    puts "Remember you can always type 'exit' to back out\n"
    puts "\n Lets check out whats new in Marvel comics this week!\n"
  end
  
  def list_comics
    puts "\n Choose a number from (1 - #{Comic.all.length}) to see more info about.\n"
    Comic.all.each_with_index do|issue, index|
      puts "\n#{index + 1}. #{issue.title}\n"
    end
  end
  
  def dive(index)
    comic = Comic.all[index]
    if comic.published_date == nil
      Scraper.scrape_info(comic)
    end
    
    puts "\nTitle: - #{comic.title}\n"
    puts "\nDate published: - #{comic.published_date}\n"
    puts "\n Url: - #{comic.info_url}\n"
    puts "\n Description: - #{comic.description}\n\n"
    puts "Would you like to see other comics?(y/n)"
    input = gets.strip.downcase
    if input.downcase == "y"
      return "y"
    elsif input == "n" || input.downcase == "exit"
      puts "goodbye"
      return "exit"
    end
  end
end
