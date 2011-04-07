require 'test/unit'
require 'rdf/conveyor_parser'

class ConveyorParserTest < Test::Unit::TestCase
  include RDF

  def setup
    @conveyors = ConveyorParser.parse('test/files/sample-input.txt')
  end

  def test_parse_creates_correct_number_of_conveyors
    assert_equal 3, @conveyors.length
  end

  def test_parse_creates_conveyors_correctly
    assert_equal 3, @conveyors[0].robot_location
    assert_equal [nil, 1, nil, 1, nil, 1, nil, nil], @conveyors[0].north_lasers
    assert_equal [nil, nil, nil, 1, 1, nil, nil, nil], @conveyors[0].south_lasers
    
    assert_equal 4, @conveyors[1].robot_location
    assert_equal [nil, nil, 1, nil, 1, nil, 1, nil], @conveyors[1].north_lasers
    assert_equal [nil, nil, nil, 1, 1, nil, nil, nil], @conveyors[1].south_lasers
    
    assert_equal 4, @conveyors[2].robot_location
    assert_equal [nil, nil, 1, nil, 1, nil, 1, nil], @conveyors[2].north_lasers
    assert_equal [nil, nil, nil, 1, 1, 1, nil, nil], @conveyors[2].south_lasers
  end
  
end
