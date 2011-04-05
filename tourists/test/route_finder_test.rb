require 'test/unit'
require 'travel_agent/route_finder'

class RouteFinderTest < Test::Unit::TestCase
  include TravelAgent
  
  def test_find_fastest_returns_start_and_end_times
    start_airport = create_flights
    
    route_finder = RouteFinder.new
    times = route_finder.find_fastest(start_airport, 'Z')
    
    assert_equal 2, times.size
    assert times.respond_to(:"[]") # Ensure that we can retrieve like an array
  end
  
  def test_find_cheapest_returns_start_and_end_times
    start_airport = create_flights
    
    route_finder = RouteFinder.new
    times = route_finder.find_cheapest(start_airport, 'Z')
    
    assert_equal 2, times.size
    assert times.respond_to(:"[]") # Ensure that we can retrieve like an array
  end
  
  private
  
  def create_flights
    source = Airport.new('A')
    destination = Airport.new('Z')
    
    flight = Flight.new
    flight.source = source
    flight.destination = destination
    flight.departs_at = Time.parse('08:00')
    flight.arrives_at = Time.parse('12:30')
    flight.price = 175.00
    
    source.flights << flight
    
    source
  end
  
end