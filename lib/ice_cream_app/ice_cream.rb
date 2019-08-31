require 'open-uri'
require 'pry'

class Scraper

    def self.scrape_index_page(https://www.haagendazs.us/products/ice-cream)
        ice_cream = []
        doc = Nokogiri::HTML(open(https://www.haagendazs.us/products/ice-cream))
        doc.css("div.name-product h2").each do |cream|
            ice_cream[:flavor] = cream.css("span")
            binding.pry
        end
    end

end
