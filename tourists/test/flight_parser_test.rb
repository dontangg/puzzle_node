require 'test/unit'
require 'travel_agent/flight_parser'

class FlightParserTest < Test::Unit::TestCase
  include TravelAgent

  def setup
    @start_airports = FlightParser.parse('test/files/sample-input.txt')
  end

  def test_parse_creates_correct_number_of_sets_of_flights
    assert @start_airports.length == 2
  end
  
  def test_parse_creates_airports_correctly
    assert_equal ['B', 'Z'], @start_airports[0].direct_flight_destinations
    assert_equal ['B', 'C'], @start_airports[1].direct_flight_destinations
  end
end