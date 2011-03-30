module TravelAgent
  class FlightParser
    attr_reader :filepath
    
    def initialize(filepath)
      @filepath = filepath
    end
    
    def parse
      
      file = File.new(@filepath, 'r')
      while (line = file.gets)
        puts line
      end
      file.close
      
    end
    
  end
end