require 'pry'

class IceCreamController

    def call 
     input = ""
     while input != "exit"
        puts "welcome to the ice cream store!"
        puts "To list all of the flavors, enter 'list flavors'."
        puts "To list all of the ratings, enter 'list ratings'."
        puts "To quite, type 'exit'."
        puts "what would you like to do?"
            input = gets.strip
        case input 
        when "list flavors"
            list_flavors
        when "list ratings"
            list_ratings
        end
    end

    def list_flavors
        Ice_cream.all.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |c, i|
            puts "#{i}. #{c.flavor.name}"
    end

    def list_ratings
        rates.sort{|a, b| a <=> b}.each.with_index(1) do |star, i|
            puts "#{i}. #{star.rating}"
    end

end





end