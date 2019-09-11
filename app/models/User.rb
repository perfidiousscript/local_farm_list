
class User < ApplicationRecord
  enum user_type: [:farmer, :consumer, :admin]
end
