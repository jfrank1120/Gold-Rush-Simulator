require 'minitest/autorun'
require_relative '../src/class_prospector'
require_relative '../src/class_city'

class ProstpectorTest < Minitest::Test
  # Create objects to be used in Mock testing
  def setup
    @map = Map.new(Random.new, [])
    @prosp = Prospector.new(@map)
  end
  # If a prospector object is created then the prospector
  # should not return nil
  def test_prospector_is_not_nil
    refute_nil @prosp
    assert_kind_of Prospector, @prosp
  end
  # Check that gold is correctly added to the prospector
  def test_add_gold
    @prosp = Prospector.new @map
    @prosp.add_gold(10)
    assert_equal @prosp.held_gold?, 10
  end

  def test_add_silver
    @prosp = Prospector.new @map
    @prosp.add_silver(10)
    assert_equal @prosp.held_silver?, 10
  end
  # Test that a prospector can move from one city to another
  def test_move_city
    city1 = City.new(Random.new, "testCity", 0, 0)
    @prosp.move city1
    assert_same @prosp.location?, city1
    @prosp.move @map.start?
  end

  # Unit test that the location of the prospector can be printed correctly
  def test_print_location
    city1 = City.new(Random.new, "testCity", 0, 0)
    @prosp.move city1
    assert_output (/The Prospector 0 is now Aproaching: testCity/){@prosp.print_location}
    @prosp.move @map.start?
  end

  # Test that the number of moves increments correctly
  def test_num_moves
      @prosp = Prospector.new(@map)
      city1 = City.new(Random.new, "testCity", 0, 0)
      @prosp.move city1
      assert_equal 1, @prosp.num_moves?
      @prosp.move @map.start?
  end

  def test_location_city_type
    assert_instance_of City, @prosp.location?
  end

  # Unit test to check that all values for a newly created Prospector
  # object are set to 0
  def test_initial_values
    assert_equal(0, @prosp.held_gold?)
    assert_equal(0, @prosp.held_silver?)
    assert_equal(0, @prosp.found_gold?)
    assert_equal(0, @prosp.found_silver?)
    assert_equal(0, @prosp.num_moves?)
  end

  # Unit test to see that the prospector can move to the next city
  # that is linked to the one it is currently in
  def test_move_next
    next_city = @prosp.location?.next_city?
    assert_instance_of(City, next_city)
    @prosp.move next_city
    assert_same(@prosp.location?, next_city)
  end
end
