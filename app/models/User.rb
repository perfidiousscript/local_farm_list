
class User < ApplicationRecord
  has_secure_password
  enum user_type: [:farmer, :consumer, :admin]
end
