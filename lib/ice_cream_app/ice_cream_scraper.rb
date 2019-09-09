require 'open-uri'
require 'pry'
require "nokogiri"

class Scraper

    def self.scrape_index_page(index_page)
        ice_cream_flavors = []
        doc = Nokogiri::HTML(open(index_page))
        doc.css("div.name-product h2").map do |cream|
            flavor = cream.text.strip
            ice_cream_flavors << {:flavor => "#{flavor}"}
        end
        ice_cream_flavors
    end

    def self.scrape_flavor_page(flavor_url)
        description = []
        doc = Nokogiri::HTML(open(flavor_url))
        doc.css("body > div.dialog-off-canvas-main-canvas > div > div > section > div > article > div.content > div.box-infos-details > div.box-content-details > div.product-infos > span:nth-child(4) > div").each do |star|
            binding.pry
            dis = star.text
            description << {:discription => "#{dis}"}
        end
        description
    end

end

Scraper.scrape_index_page("https://www.haagendazs.us/products/ice-cream")
Scraper.scrape_flavor_page("https://www.haagendazs.us/products/ice-cream/belgian-chocolate-ice-cream")