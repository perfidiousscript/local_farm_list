require 'test_helper'

class GeoLocatableTest < ActiveSupport::TestCase
  class DummyClass
    include GeoLocatable
  end

  def setup
    @dummy = DummyClass.new
  end

  def test_geo_search_calls
    assert_equal(
      0,
      @dummy.geo_search(0, 0, 5, 'all').length,
    )
  end

  def test_geo_search_returns_all_users
    assert_equal(
      ["farmer_1", "consumer_1"],
      @dummy.geo_search(35.6, -35.6, 5, 'all').to_a.collect{|x| x[:user_name]},
    )
  end

  def test_geo_search_returns_farmers
    assert_equal(
      ["farmer_1"],
      @dummy.geo_search(35.6, -35.6, 5, 'farmer').to_a.collect{|x| x[:user_name]},
    )
  end

  def test_geo_search_returns_users
    assert_equal(
      ["consumer_2"],
      @dummy.geo_search(35.6, 35.6, 5, 'all').to_a.collect{|x| x[:user_name]},
    )
  end

  def test_geo_search_returns_farms
    assert_equal(
      "Farmy Farm",
      @dummy.geo_search(35.6, -35.6, 5, 'farms').first[:farm_name],
    )
  end
end
