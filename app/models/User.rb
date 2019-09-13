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
  has_secure_password
  enum user_type: [:farmer, :consumer, :admin]

  def is_admin?
    self.user_type == 'admin'
  end


end
