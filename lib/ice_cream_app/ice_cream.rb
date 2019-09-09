require 'pry'

class Ice_cream

    attr_accessor :flavor , :rating

    @@all = []

    def initialize(ice_cream_hash)
        @flavor = flavor
        @rating = rating
        @@all << self
    end

end