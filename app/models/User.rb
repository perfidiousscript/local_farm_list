# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string
#  email           :string
#  password_digest :string
#  user_type       :integer
#  latitude        :float
#  longitude       :float
#


class User < ApplicationRecord
  include GeoLocatable
  has_secure_password
  enum user_type: [:farmer, :consumer, :admin]
  geocoded_by :address
  after_validation :geocode

  def is_admin?
    self.user_type == 'admin'
  end

  # Necessary for geocoder gem
  def location
    [latitude, longitude].compact.join
  end

  # Seaches for all users in the DB (defaulting to farmers) within 5 miles.
  def search_local_users(distance = 5, user_type = 'farmer')
    geo_search(latitude, longitude, distance, user_type)
  end

end
