require 'pry'
require 'open-uri'
require 'nokogiri'

require_relative "./comic/cli/version"

module Comics
  module Cli
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative "./comics.rb"
require_relative "./command-line-interface.rb"
require_relative "./scraper.rb"
