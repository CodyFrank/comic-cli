#this file will create a comic class that will be the data that makes up the comics

class Comic
  
  attr_reader :title, :info_url, :published_date, :writer, :description
  
  @@all = []
  
  def initialize(title, info_url)
    @title = title
    @info_url = info_url
    @@all << self
    @published_date = nil
    @writer = nil
    @description = nil
  end
  
  def self.all
    @@all
  end
  
  
end