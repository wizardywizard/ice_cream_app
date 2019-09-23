class Ice_cream

    attr_accessor :flavor, :description, :url, :size

    @@all = []

    def initialize(ice_cream_hash)
        @flavor = ice_cream_hash[:flavor]
        @url = ice_cream_hash[:url]
        @description = ice_cream_hash[:description]
        @size = ice_cream_hash[:size]
        @@all << self
    end

    def self.create_from_collection(ice_cream_array)
        ice_cream_array.each do |cream|
            Ice_cream.new(cream)
        end
    end

    def self.all
        @@all
    end

    def all_description(description_array)
        description_array.each do |key, value|
            self.send(("#{key}="), value)
        end
    end

end
