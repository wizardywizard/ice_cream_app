require 'open-uri'
require 'pry'
require "nokogiri"

require_relative "./ice_cream_app/version"
require_relative "./ice_cream_app/ice_cream"
require_relative "./ice_cream_app/controller"
require_relative "./ice_cream_app/ice_cream_scraper"

module IceCreamApp
  class Error < StandardError; end
  # Your code goes here...
end
