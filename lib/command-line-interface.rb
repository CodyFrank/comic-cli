#responsible for making a class to run the cli 

class CommandLineInterface

  def run 
    input = nil
    self.intro
    Scraper.scrape_books
    until input.to_s.downcase == "exit"
    input = self.list_comics
      if (1..Comic.all.length).include?(input.to_i)
        input = self.dive(input.to_i-1)
      elsif input == "exit"
        puts "goodbye"
      else
        input = self.invalid_input
      end
    end
  end
  
  
  def intro 
    puts "Welcome to comics cli where you can see the latest in Marvel Comics\n" 
    puts "Remember you can always type 'exit' to back out\n"
    puts "\nLets check out whats new in Marvel comics this week!\n"
  end
  
  def list_comics
    puts "would you like to list the Comics?(y/n)"
    input = gets.strip.downcase
    if input == "y"
      Comic.all.each_with_index do|issue, index|
        puts "\n#{index + 1}. #{issue.title}"
      end
      puts "\n Choose a number from (1 - #{Comic.all.length}) to see more info.\n"
      input = gets.strip.downcase
    elsif input == "n" || input == "exit"
      input = "exit"
    else 
      input = nil
    end
    return input
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
    if input == "y"
      return "y"
    elsif input == "n" || input.downcase == "exit"
      puts "goodbye"
      return "exit"
    else
      self.invalid_input
    end
  end
  
  def invalid_input
    puts "I do not understand the command."
  end
  
end
