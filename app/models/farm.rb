# == Schema Information
#
# Table name: farms
#
#  id        :bigint           not null, primary key
#  farm_name :string
#  latitude  :float
#  longitude :float
#  users_id  :bigint
#

class Farm < ApplicationRecord
  include GeoLocatable
  geocoded_by :address
  after_validation :geocode
  belongs_to :user

  
end
