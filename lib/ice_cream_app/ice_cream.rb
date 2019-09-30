class Ice_cream                                                 

    attr_accessor :flavor, :description, :url, :size             

    @@all = []                                                  

    def initialize(ice_cream_hash)                              
        @flavor = ice_cream_hash[:flavor]                       
        @url = ice_cream_hash[:url]                             
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
 
end
