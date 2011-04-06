require 'test/unit'
require 'travel_agent'

class RouteFinderTest < Test::Unit::TestCase
  include TravelAgent
  
  def test_find_fastest_returns_an_array_with_times_and_price
    start_airport = create_flights
    
    route_finder = RouteFinder.new
    times = route_finder.find_fastest(start_airport, 'Z')
    
    assert_equal false, times.nil?, "RouteFinder#find_fastest should not return nil when a route exists"
    assert_equal 3, times.size
    assert times.respond_to?(:"[]") # Ensure that we can retrieve like an array
  end

  def test_find_fastest_returns_correct_data
    start_airports = FlightParser.parse('test/files/sample-input.txt')

    route_finder = RouteFinder.new
    
    # Check the first set in the file
    depart_at, arrive_at, cost = route_finder.find_fastest(start_airports[0], 'Z')
    
    assert_equal '10:00', depart_at.strftime('%H:%M')
    assert_equal '12:00', arrive_at.strftime('%H:%M')
    assert_equal 300, cost
    
    # Check the second set in the file
    depart_at, arrive_at, cost = route_finder.find_fastest(start_airports[1], 'Z')
    
    assert_equal '12:00', depart_at.strftime('%H:%M')
    assert_equal '16:30', arrive_at.strftime('%H:%M')
    assert_equal 550, cost
  end
  
  def test_find_cheapest_returns_an_array_with_times_and_price
    start_airport = create_flights
    
    route_finder = RouteFinder.new
    times = route_finder.find_cheapest(start_airport, 'Z')
    
    assert_equal false, times.nil?, "RouteFinder#find_cheapest should not return nil when a route exists"
    assert_equal 3, times.size
    assert times.respond_to?(:"[]") # Ensure that we can retrieve like an array
  end
  
  def test_find_cheapest_returns_correct_data
    start_airports = FlightParser.parse('test/files/sample-input.txt')

    route_finder = RouteFinder.new
    
    # Check the first set in the file
    depart_at, arrive_at, cost = route_finder.find_cheapest(start_airports[0], 'Z')
    
    assert_equal '09:00', depart_at.strftime('%H:%M')
    assert_equal '13:30', arrive_at.strftime('%H:%M')
    assert_equal 200, cost
    
    # Check the second set in the file
    depart_at, arrive_at, cost = route_finder.find_cheapest(start_airports[1], 'Z')
    
    assert_equal '08:00', depart_at.strftime('%H:%M')
    assert_equal '19:00', arrive_at.strftime('%H:%M')
    assert_equal 225, cost
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
