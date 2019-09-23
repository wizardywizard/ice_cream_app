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
            puts "select a number to know more about that flavor and available size"
            puts "type 'list' to see the list again."
            puts "To quite, type 'exit'."
            puts "what would you like to do?"
         input = gets.strip
         if (1..Ice_cream.all.length).include?(input.to_i)
             @iceCream = Ice_cream.all[(input.to_i) - 1]
             Scraper.scrape_flavor_page(@iceCream)
             list_description
             list_size
         elsif input.downcase == "list"
            list_flavors
         elsif input.downcase == "exit"
            puts "goodbye"
         else
            puts "not a valide option please select another option"
            list_flavors
            end
         end
    end

    def list_flavors
        Ice_cream.all.sort{ |a, b| a.flavor <=> b.flavor}.each.with_index(1) do |c, i|
            puts "#{i}. #{c.flavor}"
        end
    end

    def list_description
     puts @iceCream.description
    end

    def list_size
       puts @iceCream.size
    end

end

