require 'test/unit'
require 'travel_agent/flight_parser'

class FlightParserTest < Test::Unit::TestCase
  include TravelAgent

  def setup
    @parser = FlightParser.new 'files/sample-input.txt'
  end

  def test_parse_creates_something
    assert @parser.parse
  end
end