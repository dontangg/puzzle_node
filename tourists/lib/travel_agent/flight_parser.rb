require 'time'
require 'travel_agent/airport'
require 'travel_agent/flight'

module TravelAgent
  class FlightParser
    
    def self.parse(filepath)
      file = File.new(filepath, 'r')
      
      # First get the number of tests there are in this file
      line = file.gets.strip
      num_tests = line.to_i
      
      # Create an array to hold all the start airports for each test
      start_airports = []
      
      # Go through each test
      num_tests.times do
        # Go through any empty lines we may have
        while (line = file.gets.strip) == ""; end
        
        # Get the number of flights in this test
        num_flights = line.to_i
        
        # Setup an easily accessible hash of airports
        airports = {}
        
        # Go through each flight
        num_flights.times do
          line = file.gets.strip
          from, to, departs_at, arrives_at, price = line.split ' '
          
          # Create airports if they don't exist already
          airports[from] ||= Airport.new(from)
          airports[to] ||= Airport.new(to)
          
          # Create the flight that connects the airports
          flight = Flight.new
          flight.source = airports[from]
          flight.destination = airports[to]
          flight.departs_at = Time.parse(departs_at)
          flight.arrives_at = Time.parse(arrives_at)
          flight.price = price.to_f
          
          # Attach the flight to the airport
          airports[from].flights << flight
        end
        
        start_airports << airports['A']
      end
      
      file.close
      
      # We just need to return the list of start airports
      start_airports
    end
    
  end
end