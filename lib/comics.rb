#this file will create a comic class that will be the data that makes up the comics

class Comic
  
  
  attr_reader :title, :info_url, :published_date, :description
  
  @@all = []
  
  def initialize(title, info_url)
    @title = title
    @info_url = info_url
    self.save
    @published_date = nil
    @description = nil
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def published_date=(published_date)
    if @published_date == nil
      @published_date = published_date
    end
  end
  
  def description=(description)
    if @description == nil
      @description = description
    end
  end
  
end