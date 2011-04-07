require 'test/unit'
require 'rdf/conveyor'
require 'rdf/conveyor_parser'

class ConveyorTest < Test::Unit::TestCase
  include RDF

  def test_conveyor_tells_which_way_yields_least_damage
    conveyor = Conveyor.new
    conveyor.north_lasers = [nil, nil, nil]
    conveyor.south_lasers = [nil, nil, 1]
    conveyor.robot_location = 1
    
    assert_equal :west, conveyor.path_of_least_damage
    
    conveyor = Conveyor.new
    conveyor.north_lasers = [1, 1, 1]
    conveyor.south_lasers = [1, 1, 1]
    conveyor.robot_location = 1
    
    assert_equal :west, conveyor.path_of_least_damage
    
    conveyor = Conveyor.new
    conveyor.north_lasers = [1, 1, 1]
    conveyor.south_lasers = [1, 1, nil]
    conveyor.robot_location = 1
    
    assert_equal :east, conveyor.path_of_least_damage
    
    conveyor = Conveyor.new
    conveyor.north_lasers = [1, nil, 1]
    conveyor.south_lasers = [1, 1, 1]
    conveyor.robot_location = 1
    
    assert_equal :west, conveyor.path_of_least_damage
  end

  def test_conveyor_correctly_directs_with_sample_input_file
    conveyors = ConveyorParser.parse('test/files/sample-input.txt')

    assert_equal :west, conveyors[0].path_of_least_damage
    assert_equal :east, conveyors[1].path_of_least_damage
    assert_equal :west, conveyors[2].path_of_least_damage
  end
  
end
