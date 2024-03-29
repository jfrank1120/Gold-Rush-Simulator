require 'Minitest/autorun'
require_relative '../src/class_map.rb'
require_relative '../src/class_city.rb'

# tests for the city obj
class TestMap < Minitest::Test
  def setup
    @map = Map.new(Random.new, [])
  end

  # UNIT TEST FOR METHOD add_cities(city)
  def test_map_add_cities
    addMock = Minitest::Mock.new
    def addMock::[] num
      nil
    end
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addMock.expect :<<, nil, [City]
    addingMap = Map.new(Random.new, addMock)
    assert_mock addMock
  end

  #UNIT TEST FOR METHOD contains_num_cities
  def test_map_contains_num_cities
    assert_equal(@map.cities?.count, 7)
  end

  #UNIT TEST FOR METHOD contains_city_obj
  def test_map_contains_city_obj
    @map.cities?.each do |city|
      assert_instance_of(City, city)
    end
  end

  # UNIT TEST FOR METHOD contains_all_cities
  def test_map_contains_all_cities
    names = @map.cities?.map { |x| x.name? }
    assert_includes(names, 'Sutter Creek')
    assert_includes(names, 'Nevada City')
    assert_includes(names, 'Virginia City')
    assert_includes(names, 'Angels Camp')
    assert_includes(names, 'Coloma')
    assert_includes(names, 'Midas')
    assert_includes(names, 'El Dorado Canyon')
  end

  #UNIT TEST FOR METHOD .start
  def test_start_pointer_defined
    refute_nil @map.start?
  end
end
