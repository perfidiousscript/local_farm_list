module GeoLocatable
  extend ActiveSupport::Concern

  def geo_search(lat, long, distance, search_type)
    case search_type
    when 'all'
      local_list = User.near([lat,long], distance)
    when 'farmer' || 'consumer'
      local_list = User.near([lat,long], distance)
      local_list = local_list.where(user_type: search_type)
    when 'farms'
      local_list = Farm.near([lat,long], distance)
    end
    local_list
  end
end
