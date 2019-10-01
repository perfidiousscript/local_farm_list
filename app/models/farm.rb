# == Schema Information
#
# Table name: farms
#
#  id        :bigint           not null, primary key
#  farm_name :string
#  latitude  :float
#  longitude :float
#  users_id  :bigint
#  products  :jsonb            not null
#

class Farm < ApplicationRecord
  include GeoLocatable
  geocoded_by :location
  after_validation :geocode
  belongs_to :user

  # Necessary for geocoder gem
  def location
    [latitude, longitude].compact.join
  end


end
