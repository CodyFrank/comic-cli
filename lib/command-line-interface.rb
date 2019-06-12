#responsible for making a class to run the cli 

class CommandLineInterface
  # note edge case inop still
  def run 
    input = ""
    self.intro
    Scraper.scrape_books
    until input.to_s.downcase == "exit"
      self.list_comics
      input = gets.strip
      if (1..Comic.all.length).include? input.to_i 
        input = self.dive(input.to_i-1)
      elsif input.to_s.downcase == "exit"
        puts "goodbye"
      else
        puts "I do not understand the command."
      end
    end
  end
  
  
  def intro 
    puts "Welcome to comics cli where you can see the latest in Marvel\n" 
    puts "Remember you can always type 'exit' to back out\n"
    puts "\n\n\n Lets check out whats new in Marvel comics this week!\n\n\n"
  end
  
  def list_comics
    puts "\n choose a number from (1 - #{Comic.all.length}) to see more info about.\n\n"
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
    puts "\n Description: - #{comic.description}\n\n\n"
    puts "see other comics?(y/n)"
    input = gets.strip.downcase
    if input == "y"
      return "y"
    elsif input == "n" #|| input == "exit"
    binding.pry
      puts "goodbye"
      return "exit"
    end
  end
  
  
end
