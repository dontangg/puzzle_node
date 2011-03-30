require 'test/unit'
require 'travel_agent/airport'

class AirportTest < Test::Unit::TestCase
  include TravelAgent

  def setup
    @airport = Airport.new 'B'
  end

  def test_has_name
    assert @airport.name
  end
end
