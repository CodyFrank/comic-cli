require_relative "./comic/cli/version"

module Comic
  module Cli
    class Error < StandardError; end
    # Your code goes here...
  end
end

require_relative "./comic.rb"
require_relative "./command-line-interface.rb"
require_relative "./scraper.rb"
