module TravelAgent
  class FlightParser
    attr_reader :filepath
    
    def initialize(filepath)
      @filepath = filepath
    end
    
    def parse
      
      File.open @filepath do |file|
        
      end
      
    end
    
  end
end