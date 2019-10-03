class FarmsController < ApplicationController

  def search_nearby
    user_lat = @current_user.latitude
    user_long = @current_user.longitude
    if params[:distance]
      farm_list = Farm.near([user_lat, user_long], params[:distance])
    else
      farm_list = Farm.near([user_lat, user_long], 5)
    end
    render json: farm_list
  end
end
