module GeoLocatable
  extend ActiveSupport::Concern

  def geo_search(lat, long, distance = 5, user_type = 'farmer')
    local_user_list = User.near([lat,long], distance)
    filtered_local_user_list = local_user_list.where(user_type: user_type) unless user_type == 'all'
  end
end
