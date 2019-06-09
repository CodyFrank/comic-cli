#this file will create a comic class that will be the data that makes up the comics

class Comic
  
  attr_accessor :published_date, :description
  attr_reader :title, :info_url
  
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
  
end