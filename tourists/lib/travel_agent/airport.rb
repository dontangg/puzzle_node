module TravelAgent
  class Airport
    attr_reader :name, :flights
    
    def initialize(name)
      @name = name
      @flights = []
    end
    
    def direct_flight_destinations
      direct = @flights.map do |flight|
        flight.destination.name
      end
      direct.uniq
    end
  end
end