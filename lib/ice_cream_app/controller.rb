# require_relative "../lib/ice_cream_scraper.rb"
# require_relative "../lib/ice_cream.rb"
# #require 'pry'
# #require 'nokogiri'

class IceCreamController

    def call 
     Scraper.scrape_index_page
        puts "welcome to the ice cream store!"
        list_flavors
        menu
    end

    def menu
        input = ""
        while input != "exit"
            puts "select a number to know more about that flavor"
            puts "type 'list' to see the list again."
            puts "To quite, type 'exit'."
            puts "what would you like to do?"
         input = gets.strip
         if (1..Ice_cream.all.length).include?(input.to_i)
            puts "ice cream"
            Scraper.scrape_flavor_page(flavor_url)
            # find object 
            # go get discription (scrape_flavor_page)
            # display discription
         elsif input.downcase == "list"
            list_flavors
         else
            puts "not a valide option please select another option"
            list_flavors
            end
         end
         puts "goodbye"
    end

    def list_flavors
        Ice_cream.all.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |c, i|
            puts "#{i}. #{c.flavor.name}"
        end
    end

    def list_description
        # Ice_cream.description.sort{|a, b| a <=> b}.each.with_index(1) do |star, i|
        #     puts "#{i}. #{star.rating}"
        # end
    end

end




