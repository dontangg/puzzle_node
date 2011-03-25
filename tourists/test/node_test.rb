require 'test/unit'

class NodeTest < Test::Unit::TestCase
  include TravelAgent

  def setup
    @node = Node.new 'B'
  end

  def test_has_name
    assert @node.name
  end
end
