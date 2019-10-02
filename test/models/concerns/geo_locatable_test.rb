require 'test_helper'

class GeoLocatableTest < ActiveSupport::TestCase
  class DummyClass
    include GeoLocatable
  end

  def test_geo_search_calls
    dummy = DummyClass.new

    assert(
      0,
      dummy.geo_search(0, 0, 5, 'all').length,
    )
  end

  def test_geo_search_returns_all_users
    dummy = DummyClass.new

    assert(
      2,
      dummy.geo_search(35.6, -35.6, 5, 'all').length,
    )
  end

  def test_geo_search_returns_farmers
    dummy = DummyClass.new

    assert(
      1,
      dummy.geo_search(35.6, -35.6, 5, 'farmer').length,
    )
  end

  def test_geo_search_returns_users
    dummy = DummyClass.new

    assert(
      1,
      dummy.geo_search(35.6, 35.6, 5, 'all').length,
    )
  end



end
