module GeoLocatable
  extend ActiveSupport::Concern

  def geo_search(lat, long, distance, user_type)
    local_user_list = User.near([lat,long], distance)
    unless user_type == 'all'
      local_user_list = local_user_list.where(user_type: user_type)
    end
    local_user_list
  end
end
