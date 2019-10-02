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

end
