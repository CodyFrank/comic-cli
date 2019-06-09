#responsible for making a class to run the cli 

class CommandLineInterface
  # note edge case inop still
  def start 
    input = ""
    self.intro
    Scraper.scrape_books
    until input.to_s.downcase == "exit"
      self.list_comics
      puts "\n choose a number from (1 - #{Comic.all.length}) to see more info about.\n\n\n"
      input = gets.strip
      if input.to_i > 0 && input.to_i < Comic.all.length+1
        self.dive(input.to_i-1)
      elsif input.to_s.downcase == "exit"
        puts "goodbye"
      elsif (input.to_s != "")
        puts "invalid response"
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
  
  def dive(index)
    comic = Comic.all[index]
    if comic.published_date == nil
      Scraper.scrape_info(comic)
    end
    puts comic.title
    puts comic.published_date
    puts comic.info_url
    puts comic.description
    puts "see other comics?(y/n)"
    input = gets.strip.downcase
    if input == "y"
      return
    else
      puts "goodbye"
    end
  end
  
  
end
