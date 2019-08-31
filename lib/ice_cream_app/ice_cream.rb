require 'open-uri'
require 'pry'
require "nokogiri"

class Scraper

    def self.scrape_index_page
        ice_cream_flavors = []
        doc = Nokogiri::HTML(open("https://www.haagendazs.us/products/ice-cream"))
        doc.css("div.name-product h2").map do |cream|
            flavor = cream.text.strip
            ice_cream_flavors << {:flavor => "#{flavor}"}
        end
        ice_cream_flavors
    end

    def self.scrape_flavor_page(flavor_url)
        rating = []
        binding.pry
        doc.css("div.bv_avgRating_component_container").map do |star|
            rate = star.itemprop.strip
            rating << {:rate => "#{rate}"}
        end
        rating
    end

end
