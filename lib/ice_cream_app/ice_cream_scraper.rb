class Scraper

    def self.scrape_index_page
        doc = Nokogiri::HTML(open("https://www.haagendazs.us/products/ice-cream"))
         ice_cream_flavors = doc.css(".col-xs-12.col-sm-4.col-lg-3.columns.flavors a").map do |cream|
         link_href = cream.attr("href")
           ice_cream_flavor = cream.css("div.name-product h2").text.strip
             {:flavor => ice_cream_flavor, :url => "https://www.haagendazs.us#{link_href}"}
        end
       Ice_cream.create_from_collection(ice_cream_flavors)
    end

    def self.scrape_flavor_page(ice_cream_instence)
        description_size = []
        doc = Nokogiri::HTML(open(ice_cream_instence.url))
        ice_cream_instence.description = doc.css(".product-infos span").first.text.strip
        oz = doc.css(".product-infos span").last.text
        ice_cream_instence.size = "Available in #{oz}"
        description_size << {:description => ice_cream_instence.description, :size => ice_cream_instence.size}
    end

end

