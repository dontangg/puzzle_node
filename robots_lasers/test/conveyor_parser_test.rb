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
    
  end
  
end
